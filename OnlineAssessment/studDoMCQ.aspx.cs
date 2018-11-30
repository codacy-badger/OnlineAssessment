using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class studDoMCQ : System.Web.UI.Page
    {
        string studAns = " ";
        int correct_ans = 0;
        int total_question = 0;
        static int finalmark = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["subjectName"].ToString() != "")
            {
                questionDetail.Text = Session["questType"].ToString() + " - "
                    + Session["assessName"].ToString() + "<br/>Subject : "
                    + Session["subjectName"].ToString() + "<br/>Type : "
                    + Session["assessType"].ToString() + "<br/>Created by : " + Session["lecName"].ToString();
            }
            else
            {
                questionDetail.Text = Session["questType"].ToString() + " - "
                   + Session["assessName"].ToString() + "<br/>Type : "
                    + Session["assessType"].ToString() + "<br/>Created by : " + Session["lecName"].ToString();
            }
            if (!IsPostBack)
            {
                lblResult.Visible = false;
                btnHome.Visible = false;
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/studDoMCQ.aspx", false);
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/studDoAssessments.aspx", false);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string assessID = Session["assessID"].ToString();

            addStudAssess(Convert.ToInt32(Session["userID"].ToString()), assessID);
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd;

            con.Open();
            cmd = new SqlCommand("select MAX(stuAssessID) from Student_Assessment", con);
            int stuAssID = (int)cmd.ExecuteScalar();
            con.Close();


            foreach (DataListItem row in DataList1.Items)
            {

                total_question += 1;
                Label questID = (Label)row.FindControl("questID");
                RadioButton selectA = (RadioButton)row.FindControl("selectA");
                RadioButton selectB = (RadioButton)row.FindControl("selectB");
                RadioButton selectC = (RadioButton)row.FindControl("selectC");
                RadioButton selectD = (RadioButton)row.FindControl("selectD");
                HtmlContainerControl divA = (HtmlContainerControl)row.FindControl("div_A");
                HtmlContainerControl divB = (HtmlContainerControl)row.FindControl("div_B");
                HtmlContainerControl divC = (HtmlContainerControl)row.FindControl("div_C");
                HtmlContainerControl divD = (HtmlContainerControl)row.FindControl("div_D");
                if (selectA.Checked)
                {
                    studAns = "A";
                    divA.Attributes.Add("Style", "background-color:#ff7d7d;");
                }
                else if (selectB.Checked)
                {
                    studAns = "B";
                    divB.Attributes.Add("Style", "background-color:#ff7d7d;");
                }
                else if (selectC.Checked)
                {
                    studAns = "C";
                    divC.Attributes.Add("Style", "background-color:#ff7d7d;");

                }
                else if (selectD.Checked)
                {
                    studAns = "D";
                    divD.Attributes.Add("Style", "background-color:#ff7d7d;");
                }
                selectA.Enabled = false;
                selectB.Enabled = false;
                selectC.Enabled = false;
                selectD.Enabled = false;
                addStuAns(stuAssID, Convert.ToInt32(questID.Text));


                con.Open();
                cmd = new SqlCommand("Select answer FROM Question WHERE questID = @questID", con);
                cmd.Parameters.Add("@questID", SqlDbType.Int).Value = Convert.ToInt32(questID.Text);

                string correctAns = cmd.ExecuteScalar().ToString().Replace(" ", "");
                if (correctAns == "A")
                {
                    divA.Attributes.Add("Style", "background-color:#5cfb5c;");

                }
                else if (correctAns == "B")
                {
                    divB.Attributes.Add("Style", "background-color:#5cfb5c;");
                }
                else if (correctAns == "C")
                {
                    divC.Attributes.Add("Style", "background-color:#5cfb5c;");
                }
                else if (correctAns == "D")
                {
                    divD.Attributes.Add("Style", "background-color:#5cfb5c;");
                }

                if (studAns == correctAns)
                {
                    correct_ans += 1;
                }

                con.Close();

            }

            calculateScore(correct_ans, total_question, Convert.ToInt32(Session["userID"].ToString()), Convert.ToInt32(assessID), stuAssID);


            btnSubmit.Visible = false;
            btnReset.Visible = false;
            btnHome.Visible = true;
            lblResult.Visible = true;

            if (finalmark < 50)
                lblResult.ForeColor = Color.Red;
            else
                lblResult.ForeColor = Color.YellowGreen;

            lblResult.Text = "You have submitted your answer.. <br/>" +
                correct_ans + " correct answers out of " + total_question + "<br/>" +
                "Total mark: " + finalmark;

        }


        private void addStuAns(int stuAssID, int questID)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string query = "INSERT INTO StudentAnswer(stuAssessID, questID, answer)" +
                "VALUES (@param1, @param2, @param3)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Add("@param1", SqlDbType.Int).Value = stuAssID;
            cmd.Parameters.Add("@param2", SqlDbType.Int).Value = questID;
            cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = studAns;
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
        }
        private void addStudAssess(int studID, string assessID)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string query = "INSERT INTO Student_Assessment(status, score, stuID, assessID)" +
                "VALUES (@param1, @param2, @param3, @param4)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.Add("@param1", SqlDbType.NVarChar).Value = "progress";
            cmd.Parameters.Add("@param2", SqlDbType.Int).Value = -1;
            cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = studID;
            cmd.Parameters.Add("@param4", SqlDbType.NVarChar).Value = assessID;
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
        }


        private void calculateScore(int correct_ans, int total_question, int stuID, int assessID, int stuAssID)
        {
            int score = correct_ans * 100 / total_question;
            finalmark = Convert.ToInt32(score.ToString());
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("update Student_Assessment set status = 'done', score = '" + finalmark + "', stuID = '" + stuID +
                "', assessID = '" + assessID +
                "' WHERE stuAssessID = " + stuAssID, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
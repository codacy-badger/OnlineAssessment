using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class stuDoSubQ : System.Web.UI.Page
    {
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int assessID = Convert.ToInt32(Session["assessID"].ToString());

            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string query = "INSERT INTO Student_Assessment(status, score, stuID, assessID)" +
                "VALUES (@param1, @param2, @param3, @param4)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.Add("@param1", SqlDbType.NVarChar).Value = "progress";
            cmd.Parameters.Add("@param2", SqlDbType.Int).Value = -1;
            cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = Convert.ToInt32(Session["userID"].ToString());
            cmd.Parameters.Add("@param4", SqlDbType.NVarChar).Value = assessID;
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();

            string strCon1 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(strCon1);
            SqlCommand cmd1;

            con1.Open();
            cmd1 = new SqlCommand("select MAX(stuAssessID) from Student_Assessment", con1);
            int stuAssID = (int)cmd1.ExecuteScalar();
            con1.Close();

            foreach (DataListItem row in DataList1.Items)
            {
                Label questID = (Label)row.FindControl("questID");
                TextBox answer = (TextBox)row.FindControl("subAns");
                addStudAns(stuAssID, Convert.ToInt32(questID.Text), answer.Text);
            }

            btnSubmit.Visible = false;
            btnReset.Visible = false;
            btnHome.Visible = true;
            lblResult.Visible = true;
            lblResult.Text = "Thank for your participate..<br/>" +
                "Your paper will be mark soon..<br/>";

        }
        private void addStudAns(int stuAssID, int questID, String answer)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string query = "INSERT INTO StudentAnswer(stuAssessID, questID, answer)" +
                "VALUES (@param1, @param2, @param3)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Add("@param1", SqlDbType.Int).Value = stuAssID;
            cmd.Parameters.Add("@param2", SqlDbType.Int).Value = questID;
            cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = answer;
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/stuDoSubQ.aspx", false);
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/stuPage.aspx");
        }
    }
}
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class lecCreateMCQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            int subjectID = Convert.ToInt32(Session["subjectID"]);
            if (subjectID != 0)
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);

                con.Open();
                SqlCommand getSubject = new SqlCommand("SELECT (subjectCode + ' ' + subjectName) AS SUBJECT " +
               "FROM Subject WHERE subjectID = " + subjectID, con);
                string subject = getSubject.ExecuteScalar().ToString();
                con.Close();
                subjectName.Text = subject;
            }
            else subjectName.Text = "-";

            type.Text = Session["type"].ToString();
            assessName.Text = Session["assessID"].ToString() + " " + Session["assessment"].ToString();

            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtQuestion.Text != "")
                addQuestion();
            Response.Redirect("~/lecCreateMCQ.aspx", false);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/lecCreateMCQ.aspx", false);
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (txtQuestion.Text != "")
                addQuestion();

            MultiView1.ActiveViewIndex = 1;
            btnFinish.Visible = true;
            btnAddMore.Visible = true;
        }

        protected void btnFinish_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/lecPage.aspx");
        }

        protected void btnAddMore_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Response.Redirect("~/lecCreateMCQ.aspx", false);
            btnFinish.Visible = false;
            btnAddMore.Visible = false;
        }

        protected void addQuestion()
        {
            char choiceAns = 'A';
            if (rbB.Checked) { choiceAns = 'B'; }
            else if (rbC.Checked) { choiceAns = 'C'; }
            else if (rbD.Checked) { choiceAns = 'D'; }

            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd;

            con.Open();
            SqlCommand CountAssess = new SqlCommand("Select count(*) from Assessment", con);
            int count = (int)CountAssess.ExecuteScalar();
            int assessID = 1001;
            con.Close();

            if (count > 0)
            {
                con.Open();
                cmd = new SqlCommand("select MAX(assessID) from Assessment", con);
                assessID = (int)cmd.ExecuteScalar();
                con.Close();
            }

            string query = "INSERT INTO Question(assessID, questName, selectA, selectB, selectC, selectD, answer) " +
            "VALUES (@param1, @param2, @param3, @param4, @param5, @param6, @param7)";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.Add("@param1", SqlDbType.Int).Value = assessID;
            cmd.Parameters.Add("@param2", SqlDbType.NVarChar).Value = txtQuestion.Text;
            cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = txtA.Text;
            cmd.Parameters.Add("@param4", SqlDbType.NVarChar).Value = txtB.Text;
            cmd.Parameters.Add("@param5", SqlDbType.NVarChar).Value = txtC.Text;
            cmd.Parameters.Add("@param6", SqlDbType.NVarChar).Value = txtD.Text;
            cmd.Parameters.Add("@param7", SqlDbType.NChar).Value = choiceAns;

            con.Open();
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                DataList1.EditItemIndex = e.Item.ItemIndex;
            }
            else if (e.CommandName == "delete")
            {
                int questID = Convert.ToInt32(((Label)e.Item.FindControl("lblQuest")).Text);

                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd = new SqlCommand("DELETE from Question WHERE questID = " + questID, con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                DataList1.EditItemIndex = -1;
                DataList1.EditItemIndex = -1;
            }
            else if (e.CommandName == "cancel")
            {
                DataList1.EditItemIndex = -1;
            }
            else if (e.CommandName == "update")
            {
                RadioButton rbEditA = (RadioButton)e.Item.FindControl("rbEditA");
                RadioButton rbEditB = (RadioButton)e.Item.FindControl("rbEditB");
                RadioButton rbEditC = (RadioButton)e.Item.FindControl("rbEditC");
                RadioButton rbEditD = (RadioButton)e.Item.FindControl("rbEditD");
                char answer = '-';
                if (rbEditA.Checked == true)
                {
                    answer = 'A';
                }
                else if (rbEditB.Checked == true)
                {
                    answer = 'B';
                }
                else if (rbEditC.Checked == true)
                {
                    answer = 'C';
                }
                else if (rbEditD.Checked == true)
                {
                    answer = 'D';
                }

                int questID = Convert.ToInt32(((Label)e.Item.FindControl("lblQuest")).Text);
                int assessID = Convert.ToInt32(((Label)e.Item.FindControl("lblAssess")).Text);
                string question = ((TextBox)e.Item.FindControl("editQuest")).Text;
                string selectA = ((TextBox)e.Item.FindControl("editA")).Text;
                string selectB = ((TextBox)e.Item.FindControl("editB")).Text;
                string selectC = ((TextBox)e.Item.FindControl("editC")).Text;
                string selectD = ((TextBox)e.Item.FindControl("editD")).Text;

                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd = new SqlCommand("update question set questName = '"
                    + question + "', selectA = '" + selectA + "', selectB = '" + selectB +
                    "', selectC = '" + selectC + "', selectD = '" + selectD + "', answer = '" + answer +
                    "' WHERE questID = " + questID + " AND assessID = " + assessID, con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                DataList1.EditItemIndex = -1;

            }
            DataList1.DataBind();
        }


    }
}
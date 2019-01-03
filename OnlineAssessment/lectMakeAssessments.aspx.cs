using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnlineAssessment
{
    public partial class lectMakeAssessments : System.Web.UI.Page
    {
        static int assessID;
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlSubject.DataBind();
            if (ddlSubject.Items.Count == 0)
            {
                ddlSubject.Visible = false;
                error2.Text = "Not enrolled to any subject!";
            }
            else
            {
                error2.Text = "";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                error1.Text = "";
                addAssessment();
                Session["assessment"] = txtName.Text;
                Session["assessID"] = assessID;
                Session["subjectID"] = ddlSubject.SelectedValue;
                Session["type"] = rblAssessType.SelectedValue;
                if (rblQuestType.SelectedValue == "MCQ")
                    Response.Redirect("~/lectMakeMCQ.aspx");
                else
                    Response.Redirect("~/lectMakeSubjective.aspx");
            }
            else
            {
                error1.Text = "Invalid input! Make sure all fields are correct!";
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/lectMakeAssessments.aspx", false);
        }

        protected void addAssessment()
        {
            string query;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd;
            query = "INSERT INTO ASSESSMENT(assessName, assessType, questType, subjectID, lecID) " +
                "VALUES (@param1, @param2, @param3, @param4, @param5)";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.Add("@param1", SqlDbType.NVarChar).Value = txtName.Text;
            cmd.Parameters.Add("@param2", SqlDbType.NVarChar).Value = rblAssessType.SelectedValue;
            cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = rblQuestType.SelectedValue;
            cmd.Parameters.Add("@param4", SqlDbType.Int).Value = ddlSubject.SelectedValue;
            cmd.Parameters.Add("@param5", SqlDbType.NVarChar).Value = Session["userID"];

            con.Open();
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            con.Close();

            con.Open();
            SqlCommand getAssessID = new SqlCommand("select MAX(assessID) from Assessment", con);
            assessID = (int)getAssessID.ExecuteScalar();
            con.Close();

        }

    }
}
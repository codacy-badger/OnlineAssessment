using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnlineAssessment
{
    public partial class EnrollLecture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["enroll"] != null)
                {
                    lblMsg.Text = "Succesfully enroll to " + Request.QueryString["enroll"].ToString();
                }
            }
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd;

            string query = "INSERT INTO EnrollLecturer(lecID, subjectID)" +
            "VALUES (@param1, @param2)";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.Add("@param1", SqlDbType.Int).Value = Session["userID"];
            cmd.Parameters.Add("@param2", SqlDbType.Int).Value = ddlSubjectEnroll.SelectedValue;

            con.Open();
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();

            //            Response.Redirect("EnrollLecture.aspx?enroll=" + ddlSubjectEnroll.SelectedItem.Text, false);
            Response.Redirect("~/lecSub.aspx");

        }

        protected void btnBackAction_Click(object sender, EventArgs e)
        {
            Response.Redirect("lecSub.aspx");
        }
    }
}
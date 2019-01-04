using System;
using ExceptionManagers;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnlineAssessment
{
    public partial class EnrollStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["enroll"] != null)
                {
                    lblMsg.Text = "Student: " + Request.QueryString["enroll"].ToString() + " successfuly enroll to the subject";
                }
            }
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd;

            string query = "INSERT INTO EnrollStudent(stuID, subjectID)" +
            "VALUES (@param1, @param2)";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.Add("@param1", SqlDbType.Int).Value = ddlStudentEnroll.SelectedValue;
            cmd.Parameters.Add("@param2", SqlDbType.Int).Value = Session["subjectID"].ToString();

            try
{
    con.Open();
}
catch (Exception ex)
{
    Response.Redirect(ExceptionManagersHandler.PublishException("MyApplication", ex));
}
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();

            Response.Redirect("enrollStudents.aspx?enroll=" + ddlStudentEnroll.SelectedItem.Text, false);
        }

        protected void btnBackAction_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/lectSubjectList.aspx");
        }
    }
}
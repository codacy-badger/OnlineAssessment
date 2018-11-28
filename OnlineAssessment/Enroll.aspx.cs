using System;
using System.Data.SqlClient;

namespace OnlineAssessment
{
    public partial class Enroll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            string stud = txtStudent.Text;
            string course = txtCourse.Text;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlCommand cmd = new SqlCommand("INSERT INTO StudCourse VALUES(@couID, @stuID, @se)", con);
            cmd.Parameters.AddWithValue("@stuID", stud);
            cmd.Parameters.AddWithValue("@couID", course);
            cmd.Parameters.AddWithValue("@se", "Y1S1");
            con.Open();
            int insertCourse = cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("LecturePage.aspx");
        }
    }
}
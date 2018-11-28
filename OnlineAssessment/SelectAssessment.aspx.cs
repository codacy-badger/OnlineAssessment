using System;
using System.Data.SqlClient;

namespace OnlineAssessment
{
    public partial class SelectAssessment : System.Web.UI.Page
    {
        SqlCommand com;
        string str;
        string type;

        protected void Page_Load(object sender, EventArgs e)
        {
            String idd = Session["id"].ToString();
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            con.Open();
            str = "select c.CourseID from Course c, Student s, StudCourse sc where sc.CourseID = c.CourseID and sc.StudID = s.StudID and s.StudID = @StudID";
            com = new SqlCommand(str, con);
            com.Parameters.AddWithValue("@StudID", idd);
            Session["Course"] = com.ExecuteScalar();
            con.Close();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            string val = DropDownList2.SelectedValue;
            Session["Assessment"] = val;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            con.Open();
            str = "select * from Assessment where AssessmentCode='" + val + "'";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.Read())
            {
                type = reader["Type"].ToString();
                reader.Close();
                con.Close();
            }

            if (type == "0")
            {
                Response.Redirect("ViewMCQuestion.aspx");
            }
            else if (type == "1")
            {
                Response.Redirect("ViewSubQuestion.aspx");
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewQuestion.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedItem.Value == "Public")
            {
                DropDownList2.Visible = true;
                DropDownList3.Visible = false;
            }
            else
            {
                DropDownList3.Visible = true;
                DropDownList2.Visible = false;
            }
        }
    }
}
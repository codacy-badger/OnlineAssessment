using System;
using System.Data;
using System.Data.SqlClient;

namespace OnlineAssessment
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\yeokjy\Desktop\Web Assignment\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlCommand cmd = new SqlCommand("select * from Student where StudEmail=@StudEmail and StudPass=@StudPass", con);
            cmd.Parameters.AddWithValue("@StudEmail", txtEmail.Text);
            cmd.Parameters.AddWithValue("@StudPass", txtPassword.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                con.Open();
                Session["id"] = cmd.ExecuteScalar();
                con.Close();

                Session["Email"] = txtEmail.Text;
                Session["Person"] = "Student";
                Response.Redirect("StudentPage.aspx");

            }
            else
            {
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\yeokjy\Desktop\Web Assignment\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
                SqlCommand cmdn = new SqlCommand("select * from Lecturer where LecEmail=@LecEmail and LecPass=@LecPassword", conn);
                cmdn.Parameters.AddWithValue("@LecEmail", txtEmail.Text);
                cmdn.Parameters.AddWithValue("@LecPassword", txtPassword.Text);
                SqlDataAdapter sdan = new SqlDataAdapter(cmdn);
                DataTable dtn = new DataTable();

                sdan.Fill(dtn);
                conn.Open();
                int j = cmdn.ExecuteNonQuery();
                conn.Close();
                if (dtn.Rows.Count > 0)
                {
                    conn.Open();
                    Session["id"] = cmdn.ExecuteScalar();
                    conn.Close();

                    Session["email"] = txtEmail.Text;
                    Session["Person"] = "Lecturer";
                    Response.Redirect("LecturePage.aspx");
                }
                else
                {
                    lblErrorMsg.Text = "You're username and password is incorrect";
                    lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                    lblErrorMsg.Visible = true;
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }
    }
}
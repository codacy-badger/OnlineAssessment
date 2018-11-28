using System;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class MarkingAssessment : System.Web.UI.Page
    {
        int mark = 0;
        int totalMark = 0;
        int markPrefix = 0;
        int totalMarkPrefix = 0;
        int assessTotal = 0;
        Models.AssessmentEntities2 db = new Models.AssessmentEntities2();

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        TextBox txtMark = GridView1.Rows[i].Cells[2].FindControl("txtMark") as TextBox;
                        //txtMark.Text = txtMark.ToString();
                        // mark += Int32.Parse(txtMark.Text);
                        mark = Int32.Parse(txtMark.Text);
                    }
                }
            }
        }

        protected void btnTotalMark_Click(object sender, EventArgs e)
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                TextBox txtMark = GridView1.Rows[i].Cells[2].FindControl("txtMark") as TextBox;
                /*TextBox txtMarkPrefix = GridView1.Rows[i].Cells[3].FindControl() as TextBox;*/
                //txtMark.Text = txtMark.ToString();
                // mark += Int32.Parse(txtMark.Text);
                mark = Int32.Parse(txtMark.Text);
                String mPrefix = GridView1.Rows[i].Cells[3].Text;
                markPrefix = Int32.Parse(mPrefix);
                /*markPrefix = Int32.Parse(txtMarkPrefix.Text);*/
                totalMark = totalMark + mark;
                totalMarkPrefix = totalMarkPrefix + markPrefix;
            }

            /*totalMark = totalMark + mark;*/
            double assessTtl = (totalMark * 100) / totalMarkPrefix;
            string ttl = assessTtl.ToString();
            assessTotal = int.Parse(ttl);
            //lblMark.Text = assessTotal.ToString();


            string studId = Session["StudId"].ToString();
            string lecemail = Session["Email"].ToString();
            string assessmentCode = Session["AssessmentCode"].ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            SqlCommand cmd;
            con.Open();

            string studEmail = "select StudEmail from Student where StudID= @StudID";
            cmd = new SqlCommand(studEmail, con);
            cmd.Parameters.AddWithValue("@StudID", studId);
            Session["studemail"] = cmd.ExecuteScalar();
            string email = Session["studemail"].ToString();

            SqlCommand cmd1;
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = "";


            sql = "UPDATE TakenAss SET mark = @mark, AssStatus = 'Mark' where (AssessmentCode = @AssessmentCode AND StudID = @StudID)";

            cmd1 = new SqlCommand(sql, con);
            cmd1.Parameters.AddWithValue("@mark", assessTotal);
            cmd1.Parameters.AddWithValue("@AssessmentCode", assessmentCode);
            cmd1.Parameters.AddWithValue("@StudID", studId);



            //SqlDataReader rd = cmd1.ExecuteReader();
            //adapter.UpdateCommand = new SqlCommand(sql, con);
            cmd1.ExecuteNonQuery();

            cmd1.Dispose();
            con.Close();

            /*Models.TakenAss use = new Models.TakenAss
            {
                AssessmentCode = assessmentCode,
                StudID = studId,
                mark = assessTotal,
                AssStatus = "Mark"
            };
            db.TakenAsses.Add(use);
            db.SaveChanges();*/


            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress(lecemail, "Email head", System.Text.Encoding.UTF8);
            mail.Subject = "This mail is send from asp.net application";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Marks =" + assessTotal;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential(lecemail, "yapyanzhi1998");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
                Page.RegisterStartupScript("UserMsg", "<script>alert('Successfully Send...');if(alert){ window.location='LecturePage.aspx';}</script>");
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
                Page.RegisterStartupScript("UserMsg", "<script>alert('Sending Failed...');if(alert){ window.location='SendMail.aspx';}</script>");
            }
        }

    }
}
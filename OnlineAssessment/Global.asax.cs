using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;
using System.Web.SessionState;

namespace OnlineAssessment
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }
        public static void DeleteEmptyAssessments()
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (var conn = new SqlConnection(strCon))
            using (var command = new SqlCommand("Procedure1", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void Application_PreRequestHandlerExecute(Object sender, EventArgs e)
        {
            if (Context.Handler is IRequiresSessionState || Context.Handler is IReadOnlySessionState)
            {
                if (Session.IsNewSession || Session.Count < 1)
                {
                    if (!Context.Request.Url.AbsoluteUri.ToLower().Contains("/login.aspx") && !Context.Request.Url.AbsoluteUri.ToLower().Contains("/register.aspx") && !Context.Request.Url.AbsoluteUri.ToLower().Contains("/about.aspx"))
                    {
                        // redirect to your login page
                        Context.Response.Redirect("~/login.aspx?resession=yes");
                    }
                }
            }
        }

        public static void Email(string to, string body, string subject, string fromAddress, string fromDisplay)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.Body = body;
                mail.IsBodyHtml = true;
                mail.To.Add(new MailAddress(to));
                mail.From = new MailAddress(fromAddress, fromDisplay, Encoding.UTF8);
                mail.Subject = subject;
                mail.SubjectEncoding = Encoding.UTF8;
                mail.Priority = MailPriority.Normal;

                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Send(mail);
            }
            catch (Exception ex)
            {
                
            }
        }

    }
}
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;
using System.Web.UI.WebControls;

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

    }
}
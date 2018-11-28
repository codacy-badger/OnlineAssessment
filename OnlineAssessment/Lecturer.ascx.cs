using System;

namespace OnlineAssessment
{
    public partial class Lecturer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = (String)Session["Email"];

            account.Text = email;
        }
    }
}
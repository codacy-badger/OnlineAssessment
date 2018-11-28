using System;

namespace OnlineAssessment
{
    public partial class stuPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            stuName.Text = (String)Session["username"];
        }
    }
}
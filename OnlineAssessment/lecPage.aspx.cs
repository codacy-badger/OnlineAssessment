using System;

namespace OnlineAssessment
{
    public partial class lecPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lecName.Text = (String)Session["username"];
        }
    }
}
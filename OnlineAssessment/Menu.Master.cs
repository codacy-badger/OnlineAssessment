using System;

namespace OnlineAssessment
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();

            String activepage = Request.RawUrl;
            if (activepage.Contains("lecWork.aspx"))
            {
                lecWorkLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("lecCreateAssess.aspx"))
            {
                lecCreateAssessLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("lecSub.aspx"))
            {
                lecSubLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("stuDoAssess.aspx"))
            {
                stuDoAssessLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("stuViewAssess.aspx"))
            {
                stuViewAssessLink.Attributes.Add("class", "active");
            }
        }

    }
}
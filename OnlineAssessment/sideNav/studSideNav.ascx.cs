using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessment.sideNav
{
    public partial class studSideNav : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String activepage = Request.RawUrl;
            if (activepage.Contains("../studDoAssessments.aspx"))
            {
                studDoAssessmentsLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("../studViewAssessments.aspx"))
            {
                stuViewAssessLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("../about.aspx"))
            {
                stuaboutLink.Attributes.Add("class", "active");
            }
        }
    }
}
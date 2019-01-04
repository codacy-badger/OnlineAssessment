using System;
using ExceptionManagers;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessment.sideNav
{
    public partial class lectSideNav : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String activepage = Request.RawUrl;
            if (activepage.Contains("../lectViewAssessments.aspx"))
            {
                lectViewAssessmentsLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("../lectMakeAssessments.aspx"))
            {
                lecCreateAssessLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("../lectSubjects.aspx"))
            {
                lecSubLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("../about.aspx"))
            {
                lecaboutLink.Attributes.Add("class", "active");
            }
            
        }
    }
}
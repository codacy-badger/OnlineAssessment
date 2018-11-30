using System;

namespace OnlineAssessment
{
    public partial class assessment : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String username = (String)Session["username"];
            if (Session["gender"] != null)
            {
                if (Session["gender"].ToString().ToUpper().Equals("MALE"))
                {
                    username = "Mr. " + username;
                }
                else
                {
                    username = "Ms. " + username;
                }
            }
                

            userName.Text = username;

            Response.Cache.SetNoStore();

            String activepage = Request.RawUrl;
            if (activepage.Contains("lectViewAssessments.aspx"))
            {
                lectViewAssessmentsLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("lectMakeAssessments.aspx"))
            {
                lecCreateAssessLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("lectSubjects.aspx"))
            {
                lecSubLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("studDoAssessments.aspx"))
            {
                studDoAssessmentsLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("studViewAssessments.aspx"))
            {
                stuViewAssessLink.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("about.aspx"))
            {
                stuaboutLink.Attributes.Add("class", "active");
                lecaboutLink.Attributes.Add("class", "active");
            }
        }

    }
}
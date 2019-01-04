using System;
using ExceptionManagers;
using System.Web.UI;

namespace OnlineAssessment
{
    public partial class assessment : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control topNavControl;
            if (Session["role"] != null)
            {
                Control sideNavControl = LoadControl("sideNav/bothSideNav.ascx");
                string role = Session["role"].ToString();
                if (role == "Lecturer")
                {
                    topNavControl = LoadControl("topNav/lectTopNav.ascx");
                }
                else
                {
                    topNavControl = LoadControl("topNav/studTopNav.ascx");
                }
                topNavPlaceholder.Controls.Add(topNavControl);
                sideNavPlaceholder.Controls.Add(sideNavControl);
            }
            else
            {
                topNavControl = LoadControl("topNav/genericTopNav.ascx");
                topNavPlaceholder.Controls.Add(topNavControl);
            }
            

            Response.Cache.SetNoStore();

            
        }

    }
}
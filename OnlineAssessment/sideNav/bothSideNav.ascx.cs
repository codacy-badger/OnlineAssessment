using System;
using ExceptionManagers;
using System.Web.UI;

namespace OnlineAssessment.sideNav
{
    public partial class bothSideNav : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["role"] != null)
            {
                String username = (String)Session["username"];
                if (Session["gender"] != null)
                {
                    Control picControl;
                    Control statusControl;
                    Control linksControl;
                    if (Session["gender"].ToString().ToUpper().Equals("MALE"))
                    {
                        username = "Mr. " + username;
                        picControl = LoadControl("../genderPic/malePic.ascx");
                    }
                    else
                    {
                        username = "Ms. " + username;
                        picControl = LoadControl("../genderPic/femalePic.ascx");
                    }
                    
                    userName.Text = username;

                    genderPicPlaceholder.Controls.Add(picControl);

                    string role = Session["role"].ToString();
                    if (role == "Lecturer")
                    {
                        statusControl = LoadControl("~/sideNav/lectStatus.ascx");
                        linksControl = LoadControl("~/sideNav/lectSideNav.ascx");
                    }
                    else
                    {
                        statusControl = LoadControl("~/sideNav/studStatus.ascx");
                        linksControl = LoadControl("~/sideNav/studSideNav.ascx");
                    }
                    roleStatusPlaceholder.Controls.Add(statusControl);
                    roleSideLinksPlaceholder.Controls.Add(linksControl);
                }

            }
        }
    }
}
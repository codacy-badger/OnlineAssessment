using System;
using System.Web.UI;

namespace OnlineAssessment
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            //Retrieve Person from session
            //and display different advertisement banner based on User
            //place your code here...
            Control ctrl;
            if (Session["Person"] != null)
            {
                string person = Session["Person"].ToString();
                if (person == "Lecturer")
                {
                    ctrl = LoadControl("Lecturer.ascx");
                    Header.Controls.Add(ctrl);

                }
                else if (person == "Student")
                {
                    ctrl = LoadControl("Student.ascx");
                    Header.Controls.Add(ctrl);
                }
                else
                {

                }
            }
            else
            {
                ctrl = LoadControl("Common.ascx");
                Header.Controls.Add(ctrl);
            }
        }
    }
}
using System;

namespace OnlineAssessment
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();

            if (Session["role"] == null)
            {
                subject.Visible = false;
                assessment.Visible = false;
                work.Visible = false;
                mark.Visible = false;
                logout.Attributes.Add("style", "display:none");
            }
            else
            {
                login.Attributes.Add("style", "display:none");
                register.Attributes.Add("style", "display:none");

                string role = Session["role"].ToString();
                if (role == "Lecturer")
                {
                    subject.Visible = true;
                    assessment.Visible = true;
                    work.Visible = true;
                    mark.Visible = false;
                    if ((String)Session["gender"] == "MALE")
                        account.Text = "Mr. " + (String)Session["username"];
                    else account.Text = "Ms. " + (String)Session["username"];
                    SiteMapPath1.SiteMapProvider = "webLec";
                }
                else if (role == "Student")
                {
                    assessment.Visible = true;
                    mark.Visible = true;
                    subject.Visible = false;
                    work.Visible = false;
                    if ((String)Session["gender"] == "MALE")
                        account.Text = "Mr. " + (String)Session["username"];
                    else account.Text = "Ms. " + (String)Session["username"];
                    SiteMapPath1.SiteMapProvider = "webStu";
                }
            }
        }

        protected void home_Click(object sender, EventArgs e)
        {

            if (Session["role"] == null)
            {
                Response.Redirect("~/MainPage.aspx", false);
            }
            else
            {
                string role = Session["role"].ToString();
                if (role == "Lecturer")
                {
                    Response.Redirect("~/lecPage.aspx", false);
                }
                else if (role == "Student")
                {
                    Response.Redirect("~/stuPage.aspx", false);
                }
            }
        }

        protected void subject_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/lecSub.aspx", false);
        }

        protected void assessment_Click(object sender, EventArgs e)
        {
            if (Session["role"].ToString() == "Lecturer")
            {
                Response.Redirect("~/lecCreateAssess.aspx", false);
            }
            else if (Session["role"].ToString() == "Student")
            {
                Response.Redirect("~/stuDoAssess.aspx", false);
            }
        }

        protected void mark_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/stuViewAssess.aspx", false);
        }

        protected void work_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/lecWork.aspx", false);
        }

    }
}
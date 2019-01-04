using System;
using ExceptionManagers;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class lectViewAssessmentList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["subName"].ToString() != "")
            {
                assessDetail.Text = Session["questType"].ToString() + " - "
                    + Session["assessName"].ToString() + "<br/>Subject : "
                    + Session["subName"].ToString() + "<br/>Assessment Type : "
                    + Session["assessType"].ToString();
            }
            else
            {
                assessDetail.Text = Session["questType"].ToString() + " - "
                    + Session["assessName"].ToString() + "<br/>Assessment Type : "
                    + Session["assessType"].ToString();
            }

            Repeater1.DataBind();
            Repeater2.DataBind();
            
            if (Repeater1.Items.Count == 0)
            {
                EmptyRepeater.RepeatTitle = "";
                Repeater1.HeaderTemplate = LoadTemplate("EmptyRepeater.ascx");
            }
            if (Repeater2.Items.Count == 0)
            {
                EmptyRepeater.RepeatTitle = "";
                Repeater2.HeaderTemplate = LoadTemplate("EmptyRepeater.ascx");
            }

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label stuAssessID = (Label)e.Item.FindControl("stuAssessID");
            Label stuID = (Label)e.Item.FindControl("lblStuID");
            Label stuName = (Label)e.Item.FindControl("lblStudName");
            Label stuEmail = (Label)e.Item.FindControl("lblEmail");
            Session["stuAssessID"] = stuAssessID.Text;
            Session["stuID"] = stuID.Text;
            Session["stuName"] = stuName.Text;
            Session["stuEmail"] = stuEmail.Text;
            Response.Redirect("~/lectAssessmentMarks.aspx");

        }

      
    }
}
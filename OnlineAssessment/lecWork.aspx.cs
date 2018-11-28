using System;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class lecWork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lists_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label assessID = (Label)e.Item.FindControl("lblAssID");
            Label subName = (Label)e.Item.FindControl("lblSubname");
            Label assessType = (Label)e.Item.FindControl("lblAssessType");
            Label assessName = (Label)e.Item.FindControl("lblAssName");
            Label questType = (Label)e.Item.FindControl("lblQuestType");
            Session["assessID"] = assessID.Text;
            Session["subName"] = subName.Text;
            Session["assessType"] = assessType.Text;
            Session["assessName"] = assessName.Text;
            Session["questType"] = questType.Text;
            Response.Redirect("~/lecWorkList.aspx");
        }
        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label assessID = (Label)e.Item.FindControl("lblAssID");
            Label assessType = (Label)e.Item.FindControl("lblAssessType");
            Label assessName = (Label)e.Item.FindControl("lblAssName");
            Label questType = (Label)e.Item.FindControl("lblQuestType");
            Session["assessID"] = assessID.Text;
            Session["subName"] = "";
            Session["assessType"] = assessType.Text;
            Session["assessName"] = assessName.Text;
            Session["questType"] = questType.Text;
            Response.Redirect("~/lecWorkList.aspx");
        }
    }
}
using System;
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
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label stuAssessID = (Label)e.Item.FindControl("stuAssessID");
            Label stuID = (Label)e.Item.FindControl("lblStuID");
            Label stuName = (Label)e.Item.FindControl("lblStudName");
            Session["stuAssessID"] = stuAssessID.Text;
            Session["stuID"] = stuID.Text;
            Session["stuName"] = stuName.Text;
            Response.Redirect("~/lectAssessmentMarks.aspx");

        }

      
    }
}
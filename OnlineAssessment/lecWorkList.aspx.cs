using System;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class lecWorkList : System.Web.UI.Page
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
            Response.Redirect("~/lecWorkMark.aspx");

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int score = Convert.ToInt32(e.Row.Cells[4].Text);
                if (score >= 90)
                {
                    e.Row.Cells[5].Text = "A+";
                }
                else if (score >= 80)
                {
                    e.Row.Cells[5].Text = "A";
                }
                else if (score >= 75)
                {
                    e.Row.Cells[5].Text = "A-";
                }
                else if (score >= 70)
                {
                    e.Row.Cells[5].Text = "B+";
                }
                else if (score >= 65)
                {
                    e.Row.Cells[5].Text = "B";
                }
                else if (score >= 60)
                {
                    e.Row.Cells[5].Text = "B-";
                }
                else if (score >= 55)
                {
                    e.Row.Cells[5].Text = "C+";
                }
                else if (score >= 50)
                {
                    e.Row.Cells[5].Text = "C";
                }
                else if (score < 50 && score >= 0)
                {
                    e.Row.Cells[5].Text = "F";
                    e.Row.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                }
            }
        }
    }
}
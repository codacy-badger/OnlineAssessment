using System;

namespace OnlineAssessment
{
    public partial class ViewUnmarkAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = GridView1.SelectedRow.Cells[1].Text;
            AssId.Text = GridView1.SelectedRow.Cells[1].Text;
            studID.Text = GridView1.SelectedRow.Cells[4].Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["AssessmentCode"] = AssId.Text;
            Session["StudId"] = studID.Text;
            Response.Redirect("MarkingAssessment.aspx");
        }
    }
}
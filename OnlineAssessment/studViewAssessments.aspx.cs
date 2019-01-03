using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class studViewAssessments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataBind();
            Repeater2.DataBind();

            if (Repeater1.Items.Count == 0 && Repeater2.Items.Count == 0)
            {
                EmptyRepeater.RepeatTitle = "";
                Repeater1.HeaderTemplate = LoadTemplate("EmptyRepeater.ascx");
                Repeater2.HeaderTemplate = null;
            }
            else if (Repeater1.Items.Count == 0)
            {
                EmptyRepeater.RepeatTitle = "Private Assessments";
                Repeater1.HeaderTemplate = LoadTemplate("EmptyRepeater.ascx");
            }
            else if (Repeater2.Items.Count == 0)
            {
                EmptyRepeater.RepeatTitle = "Public Assessments";
                Repeater2.HeaderTemplate = LoadTemplate("EmptyRepeater.ascx");
            }
        }

        protected void select_Click(object sender, EventArgs e)
        {

        }
        protected void lists_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {
            foreach (RepeaterItem ri in Repeater1.Items)
            {

                int x = 0;
                LinkButton linkbtn = (LinkButton)ri.FindControl("LinkButton1");
                Label status = (Label)ri.FindControl("status");
                Label grade = (Label)ri.FindControl("grade");
                Label score = (Label)ri.FindControl("score");
                string strGrade = "-";
                string strScore = "-";
                bool parsed = Int32.TryParse(score.Text, out x);
                if (parsed)
                {
                    if (x >= 90)
                    {
                        strScore = x + "";
                        strGrade = "A+";
                    }
                    else if (x >= 80)
                    {
                        strScore = x + "";
                        strGrade = "A";
                    }
                    else if (x >= 75)
                    {
                        strScore = x + "";
                        strGrade = "A-";
                    }
                    else if (x >= 70)
                    {
                        strScore = x + "";
                        strGrade = "B+";
                    }
                    else if (x >= 65)
                    {
                        strScore = x + "";
                        strGrade = "B";
                    }
                    else if (x >= 60)
                    {
                        strScore = x + "";
                        strGrade = "B-";
                    }
                    else if (x >= 55)
                    {
                        strScore = x + "";
                        strGrade = "C+";
                    }
                    else if (x >= 50)
                    {
                        strScore = x + "";
                        strGrade = "C";
                    }
                    else if (x < 50 && x >= 0)
                    {
                        strScore = x + "";
                        strGrade = "F";
                    }
                }
                score.Text = strScore;
                grade.Text = strGrade;

                if (status.Text.Replace(" ", "") == "progress")
                {
                    status.ForeColor = System.Drawing.Color.Red;
                    status.Text = "Pending";
                    linkbtn.Enabled = false;
                }
                else if (status.Text.Replace(" ", "") == "done")
                {
                    status.Text = "View";
                }

            }


        }
        protected void lists_ItemDataBound2(object sender, RepeaterItemEventArgs e)
        {
            foreach (RepeaterItem ri in Repeater2.Items)
            {

                int x = 0;
                LinkButton linkbtn = (LinkButton)ri.FindControl("LinkButton2");
                Label status = (Label)ri.FindControl("status2");
                Label grade = (Label)ri.FindControl("grade2");
                Label score = (Label)ri.FindControl("score2");
                string strGrade2 = "-";
                string strScore2 = "-";
                bool parsed2 = Int32.TryParse(score.Text, out x);
                if (parsed2)
                {
                    if (x >= 90)
                    {
                        strScore2 = x + "";
                        strGrade2 = "A+";
                    }
                    else if (x >= 80)
                    {
                        strScore2 = x + "";
                        strGrade2 = "A";
                    }
                    else if (x >= 75)
                    {
                        strScore2 = x + "";
                        strGrade2 = "A-";
                    }
                    else if (x >= 70)
                    {
                        strScore2 = x + "";
                        strGrade2 = "B+";
                    }
                    else if (x >= 65)
                    {
                        strScore2 = x + "";
                        strGrade2 = "B";
                    }
                    else if (x >= 60)
                    {
                        strScore2 = x + "";
                        strGrade2 = "B-";
                    }
                    else if (x >= 55)
                    {
                        strScore2 = x + "";
                        strGrade2 = "C+";
                    }
                    else if (x >= 50)
                    {
                        strScore2 = x + "";
                        strGrade2 = "C";
                    }
                    else if (x < 50 && x >= 0)
                    {
                        strScore2 = x + "";
                        strGrade2 = "F";
                    }
                }
                score.Text = strScore2;
                grade.Text = strGrade2;

                if (status.Text.Replace(" ", "") == "progress")
                {
                    status.ForeColor = System.Drawing.Color.Red;
                    status.Text = "Pending";
                    linkbtn.Enabled = false;
                }
                else if (status.Text.Replace(" ", "") == "done")
                {
                    status.Text = "View";
                }


            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label assessID = (Label)e.Item.FindControl("assessID");
            Label stuAssessID = (Label)e.Item.FindControl("stuAssessID");
            Label questType = (Label)e.Item.FindControl("questType");
            Label score = (Label)e.Item.FindControl("score");
            Label grade = (Label)e.Item.FindControl("grade");
            Label assessName = (Label)e.Item.FindControl("assessName");
            Label subjectName = (Label)e.Item.FindControl("subjectName");
            Session["assessID"] = assessID.Text;
            Session["stuAssessID"] = stuAssessID.Text;
            Session["grade"] = grade.Text;
            Session["score"] = score.Text;
            Session["assessName"] = assessName.Text;
            Session["subjectName"] = subjectName.Text;

            if (questType.Text == "Subjective")
                Response.Redirect("~/studViewSubjective.aspx");
            else
                Response.Redirect("~/studViewMCQ.aspx");

        }
        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label assessID = (Label)e.Item.FindControl("assessID2");
            Label stuAssessID = (Label)e.Item.FindControl("stuAssessID2");
            Label questType = (Label)e.Item.FindControl("questType2");
            Label score = (Label)e.Item.FindControl("score2");
            Label grade = (Label)e.Item.FindControl("grade2");
            Label assessName = (Label)e.Item.FindControl("assessName2");
            Session["assessID"] = assessID.Text;
            Session["stuAssessID"] = stuAssessID.Text;
            Session["grade"] = grade.Text;
            Session["score"] = score.Text;
            Session["assessName"] = assessName.Text;
            Session["subjectName"] = "";

            if (questType.Text == "Subjective")
                Response.Redirect("~/studViewSubjective.aspx");
            else
                Response.Redirect("~/studViewMCQ.aspx");

        }
    }
}
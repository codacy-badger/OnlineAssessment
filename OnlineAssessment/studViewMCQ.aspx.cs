using System;
using ExceptionManagers;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class studViewMCQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string query = "SELECT lecName from Lecture L, Assessment A, Student_Assessment SA WHERE L.lecID = A.lecID AND " +
                "SA.assessID = A.assessID AND SA.stuAssessID = " + Convert.ToInt32(Session["stuAssessID"].ToString());
            try
{
    con.Open();
}
catch (Exception ex)
{
    Response.Redirect(ExceptionManagersHandler.PublishException("MyApplication", ex));
}
            SqlCommand cmd = new SqlCommand(query, con);

            string getLecName = cmd.ExecuteScalar().ToString();
            con.Close();


            scoreDetail.Text = "Your Score: " + Session["score"].ToString();
            if (Convert.ToInt32(Session["score"]) < 50)
            {
                scoreDetail.ForeColor = Color.Red;
            }
            else
            {
                scoreDetail.ForeColor = Color.Green;
            }

            if (Session["subjectName"].ToString() != "")
            {
                questionDetail.Text = "MCQ - <b>#" + Session["assessID"] + "</b> "
                    + Session["assessName"].ToString() + "<br/>Subject : "
                    + Session["subjectName"].ToString() + "<br/>Type : Private"
                    + "<br/>Created by : " + getLecName;
            }
            else
            {
                questionDetail.Text = "MCQ - <b>#" + Session["assessID"] + "</b> "
                   + Session["assessName"].ToString() + "<br/>Type : Public"
                  + "<br/>Created by : " + getLecName;
            }
        }
        protected void lists_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            foreach (RepeaterItem ri in Repeater1.Controls)
            {
                Label stuAns = (Label)ri.FindControl("stuAns");
                RadioButton op1 = (RadioButton)ri.FindControl("selectA");
                RadioButton op2 = (RadioButton)ri.FindControl("selectB");
                RadioButton op3 = (RadioButton)ri.FindControl("selectC");
                RadioButton op4 = (RadioButton)ri.FindControl("selectD");
                Label lblCorrectAns = (Label)ri.FindControl("lblCorrectAns");
                HtmlContainerControl divA = (HtmlContainerControl)ri.FindControl("div_A");
                HtmlContainerControl divB = (HtmlContainerControl)ri.FindControl("div_B");
                HtmlContainerControl divC = (HtmlContainerControl)ri.FindControl("div_C");
                HtmlContainerControl divD = (HtmlContainerControl)ri.FindControl("div_D");

                //make student answer red color
                if (stuAns.Text == "A                                                                                                   ")
                {
                    op1.Checked = true;
                    divA.Attributes.Add("Style", "background-color:#ff7d7d;");
                }
                else if (stuAns.Text == "B                                                                                                   ")
                {
                    op2.Checked = true;
                    divB.Attributes.Add("Style", "background-color:#ff7d7d;");
                }
                else if (stuAns.Text == "C                                                                                                   ")
                {
                    op3.Checked = true;
                    divC.Attributes.Add("Style", "background-color:#ff7d7d;");
                }
                else
                {
                    op4.Checked = true;
                    divD.Attributes.Add("Style", "background-color:#ff7d7d;");
                }

                //make correct answer to green color
                if (lblCorrectAns.Text.Replace(" ", "") == "A")
                {
                    divA.Attributes.Add("Style", "background-color:#5cfb5c;");
                }
                else if (lblCorrectAns.Text.Replace(" ", "") == "B")
                {
                    divB.Attributes.Add("Style", "background-color:#5cfb5c;");
                }
                else if (lblCorrectAns.Text.Replace(" ", "") == "C")
                {
                    divC.Attributes.Add("Style", "background-color:#5cfb5c;");
                }
                else if (lblCorrectAns.Text.Replace(" ", "") == "D")
                {
                    divD.Attributes.Add("Style", "background-color:#5cfb5c;");
                }

            }
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/studViewAssessments.aspx", false);
        }
    }
}
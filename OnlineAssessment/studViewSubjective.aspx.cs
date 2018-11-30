using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace OnlineAssessment
{
    public partial class studViewSubjective : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string query = "SELECT lecName from Lecture L, Assessment A, Student_Assessment SA WHERE L.lecID = A.lecID AND " +
                "SA.assessID = A.assessID AND SA.stuAssessID = " + Convert.ToInt32(Session["stuAssessID"].ToString());
            con.Open();
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
                    + Session["subjectName"].ToString() + "<br/>Type : Private<br/>Created by : " + getLecName;
            }
            else
            {
                questionDetail.Text = "MCQ - <b>#" + Session["assessID"] + "</b> "
                   + Session["assessName"].ToString() + "<br/>Type : Public<br/>Created by : " + getLecName;
            }
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/studViewAssessments.aspx", false);
        }
    }

}
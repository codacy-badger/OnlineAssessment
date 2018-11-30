using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{

    public partial class lectSubjectList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblSubjectName.Text = Session["subjectName"].ToString();
            lblSubjectCode.Text = Session["subjectCode"].ToString();
            lblSubjectInfo.Text = Session["subjectDesc"].ToString();
            if (!IsPostBack)
            {
                if (Request.QueryString["kick"] != null)
                {
                    lblMsg.Text = "Student have been kicked out from this subject";
                }
            }
        }

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label enrollID = (Label)e.Item.FindControl("lblEnrollID");
            int enrollSID = Convert.ToInt32(enrollID.Text);
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("delete FROM EnrollStudent WHERE enrollSID = '" + enrollSID + "'", con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("lectSubjectList.aspx?kick=" + enrollSID.ToString(), false);

        }

        protected void btnEnrollStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EnrollStudents.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
    }
}
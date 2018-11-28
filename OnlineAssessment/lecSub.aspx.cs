using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class lecSub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label subjectCode = (Label)e.Item.FindControl("lblSubjectCode");
            Label subjectName = (Label)e.Item.FindControl("lblSubjectName");

            Session["subjectCode"] = subjectCode.Text;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();
            SqlCommand cmd = new SqlCommand("select * FROM Subject WHERE subjectCode= '" + Session["subjectCode"].ToString() + "'", con);
            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                if (rdr.Read())
                {
                    Session["subjectID"] = rdr.GetInt32(0);
                    Session["subjectCode"] = rdr.GetString(1);
                    Session["subjectName"] = rdr.GetString(2);
                    Session["subjectDesc"] = rdr.GetString(3);
                }
            }
            con.Close();

            Response.Redirect("~/lecSubList.aspx");
        }

    }
}
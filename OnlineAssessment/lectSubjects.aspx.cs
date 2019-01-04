using System;
using ExceptionManagers;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class lectSubjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["delete"] != null)
                {
                    lblMsg.Text = "Unenrolled.";
                }
            }
        }
        override protected void OnInit(EventArgs e)
        {
            base.OnInit(e);
            Repeater1.ItemCommand += new RepeaterCommandEventHandler(Repeater1_ItemCommand);
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
            try
{
    con.Open();
}
catch (Exception ex)
{
    Response.Redirect(ExceptionManagersHandler.PublishException("MyApplication", ex));
}
            SqlCommand cmd = new SqlCommand("select * FROM Subject WHERE subjectCode= '" + Session["subjectCode"] + "'", con);
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

            if (e.CommandName.Equals("view"))
            {
                
                Response.Redirect("~/lectSubjectList.aspx");
            }
            else if (e.CommandName.Equals("unenroll"))
            {
                SqlCommand cmd2 = new SqlCommand("delete FROM enrollLecturer WHERE lecID = " + Int16.Parse(Session["userID"].ToString()) + " AND subjectID = " + Int16.Parse(Session["subjectID"].ToString()), con);

                try
{
    con.Open();
}
catch (Exception ex)
{
    Response.Redirect(ExceptionManagersHandler.PublishException("MyApplication", ex));
}
                cmd2.ExecuteNonQuery();
                con.Close();

                Response.Redirect("lectSubjects.aspx?delete=" + subjectCode, false);
            }


        }

    }
}
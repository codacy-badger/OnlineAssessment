using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class lectViewAssessments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["delete"] != null)
                {
                    lblMsg.Text = "Assessment has been deleted.";
                }
            }

            Global.DeleteEmptyAssessments();

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
                EmptyRepeater.RepeatTitle = "Private";
                Repeater1.HeaderTemplate = LoadTemplate("EmptyRepeater.ascx");
            }
            else if (Repeater2.Items.Count == 0)
            {
                EmptyRepeater.RepeatTitle = "Public";
                Repeater2.HeaderTemplate = LoadTemplate("EmptyRepeater.ascx");
            }

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

            if (e.CommandName.Equals("view"))
            {
                Response.Redirect("~/lectViewAssessmentList.aspx");
            }
            else if (e.CommandName.Equals("delete"))
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd = new SqlCommand("delete FROM Assessment WHERE assessID = '" + assessID.Text + "'", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("lectViewAssessments.aspx?delete=" + assessID, false);
            }
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

            if (e.CommandName.Equals("view"))
            {
                Response.Redirect("~/lectViewAssessmentList.aspx");
            }
            else if (e.CommandName.Equals("delete"))
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd = new SqlCommand("delete FROM Assessment WHERE assessID = '" + assessID.Text + "'", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("lectViewAssessments.aspx?delete=" + assessID, false);
            }
        }

        override protected void OnInit(EventArgs e)
        {
            base.OnInit(e);
            Repeater2.ItemCommand += new RepeaterCommandEventHandler(Repeater2_ItemCommand);
        }
        
    }
}
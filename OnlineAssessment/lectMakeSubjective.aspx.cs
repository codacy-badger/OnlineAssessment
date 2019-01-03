using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class lectMakeSubjective : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            int subjectID = Convert.ToInt32(Session["subjectID"]);
            if (subjectID != 0)
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);

                con.Open();
                SqlCommand getSubject = new SqlCommand("SELECT (subjectCode + ' ' + subjectName) AS SUBJECT " +
               "FROM Subject WHERE subjectID = " + subjectID, con);
                string subject = getSubject.ExecuteScalar().ToString();
                con.Close();
                subjectName.Text = subject;
            }
            else subjectName.Text = "-";

            type.Text = (String)Session["type"];
            assessName.Text = Session["assessID"].ToString() + " " + (String)Session["assessment"];

            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            if (txtDesc.Text != "")
                addQuestion();
            Response.Redirect("~/lectMakeSubjective.aspx", false);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/lectMakeSubjective.aspx", false);
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                error1.Text = "";
                if (txtDesc.Text != "")
                    addQuestion();

                MultiView1.ActiveViewIndex = 1;
                btnFinish.Visible = true;
                btnAddMore.Visible = true;
            }
            else
            {
                error1.Text = "Cannot submit! Make sure all fields are valid!";
            }
        }

        protected void btnFinish_Click(object sender, EventArgs e)
        {
            Repeater1.DataSource = SqlDataSource2;
            Repeater1.DataBind();
            if (Repeater1.Items.Count == 0)
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd;


                string query = "DELETE FROM Question WHERE assessID = @param1";

                cmd = new SqlCommand(query, con);

                cmd.Parameters.Add("@param1", SqlDbType.Int).Value = Session["assessID"];

                con.Open();
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
            }
            Response.Redirect("~/lectViewAssessments.aspx");
        }

        protected void btnAddMore_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Response.Redirect("~/lectMakeSubjective.aspx", false);
            btnFinish.Visible = false;
            btnAddMore.Visible = false;
        }

        protected void addQuestion()
        {
            // Image Upload
            byte[] data = null;
            if (imageUpload.HasFile)
            {
                imageUpload.PostedFile.SaveAs(Server.MapPath("~/Images/temp.jpeg"));
                data = File.ReadAllBytes(Server.MapPath("~/Images/temp.jpeg"));
            }
            

            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd;

            con.Open();
            SqlCommand CountAssess = new SqlCommand("Select count(*) from Assessment", con);
            int count = (int)CountAssess.ExecuteScalar();
            int assessID = 1001;
            con.Close();

            if (count > 0)
            {
                con.Open();
                cmd = new SqlCommand("select MAX(assessID) from Assessment", con);
                assessID = (int)cmd.ExecuteScalar();
                con.Close();
            }

            string query = "INSERT INTO Question(assessID, questName, mark, image) " +
            "VALUES (@param1, @param2, @param3, @param4)";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.Add("@param1", SqlDbType.Int).Value = assessID;
            cmd.Parameters.Add("@param2", SqlDbType.NVarChar).Value = txtDesc.Text;
            cmd.Parameters.Add("@param3", SqlDbType.Int).Value = ddlMark.SelectedValue;
            if (data != null)
            {
                cmd.Parameters.Add("@param4", SqlDbType.VarBinary).Value = data;
            }
            else
            {
                cmd.Parameters.Add("@param4", SqlDbType.VarBinary).Value = DBNull.Value;
            }

            con.Open();
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                DataList1.EditItemIndex = e.Item.ItemIndex;
                

            }
            else if (e.CommandName == "delete")
            {
                int questID = Convert.ToInt32(((Label)e.Item.FindControl("lblQuest")).Text);

                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd = new SqlCommand("DELETE from Question WHERE questID = " + questID, con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                DataList1.EditItemIndex = -1;
                DataList1.EditItemIndex = -1;
            }
            else if (e.CommandName == "cancel")
            {
                DataList1.EditItemIndex = -1;
            }
            else if (e.CommandName == "update")
            {
                int questID = int.Parse(((Label)e.Item.FindControl("lblQuest")).Text);
                int assessID = int.Parse(((Label)e.Item.FindControl("lblAssess")).Text);
                string question = ((TextBox)e.Item.FindControl("editQName")).Text;
                int mark = int.Parse(((DropDownList)e.Item.FindControl("ddlEditMark")).SelectedValue);

                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd = new SqlCommand("update question set questName = '"
                    + question + "', mark = " + mark +
                    " WHERE questID = " + questID + " AND assessID = " + assessID, con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                DataList1.EditItemIndex = -1;
                
            }
            DataList1.DataBind();
        }

    }
}
﻿using System;
using ExceptionManagers;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class studDoAssessments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Global.DeleteEmptyAssessments(); // 
            Repeater1.DataBind();
            Repeater2.DataBind();

            if (Repeater1.Items.Count == 0 && Repeater2.Items.Count == 0)
            {
                EmptyRepeater.RepeatTitle = "";
                Repeater1.HeaderTemplate = LoadTemplate("EmptyRepeater.ascx");
                Repeater2.HeaderTemplate = null;
            }
        }
        
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label lblQuestType = (Label)e.Item.FindControl("questType");
            Label lblAssessID = (Label)e.Item.FindControl("assessID");
            Label lblAssessName = (Label)e.Item.FindControl("assessName");
            Label lblAssessType = (Label)e.Item.FindControl("assessType");
            Label lblSubjectName = (Label)e.Item.FindControl("subjectName");
            Label lblLecName = (Label)e.Item.FindControl("lecName");
            Session["assessName"] = lblAssessName.Text;
            Session["questType"] = lblQuestType.Text;
            Session["assessID"] = lblAssessID.Text;
            Session["assessType"] = lblAssessType.Text;
            Session["lecName"] = lblLecName.Text;

            if (lblAssessType.Text == "Private   ")
                Session["subjectName"] = lblSubjectName.Text;
            else
                Session["subjectName"] = "";

            if (lblQuestType.Text == "Subjective")
                Response.Redirect("~/studDoSubjective.aspx", false);
            else
                Response.Redirect("~/studDoMCQ.aspx", false);

        }
    }
}
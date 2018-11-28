using System;
using System.Linq;

namespace OnlineAssessment
{
    public partial class CreateAssessment : System.Web.UI.Page
    {
        Models.AssessmentEntities2 db = new Models.AssessmentEntities2();
        
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string lectureid = Session["id"].ToString();
            string assTitle = txtTitle.Text;
            string assYear = DateTime.Now.ToString();
            string vb = RadioButtonList1.SelectedValue;
            string t = RadioButtonList2.SelectedValue;
            string lec = lectureid;
            string assID = "";
            int count = db.Assessments.Count();
            int newID = count + 1;

            if (newID < 10)
            {
                assID = "A000" + newID.ToString();

            }
            else if (newID < 100)
            {
                assID = "A00" + newID.ToString();

            }
            else
            {
                assID = "A0" + newID.ToString();
            }

                Models.Assessment use = new Models.Assessment
                {
                    AssessmentCode = assID,
                    AssessmentTitle = assTitle,
                    AssessmentYear = Convert.ToDateTime(assYear),
                    Publicity = vb,
                    LecID = lec,
                    Type = int.Parse(t)
                };

                db.Assessments.Add(use);
                db.SaveChanges();

            Session["AssID"] = assID;

            if (t == "0")
            {
                Response.Redirect("CreateMCQuestion.aspx");
            }
            else if (t == "1")
            {
                Response.Redirect("CreateSubQuestion.aspx");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Server.Transfer("CreateAssessment.aspx");
        }

    }
}
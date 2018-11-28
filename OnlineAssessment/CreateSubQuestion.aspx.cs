using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class CreateSubQuestion : System.Web.UI.Page
    {
        Models.AssessmentEntities2 db = new Models.AssessmentEntities2();
        string l;

        protected void Page_Load(object sender, EventArgs e)
        {
            l = Session["AssID"].ToString();
            title.Text = l;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string desc = txtDesc.Text;
                int mark = int.Parse(markddl.SelectedItem.Value);
                string qID = "";
                int count = db.WrittenQuestions.Count();
                int newID = count + 1;

                FileUpload img = (FileUpload)fullImg;
                Byte[] imgByte = null;
                if (img.HasFile && img.PostedFile != null)
                {
                    //To create a PostedFile
                    HttpPostedFile File = fullImg.PostedFile;
                    //Create byte Array with file len
                    imgByte = new Byte[File.ContentLength];
                    //force the control to load data in array
                    File.InputStream.Read(imgByte, 0, File.ContentLength);
                }

                if (newID < 10)
                {
                    qID = "W000" + newID.ToString();

                }
                else if (newID < 100)
                {
                    qID = "W00" + newID.ToString();

                }
                else
                {
                    qID = "W0" + newID.ToString();
                }

                Models.WrittenQuestion u = new Models.WrittenQuestion
                {
                    QuestionID = qID,
                    Question = desc,
                    AssessmentCode = l,
                    SubImg = imgByte,
                    Score = mark,
                };

                db.WrittenQuestions.Add(u);
                db.SaveChanges();

                Response.Redirect("CreateSubQuestion.aspx");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtDesc.Text = "";
            markddl.ClearSelection();
            fullImg.Attributes.Clear();
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string desc = txtDesc.Text;
                int mark = int.Parse(markddl.SelectedItem.Value);
                string qID = "";
                int count = db.WrittenQuestions.Count();
                int newID = count + 1;

                FileUpload img = (FileUpload)fullImg;
                Byte[] imgByte = null;
                if (img.HasFile && img.PostedFile != null)
                {
                    //To create a PostedFile
                    HttpPostedFile File = fullImg.PostedFile;
                    //Create byte Array with file len
                    imgByte = new Byte[File.ContentLength];
                    //force the control to load data in array
                    File.InputStream.Read(imgByte, 0, File.ContentLength);
                }

                if (newID < 10)
                {
                    qID = "W000" + newID.ToString();

                }
                else if (newID < 100)
                {
                    qID = "W00" + newID.ToString();

                }
                else
                {
                    qID = "W0" + newID.ToString();
                }

                Models.WrittenQuestion u = new Models.WrittenQuestion
                {
                    QuestionID = qID,
                    Question = desc,
                    AssessmentCode = l,
                    SubImg = imgByte,
                    Score = mark,
                };

                db.WrittenQuestions.Add(u);
                db.SaveChanges();

                Response.Redirect("LecturePage.aspx");
            }
        }
    }
}
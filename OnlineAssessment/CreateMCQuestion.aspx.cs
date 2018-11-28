using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class CreateMCQuestion : System.Web.UI.Page
    {
        Models.AssessmentEntities2 db = new Models.AssessmentEntities2();
        string l;

        protected void Page_Load(object sender, EventArgs e)
        {
            l = Session["AssID"].ToString();
            title.Text = l;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string desc = txtDesc.Text;
                string o1 = opt1.Text;
                string o2 = opt2.Text;
                string o3 = opt3.Text;
                string o4 = opt4.Text;
                string cOpt = answerddl.SelectedItem.Value;
                string qID = "";
                int count = db.MCQs.Count();
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

                    Models.MCQ u = new Models.MCQ
                    {
                        MCQID = qID,
                        MCQuestion = desc,
                        Opt1 = o1,
                        Opt2 = o2,
                        Opt3 = o3,
                        Opt4 = o4,
                        COpt = cOpt,
                        AssessmentCode = l,
                        Img = imgByte
                    };

                    db.MCQs.Add(u);
                    db.SaveChanges();

                Server.Transfer("CreateMCQuestion.aspx");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtDesc.Text = "";
            opt1.Text = "";
            opt2.Text = "";
            opt3.Text = "";
            opt4.Text = "";
            answerddl.ClearSelection();
            fullImg.Attributes.Clear();
            
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                string desc = txtDesc.Text;
                string o1 = opt1.Text;
                string o2 = opt2.Text;
                string o3 = opt3.Text;
                string o4 = opt4.Text;
                string cOpt = answerddl.SelectedItem.Value;
                string qID = "";
                int count = db.MCQs.Count();
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

                Models.MCQ u = new Models.MCQ
                {
                    MCQID = qID,
                    MCQuestion = desc,
                    Opt1 = o1,
                    Opt2 = o2,
                    Opt3 = o3,
                    Opt4 = o4,
                    COpt = cOpt,
                    AssessmentCode = l,
                    Img = imgByte
                };

                db.MCQs.Add(u);
                db.SaveChanges();

                Server.Transfer("LecturePage.aspx");
            }
        }
    }
}
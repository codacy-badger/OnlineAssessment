using System;
using System.Linq;

namespace OnlineAssessment
{
    public partial class Registration : System.Web.UI.Page
    {
        Models.AssessmentEntities2 db = new Models.AssessmentEntities2();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                string username = txtName.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;
                string userID = "";
                string value = RadioButtonList1.SelectedValue;

                if (value == "Student")
                {
                    int count = db.Students.Count();
                    int newID = count + 1;

                    if (newID < 10)
                    {
                        userID = "S000" + newID.ToString();

                    }
                    else if (newID < 100)
                    {
                        userID = "S00" + newID.ToString();

                    }
                    else
                    {
                        userID = "S0" + newID.ToString();
                    }

                    Models.Student use = new Models.Student
                    {
                        StudID = userID,
                        StudName = username,
                        StudEmail = email,
                        StudPass = password
                    };
                    db.Students.Add(use);
                    db.SaveChanges();
                }

                else if (value == "Lecturer")
                {
                    int count = db.Lecturers.Count();
                    int newID = count + 1;

                    if (newID < 10)
                    {
                        userID = "L000" + newID.ToString();

                    }
                    else if (newID < 100)
                    {
                        userID = "L00" + newID.ToString();

                    }
                    else
                    {
                        userID = "L0" + newID.ToString();
                    }

                    Models.Lecturer use = new Models.Lecturer
                    {
                        LecID = userID,
                        LecName = username,
                        LecEmail = email,
                        LecPass = password
                    };

                    db.Lecturers.Add(use);
                    db.SaveChanges();
                }
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Server.Transfer("Homepage.aspx");
        }

    }
}
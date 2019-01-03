using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnlineAssessment
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
                Session.Abandon();
            }

            if (Request.QueryString["resession"] != null)
            {
                lblErrorMsg.Visible = false;
                if (Request.QueryString["resession"] == "yes")
                lblErrorMsg.Visible = true;
                lblErrorMsg.Text = "Session ended! Please login again.";
            }
            else
            {
                lblErrorMsg.Visible = false;
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            loginFunc();
        }

        protected void loginFunc()
        {
            lblErrorMsg.Visible = false;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            if (validateLogin() == 0)
                Response.Write("<script>alert('Password and email does not match!');</script>");
            else
            {
                if (validateLogin() == 1) // lecturer
                {
                    con.Open();
                    SqlCommand getPsw = new SqlCommand("SELECT psw from Lecture WHERE email = '" + Request.Form["txtEmail"] + "'", con);
                    string psw = getPsw.ExecuteScalar().ToString().Replace(" ", "");

                    con.Close();

                    if (psw == Request.Form["txtPassword"])
                    {
                        con.Open();
                        SqlCommand getName = new SqlCommand("SELECT lecID, lecName, gender from Lecture WHERE email = '" + Request.Form["txtEmail"] + "'", con);
                        string name = "";
                        string gender = "";
                        int lecID = 0;
                        using (SqlDataReader rdr = getName.ExecuteReader())
                        {
                            if (rdr.Read())
                            {
                                lecID = rdr.GetInt32(0);
                                name = rdr.GetString(1);
                                gender = rdr.GetString(2).Replace(" ", "");
                            }
                        }
                        con.Close();
                        Session["userID"] = lecID;
                        Session["username"] = name;
                        Session["gender"] = gender;
                        Session["role"] = "Lecturer";


                        Response.Redirect("~/lectViewAssessments.aspx", false);
                    }
                    else
                    {
                        lblErrorMsg.Visible = true;
                        lblErrorMsg.Text = "Wrong Password / Email Entered";
                    }
                }
                else // student
                {
                    con.Open();
                    SqlCommand getPsw = new SqlCommand("SELECT psw from Student WHERE email = '" + Request.Form["txtEmail"].ToUpper() + "'", con);
                    string psw = getPsw.ExecuteScalar().ToString().Replace(" ", "");
                    con.Close();

                    if (psw == Request.Form["txtPassword"])
                    {

                        con.Open();
                        SqlCommand getName = new SqlCommand("SELECT stuID, stuName, gender from Student WHERE email = '" + Request.Form["txtEmail"].ToUpper() + "'", con);
                        string name = "";
                        string gender = "";
                        int stuID = 0;
                        using (SqlDataReader rdr = getName.ExecuteReader())
                        {
                            if (rdr.Read())
                            {
                                stuID = rdr.GetInt32(0);
                                name = rdr.GetString(1);
                                gender = rdr.GetString(2).Replace(" ", "");
                            }
                        }
                        con.Close();
                        Session["userID"] = stuID;
                        Session["username"] = name;
                        Session["email"] = Request.Form["txtEmail"];
                        Session["gender"] = gender;
                        Session["role"] = "Student";

                        Response.Redirect("~/studDoAssessments.aspx", false);
                    }
                    else
                    {
                        lblErrorMsg.Visible = true;
                        lblErrorMsg.Text = "Wrong Password / Email Entered";
                    }
                }

            }
        }

        private int validateLogin()
        {
            if (Request.Form["txtEmail"].ToUpper().Equals("") || Request.Form["txtPassword"].ToUpper().Equals(""))
            {
                return 0;
            }
            string query1, query2;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd;
            SqlDataAdapter da;
            DataSet ds;

            //Check email from lecturer, return 1 if lecturer
            query1 = "Select * from Lecture where email = '" + Request.Form["txtEmail"].ToUpper() + "'";
            cmd = new SqlCommand(query1, con);
            con.Open();
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ds.Clear();
                return 1;
            }

            //Check email from lecturer, return 2 if student
            query2 = "Select * from Student where email = '" + Request.Form["txtEmail"].ToUpper() + "'";
            cmd = new SqlCommand(query2, con);
            con.Open();
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ds.Clear();
                return 2;
            }

            //return 0 if none
            return 0;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx", false);
        }
    }
}
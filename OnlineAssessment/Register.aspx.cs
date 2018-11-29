﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnlineAssessment
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            register();
        }

        protected void register()
        {
            string role = rblRole.SelectedValue;
            string query;

            if (checkEmailExist() == true)
                Response.Write("<script>alert('Email Registered. Please Choose another');</script>");
            else
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd;

                if (role == "Lecturer")
                {
                    query = "INSERT INTO Lecture(lecName, psw, email, gender) " +
                "VALUES (@param1, @param2, @param3, @param4)";
                }
                else
                {
                    query = "INSERT INTO Student(stuName, psw, email, gender) " +
                "VALUES (@param1, @param2, @param3, @param4)";
                }

                cmd = new SqlCommand(query, con);

                cmd.Parameters.Add("@param1", SqlDbType.NVarChar).Value = Request.Form["txtName"];
                cmd.Parameters.Add("@param2", SqlDbType.NVarChar).Value = Request.Form["txtPassword"];
                cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = Request.Form["txtEmail"].ToUpper();
                cmd.Parameters.Add("@param4", SqlDbType.NVarChar).Value = rblGender.SelectedValue;

                con.Open();

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                
                Response.Write("<script>alert('Register Successfuly. As a " + role + ". Proceed to Login..');" +
                    "window.location = 'MainPage.aspx'</script>"); 
                
               
            }
        }

        private Boolean checkEmailExist()
        {
            Boolean emailExist = false;
            string query1, query2;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd;

            con.Open();
            query1 = "Select * from Lecture where email = '" + Request.Form["txtEmail"].ToUpper() + "'";
            cmd = new SqlCommand(query1, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                emailExist = true;
            }
            con.Close();

            con.Open();
            query2 = "Select * from Student where email = '" + Request.Form["txtEmail"].ToUpper() + "'";
            cmd = new SqlCommand(query2, con);
            SqlDataAdapter da1 = new SqlDataAdapter();
            da1.SelectCommand = cmd;
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                emailExist = true;
            }
            con.Close();


            return emailExist;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx", false);
        }

    }
}
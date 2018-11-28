using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class ViewMCQuestion : System.Web.UI.Page
    {
        string str = " ";
        SqlDataReader rd;
        int correct_ans = 0;
        int wrong_ans = 0;

        Models.AssessmentEntities2 db = new Models.AssessmentEntities2();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Loadgt();
            }
        }

        private void Loadgt()
        {
            string ass = Session["Assessment"].ToString();
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlCommand cmd = new SqlCommand("select * from MCQ where AssessmentCode = @ass", con);
            cmd.Parameters.AddWithValue("@ass", ass);
            con.Open();
            rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Dispose();
            con.Close();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
             foreach (GridViewRow row in GridView1.Rows)
            {
                Label l1 = row.FindControl("QuestionID") as Label;
                RadioButton r1 = row.FindControl("Opt1") as RadioButton;
                RadioButton r2 = row.FindControl("Opt2") as RadioButton;
                RadioButton r3 = row.FindControl("Opt3") as RadioButton;
                RadioButton r4 = row.FindControl("Opt4") as RadioButton;

                if (r1.Checked)
                {
                    str = "A";
                }
                else if (r2.Checked)
                {
                    str = "B";
                }
                else if (r3.Checked)
                {
                    str = "C";
                }
                else if (r4.Checked)
                {
                    str = "D";
                }
                Check_number(l1.Text, str);

            }
            calculate(correct_ans, GridView1.Rows.Count);


        }

        private void calculate(int correct_ans, int p)
        {
            double percentage = (correct_ans * 100) / p;
            String finalmark = percentage.ToString();

            string a = Session["Assessment"].ToString();
            string s = Session["id"].ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlCommand cmd = new SqlCommand("Select * FROM TakenAss WHERE StudID = @StudID AND AssessmentCode = @AssessmentCode", con);
            cmd.Parameters.AddWithValue("@StudID", s);
            cmd.Parameters.AddWithValue("@AssessmentCode", a);
            SqlDataAdapter sdan = new SqlDataAdapter(cmd);
            DataTable dtn = new DataTable();

            sdan.Fill(dtn);
            con.Open();
            int j = cmd.ExecuteNonQuery();
            con.Close();
            if (dtn.Rows.Count > 0)
            {
                SqlCommand cmd1;
                SqlDataAdapter adapter = new SqlDataAdapter();
                String sql = "";


                sql = "UPDATE TakenAss SET mark = @mark, AssStatus = 'Mark' where (AssessmentCode = @AssessmentCode AND StudID = @StudID)";

                cmd1 = new SqlCommand(sql, con);
                cmd1.Parameters.AddWithValue("@mark", percentage);
                cmd1.Parameters.AddWithValue("@AssessmentCode", a);
                cmd1.Parameters.AddWithValue("@StudID", s);

                con.Open();
                cmd1.ExecuteNonQuery();

                cmd1.Dispose();
                con.Close();
            }
            else
            {

                Models.TakenAss ta = new Models.TakenAss
                {
                    AssessmentCode = a,
                    StudID = s,
                    mark = int.Parse(finalmark),
                    AssStatus = "Mark"
                };

                db.TakenAsses.Add(ta);
                db.SaveChanges();
                Response.Redirect("StudentPage.aspx");
            }

        }

        private void Check_number(string test, string select_no)
        {
            string assID = Session["Assessment"].ToString();
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlCommand cmd = new SqlCommand("Select * FROM MCQ WHERE MCQID = @mcqID", con);
            cmd.Parameters.AddWithValue("@mcqID", test);
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                if (select_no.Equals(rd["COpt"]))
                {
                    correct_ans = correct_ans + 1;
                    break;
                }
                else
                {
                    wrong_ans = wrong_ans + 1;
                    break;
                }

            }
            rd.Dispose();
            con.Close();
        }
    }
}
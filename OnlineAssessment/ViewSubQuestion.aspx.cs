using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class ViewSubQuestion : System.Web.UI.Page
    {
        SqlDataReader rd;
        Models.AssessmentEntities2 db = new Models.AssessmentEntities2();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string assessmentID = Session["Assessment"].ToString();
            string stud = Session["id"].ToString();

            for (int i = 0; i <= Repeater1.Items.Count - 1; i++)
            {
                Label subID = Repeater1.Items[i].FindControl("Q") as Label;
                string subid = subID.Text;
                TextBox tb = Repeater1.Items[i].FindControl("subans") as TextBox;
                tb.Text = tb.Text.ToString();
                string subjAns = tb.Text;
                string idn;

                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
                SqlCommand cmdn = new SqlCommand("Select * FROM StudAns WHERE StudID = @StudID AND AssessmentCode = @AssessmentCode AND QuestionID = @Q", conn);
                cmdn.Parameters.AddWithValue("@StudID", stud);
                cmdn.Parameters.AddWithValue("@AssessmentCode", assessmentID);
                cmdn.Parameters.AddWithValue("@Q", subid);
                SqlDataAdapter sdann = new SqlDataAdapter(cmdn);
                DataTable dtnn = new DataTable();

                sdann.Fill(dtnn);
                conn.Open();
                int f = cmdn.ExecuteNonQuery();
                conn.Close();

                if (dtnn.Rows.Count > 0)
                {
                    SqlCommand cmd2;
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    String sql = "";


                    sql = "UPDATE StudAns SET WrittenAns = @ee where (AssessmentCode = @AssessmentCode AND StudID = @StudID AND QuestionID = @ii)";

                    cmd2 = new SqlCommand(sql, conn);
                    cmd2.Parameters.AddWithValue("@AssessmentCode", assessmentID);
                    cmd2.Parameters.AddWithValue("@StudID", stud);
                    cmd2.Parameters.AddWithValue("@ee", subjAns);
                    cmd2.Parameters.AddWithValue("@ii", subid);

                    conn.Open();
                    cmd2.ExecuteNonQuery();

                    cmd2.Dispose();
                    conn.Close();
                }

                else
                {

                    int count = db.StudAns.Count();
                    int newID = count + 1;
                    if (newID < 10)
                    {
                        idn = "J000" + newID.ToString();
                    }
                    else if (newID < 100)
                    {
                        idn = "J00" + newID.ToString();
                    }
                    else if (newID < 1000)
                    {
                        idn = "J0" + newID.ToString();
                    }
                    else
                    {
                        idn = "J" + newID.ToString();
                    }

                    Models.StudAn use = new Models.StudAn
                    {
                        StudAnsID = idn,
                        StudID = stud,
                        AssessmentCode = assessmentID,
                        QuestionID = subid,
                        WrittenAns = subjAns,
                        /*QuestionID = Convert.ToString(subID),
                        WrittenAns = Convert.ToString(tb)*/
                    };

                    db.StudAns.Add(use);
                    db.SaveChanges();
                }
            }

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
                SqlCommand cmd = new SqlCommand("Select * FROM TakenAss WHERE StudID = @StudID AND AssessmentCode = @AssessmentCode", con);
                cmd.Parameters.AddWithValue("@StudID", stud);
                cmd.Parameters.AddWithValue("@AssessmentCode", assessmentID);
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


                    sql = "UPDATE TakenAss SET mark = 0, AssStatus = 'Unmark' where (AssessmentCode = @AssessmentCode AND StudID = @StudID)";

                    cmd1 = new SqlCommand(sql, con);
                    cmd1.Parameters.AddWithValue("@AssessmentCode", assessmentID);
                    cmd1.Parameters.AddWithValue("@StudID", stud);

                    con.Open();
                    cmd1.ExecuteNonQuery();

                    cmd1.Dispose();
                    con.Close();
                    Response.Redirect("StudentPage.aspx");
                }
                else
                {
                    Models.TakenAss ta = new Models.TakenAss
                    {
                        AssessmentCode = assessmentID,
                        StudID = stud,
                        mark = 0,
                    };

                    db.TakenAsses.Add(ta);
                    db.SaveChanges();
                    Response.Redirect("StudentPage.aspx");
                }
        }
    }
}
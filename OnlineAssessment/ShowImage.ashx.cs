using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;

namespace OnlineAssessment
{

    public class ShowImage : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            String imgno;
            if (context.Request.QueryString["id"] != null)
                imgno = context.Request.QueryString["id"];
            else
                throw new ArgumentException("No parameter specified");

            context.Response.ContentType = "image/jpeg";
            Stream strm = ShowQImage(imgno);
            byte[] buffer = new byte[4096];
            if (strm != null)
            {
                int byteSeq = strm.Read(buffer, 0, 4096);

                while (byteSeq > 0)
                {
                    context.Response.OutputStream.Write(buffer, 0, byteSeq);
                    byteSeq = strm.Read(buffer, 0, 4096);
                }
            }
            //context.Response.BinaryWrite(buffer);
        }

        public Stream ShowQImage(String imgno)
        {
            string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\wei\source\repos\Assignment(N)\Assignment(N)\App_Data\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            SqlConnection connection = new SqlConnection(conn);
            string sql = "SELECT Img FROM MCQ WHERE MCQID = @ID";
            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@ID", imgno);
            connection.Open();
            object img = cmd.ExecuteScalar();
            try
            {
                return new MemoryStream((byte[])img);
            }
            catch
            {
                return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


    }
}
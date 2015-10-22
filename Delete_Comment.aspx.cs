using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Delete_Comment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Page.IsPostBack == false) && Request.Params["id"] != null)
        {
            try
            {
                // int id = Convert.ToInt32(Request.Params["id"]);
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT COMMENTS.COMMENT FROM [COMMENTS] WHERE [ID] = @ID", connection);
                command.Parameters.AddWithValue("ID", Request.Params["id"]);

                try
                {
                    SqlDataReader r = command.ExecuteReader(); // pentru select
                    
                }
                catch (SqlException sqex)
                {
                    Raspuns.Text = sqex.Message;
                }

                connection.Close();
            }
            catch (Exception ex)
            {
                Raspuns.Text = ex.Message;
            }
        }
    }

    protected void ButtonDa_Click(object sender, EventArgs e)
    {
        int id_news = Convert.ToInt32(Request.Params["id_news"]);

        if (Request.Params["id"] != null)
        {
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                connection.Open();

                SqlCommand command = new SqlCommand("DELETE FROM [COMMENTS] WHERE [ID] = @ID", connection);
                command.Parameters.AddWithValue("ID", Request.Params["id"]);

                try
                {
                    command.ExecuteNonQuery(); // pentru insert, update, delete
                    Raspuns.Text = "Comment deleted !";
                    confirmare.Visible = false;
                    // System.Threading.Thread.Sleep(2000);
                    Response.Redirect("~/Result_Article.aspx?id=" + Convert.ToInt32(Request.Params["id_of_article"]));
                }
                catch (SqlException sqex)
                {
                    Raspuns.Text = sqex.Message;
                }

                connection.Close();
            }
            catch (Exception ex)
            {
                Raspuns.Text = ex.Message;
            }
        }
    }

    protected void ButtonNu_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Result_Article.aspx?id=" + Convert.ToInt32(Request.Params["id_of_article"]));
    }
}
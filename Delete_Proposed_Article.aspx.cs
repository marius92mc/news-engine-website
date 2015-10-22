using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class Delete_Proposed_Article : System.Web.UI.Page
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

                SqlCommand command = new SqlCommand("SELECT PROPOSED_ARTICLES.TITLE FROM [PROPOSED_ARTICLES] WHERE [ID] = @ID", connection);
                command.Parameters.AddWithValue("ID", Request.Params["id"]);

                try
                {
                    SqlDataReader r = command.ExecuteReader(); // pentru select
                    if (r.Read())
                    {
                        label_proposed_article.Text = r["TITLE"].ToString();
                        //label_writter.Text = r["USERNAME"].ToString();     not working...
                    }
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
        if (Request.Params["id"] != null)
        {
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                connection.Open();

                SqlCommand command = new SqlCommand("DELETE FROM [PROPOSED_ARTICLES] WHERE [ID] = @ID", connection);
                command.Parameters.AddWithValue("ID", Request.Params["id"]);

                try
                {
                    command.ExecuteNonQuery(); // pentru insert, update, delete
                    Raspuns.Text = "Article deleted !";
                    Response.Redirect("~/Propose_Article.aspx?deleted=1");
                    confirmare.Visible = false;
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
        Response.Redirect("~/Propose_Article.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Result_Article : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.Params["id"]);

        if (id >= 1)
        {
            result_search.SelectCommand = "SELECT News.ID, News.IMAGE, News.TITLE, News.DESCRIPTION, News.EDITOR, News.BODY, News.DATE " +
                                            "FROM News WHERE ID = " + id;
        }

        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            panel_loggedin_commentaries.Visible = true;
        }
        else
        {
            panel_loggedin_commentaries.Visible = false;
        }

        SqlDataSource_commentaries.SelectCommand = "SELECT COMMENTS.ID, COMMENTS.USERNAME, COMMENTS.DATE, COMMENTS.COMMENT, COMMENTS.ID_NEWS " +
                                                   "FROM COMMENTS WHERE ID_NEWS = " + id + " ORDER BY DATE DESC";
    }

    protected void postComment(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.Params["id"]);

        try
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            connection.Open();

            SqlCommand command = new SqlCommand("INSERT INTO [COMMENTS] ([USERNAME], [COMMENT], [ID_NEWS]) VALUES (@USERNAME, @COMMENT, @ID_NEWS)", connection);
            command.Parameters.AddWithValue("USERNAME", User.Identity.Name);
            command.Parameters.AddWithValue("COMMENT", comment_box.Text);
            command.Parameters.AddWithValue("ID_NEWS", id);

            try
            {
                command.ExecuteNonQuery();
                Response.Redirect("~/Result_Article.aspx?id=" + id);

                Raspuns.Text = "Comment successfully inserted !";
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

    protected void editComment(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/Edit_Comment.aspx?id=" + (String)e.CommandArgument + "&id_news=1" + "&id_of_article=" + 
                                                                                                 Request.Params["id"]);
    }

    protected void deleteComment(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/Delete_Comment.aspx?id=" + (String)e.CommandArgument + "&id_news=1" + "&id_of_article=" +
                                                                                                 Request.Params["id"]);
    }
}
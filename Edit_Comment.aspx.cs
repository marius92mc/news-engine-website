using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Edit_Comment : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Page.IsPostBack == false) && Request.Params["id"] != null)
        {
            
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT ID, COMMENT FROM [COMMENTS] WHERE [ID] = @ID", connection);
                command.Parameters.AddWithValue("ID", Request.Params["id"]);

                try
                {
                    SqlDataReader r = command.ExecuteReader();
                    if (r.Read())
                    {
                        comment_box.Text = r["COMMENT"].ToString();
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

    protected void editComment(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.Params["id"]);
        string[] roles;
        
        roles = Roles.GetRolesForUser();

      //  if (roles[0] == "Admin")
        
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                connection.Open();

                SqlCommand command = new SqlCommand("UPDATE [COMMENTS] SET [COMMENT] = @COMMENT, [DATE] = @DATE WHERE [ID] = @ID", connection);
                   // sa update-eze comment-ul editat, data, FARA username
                command.Parameters.AddWithValue("COMMENT", comment_box.Text);
                command.Parameters.AddWithValue("ID", id);  // id-ul comment-ului
                command.Parameters.AddWithValue("DATE", DateTime.Now);

                try
                {
                    command.ExecuteNonQuery();
                    Response.Redirect("~/Result_Article.aspx?id=" + Request.Params["id_of_article"]);

                    Raspuns.Text = "Comment successfully edited !";
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
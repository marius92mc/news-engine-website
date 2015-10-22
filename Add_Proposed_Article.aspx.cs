using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Resources;
using System.Text;
using System.Drawing.Drawing2D;

public partial class Add_Proposed_Article : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.Params["id"]);

        try 
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            connection.Open();
            
            SqlCommand command = new SqlCommand("INSERT INTO [News] ([TITLE], [DESCRIPTION], [EDITOR], [ID_CATEGORY], [BODY], [IMAGE]) SELECT [TITLE], [DESCRIPTION], [USERNAME], [ID_CATEGORY], [BODY], [IMAGE] FROM PROPOSED_ARTICLES WHERE ID = @ID", connection);
               // NU MERGE COMANDA ASTA

       
            command.Parameters.AddWithValue("ID", id);
            
            try
            {
                command.ExecuteNonQuery();
                
                 // de dat DELETE la aceasta linie din PROPOSED_ARTICLES, ca a fost adaugata


                try
                {
                    SqlConnection connection2 = new SqlConnection();
                    connection2.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                    connection2.Open();

                    SqlCommand command2 = new SqlCommand("DELETE FROM [PROPOSED_ARTICLES] WHERE [ID] = @ID", connection2);
                    command2.Parameters.AddWithValue("ID", id);

                    try
                    {
                        command2.ExecuteNonQuery(); // pentru insert, update, delete
                    }

                    catch (SqlException sqex)
                    {
                        Raspuns.Text = sqex.Message;
                    }

                    connection2.Close();
                    Response.Redirect("~/Propose_article.aspx?added=1");
                }
                catch (Exception ex)
                {
                    Raspuns.Text = ex.Message;
                }




            }
            catch (SqlException sqex)
            {
                Raspuns.Text = sqex.Message;
            }

            connection.Close();
        } 
        catch(Exception ex) 
        {
            Raspuns.Text = ex.Message;
        }
    }
}

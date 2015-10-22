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

public partial class Add_Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Insereaza(object sender, EventArgs e)
    {
        try
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            connection.Open();

            string command2 = @"SELECT ID FROM CATEGORII WHERE CATEGORY LIKE ('%" + Body.Text + "%')";

            SqlCommand command3 = new SqlCommand("SELECT ID FROM CATEGORII WHERE CATEGORY LIKE ('%" + Body.Text + "%')", connection);

            SqlDataReader reader = command3.ExecuteReader();

            int t = 0;
            if (!reader.HasRows)
            {
                t = 1;
                connection.Close();
                connection.Open();
                SqlCommand command = new SqlCommand("INSERT INTO [CATEGORII] ([CATEGORY]) VALUES (@CATEGORY)", connection);
                command.Parameters.AddWithValue("CATEGORY", Body.Text);
                try
                {
                    command.ExecuteNonQuery();
                    Response.Redirect("~/Categories.aspx?insert=1");
                }
                catch (SqlException sqex)
                {
                    Raspuns.Text = sqex.Message;
                }
                connection.Close();
            }
            else
            {
                Raspuns.Text = "Category already exists !";
            }
            if (t == 0)
            {
                connection.Close();
            }
        }
        catch (Exception ex)
        {
            Raspuns.Text = ex.Message;
        }
                

    }
    
}
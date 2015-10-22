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

public partial class Delete_Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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



                SqlCommand command2 = new SqlCommand("DELETE FROM [News] WHERE ID_CATEGORY = " + Request.Params["id"], connection);
                command2.Parameters.AddWithValue("ID", Request.Params["id"]);


                try
                {
                    command2.ExecuteNonQuery();
                    confirmare.Visible = false;
                    // System.Threading.Thread.Sleep(2000);

                }

                catch (SqlException sqex)
                {
                    Raspuns.Text = sqex.Message;
                }



                SqlCommand command = new SqlCommand("DELETE FROM [CATEGORII] WHERE [ID] = @ID", connection);
                command.Parameters.AddWithValue("ID", Request.Params["id"]);

                try
                {
                    command.ExecuteNonQuery(); // pentru insert, update, delete
                    Raspuns.Text = "Category deleted !";
                    confirmare.Visible = false;
                    // System.Threading.Thread.Sleep(2000);
                    Response.Redirect("~/Categories.aspx");
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
        Response.Redirect("~/Categories.aspx");
    }
}
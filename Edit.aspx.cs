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

public partial class Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated && User.IsInRole("Admin"))
        {                         // a doua conditie e ca sa fie true DOAR daca acel user are rol de admin
            panel_LogedIn.Visible = true;
        }
        else
        {
            panel_LogedIn.Visible = false;
        }

        if ( (Page.IsPostBack == false) && Request.Params["id"] != null)
        {
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT News.ID, News.TITLE, News.DESCRIPTION, News.EDITOR, News.BODY, News.ID_CATEGORY FROM [News] WHERE [ID] = @ID", connection);
                command.Parameters.AddWithValue("ID", Request.Params["id"]);

                try
                {
                   SqlDataReader r = command.ExecuteReader();
                   if (r.Read())
                   {
                       Title.Text = r["TITLE"].ToString();
                       Description.Text = r["DESCRIPTION"].ToString();
                       Editor.Text = r["EDITOR"].ToString();
                       Body.Text = r["BODY"].ToString();
                       Category.SelectedValue = r["ID_CATEGORY"].ToString();
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

    public static Image ScaleImage(Image image, int maxWidth, int maxHeight)
    {
        var ratioX = (double)maxWidth / image.Width;
        var ratioY = (double)maxHeight / image.Height;
        var ratio = Math.Min(ratioX, ratioY);

        var newWidth = (int)(image.Width * ratio);
        var newHeight = (int)(image.Height * ratio);

        var newImage = new Bitmap(newWidth, newHeight);
        Graphics.FromImage(newImage).DrawImage(image, 0, 0, newWidth, newHeight);
        return newImage;
    }

    protected void Editeaza(object sender, EventArgs e)
    {
        string image_name = "nothing";

        if (FileUploadControl.HasFile)
        {
            try
            {
                if (FileUploadControl.PostedFile.ContentType == "image/jpeg")
                {
                    if (FileUploadControl.PostedFile.ContentLength < 102400)
                    {
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        FileUploadControl.SaveAs(Server.MapPath("~/NewsImages/") + filename);   // !!!!!!! cu mappath
                        StatusLabel.Text = "Upload status: File uploaded!";

                        image_name = Server.MapPath("~/NewsImages/") + filename;


                        var image = Image.FromFile(image_name);
                        Image newImage = ScaleImage(image, 100, 100);


                        newImage.Save(Server.MapPath("~/NewsImages/") + Title.Text + ".jpg", System.Drawing.Imaging.ImageFormat.Jpeg);

                        image_name = "~/NewsImages/" + Title.Text + ".jpg"; // aici fara MapPath

                    }
                    else
                        StatusLabel.Text = "Upload status: The file has to be less than 100 kb!";
                }
                else
                    StatusLabel.Text = "Upload status: Only JPEG files are accepted!";
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }

        try
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            connection.Open();

            SqlCommand command = new SqlCommand("UPDATE [News] SET [TITLE] = @TITLE, [DESCRIPTION] = @DESCRIPTION, [EDITOR] = @EDITOR, [BODY] = @BODY, [ID_CATEGORY] = @ID_CATEGORY, [IMAGE] = @IMAGE, [DATE] = @DATE WHERE [ID] = @ID", connection);
            command.Parameters.AddWithValue("TITLE", Title.Text);
            command.Parameters.AddWithValue("DESCRIPTION", Description.Text);
            command.Parameters.AddWithValue("EDITOR", Editor.Text);
            command.Parameters.AddWithValue("BODY", Body.Text);
            command.Parameters.AddWithValue("ID_CATEGORY", Category.SelectedValue);
            command.Parameters.AddWithValue("ID", Request.Params["id"]);
            command.Parameters.AddWithValue("DATE", DateTime.Now);
            if (image_name != "nothing")
                command.Parameters.AddWithValue("IMAGE", image_name);

            try
            {
                command.ExecuteNonQuery();
                Raspuns.Text = "Edited !";
                Response.Redirect("~/Default.aspx");
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
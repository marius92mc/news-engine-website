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
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Propose_Article : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated && User.IsInRole("Admin"))
        {                         // a doua conditie e ca sa fie true DOAR daca acel user are rol de admin
            panel_LogedIn.Visible = false;
        }
        else
        {
            panel_LogedIn.Visible = true;
        }

        if (Request.Params["insert"] == "1")
        {
            Adauga.Text = "Article proposed ! It's waiting for admin approval.";
        }
        else
            if (Request.Params["added"] == "1")
            {
                Adauga.Text = "Article added !";
            }
            else
                if (Request.Params["deleted"] == "1")
                {
                    Adauga.Text = "Proposed article deleted !";
                }
    }

    public static System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxWidth, int maxHeight)
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



    protected void Insereaza(object sender, EventArgs e)
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


                        var image = System.Drawing.Image.FromFile(image_name);
                        System.Drawing.Image newImage = ScaleImage(image, 100, 100);


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

            SqlCommand command = new SqlCommand("INSERT INTO [PROPOSED_ARTICLES] ([IMAGE], [USERNAME], [TITLE], [DESCRIPTION], [ID_CATEGORY], [BODY]) VALUES (@IMAGE, @USERNAME, @TITLE, @DESCRIPTION, @ID_CATEGORY, @BODY)", connection);
            command.Parameters.AddWithValue("TITLE", Title.Text);
            command.Parameters.AddWithValue("DESCRIPTION", Description.Text);
            command.Parameters.AddWithValue("USERNAME", User.Identity.Name);
            command.Parameters.AddWithValue("BODY", Body.Text);
            command.Parameters.AddWithValue("ID_CATEGORY", Category.SelectedValue);
            if (image_name != "nothing")
                command.Parameters.AddWithValue("IMAGE", image_name);

            try
            {
                command.ExecuteNonQuery();
                Response.Redirect("~/Propose_Article.aspx?insert=1");

                Raspuns.Text = Title.Text + "successfully inserted into database !";
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

    protected void addProposedArticle(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/Add_Proposed_Article.aspx?id=" + (String)e.CommandArgument);
    }

    protected void deleteProposedArticle(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/Delete_Proposed_Article.aspx?id=" + (String)e.CommandArgument);
    }

}
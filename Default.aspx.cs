using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            panel_nonLogedIn.Visible = false;
        }
        else
        {
            panel_nonLogedIn.Visible = true;
        }

        if (Request.Params["insert"] == "1")
        {
            Adauga.Text = "Article inserted successfully !";
        }
        else
            if (Request.Params["article_deleted"] == "1")
            {
                Adauga.Text = "Article deleted !";
            }


    }

    protected void editArticle(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/Edit.aspx?id=" + (String)e.CommandArgument);
    }

    protected void deleteArticle(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/Delete.aspx?id=" + (String)e.CommandArgument);
    }

}
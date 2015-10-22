using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Categories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["insert"] == "1")
        {
            Adauga.Text = "Category inserted successfully !";
        }
    }

    protected void addCategory(object sender, EventArgs e)
    {
        Response.Redirect("~/Add_Category.aspx");
    }
}
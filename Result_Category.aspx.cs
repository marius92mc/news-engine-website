using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Result_Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int id_category = Convert.ToInt32(Request.Params["id_category"]);

        if (id_category >= 1)
        {
            result_category.SelectCommand = "SELECT News.ID, News.IMAGE, News.TITLE, News.DESCRIPTION, News.BODY, " + 
                "News.EDITOR, News.DATE, CATEGORII.CATEGORY " + 
                "FROM News INNER JOIN CATEGORII ON News.ID_CATEGORY = CATEGORII.ID WHERE ID_CATEGORY = " + id_category +
                " ORDER BY News.DATE DESC";
        }
    }
}
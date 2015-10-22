using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Result_Proposed_Article : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.Params["id"]);

        if (id >= 1)
        {
            SqlDataSource_proposed_article.SelectCommand = "SELECT PROPOSED_ARTICLES.ID, PROPOSED_ARTICLES.USERNAME, PROPOSED_ARTICLES.IMAGE, PROPOSED_ARTICLES.TITLE, PROPOSED_ARTICLES.DESCRIPTION, CATEGORII.CATEGORY, PROPOSED_ARTICLES.BODY, PROPOSED_ARTICLES.DATE, PROPOSED_ARTICLES.STATUS FROM PROPOSED_ARTICLES INNER JOIN CATEGORII ON PROPOSED_ARTICLES.ID_CATEGORY = CATEGORII.ID WHERE PROPOSED_ARTICLES.ID = " + id;
        }

    }
}
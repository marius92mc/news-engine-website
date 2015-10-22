using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        String q = Request.Params["q"];

        if (q != null)
        {
            result_search.SelectCommand = "SELECT News.ID, News.IMAGE, News.TITLE, News.DESCRIPTION, News.EDITOR, News.BODY, News.DATE " +
                                            "FROM News WHERE TITLE LIKE ('%" + q + "%')" + " OR " +
                                                             "DESCRIPTION LIKE ('%" + q + "%')" + " OR " +
                                                             "BODY LIKE ('%" + q + "%')";
        }
    }
}
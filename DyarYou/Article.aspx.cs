using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Article art = new Article();
        switch(Request.QueryString.GetKey(0).ToString())
        {
            case "Title":
                art.GetArticle("Title", Request.QueryString["Title"]);
                break;
            case "Category":
                art.GetArticle("Category", Request.QueryString["Category"]);
                break;
            case "Tag":
                art.GetArticle("Tag", Request.QueryString["Tag"]);
                break;
            case "User":
                art.GetArticle("User", Request.QueryString["User"]);
                break;
            default:
                break;
        }
        lv_Articles.DataSource = art.Articles;
        lv_Articles.DataBind();
    }
    protected void Title_Click(object sender, EventArgs e)
    {
        Response.Redirect("Article.aspx?" + "Title=" + (sender as LinkButton).Text);
    }
}
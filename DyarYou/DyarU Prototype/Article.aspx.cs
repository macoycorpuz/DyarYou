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
        bool flag = false;
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
            case "Special":
                art.GetArticle("Special", Request.QueryString["Special"]);
                break;
            case "User":
                art.GetArticle("User", Request.QueryString["User"]);
                flag = true;
                break;
            default:
                break;
        }

        if(flag)
        {
            lv_Articles.Visible = false;
            lv_MyArt.DataSource = art.Articles;
            lv_MyArt.DataBind();
        }
        else
        {
            lv_MyArt.Visible = false;
            lv_Articles.DataSource = art.Articles;
            lv_Articles.DataBind();
        }

    }
    protected void Title_Click(object sender, EventArgs e)
    {
        if(Session["Username"] != null)
        {
            Response.Redirect("Article.aspx?" + "Special=" + (sender as LinkButton).Text);
        }
        else
        {
            Response.Redirect("Article.aspx?" + "Title=" + (sender as LinkButton).Text);
        }
    }

}
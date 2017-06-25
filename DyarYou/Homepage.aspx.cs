using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        Article art = new Article();
        art.GetArticle("FP", "Technology");
        lv_Technology.DataSource = art.Articles;
        lv_Technology.DataBind();
        art.GetArticle("FP", "Entertainment");
        lv_Entertainment.DataSource = art.Articles;
        lv_Entertainment.DataBind();
        art.GetArticle("FP", "Bussiness");
        lv_Bussiness.DataSource = art.Articles;
        lv_Bussiness.DataBind();
        art.GetArticle("FP", "Sports");
        lv_Sports.DataSource = art.Articles;
        lv_Sports.DataBind();
        
        
    }

    protected void Title_Click(object sender, EventArgs e)
    {
        Response.Redirect("Article.aspx?" + "Title=" + (sender as LinkButton).Text);
    }
}
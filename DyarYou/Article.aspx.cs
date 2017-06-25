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
                art.loadfeedbacks(Request.QueryString["Title"]);

                lv_feedback.DataSource = art.Feedbacks;
                lv_feedback.DataBind();
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

        if( Session["Username"] !=null)
        {
            person.Text = Session["Username"].ToString();
        }
        else
        {
            person.Text = "Anonymous";
        }
        //Display the account type
        //load all the comments
    }

    //Display the comments

    protected void Title_Click(object sender, EventArgs e)
    {
        Response.Redirect("Article.aspx?" + "Title=" + (sender as LinkButton).Text);
    }

    protected void Person_Click(object sender, EventArgs e)
    {
        //dito sana yung pag nag click sa Profile nung nag comment eh mag view
       // Response.Redirect("Person.aspx?" + "Name=" + (sender as LinkButton).Text);
    }

    protected void Feedbackpost_Click(object sender, EventArgs e)
    {
        //get post id = Request.QueryString["Title"]
        //get username Session["Username"]
        //Comment
        //Is anonymous

        //Article
        //AccountID
        //Dateposted
        int anon;
        string uname;
        if (Session["Username"] == null)
        { anon = 1;
            uname = "";
        }
        else
        {
            uname = Session["Username"].ToString();
            anon = 0;
        }
        Article art = new Article();
        art.addfeedback("@feedbackcontent", tbox_feedbackcontent.Text, "@is_Anon_status", anon, "@articletitle", Request.QueryString["Title"], "@username", uname, "@_datetime", DateTime.Now);
        Response.Redirect("Article.aspx?" + "Title=" + Request.QueryString["Title"]);

    }
}
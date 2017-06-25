using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DyarUMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["Role"] != null)
        {
            if(Session["Role"].ToString() == "True")
            {
                lb_Admin.Visible = true;
                lb_MyArt.Visible = false;
            }
            else
            {
                lb_MyArt.Visible = true;
                lb_Admin.Visible = false;
            }
        }
    }
    protected void btn_Tag_Click(object sender, EventArgs e)
    {
        Response.Redirect("Article.aspx?Tag=" + tb_Tag.Text);
    }
    protected void MyArt_Click(object sender, EventArgs e)
    {
        Response.Redirect("Article.aspx?User=" + Session["Username"].ToString());
    }
}

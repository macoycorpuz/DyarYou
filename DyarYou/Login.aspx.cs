using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login_Click(object sender, EventArgs e)
    {
        Account acnt = new Account();
        acnt.CheckAccount(tb_username.Text, tb_password.Text);
        if(acnt.Accounts.Tables[0].Rows.Count > 0)
        {
            Session.Clear();
            Session["Username"] = tb_username.Text;
            acnt.GetAccount("Name", tb_username.Text);
            Session["First_Name"] = acnt.Accounts.Tables[0].Rows[0]["First_Name"].ToString();
            Session["Last_Name"] = acnt.Accounts.Tables[0].Rows[0]["Last_Name"].ToString();
            acnt.GetAccount("Role", tb_username.Text);
            Session["Role"] = acnt.Accounts.Tables[0].Rows[0]["Role"].ToString();
            Response.Redirect("Homepage.aspx");
        }
        else
        {
            //error notif
        }
    }
}
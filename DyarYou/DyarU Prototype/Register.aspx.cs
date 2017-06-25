using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Register_Click(object sender, EventArgs e)
    {
        Account acnt = new Account();
        if(rb_Editor.Checked == true)
        {
            acnt.AddAccount(tb_Username.Text, tb_Password.Text, tb_FirstName.Text, tb_LastName.Text, true);
        }
        else
        {
            acnt.AddAccount(tb_Username.Text, tb_Password.Text, tb_FirstName.Text, tb_LastName.Text, false);
        }

        if(acnt.Accounts.Tables.Count == 0)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            //error notif
        }
    }
}
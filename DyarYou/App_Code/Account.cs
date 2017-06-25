using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Account
/// </summary>
public class Account
{
    #region Attributes
    private DataSet _accounts;
    #endregion

    #region Properties
    public DataSet Accounts
    {
        get
        {
            return _accounts;
        }
    }
    #endregion

    #region Methods
    public Account()
	{
        _accounts = new DataSet();
    }
    ~Account()
    {
        _accounts.Dispose();
    }
    public void GetAccount(string type, string un)
    {
        _accounts.Clear();
        using(Helper db = new Helper())
        {
            switch(type)
            {
                case "Role":
                    {
                        _accounts = db.ExecDataSetProc("sp_GetAccount_Role", "@Username", un);
                        break;
                    }
                case "Name":
                    {
                        _accounts = db.ExecDataSetProc("sp_GetAccount_Name", "@Username", un);
                        break;
                    }
                default:
                    break;
            }
        }
    }
    public void CheckAccount(string un, string pw)
    {
        _accounts.Clear();
        using(Helper db =new Helper())
        {
            _accounts = db.ExecDataSetProc("sp_GetAccount_Validity", "@Username", un, "@Password", pw);
        }
    }
    public void AddAccount(string un, string pw, string fn, string ln, bool role)
    {
        _accounts.Clear();
        using(Helper db = new Helper())
        {
            _accounts = db.ExecDataSetProc("sp_AddAccount", "@Username", un, "@Password", pw, "@FirstName", fn, "@Lastname", ln, "@Role", role);
        }
    }
    #endregion
}
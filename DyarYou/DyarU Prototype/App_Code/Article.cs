using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Article
/// </summary>
public class Article
{
    #region Attributes
    private DataSet _articles;
    #endregion

    #region Properties
    public DataSet Articles
    {
        get
        {
            return _articles;
        }
    }
    #endregion

    #region Methods
    public Article()
	{
        _articles = new DataSet();
    }
    ~Article()
    {
        _articles.Dispose();
    }
    public void GetArticle(string type, string args)
    {
        _articles.Clear();
        using(Helper db = new Helper())
        {
            switch(type)
            {
                case "All":
                    {
                        _articles = db.ExecDataSetProc("sp_GetArticle");
                        break;
                    }
                case "Category":
                    {
                        _articles = db.ExecDataSetProc("sp_GetArticle_Category", "@Category", args);
                        break;
                    }
                case "Title":
                    {
                        _articles = db.ExecDataSetProc("sp_GetArticle_Title", "@Title", args);
                        break;
                    }
                case "Tag":
                    {
                         _articles = db.ExecDataSetProc("sp_GetArticle_Tag", "@Tag", args);
                        break;
                    }
                case "FP":
                    {
                        _articles = db.ExecDataSetProc("sp_GetArticle_Category_FP", "@Category", args);
                        break;
                    }
                case "User":
                    {
                        _articles = db.ExecDataSetProc("sp_GetArticle_Username", "@Username", args);
                        break;
                    }
                case "Special":
                    {
                        _articles = db.ExecDataSetProc("sp_GetArticle_Title_Special", "@Title", args);
                        break;
                    }
                default:
                    break;
            }
        }
    }
    #endregion
}
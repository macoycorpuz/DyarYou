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
    private DataSet _feedbacks;
    #endregion

    #region Properties
    public DataSet Articles
    {
        get
        {
            return _articles;
        }
    }

    public DataSet Feedbacks
    {
        get
        {
            return _feedbacks;
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
        using (Helper db = new Helper())
        {
            switch (type)
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
                default:
                    break;
            }
        }
    }

    public void loadfeedbacks(string post)
    {
        //_feedbacks.Clear();
        
        using (Helper db = new Helper())
        {

            _feedbacks = db.ExecDataSetProc("sp_GetFeedback_Title","@Title", post);
        }

    }

    public void addfeedback(params object[] args)
    {
        using (Helper db = new Helper())
        {
            db.ExecNonQueryProc("sp_AddFeedback_Title", args);
        }
    }
    #endregion
}
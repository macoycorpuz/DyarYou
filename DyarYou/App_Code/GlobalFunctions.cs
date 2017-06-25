using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GlobalFunctions
/// </summary>
public class GlobalFunctions
{
    #region Attributes

    IDatabase _clsDb;
    bool _Error;
    //DataTable _dtProduct, _dtNews, _dtEvent, _dtCustomer, _dtAdmin, _dtTransaction;
    //string _prodID, _newsID, eventID;

    public bool HasError
    {
        get
        {
            return _Error;
        }

        set
        {
            _Error = value;
        }
    }

    #endregion

    #region Constructor

    public GlobalFunctions()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #endregion

    #region Methods

    /// <summary>
    /// All View Processes
    /// </summary>
    #region Get


    //EXAMPLE

    //public DataTable GetProduct()
    //{
    //    _clsDb = new Database();
    //    _dtProduct = new DataTable();

    //    _clsDb.ExecuteCommand("Select ProductName, ProductID FROM Product ORDER BY ProductID DESC");
    //    if (_clsDb.Data.Rows.Count > 0)
    //        _dtProduct = _clsDb.Data;
    //    return _dtProduct;

    //}


    #endregion

    /// <summary>
    /// All Add/Edit/Delete Processes
    /// </summary>
    #region Set

    //EXAMPLE

    //public void DeleteProduct(string title)
    //{
    //    _clsDb = new Database();
    //    _clsDb.ExecuteStoredProc("spDeleteProduct", "@Title", title);
    //}

    //public void SetTransaction(string cid, string prodid, string qty)
    //{
    //    _clsDb = new Database();
    //    _clsDb.ExecuteStoredProc("spAddTransaction", "@CID", cid, "@ProdID", prodid, "@OrderQty", qty);
    //}

    #endregion

    #endregion
}
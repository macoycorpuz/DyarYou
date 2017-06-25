using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for IDatabase
/// </summary>
public interface IDatabase
{
    DataTable Data { get; }

    bool HasError { get; }

    void ExecuteCommand(string query);

    void ExecuteStoredProc(string query, params object[] args);

    void Dispose();
}
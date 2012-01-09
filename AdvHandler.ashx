<%@ WebHandler Language="C#" Class="AdvHandler" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

public class AdvHandler : IHttpHandler
{
    public void ProcessRequest (HttpContext context)
    {
        int advid = Int32.Parse(context.Request["advid"]);
        string naviUrl = string.Empty;
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        cnn.Open();
        InsertNaviUrlLog(advid, cnn);
        naviUrl = GetNaviUrl(advid, cnn);
        cnn.Close();
        if (!string.IsNullOrEmpty(naviUrl))
        {
            context.Response.Redirect(naviUrl);
        }
    }

    private void InsertNaviUrlLog(int advid, SqlConnection cnn)
    {
        string insertSql = "INSERT INTO adNavi(advid, cDate) VALUES (@advid, GetDate())";
        SqlCommand cmd = new SqlCommand(insertSql, cnn);
        cmd.Parameters.AddWithValue("@advid", advid);
        cmd.ExecuteNonQuery();
    }

    string GetNaviUrl(int advid, SqlConnection cnn)
    {
        string selectSql = "SELECT NavigateUrl FROM advtise WHERE advid = @advid";
        SqlCommand cmd = new SqlCommand(selectSql, cnn);
        cmd.Parameters.AddWithValue("@advid", advid);
        return cmd.ExecuteScalar().ToString();
    }
 
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
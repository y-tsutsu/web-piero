using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Staff_GetImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int kgid;
        kgid = int.Parse(Request.QueryString["kgid"]);
        byte[] imageArray;
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        cnn.Open();
        string selectSql = "SELECT kphoto FROM KAMIGATA WHERE kgid = @kgid";
        SqlCommand cmd = new SqlCommand(selectSql, cnn);
        cmd.Parameters.AddWithValue("@kgid", kgid);
        imageArray = cmd.ExecuteScalar() as byte[];
        Response.BinaryWrite(imageArray);
        cnn.Close();
    }
    // ----------------------------------------------------------------------------------------------------
}
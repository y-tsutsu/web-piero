using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // ----------------------------------------------------------------------------------------------------

    protected void AdRotator_AdCreated(object sender, AdCreatedEventArgs e)
    {
        SqlDataSource1.InsertParameters["advid"].DefaultValue = e.AdProperties["advid"].ToString();
        SqlDataSource1.Insert();
        e.NavigateUrl = "~/AdvHandler.ashx?advid=" + e.AdProperties["advid"].ToString();
    }
    // ----------------------------------------------------------------------------------------------------

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
    // ----------------------------------------------------------------------------------------------------
}

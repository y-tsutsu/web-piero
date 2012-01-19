using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StartPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    // ----------------------------------------------------------------------------------------------------

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Kokyakuhosyu.aspx");
    }
    // ----------------------------------------------------------------------------------------------------

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Staff/PhotoUpload.aspx");
    }
    // ----------------------------------------------------------------------------------------------------

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Staff/PhotoList.aspx");
    }
    // ----------------------------------------------------------------------------------------------------

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Staff/MailMagazin.aspx");
    }
    // ----------------------------------------------------------------------------------------------------
}
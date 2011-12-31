using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KokyakuHosyu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string[] kanaArray = { "ア", "イ", "ウ", "エ", "オ", "カ", "キ", "ク", "ケ", "コ", "サ", "シ", "ス", "セ", "ソ",
                "タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "ネ", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "マ", "ミ", "ム", "メ", "モ",
                "ヤ", "ユ", "ヨ", "ラ", "リ", "ル", "レ", "ロ", "ワ", "ヲ", "ン" };

            foreach (string kana in kanaArray)
            {
                DropDownList2.Items.Add(new ListItem(kana));
            }
        }

    }
    // ----------------------------------------------------------------------------------------------------

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    // ----------------------------------------------------------------------------------------------------

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    // ----------------------------------------------------------------------------------------------------

    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }
    // ----------------------------------------------------------------------------------------------------

    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataBind();
    }
    // ----------------------------------------------------------------------------------------------------

    protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        GridView1.DataBind();
    }
    // ----------------------------------------------------------------------------------------------------

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        GridView1.SelectedIndex = -1;
    }
    // ----------------------------------------------------------------------------------------------------

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    // ----------------------------------------------------------------------------------------------------
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff_FileUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // ----------------------------------------------------------------------------------------------------

    protected void Button1_Click(object sender, EventArgs e)
    {
        string saveDir = @"Uploads\";
        const int MAX_FILE_SIZE = 1024 * 1024 * 2;
        string appPath = Request.PhysicalApplicationPath;

        if (FileUpload1.HasFile)
        {
            if (FileUpload1.FileContent.Length <= MAX_FILE_SIZE)
            {
                string fileName = Server.HtmlEncode(FileUpload1.FileName);
                string extension = System.IO.Path.GetExtension(fileName).ToLower();

                if ((extension == ".jpg") || (extension == ".gif"))
                {
                    string savePath = appPath + saveDir + fileName;
                    FileUpload1.SaveAs(savePath);
                    LabelStatus.Text = "アップロードしました";
                }
                else
                {
                    LabelStatus.Text = "拡張子が違います（jpg，もしくはgif）";
                }
            }
            else
            {
                LabelStatus.Text = "ファイルサイズが大きすぎます（2MB以内）";
            }
        }
        else
        {
            LabelStatus.Text = "ファイルが指定されていません";
        }
    }
    // ----------------------------------------------------------------------------------------------------
}
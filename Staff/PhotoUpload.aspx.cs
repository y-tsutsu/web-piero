using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Staff_PhotoUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // ----------------------------------------------------------------------------------------------------

    protected void Button1_Click(object sender, EventArgs e)
    {
        const int MAX_FILE_SIZE = 1024 * 1024 * 2;

        if (FileUpload1.HasFile)
        {
            if (FileUpload1.FileContent.Length <= MAX_FILE_SIZE)
            {
                string extension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                if ((extension == ".jpg") || (extension == ".gif"))
                {
                    InsertKamigata();
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

    void InsertKamigata()
    {
        byte[] imageArray;
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        cnn.Open();
        string insertSql = "INSERT INTO KAMIGATA(koid,sdate,hstyle,kmemo,kphoto) VALUES (@koid,getdate(),@hstyle,@kmemo,@kphoto)";
        SqlCommand cmd = new SqlCommand(insertSql, cnn);
        cmd.Parameters.AddWithValue("@koid", TextKoid.Text);
        cmd.Parameters.AddWithValue("@hstyle", TextHstyle.Text);
        cmd.Parameters.AddWithValue("@kmemo", TextKmemo.Text);
        imageArray = FileUpload1.FileBytes;
        cmd.Parameters.AddWithValue("@kphoto", imageArray);
        cmd.ExecuteNonQuery();
        cnn.Close();
    }
    // ----------------------------------------------------------------------------------------------------
}
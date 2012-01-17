using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;

public partial class Staff_MailMagazin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // ----------------------------------------------------------------------------------------------------

    protected void Button1_Click(object sender, EventArgs e)
    {
        ListBoxMember.Items.Clear();

        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        cnn.Open();
        string selectSql = "SELECT koname, email FROM KOKYAKU WHERE melmaga = 1";
        SqlCommand cmd = new SqlCommand(selectSql, cnn);
        SqlDataReader reader = cmd.ExecuteReader();
        LabelState.Text = "送信開始";
        while (reader.Read())
        {
            SendMail(reader[0] as string, reader[1] as string);
            ListBoxMember.Items.Add(reader[0] as string);
        }
        LabelState.Text = LabelState.Text + "+送信終了";
        reader.Close();
        cnn.Close();
    }
    // ----------------------------------------------------------------------------------------------------

    private void SendMail(string name, string email)
    {
        Encoding isoEnc = Encoding.GetEncoding("iso-2022-jp");
        
        MailAddress from = new MailAddress("a.piero.inquiry@gmail.com", "A PIERO", isoEnc);
        MailAddress to = new MailAddress(email, name + "様", isoEnc);
        MailMessage msg = new MailMessage(from, to);
        msg.Subject = "メールマガジン";
        msg.SubjectEncoding = isoEnc;
        msg.Body = TextMessage.Text;
        msg.BodyEncoding = isoEnc;

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.EnableSsl = true;
        smtp.Credentials = new System.Net.NetworkCredential("a.piero.inquiry@gmail.com", "hogehogehoge");
        smtp.Send(msg);
    }
    // ----------------------------------------------------------------------------------------------------
}
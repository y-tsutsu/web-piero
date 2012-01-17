using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;

public partial class WizardForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // ----------------------------------------------------------------------------------------------------

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Encoding isoEnc = Encoding.GetEncoding("iso-2022-jp");

        MailAddress from = new MailAddress("a.piero.inquiry@gmail.com", LabelName.Text + "様", isoEnc);
        MailAddress to = new MailAddress("a.piero.inquiry@gmail.com", "問い合わせ受付け", isoEnc);
        MailMessage msg = new MailMessage(from, to);
        msg.Subject = "お問い合わせ";
        msg.SubjectEncoding = isoEnc;
        msg.Body = LabelInquiry.Text + "\n\n" + LabelMail.Text;
        msg.BodyEncoding = isoEnc;

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.EnableSsl = true;
        smtp.Credentials = new System.Net.NetworkCredential("a.piero.inquiry@gmail.com", "hogehogehoge");
        smtp.Send(msg);
    }
    // ----------------------------------------------------------------------------------------------------

    protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
    {
        EditToLabel();
    }
    // ----------------------------------------------------------------------------------------------------

    private void EditToLabel()
    {
        LabelName.Text = TextName.Text;
        LabelMail.Text = TextMail.Text;
        LabelInquiry.Text = TextInquiry.Text;
    }
    // ----------------------------------------------------------------------------------------------------
}
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterChildPage.master" AutoEventWireup="true" CodeFile="InquiryMail.aspx.cs" Inherits="WizardForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" 
    onactivestepchanged="Wizard1_ActiveStepChanged" 
    onfinishbuttonclick="Wizard1_FinishButtonClick">
    <WizardSteps>
        <asp:WizardStep runat="server" StepType="Start" title="お客様情報">
            お名前<br /> 
            <asp:TextBox ID="TextName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextName" ErrorMessage="RequiredFieldValidator">お名前は入力必須です</asp:RequiredFieldValidator>
            <br />
            メールアドレス<br /> 
            <asp:TextBox ID="TextMail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextMail" ErrorMessage="RequiredFieldValidator">メールアドレスは必須です</asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextMail" ErrorMessage="RegularExpressionValidator" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">正しくメールアドレスを入力してください</asp:RegularExpressionValidator>
        </asp:WizardStep>
        <asp:WizardStep runat="server" StepType="Step" Title="お問い合わせ内容">
            お問い合わせ内容<br /> 
            <asp:TextBox ID="TextInquiry" runat="server" TextMode="MultiLine" Width="350px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextInquiry" ErrorMessage="RequiredFieldValidator">お問い合わせ内容を入力してください</asp:RequiredFieldValidator>
        </asp:WizardStep>
        <asp:WizardStep runat="server" StepType="Finish" Title="確認">
            お名前<br /> 
            <asp:Label ID="LabelName" runat="server"></asp:Label>
            <br />
            <br />
            メールアドレス<br /> 
            <asp:Label ID="LabelMail" runat="server"></asp:Label>
            <br />
            <br />
            お問い合わせ内容<br /> 
            <asp:Label ID="LabelInquiry" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            完了ボタンをクリックすると，お問い合わせ内容を送信します．
        </asp:WizardStep>
        <asp:WizardStep runat="server" StepType="Complete" Title="ありがとうございました">
            <br />
            <br />
            <br />
            お問い合わせありがとうございました．<br />2営業日以内にお返事メールをお送りしますので，しばらくお待ちください．<br /> 
            <br />
            <br />
        </asp:WizardStep>
    </WizardSteps>
</asp:Wizard>
</asp:Content>


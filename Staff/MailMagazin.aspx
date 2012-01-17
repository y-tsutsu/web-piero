<%@ Page Title="" Language="C#" MasterPageFile="~/Staff/StaffPage.master" AutoEventWireup="true" CodeFile="MailMagazin.aspx.cs" Inherits="Staff_MailMagazin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="メールマガジンの内容を入力"></asp:Label>
    <br />
    <asp:TextBox ID="TextMessage" runat="server" Height="244px" TextMode="MultiLine" 
        Width="365px"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="送信" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextMessage" ErrorMessage="RequiredFieldValidator">メルマガの内容が未入力です</asp:RequiredFieldValidator>
    <br />
    <asp:ListBox ID="ListBoxMember" runat="server" Height="65px" Width="274px">
    </asp:ListBox>
    <br />
    <asp:Label ID="LabelState" runat="server"></asp:Label>
    <br />
</asp:Content>


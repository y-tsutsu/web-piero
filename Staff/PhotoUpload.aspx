<%@ Page Title="" Language="C#" MasterPageFile="~/Staff/StaffPage.master" AutoEventWireup="true" CodeFile="PhotoUpload.aspx.cs" Inherits="Staff_PhotoUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width:70%;">
        <tr>
            <td style="style2; width: 142px;">
                顧客ID</td>
            <td style="height: 20px">
                <asp:TextBox ID="TextKoid" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px; width: 142px;">
                ヘアースタイル</td>
            <td style="height: 20px">
                <asp:TextBox ID="TextHstyle" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 142px">
                メモ</td>
            <td>
                <asp:TextBox ID="TextKmemo" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 142px; height: 20px;">
                画像</td>
            <td style="height: 20px">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 142px; height: 20px;">
                &nbsp;</td>
            <td style="height: 20px">
                <asp:Button ID="Button1" runat="server" Text="書き込み" onclick="Button1_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
</asp:Content>


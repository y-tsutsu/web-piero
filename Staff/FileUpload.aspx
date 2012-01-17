<%@ Page Title="" Language="C#" MasterPageFile="~/Staff/StaffPage.master" AutoEventWireup="true" CodeFile="FileUpload.aspx.cs" Inherits="Staff_FileUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="アップロード" />
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
    <br />
</asp:Content>


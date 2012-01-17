<%@ Page Title="" Language="C#" MasterPageFile="~/Staff/StaffPage.master" AutoEventWireup="true" CodeFile="PhotoList.aspx.cs" Inherits="Staff_PhotoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="kgid" 
        DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="background-color: #FAFAD2;color: #284775;">画像ID:
            <asp:Label ID="kgidLabel" runat="server" Text='<%# Eval("kgid") %>' />
            <br />
            顧客ID:
            <asp:Label ID="koidLabel" runat="server" Text='<%# Eval("koid") %>' />
            <br />
            撮影日:
            <asp:Label ID="sdateLabel" runat="server" Text='<%# Eval("sdate") %>' />
            <br />
            ヘアースタイル:
            <asp:Label ID="hstyleLabel" runat="server" Text='<%# Eval("hstyle") %>' />
            <br />
            メモ:
            <asp:Label ID="kmemoLabel" runat="server" Text='<%# Eval("kmemo") %>' />
            <br />
            &nbsp;<asp:Image ID="Image4" runat="server" 
                ImageUrl='<%# Eval("kgid", "GetImage.aspx?kgid={0}") %>' />
            <br />
<br /></span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #FFCC66;color: #000080;">kgid:
            <asp:Label ID="kgidLabel1" runat="server" Text='<%# Eval("kgid") %>' />
            <br />
            koid:
            <asp:TextBox ID="koidTextBox" runat="server" Text='<%# Bind("koid") %>' />
            <br />
            sdate:
            <asp:TextBox ID="sdateTextBox" runat="server" Text='<%# Bind("sdate") %>' />
            <br />
            hstyle:
            <asp:TextBox ID="hstyleTextBox" runat="server" Text='<%# Bind("hstyle") %>' />
            <br />
            kmemo:
            <asp:TextBox ID="kmemoTextBox" runat="server" Text='<%# Bind("kmemo") %>' />
            <br />
            kphoto:
            <asp:TextBox ID="kphotoTextBox" runat="server" Text='<%# Bind("kphoto") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="キャンセル" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>データは返されませんでした。</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">koid:
            <asp:TextBox ID="koidTextBox" runat="server" Text='<%# Bind("koid") %>' />
            <br />sdate:
            <asp:TextBox ID="sdateTextBox" runat="server" Text='<%# Bind("sdate") %>' />
            <br />hstyle:
            <asp:TextBox ID="hstyleTextBox" runat="server" Text='<%# Bind("hstyle") %>' />
            <br />kmemo:
            <asp:TextBox ID="kmemoTextBox" runat="server" Text='<%# Bind("kmemo") %>' />
            <br />kphoto:
            <asp:TextBox ID="kphotoTextBox" runat="server" Text='<%# Bind("kphoto") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="挿入" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="クリア" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="background-color: #FFFBD6;color: #333333;">画像ID:
            <asp:Label ID="kgidLabel" runat="server" Text='<%# Eval("kgid") %>' />
            <br />
            顧客ID:
            <asp:Label ID="koidLabel" runat="server" Text='<%# Eval("koid") %>' />
            <br />
            撮影日:
            <asp:Label ID="sdateLabel" runat="server" Text='<%# Eval("sdate") %>' />
            <br />
            ヘアースタイル:
            <asp:Label ID="hstyleLabel" runat="server" Text='<%# Eval("hstyle") %>' />
            <br />
            メモ:
            <asp:Label ID="kmemoLabel" runat="server" Text='<%# Eval("kmemo") %>' />
            <br />
            &nbsp;<asp:Image ID="Image3" runat="server" 
                ImageUrl='<%# Eval("kgid", "GetImage.aspx?kgid={0}") %>' />
            <br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" 
                style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">kgid:
            <asp:Label ID="kgidLabel" runat="server" Text='<%# Eval("kgid") %>' />
            <br />
            koid:
            <asp:Label ID="koidLabel" runat="server" Text='<%# Eval("koid") %>' />
            <br />
            sdate:
            <asp:Label ID="sdateLabel" runat="server" Text='<%# Eval("sdate") %>' />
            <br />
            hstyle:
            <asp:Label ID="hstyleLabel" runat="server" Text='<%# Eval("hstyle") %>' />
            <br />
            kmemo:
            <asp:Label ID="kmemoLabel" runat="server" Text='<%# Eval("kmemo") %>' />
            <br />
            kphoto:
            <asp:Label ID="kphotoLabel" runat="server" Text='<%# Eval("kphoto") %>' />
            <br />
<br /></span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [KAMIGATA]"></asp:SqlDataSource>
</asp:Content>


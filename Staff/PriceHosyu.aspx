<%@ Page Title="" Language="C#" MasterPageFile="~/Staff/StaffPage.master" AutoEventWireup="true" CodeFile="PriceHosyu.aspx.cs" Inherits="Staff_PRICE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="pid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="pid" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="pid" />
            <asp:BoundField DataField="pname" HeaderText="メニュー名" SortExpression="pname" />
            <asp:BoundField DataField="price" DataFormatString="{0:C}" HeaderText="料金" 
                SortExpression="price" />
            <asp:BoundField DataField="porder" HeaderText="表示順" SortExpression="porder" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [PRICE] WHERE [pid] = @pid" 
        InsertCommand="INSERT INTO [PRICE] ([pname], [price], [porder]) VALUES (@pname, @price, @porder)" 
        SelectCommand="SELECT * FROM [PRICE]" 
        UpdateCommand="UPDATE [PRICE] SET [pname] = @pname, [price] = @price, [porder] = @porder WHERE [pid] = @pid">
        <DeleteParameters>
            <asp:Parameter Name="pid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pname" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="porder" Type="Int16" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pname" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="porder" Type="Int16" />
            <asp:Parameter Name="pid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>


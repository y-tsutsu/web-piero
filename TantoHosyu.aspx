<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TantoHosyu.aspx.cs" Inherits="TantoHosyu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 54px">
    <form id="form1" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="tpname" DataValueField="tpcd" 
        AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [tpcd], [tpname] FROM [TENPO]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="tncd" DataSourceID="SqlDataSource2" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="tncd" HeaderText="コード" ReadOnly="True" 
                SortExpression="tncd" />
            <asp:BoundField DataField="tnname" HeaderText="担当者名" SortExpression="tnname" />
            <asp:BoundField DataField="tpname" HeaderText="店舗" SortExpression="tpname" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT TANTO.tncd, TANTO.tnname, TENPO.tpname FROM TANTO INNER JOIN TENPO ON TANTO.stpcd = TENPO.tpcd WHERE (TANTO.stpcd = @stpcd)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="stpcd" 
                PropertyName="SelectedValue" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>

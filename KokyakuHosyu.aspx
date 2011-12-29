<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KokyakuHosyu.aspx.cs" Inherits="KokyakuHosyu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource1" DataTextField="tpname" DataValueField="tpcd">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [tpcd], [tpname] FROM [TENPO]"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Text="フリガナ"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="koid" DataSourceID="SqlDataSource2" 
                ForeColor="#333333" GridLines="None" 
                onselectedindexchanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="koid" HeaderText="顧客ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="koid" />
                    <asp:BoundField DataField="koname" HeaderText="顧客名" SortExpression="koname" />
                    <asp:BoundField DataField="furi" HeaderText="フリガナ" SortExpression="furi" />
                    <asp:BoundField DataField="birth" DataFormatString="{0:d}" HeaderText="生年月日" 
                        SortExpression="birth" />
                    <asp:BoundField DataField="telno" HeaderText="電話番号" SortExpression="telno" />
                    <asp:BoundField DataField="keitai" HeaderText="携帯" SortExpression="keitai" />
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
                
                SelectCommand="SELECT [koid], [koname], [furi], [birth], [telno], [keitai] FROM [KOKYAKU] WHERE ([ttpcd] = @ttpcd) and ([furi] like @furi + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ttpcd" 
                        PropertyName="SelectedValue" Type="Int16" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="furi" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                CellPadding="4" DataKeyNames="koid" DataSourceID="SqlDataSource3" 
                ForeColor="#333333" GridLines="None" Height="50px" 
                onitemdeleted="DetailsView1_ItemDeleted" 
                oniteminserted="DetailsView1_ItemInserted" 
                onitemupdated="DetailsView1_ItemUpdated" Width="250px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="koid" HeaderText="顧客ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="koid" />
                    <asp:BoundField DataField="koname" HeaderText="顧客名" SortExpression="koname" />
                    <asp:BoundField DataField="furi" HeaderText="フリガナ" SortExpression="furi" />
                    <asp:BoundField ApplyFormatInEditMode="True" DataField="birth" 
                        DataFormatString="{0:d}" HeaderText="生年月日" SortExpression="birth" />
                    <asp:TemplateField HeaderText="性別" SortExpression="gender">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" 
                                SelectedValue='<%# Bind("gender") %>'>
                                <asp:ListItem Value="0">男</asp:ListItem>
                                <asp:ListItem Value="1">女</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" Enabled="False" 
                                SelectedValue='<%# Eval("gender") %>'>
                                <asp:ListItem Value="0">男</asp:ListItem>
                                <asp:ListItem Value="1">女</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="zipcode" HeaderText="郵便番号" 
                        SortExpression="zipcode" />
                    <asp:BoundField DataField="addr1" HeaderText="住所1" SortExpression="addr1" />
                    <asp:BoundField DataField="addr2" HeaderText="住所2" SortExpression="addr2" />
                    <asp:BoundField DataField="tatemono" HeaderText="建物" 
                        SortExpression="tatemono" />
                    <asp:BoundField DataField="telno" HeaderText="電話番号" SortExpression="telno" />
                    <asp:BoundField DataField="keitai" HeaderText="携帯" SortExpression="keitai" />
                    <asp:BoundField DataField="email" HeaderText="Eメール" SortExpression="email" />
                    <asp:CheckBoxField DataField="melmaga" HeaderText="メルマガ送付" 
                        SortExpression="melmaga" />
                    <asp:TemplateField HeaderText="登録店舗" SortExpression="ttpcd">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="tpname" DataValueField="tpcd" 
                                SelectedValue='<%# Bind("ttpcd") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT [tpcd], [tpname] FROM [TENPO]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ttpcd") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("tpname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="更新"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="キャンセル"></asp:LinkButton>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="挿入"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="キャンセル"></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="編集"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="New" Text="新規作成"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="削除"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">一覧</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [KOKYAKU] WHERE [koid] = @koid" 
                InsertCommand="INSERT INTO [KOKYAKU] ([koname], [furi], [birth], [gender], [zipcode], [addr1], [addr2], [tatemono], [telno], [keitai], [email], [melmaga], [ttpcd]) VALUES (@koname, @furi, @birth, @gender, @zipcode, @addr1, @addr2, @tatemono, @telno, @keitai, @email, @melmaga, @ttpcd)" 
                SelectCommand="SELECT KOKYAKU.koid, KOKYAKU.koname, KOKYAKU.furi, KOKYAKU.birth, KOKYAKU.gender, KOKYAKU.zipcode, KOKYAKU.addr1, KOKYAKU.addr2, KOKYAKU.tatemono, KOKYAKU.telno, KOKYAKU.keitai, KOKYAKU.email, KOKYAKU.melmaga, KOKYAKU.ttpcd, TENPO.tpname FROM KOKYAKU INNER JOIN TENPO ON KOKYAKU.ttpcd = TENPO.tpcd WHERE (KOKYAKU.koid = @koid)" 
                UpdateCommand="UPDATE [KOKYAKU] SET [koname] = @koname, [furi] = @furi, [birth] = @birth, [gender] = @gender, [zipcode] = @zipcode, [addr1] = @addr1, [addr2] = @addr2, [tatemono] = @tatemono, [telno] = @telno, [keitai] = @keitai, [email] = @email, [melmaga] = @melmaga, [ttpcd] = @ttpcd WHERE [koid] = @koid">
                <DeleteParameters>
                    <asp:Parameter Name="koid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="koname" Type="String" />
                    <asp:Parameter Name="furi" Type="String" />
                    <asp:Parameter DbType="Date" Name="birth" />
                    <asp:Parameter Name="gender" Type="Byte" />
                    <asp:Parameter Name="zipcode" Type="String" />
                    <asp:Parameter Name="addr1" Type="String" />
                    <asp:Parameter Name="addr2" Type="String" />
                    <asp:Parameter Name="tatemono" Type="String" />
                    <asp:Parameter Name="telno" Type="String" />
                    <asp:Parameter Name="keitai" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="melmaga" Type="Boolean" />
                    <asp:Parameter Name="ttpcd" Type="Int16" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="koid" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="koname" Type="String" />
                    <asp:Parameter Name="furi" Type="String" />
                    <asp:Parameter DbType="Date" Name="birth" />
                    <asp:Parameter Name="gender" Type="Byte" />
                    <asp:Parameter Name="zipcode" Type="String" />
                    <asp:Parameter Name="addr1" Type="String" />
                    <asp:Parameter Name="addr2" Type="String" />
                    <asp:Parameter Name="tatemono" Type="String" />
                    <asp:Parameter Name="telno" Type="String" />
                    <asp:Parameter Name="keitai" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="melmaga" Type="Boolean" />
                    <asp:Parameter Name="ttpcd" Type="Int16" />
                    <asp:Parameter Name="koid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
    </form>
</body>
</html>

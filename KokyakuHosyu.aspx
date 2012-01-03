<%@ Page Language="C#" MasterPageFile="~/MasterChildPage.master" AutoEventWireup="true" CodeFile="KokyakuHosyu.aspx.cs" Inherits="KokyakuHosyu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
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
            <asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click">新規追加</asp:LinkButton>
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
                onitemupdated="DetailsView1_ItemUpdated" Width="500px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    <asp:LinkButton ID="LinkButton6" runat="server" CommandName="New">新規追加</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton7" runat="server" onclick="LinkButton7_Click">一覧</asp:LinkButton>
                </EmptyDataTemplate>
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="koid" HeaderText="顧客ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="koid" />
                    <asp:TemplateField HeaderText="顧客名" SortExpression="koname">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("koname") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" 
                                ForeColor="Brown">顧客名を入力してください</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("koname") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" 
                                ForeColor="Brown">顧客名を入力してください</asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("koname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="フリガナ" SortExpression="furi">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("furi") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                                ForeColor="Brown">フリガナを入力してください</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("furi") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                                ForeColor="Brown">フリガナを入力してください</asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("furi") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="生年月日" SortExpression="birth">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("birth", "{0:d}") %>'></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                ControlToValidate="TextBox3" ErrorMessage="RangeValidator" ForeColor="Brown" 
                                MaximumValue="2049/12/31" MinimumValue="1900/1/1" Type="Date">正しい年月日を入力してください</asp:RangeValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("birth", "{0:d}") %>'></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                ControlToValidate="TextBox3" ErrorMessage="RangeValidator" ForeColor="Brown" 
                                MaximumValue="2049/12/31" MinimumValue="1900/1/1" Type="Date">正しい年月日を入力してください</asp:RangeValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("birth", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="性別" SortExpression="gender">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" 
                                SelectedValue='<%# Bind("gender") %>'>
                                <asp:ListItem Value="0">男</asp:ListItem>
                                <asp:ListItem Value="1">女</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" 
                                SelectedValue='<%# Bind("gender") %>'>
                                <asp:ListItem Value="0">男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" Enabled="False" 
                                SelectedValue='<%# Eval("gender") %>'>
                                <asp:ListItem Value="0">男</asp:ListItem>
                                <asp:ListItem Value="1">女</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="郵便番号" SortExpression="zipcode">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("zipcode") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TextBox4" ErrorMessage="RegularExpressionValidator" 
                                ForeColor="Brown" ValidationExpression="\d{3}(-(\d{4}|\d{2}))?">正しい郵便番号を入力してください</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("zipcode") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TextBox4" ErrorMessage="RegularExpressionValidator" 
                                ForeColor="Brown" ValidationExpression="\d{3}(-(\d{4}|\d{2}))?">正しい郵便番号を入力してください</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="addr1" HeaderText="住所1" SortExpression="addr1" />
                    <asp:BoundField DataField="addr2" HeaderText="住所2" SortExpression="addr2" />
                    <asp:BoundField DataField="tatemono" HeaderText="建物" 
                        SortExpression="tatemono" />
                    <asp:TemplateField HeaderText="電話番号" SortExpression="telno">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("telno") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="TextBox5" ErrorMessage="RegularExpressionValidator" 
                                ForeColor="Brown" 
                                ValidationExpression="(0\d{1,4}-|\(0\d{1,4}\) ?)?\d{1,4}-\d{4}">正しい電話番号を入力してください</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("telno") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="TextBox5" ErrorMessage="RegularExpressionValidator" 
                                ForeColor="Brown" 
                                ValidationExpression="(0\d{1,4}-|\(0\d{1,4}\) ?)?\d{1,4}-\d{4}">正しい電話番号を入力してください</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("telno") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="携帯" SortExpression="keitai">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("keitai") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                ControlToValidate="TextBox7" ErrorMessage="RegularExpressionValidator" 
                                ForeColor="Brown" ValidationExpression="\d{3}-\d{4}-\d{4}">正しい携帯番号を入力してください</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("keitai") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                ControlToValidate="TextBox7" ErrorMessage="RegularExpressionValidator" 
                                ForeColor="Brown" ValidationExpression="\d{3}-\d{4}-\d{4}">正しい携帯番号を入力してください</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("keitai") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eメール" SortExpression="email">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="TextBox6" ErrorMessage="RegularExpressionValidator" 
                                ForeColor="Brown" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">正しいメールアドレスを入力してください</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="TextBox6" ErrorMessage="RegularExpressionValidator" 
                                ForeColor="Brown" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">正しいメールアドレスを入力してください</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                            <asp:DropDownList ID="DropDownList7" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="tpname" DataValueField="tpcd" 
                                SelectedValue='<%# Bind("ttpcd") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT [tpcd], [tpname] FROM [TENPO]"></asp:SqlDataSource>
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
                                CommandName="Delete" Text="削除" 
                                onclientclick="return confirm(&quot;本当に削除しますか？&quot;)"></asp:LinkButton>
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
</asp:Content>

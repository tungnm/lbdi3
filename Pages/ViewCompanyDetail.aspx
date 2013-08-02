<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ViewCompanyDetail.aspx.cs" Inherits="C2C.Pages.ViewCompanyDetail" %>

<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="MainContent">
    <div class="auto-style1">
        <p style="text-align: center">
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Browse other Companies" Height="45px" />
        </p>
        <p style="text-align: center">
            <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red" style="font-size: medium"></asp:Label>
        </p>
        <h1 class="title2">Company Information</h1>
        <p style="text-align: center">

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="font-size: small">
                <EditRowStyle BorderStyle="Solid" BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />


            </asp:GridView>

        </p>
        <h1 class="title2">Internships from this company</h1>
        <p style="text-align: center">

            <asp:GridView ID="GridView2" runat="server" CellPadding="4" OnRowCreated="GridView2_RowCreated" ForeColor="#333333" GridLines="None" style="font-size: small">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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

                <Columns>
                    <asp:TemplateField AccessibleHeaderText="ViewMore" HeaderText="ViewMore">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server"
                                NavigateUrl='<%# Eval("ID","~/Pages/ViewJobDetail.aspx?ID={0}") %>'
                                Text="View Detail" ForeColor="#0000ff"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
        </p>
        <p class="auto-style1">&nbsp;</p>


    </div>
    <p style="text-align: center">
        &nbsp;
    <asp:Button ID="btnBack0" runat="server" OnClick="btnBack_Click" Text="Browse other Companies" Height="45px" />
    </p>

    <%--   </ContentTemplate>
                    
                </asp:UpdatePanel>--%>
</asp:Content>

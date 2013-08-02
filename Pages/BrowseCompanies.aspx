<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="BrowseCompanies.aspx.cs" Inherits="C2C.Pages.BrowseCompanies" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">

    <p style="text-align: center"><asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" Height="45px" />
            </p>
    <h1 style="text-align: center">Filter</h1>


        <table align="center">
            <tr>
                <td class="auto-style2">By Industry:
                    <asp:DropDownList ID="drlIndustry" runat="server">
                    </asp:DropDownList>
                </td>
                <td>By State:
                    <asp:DropDownList ID="drlState" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>

        <p style="text-align: center">
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Apply and Search" Height="45px" />
        </p>
        <p style="text-align: center">
            <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red"></asp:Label>
        </p>
        <h1 style="text-align: center">____________________</h1>


        <h1 style="text-align: center">Company List</h1>


        <div style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" OnRowCreated="GridView1_RowCreated">
                <EditRowStyle BackColor="#999999" BorderStyle="Solid" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField AccessibleHeaderText="ViewMore" HeaderText="ViewMore">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#0000ff" NavigateUrl='<%# Eval("ID","~/Pages/ViewCompanyDetail.aspx?ID={0}") %>' Text="View Detail"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
<p style="text-align: center">
        <asp:Button ID="btnBack0" runat="server" CausesValidation="False" OnClick="btnBack_Click" Text="Go Back to Main Page" Height="45px" />
    </p>
        </asp:Panel>
</asp:Content>
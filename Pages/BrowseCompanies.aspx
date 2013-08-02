<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="BrowseCompanies.aspx.cs" Inherits="C2C.Pages.BrowseCompanies" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">

    <p><asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" />
            </p>
    <h1>Filter</h1>


        <table class="auto-style1">
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
        <p>
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Apply and Search" />
        </p>
        <p>
            <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red"></asp:Label>
        </p>
        <h1>__________________________________________________</h1>


        <h1>Company List</h1>


    <asp:GridView ID="GridView1" runat="server" CellPadding="4" OnRowCreated="GridView1_RowCreated" ForeColor="#333333" GridLines="Horizontal">
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
        <Columns>
            <asp:TemplateField AccessibleHeaderText="ViewMore" HeaderText="ViewMore">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server"
                        NavigateUrl='<%# Eval("ID","~/Pages/ViewCompanyDetail.aspx?ID={0}") %>'
                        Text="View Detail" ForeColor="#0000ff"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>

    </asp:GridView>
        <br />
        <br />
        <asp:Button ID="btnBack0" runat="server" CausesValidation="False" OnClick="btnBack_Click" Text="Go Back to Main Page" />
        </asp:Panel>
</asp:Content>
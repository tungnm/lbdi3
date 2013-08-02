<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="BrowseJobs.aspx.cs" Inherits="C2C.Pages.AllJobs" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">

    <p>
        <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" Height="45px" />
    </p>

    <h1 style="text-align: center">Internship Filter</h1>

    <table style="border: 1px solid #000000">
        <tr>
            <td>By Field:
                <asp:DropDownList ID="drlFunction" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style7">By Type:
                <asp:DropDownList ID="drlType" runat="server">
                    <asp:ListItem Value="all">All Types</asp:ListItem>
                    <asp:ListItem>UnPaid Internship</asp:ListItem>
                    <asp:ListItem>Paid Internship</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style5">By State:
                <asp:DropDownList ID="drlState" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style6">By Keyword:
                <asp:TextBox ID="txtKeyword" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
    </table>
    
        <p style="text-align: center">
            <asp:Button ID="btnSearch" runat="server" Height="45px" OnClick="btnSearch_Click" Text="Apply and Search" />
        </p>

    <p style="text-align: center">
    <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red"></asp:Label>
</p>

    <h1 style="text-align: center">_______________________________</h1>
    
        <h1 style="text-align: center">Internship List</h1>

        
        <div style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" OnRowCreated="GridView1_RowCreated">
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
                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#0000ff" NavigateUrl='<%# Eval("ID","~/Pages/ViewJobDetail.aspx?ID={0}") %>' Text="View Detail"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    
    <p>
        <asp:Button ID="btnBack0" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" Height="45px" />
    </p>


        </asp:Panel>
</asp:Content>
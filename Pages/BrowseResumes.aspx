<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="BrowseResumes.aspx.cs" Inherits="C2C.Pages.BrowseResumes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:Panel runat="server" ID="Panel1" DefaultButton="btnSearch">



        <div>

            <div style="margin-top: 5px; clear: both">

                <p>
                    <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" />
                </p>
                <h1>Resume Filter</h1>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style6"><strong>School:
                        <asp:DropDownList ID="drlSchool" runat="server">
                        </asp:DropDownList>
                        </strong>
                        </td>
                        <td class="auto-style4"><strong>Major:
                        <asp:DropDownList ID="drlMajor" runat="server">
                        </asp:DropDownList>
                        </strong>
                        </td>
                        <td class="auto-style5"><strong>Degree Type:
                        <asp:DropDownList ID="drlType" runat="server">
                            <asp:ListItem Value="all">All Types</asp:ListItem>
                            <asp:ListItem>Undergraduate</asp:ListItem>
                            <asp:ListItem>Graduate</asp:ListItem>
                        </asp:DropDownList>
                        </strong>
                        </td>
                        <td class="auto-style2"><span class="auto-style7"><strong>KeyWord:&nbsp; </strong></span><strong>
                            <asp:TextBox ID="txtKeyword" runat="server" Width="215px"></asp:TextBox>
                        </strong>
                        </td>
                    </tr>
                </table>
                <p>
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Apply and Search" />
                </p>
                <p>
                    <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red"></asp:Label>
                </p>
                <h1>Resume List</h1>

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
                        <asp:TemplateField AccessibleHeaderText="Download" HeaderText="Download">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server"
                                    NavigateUrl='<%# Eval("ID","~/Pages/GetFile.aspx?ID={0}") %>'
                                    Text="Download" ForeColor="#0000ff"></asp:HyperLink>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Select" AccessibleHeaderText="Select">
                            <ItemTemplate>
                                <asp:Button ID="btnSelect" runat="server" Text="Select" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnSelect_Click" />
                                <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btnSelect"
                                    ConfirmText="After you hit the select button, this student and his/her advisor will be notified by email and advisor will help you get in touch with this student. Select this student?">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>

                <br />
                <br />
                <asp:Button ID="btnBack0" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" />

            </div>
        </div>


    </asp:Panel>




</asp:Content>
<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="C2C.Contact" %>

<%@ Register TagPrefix="c2c" TagName="login" Src="UserControls/Login.ascx" %>
<%@ Register TagPrefix="c2c" TagName="jobPost" Src="UserControls/PostJobForm.ascx" %>
<%@ Register TagPrefix="c2c" TagName="companyForm" Src="UserControls/CompanyForm.ascx" %>
<%@ Register TagPrefix="c2c" TagName="schoolForm" Src="UserControls/SchoolForm.ascx" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <br />

    <div>

        <div style="margin-top: 5px; clear: both">

            <p><asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" />
            </p>
            <h1>Resume List</h1>

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" OnRowCreated="GridView1_RowCreated" ForeColor="#333333" GridLines="None">
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
                            <asp:Button ID="btnSelect" runat="server" Text="Select" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

            <br />
            <br />
            <asp:Button ID="btnBack0" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" />

        </div>
    </div>





</asp:Content>





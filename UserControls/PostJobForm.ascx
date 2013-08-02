<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostJobForm.ascx.cs" Inherits="C2C.UserControls.PostJobForm" %>
<style type="text/css">
    .auto-style1 {
        text-align: center;
    }
    .auto-style2 {
        width: 97%;
        height: 437px;
    }
    .auto-style3 {
        width: 81px;
        text-align: right;
    }
    .auto-style5 {
        width: 81px;
        height: 26px;
        text-align: right;
    }
    .auto-style7 {
        height: 26px;
        text-align: left;
        width: 198px;
    }
    .auto-style9 {
        width: 81px;
        text-align: right;
        height: 23px;
    }
    .auto-style11 {
        text-align: left;
        height: 23px;
        width: 198px;
    }
    .auto-style12 {
        text-align: left;
        width: 198px;
    }
    .auto-style13 {
        height: 26px;
        text-align: left;
        width: 402px;
    }
    .auto-style14 {
        text-align: left;
        height: 23px;
        width: 402px;
    }
    .auto-style15 {
        text-align: left;
        width: 402px;
    }
</style>
<%--<body style="text-align: center">--%>
<div class="auto-style1">
    <h3 style="text-align: left">Post A New Job</h3>
    <table class="auto-style2">
        <tr>
            <td class="auto-style5">Title</td>
            <td class="auto-style13">
                <asp:TextBox ID="TextBoxTitle" runat="server" Width="500px"></asp:TextBox>
            </td>
            <td class="auto-style7">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxTitle" ErrorMessage="Please enter Title" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">Company</td>
            <td class="auto-style14">
                <asp:DropDownList ID="drlCompany" runat="server">
                    <asp:ListItem>Select orType New</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="drlCompany" ErrorMessage="Please select or enter Company" ForeColor="#FF3300" InitialValue="Select orType New"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Industry</td>
            <td class="auto-style15">
                <asp:DropDownList ID="DropDownListIndustry" runat="server" style="text-align: left" DataSourceID="industry" DataTextField="Name" DataValueField="Name">
                    <asp:ListItem>Select One</asp:ListItem>
                    <asp:ListItem>Accouting</asp:ListItem>
                    <asp:ListItem>Computer</asp:ListItem>
                    <asp:ListItem>Architect</asp:ListItem>
                    <asp:ListItem>Arts and Entertainment</asp:ListItem>
                    <asp:ListItem>Finance</asp:ListItem>
                    <asp:ListItem>Insurance</asp:ListItem>
                    <asp:ListItem>Sales / Marketing</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="industry" runat="server" ConnectionString="<%$ ConnectionStrings:C2CDatabaseConnectionString %>" SelectCommand="SELECT [Name] FROM [Industry] ORDER BY [Name]"></asp:SqlDataSource>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownListIndustry" ErrorMessage="Please Select Industry" ForeColor="#FF3300" InitialValue="Select One"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Type</td>
            <td class="auto-style15">
                <asp:DropDownList ID="DropDownListType" runat="server">
                    <asp:ListItem>Select One</asp:ListItem>
                    <asp:ListItem>UnPaid Intership</asp:ListItem>
                    <asp:ListItem>Paid Intership</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListType" ErrorMessage="Please select Type" ForeColor="#FF3300" InitialValue="Select One"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">City</td>
            <td class="auto-style13">
                <asp:TextBox ID="TextBoxCity" runat="server" Width="500px"></asp:TextBox>
            </td>
            <td class="auto-style7">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBoxCity" ErrorMessage="Please enter City" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">State</td>
            <td class="auto-style15">
                <asp:DropDownList ID="DropDownListState" runat="server" DataSourceID="state" DataTextField="Name" DataValueField="Name">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>AL</asp:ListItem>
                    <asp:ListItem>FL</asp:ListItem>
                    <asp:ListItem>GA</asp:ListItem>
                    <asp:ListItem>NY</asp:ListItem>
                    <asp:ListItem>TX</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="state" runat="server" ConnectionString="<%$ ConnectionStrings:C2CDatabaseConnectionString %>" SelectCommand="SELECT [Name] FROM [State] ORDER BY [Name]"></asp:SqlDataSource>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="DropDownListState" ErrorMessage="Please select State" ForeColor="#FF3300" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Description</td>
            <td class="auto-style15">
                <asp:TextBox ID="TextBoxDes" runat="server" Height="226px" TextMode="MultiLine" Width="600px"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxDes" ErrorMessage="Please enter Description" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        </table>
    <br />
&nbsp;&nbsp;
    <asp:Button ID="ButtonPost" runat="server" OnClick="ButtonPost_Click" Text="Post" Width="82px" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="ButtonReset" runat="server" Text="Reset" Width="82px" />
    <br />
</div>
<p>
    &nbsp;</p>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SchoolForm.ascx.cs" Inherits="C2C.UserControls.SchoolForm" %>
<style type="text/css">

    .auto-style4 {
        font-size: large;
    }
    .auto-style1 {
        width: 69%;
        height: 119px;
    }
    .auto-style9 {
        width: 88px;
        text-align: right;
        height: 55px;
    }
    .auto-style10 {
        width: 233px;
        height: 55px;
        text-align: justify;
    }
    .auto-style11 {
        height: 55px;
    }
    .auto-style8 {
        width: 88px;
        text-align: right;
    }
    .auto-style2 {
        width: 233px;
        text-align: justify;
    }
    .auto-style5 {
        width: 88px;
        text-align: right;
        height: 24px;
    }
    .auto-style6 {
        width: 233px;
        height: 24px;
        text-align: justify;
    }
    .auto-style7 {
        height: 24px;
    }
    </style>
<body style="text-align: left">
    <p class="auto-style4">
        <strong>School Information</strong></p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style9">Name:</td>
            <td class="auto-style10">
                <asp:DropDownList ID="DropDownSchool" runat="server" AutoPostBack="True" DataSourceID="C2CSchool" DataTextField="Name" DataValueField="Name" Width="318px" OnSelectedIndexChanged="DropDownSchool_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="auto-style11">
                <asp:SqlDataSource ID="C2CSchool" runat="server" ConnectionString="<%$ ConnectionStrings:C2CDatabaseConnectionString %>" SelectCommand="SELECT [Name] FROM [School] ORDER BY [Name]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownSchool"  ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Website:</td>
            <td class="auto-style2">
                <asp:Label ID="LabelWebsite" runat="server" Text="www.alasu.edu" Width="313px" BorderStyle="Inset" BorderWidth="1px"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5"></td>
            <td class="auto-style6"></td>
            <td class="auto-style7"></td>
        </tr>
    </table>
    </body>




<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CompanyForm.ascx.cs" Inherits="C2C.UserControls.CompanyForm" %>

<%--<body style="text-align: center; height: 486px; width: 752px;">--%>

    <style type="text/css">

    .auto-style2 {
        width: 87%;
        height: 248px;
    }
    .auto-style13 {
        width: 121px;
        text-align: right;
        height: 26px;
    }
    .auto-style14 {
        width: 72px;
        height: 26px;
        text-align: justify;
    }
    .auto-style15 {
        width: 195px;
        height: 26px;
        text-align: left;
    }
    .auto-style6 {
        width: 121px;
        text-align: right;
    }
    .auto-style8 {
            width: 72px;
            text-align: justify;
        }
    .auto-style3 {
        width: 195px;
        text-align: left;
    }
    .auto-style7 {
            height: 23px;
            width: 121px;
            text-align: right;
            color: #000000;
        }
    .auto-style9 {
            width: 72px;
            height: 23px;
            text-align: justify;
        }
    .auto-style5 {
        width: 195px;
        height: 23px;
        text-align: left;
    }
    .auto-style10 {
        width: 121px;
        text-align: right;
        height: 119px;
    }
    .auto-style11 {
        width: 72px;
        height: 119px;
        text-align: justify;
    }
    .auto-style12 {
        width: 195px;
        height: 119px;
        text-align: left;
    }
        .auto-style17 {
            width: 121px;
            text-align: right;
            color: #000000;
        }
    </style>
<body style="text-align: left">
    <strong>Company Information<br />
    </strong>
<table class="auto-style2">
    <tr>
        <td class="auto-style13">Name</td>
        <td class="auto-style14">
            <asp:TextBox ID="TextBoxName" runat="server" Width="292px"></asp:TextBox>
        </td>
        <td class="auto-style15">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">Industry</td>
        <td class="auto-style8">
            <asp:DropDownList ID="DropDownListIndustry" runat="server" DataSourceID="C2CIndustry" DataTextField="Name" DataValueField="Name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="C2CIndustry" runat="server" ConnectionString="<%$ ConnectionStrings:C2CDatabaseConnectionString %>" SelectCommand="SELECT [Name] FROM [Industry] ORDER BY [Name]"></asp:SqlDataSource>
        </td>
        <td class="auto-style3">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownListIndustry" ErrorMessage="Required Field" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style7">Website</td>
        <td class="auto-style9">
            <asp:TextBox ID="TextBoxWebsite" runat="server" Width="292px"></asp:TextBox>
        </td>
        <td class="auto-style5"></td>
    </tr>
    <tr>
        <td class="auto-style7">Address</td>
        <td class="auto-style9">
            <asp:TextBox ID="TextBoxAddress" runat="server" Width="292px"></asp:TextBox>
        </td>
        <td class="auto-style5"></td>
    </tr>
    <tr>
        <td class="auto-style17">City</td>
        <td class="auto-style8">
            <asp:TextBox ID="TextBoxCity" runat="server" Width="292px"></asp:TextBox>
        </td>
        <td class="auto-style3">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxCity" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">State</td>
        <td class="auto-style8">
            <asp:DropDownList ID="DropDownListState" runat="server" DataSourceID="C2CStateSource" DataTextField="Name" DataValueField="Name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="C2CStateSource" runat="server" ConnectionString="<%$ ConnectionStrings:C2CDatabaseConnectionString %>" SelectCommand="SELECT [Name] FROM [State] ORDER BY [Name]"></asp:SqlDataSource>
        </td>
        <td class="auto-style3">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListState" ErrorMessage="Required Field" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style7">Zipcode</td>
        <td class="auto-style9">
            <asp:TextBox ID="TextBoxZipcode" runat="server" Width="292px"></asp:TextBox>
        </td>
        <td class="auto-style5"></td>
    </tr>
    <tr>
        <td class="auto-style10">Description</td>
        <td class="auto-style11">
            <asp:TextBox ID="TextBoxDescription" runat="server" Height="125px" Width="427px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td class="auto-style12">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxDescription" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    </table>

    </body>



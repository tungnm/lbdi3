<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PasswordHelp.aspx.cs" Inherits="C2C.Pages.PasswordHelp" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">

    <h1 class ="title2">
        Forgot Password
    </h1>

    <p>
        <span style="font-size: medium">Select <strong>user type: </strong>
        <asp:DropDownList ID="drlUserType" runat="server">
            <asp:ListItem>Select</asp:ListItem>
            <asp:ListItem>Advisor</asp:ListItem>
            <asp:ListItem>Employer</asp:ListItem>
        </asp:DropDownList>
        </span><strong>
        <asp:RequiredFieldValidator ID="valUserType" runat="server" ControlToValidate="drlUserType" ErrorMessage="Please select user type" InitialValue="Select" style="color: #0000FF"></asp:RequiredFieldValidator>
        </strong></p>
    <p>
        <span style="font-size: medium">What is your <strong>email address</strong>: </span>
    <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
&nbsp;<em>(We will send your password to this email address)</em></p>
    <p style="text-align: center">
        <strong>
        <asp:RequiredFieldValidator ID="valEmai" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Email" style="color: #0000FF"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:Label ID="lblMessage" runat="server" style="color: #FF0000"></asp:Label>
        </strong>
    </p>

    <p>
        <span style="font-size: medium">Forgot your <strong>email address?</strong> Please </span> <a href ="ContactUs.aspx"><span style="font-size: large">Contact Us</span></a> to get help.
    </p>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ContactUs.aspx.cs" Inherits="C2C.Pages.ContactUs" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h1>CONTACT US</h1>

    <p class="auto-style8">

        Please contact Mrs. Nancy Beggs: (EMAIL) with the Montgomery Area Chamber of Commerce if you do not find the information you are seeking on this website, or if you need other assistance please or fill-out the form below:</p>
    <p class="auto-style12">

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <table class="auto-style9">
        <tr>
            <td class="auto-style3">Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtName" runat="server" Width="328px" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Email<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtEmail" runat="server" Width="328px" MaxLength="50"></asp:TextBox>
                <asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Phone</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtPhone" runat="server" Width="328px" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Best time to contact</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtTime" runat="server" Width="328px" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Comment <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtComment" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                (1000 characters)</td>
            <td class="auto-style11">
                <asp:TextBox ID="txtComment" runat="server" Height="170px" TextMode="MultiLine" Width="495px" MaxLength="1000"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="Button1" runat="server" Height="43px" Text="Submit" Width="170px" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
    <p class="auto-style1">

        &nbsp;</p>
    <p class="auto-style8">

        Remember organizations can take advantage of the service that best meets their employment needs. 

Register With Our Online Career Network
        and We can put you in touch with River Region’s brightest talent when you register your organization with Coursework 2 Careers.  </p>
    <span class="auto-style7">
    <p class="auto-style1">

        All you need to do is:
</p>
    <p class="auto-style1">

        1.	Create a new account.


    </p>
    <p class="auto-style1">

        2.	Fill out all fields in the online form.


    </p>
    <p class="auto-style1">

        3.	Search for interns. </span>


    </p>
    <p class="auto-style1">

        &nbsp;</p>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style3 {
            width: 122px;
            text-align: right;
        }
        .auto-style4 {
            width: 363px;
        }
        .auto-style5 {
            width: 363px;
            text-align: left;
        }
        .auto-style7 {
            font-size: medium;
        }
        .auto-style8 {
            text-align: left;
            font-size: medium;
        }
        .auto-style9 {
            width: 72%;
            font-size: small;
            height: 374px;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style10 {
            width: 122px;
            text-align: right;
            height: 216px;
        }
        .auto-style11 {
            width: 363px;
            height: 216px;
        }
        .auto-style12 {
            text-align: center;
            font-size: medium;
        }
    </style>
</asp:Content>


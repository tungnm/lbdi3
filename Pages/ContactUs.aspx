<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ContactUs.aspx.cs" Inherits="C2C.Pages.ContactUs" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h1 class="title2">CONTACT US</h1>

    <p>
        Please contact <span style="color: #0099CC"><strong>Mrs. Nancy Beggs: (EMAIL)</strong></span> with the <strong><em>Montgomery Area Chamber of Commerce</em></strong><br />
        if you do not find the information you are seeking on this website.</p>
    <p>
        If you need other assistance please or fill-out the form below:</p>
    <p style="text-align: center">
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </p>

    <table style="border: thin dashed #666666">
        <tr>
            <td>Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" Width="328px" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="328px" MaxLength="50"></asp:TextBox>
                <asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" Width="328px" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Best time to contact</td>
            <td>
                <asp:TextBox ID="txtTime" runat="server" Width="328px" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Comment <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtComment" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                (1000 characters)</td>
            <td style="border-color: #999999">
                <asp:TextBox ID="txtComment" runat="server" Height="170px" TextMode="MultiLine" Width="495px" MaxLength="1000"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Height="43px" Text="Submit" Width="170px" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>

</asp:Content>



<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PostResume.aspx.cs" Inherits="C2C.Pages.PostResume" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">

    <p>
            <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="True" Font-Names="Arial Unicode MS" Font-Size="Medium" ForeColor="Red"></asp:Label>
        </p>
    <p>
            <asp:Button ID="btnBackToMainPage" runat="server" OnClick="btnBackToMainPage_Click" Text="Back to Main Page" CausesValidation="False" />
        </p>
    <h1>Resume upload</h1>



    <table class="auto-style1">
        <tr>
            <td class="auto-style3">Student First Name</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtFName" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Student Last Name</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtLName" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLName" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Email</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtEmail" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">School</td>
            <td class="auto-style5">
                <asp:DropDownList ID="drlSchool" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="drlSchool" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Major</td>
            <td class="auto-style5">
                <asp:DropDownList ID="drlMajor" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="drlMajor" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Type</td>
            <td class="auto-style6">
                <asp:DropDownList ID="drlType" runat="server">
                    <asp:ListItem>Undergraduate</asp:ListItem>
                    <asp:ListItem>Graduate</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="drlType" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">File upload (Maximum <span class="auto-style7"><strong>5MB</strong></span>)<br />
                (Only <span class="auto-style11">.doc</span><span class="auto-style10">, </span> <span class="auto-style11">.docx</span><span class="auto-style10">, </span> <span class="auto-style12">.txt</span><span class="auto-style10">, </span> <span class="auto-style13">.pdf</span>)</td>
            <td class="auto-style6">
                <asp:FileUpload ID="FileResume" runat="server" />
&nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="FileResume" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style6">
                <h2 class="auto-style8">&nbsp;</h2>

            </td>
            <td>&nbsp;</td>
        </tr>
        </table>

    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />

                <br />

    <br />
            <br />
    <br />
            <asp:Button ID="btnBackToMainPage0" runat="server" OnClick="btnBackToMainPage_Click" Text="Back to Main Page" CausesValidation="False" />

    <br />


    <br />


</asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PostResume.aspx.cs" Inherits="C2C.Pages.PostResume" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">

    <p style="text-align: center">
            <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="True" Font-Names="Arial Unicode MS" Font-Size="Medium" ForeColor="Red"></asp:Label>
        </p>
    <p style="text-align: center">
            <asp:Button ID="btnBackToMainPage" runat="server" OnClick="btnBackToMainPage_Click" Text="Back to Main Page" CausesValidation="False" Height="45px" />
        </p>
    <h1>Resume Upload</h1>



    <table style="width: 800px; height: 300px">
        <tr>
            <td class="auto-style3" style="text-align: right; width: 258px">Student First Name</td>
            <td class="auto-style5" style="width: 236px">
                <asp:TextBox ID="txtFName" runat="server" Width="200px" MaxLength="50" style="margin-left: 0px"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" style="text-align: right; width: 258px">Student Last Name</td>
            <td class="auto-style6" style="width: 236px">
                <asp:TextBox ID="txtLName" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLName" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" style="text-align: right; width: 258px">Email</td>
            <td class="auto-style6" style="width: 236px">
                <asp:TextBox ID="txtEmail" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right; width: 258px">School</td>
            <td class="auto-style5" style="width: 236px">
                <asp:DropDownList ID="drlSchool" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="drlSchool" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right; width: 258px">Major</td>
            <td class="auto-style5" style="width: 236px">
                <asp:DropDownList ID="drlMajor" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="drlMajor" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" style="text-align: right; width: 258px">Type</td>
            <td class="auto-style6" style="width: 236px">
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
            <td class="auto-style4" style="text-align: right; width: 258px; height: 66px">File upload (Maximum <span style="color: #FF0000; font-size: large"><strong>2</strong></span><span class="auto-style7"><strong> MB</strong></span>)<br />
                (Only <span style="color: #FF0000"> <span class="auto-style11">.doc</span><span class="auto-style10">, </span> <span class="auto-style11">.docx</span><span class="auto-style10">, </span> <span class="auto-style12">.txt</span><span class="auto-style10">, </span> <span class="auto-style13">.pdf</span></span>)</td>
            <td class="auto-style6" style="width: 236px; height: 66px">
                <asp:FileUpload ID="FileResume" runat="server" />
&nbsp;</td>
            <td style="height: 66px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="FileResume" ErrorMessage="Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        </table>

    <p style="text-align: center">

    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Height="45px" Width="89px" CssClass="auto-style1" />

                </p>
    <p style="text-align: center">
        &nbsp;</p>
    <p style="text-align: center">
            <asp:Button ID="btnBackToMainPage0" runat="server" OnClick="btnBackToMainPage_Click" Text="Back to Main Page" CausesValidation="False" Height="45px" />

    </p>

    <br />


    <br />


</asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AdvisorRegistration.aspx.cs" Inherits="C2C.Pages.AdvisorRegistration" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <h1>Advisor Registration</h1>
<p style="text-align: center">
        <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="True" Font-Names="Arial Unicode MS" Font-Size="Medium" ForeColor="Red"></asp:Label>
    </p>
    <h3>Organization Information</h3>
    <table class="auto-style11">
        <tr>
            <td class="auto-style13">School Name</td>
            <td class="auto-style3">
                <asp:DropDownList ID="drlSchoolName" runat="server" AutopostBack="true" OnSelectedIndexChanged="drlSchoolName_SelectedIndexChanged">
                    <asp:ListItem>Select One</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="drlSchoolName" ErrorMessage="Select One" ForeColor="Red" InitialValue="Select One" CssClass="auto-style14"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Website</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtWebSite" runat="server" Width="250px" Enabled="False" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtWebSite" ErrorMessage="*Required" ForeColor="Red" CssClass="auto-style14"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Full Address (Street, City, State Zipcode)</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtSchoolAddress" runat="server" Height="100px" TextMode="MultiLine" Width="250px"></asp:TextBox>
            </td>
            <td class="auto-style13">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        </table>
    <h3>Account Information</h3>
    <table class="auto-style1">
        <tr>
            <td class="auto-style13">Salutation</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserSalutation" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Full Name</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserName" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUserName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Street Adress</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserAddress" runat="server" Height="60px" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">City</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserCity" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUserCity" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">State</td>
            <td class="auto-style3">
                <asp:DropDownList ID="drlUserState" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="drlUserState" ErrorMessage="*Required" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Zipcode</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserZipcode" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Phone</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserPhone" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtUserPhone" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Email Address (UserName)</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtUserEmail" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Invalid Email" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">Enter Password (6-13 characters)</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtUserPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style8">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtUserPassword" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="valPassRequire" runat="server" ControlToValidate="txtUserPassword" ErrorMessage="Invalid password" ForeColor="Blue" ValidationExpression=".{6,13}"></asp:RegularExpressionValidator>
                </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Verify Password</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserVerifyPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtUserVerifyPassword" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtUserPassword" ControlToValidate="txtUserVerifyPassword" ErrorMessage="Password mismatch" ForeColor="Blue"></asp:CompareValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <p style="margin-left: 160px">
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
    </p>
</asp:Content>
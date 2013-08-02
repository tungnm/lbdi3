<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AdvisorProfile.aspx.cs" Inherits="C2C.Pages.AdvisorProfile" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <p><asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" />
        </p>
    <p>
        <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="True" Font-Names="Arial Unicode MS" Font-Size="Medium" ForeColor="Red"></asp:Label>
        </p>
    <h1>Advisor Pofile</h1>
    <h3>Organization Information</h3>
    <table class="auto-style1">
        <tr>
            <td class="auto-style10">School Name</td>
            <td class="auto-style17">
                <asp:DropDownList ID="drlSchoolName" runat="server" BackColor="#EFEEEF" ForeColor="Red" Enabled="False">
                </asp:DropDownList>
            </td>
            <td class="auto-style18">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="drlSchoolName" ErrorMessage="Select One" ForeColor="Red" InitialValue="Select One"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Website</td>
            <td class="auto-style17">
                <asp:TextBox ID="txtWebSite" runat="server" Width="250px" ReadOnly="True" BorderColor="Red" ForeColor="Red" BackColor="#EFEEEF" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style18">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtWebSite" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">Full Address (Street, City, State Zipcode)</td>
            <td class="auto-style17">
                <asp:TextBox ID="txtSchoolAddress" runat="server" Height="100px" TextMode="MultiLine" Width="250px"></asp:TextBox>
            </td>
            <td class="auto-style18">&nbsp;</td>
        </tr>
        </table>
    <h3>Account Information</h3>
    <table class="auto-style1">
        <tr>
            <td class="auto-style23">Salutation</td>
            <td class="auto-style29">
                <asp:TextBox ID="txtUserSalutation" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style28">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">Full Name</td>
            <td class="auto-style29">
                <asp:TextBox ID="txtUserName" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style28">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUserName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">Street Adress</td>
            <td class="auto-style29">
                <asp:TextBox ID="txtUserAddress" runat="server" Height="60px" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style28">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">City</td>
            <td class="auto-style29">
                <asp:TextBox ID="txtUserCity" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style28">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUserCity" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">State</td>
            <td class="auto-style29">
                <asp:DropDownList ID="drlUserState" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style28">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="drlUserState" ErrorMessage="*Required" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">Zipcode</td>
            <td class="auto-style29">
                <asp:TextBox ID="txtUserZipcode" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style28">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">Phone</td>
            <td class="auto-style29">
                <asp:TextBox ID="txtUserPhone" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style28">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtUserPhone" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Email Address (UserName)</td>
            <td class="auto-style21">
                <asp:TextBox ID="txtUserEmail" runat="server" Width="200px" ReadOnly="True" BorderColor="Red" ForeColor="Red" BackColor="#EFEEEF" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Invalid Email" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   </td>
        </tr>
        <tr>
            <td class="auto-style25"></td>
            <td class="auto-style26">
                </td>
            <td class="auto-style27">
                </td>
        </tr>
        <tr>
            <td class="auto-style23"><strong>Enter Current Password</strong></td>
            <td class="auto-style29">
                <asp:TextBox ID="txtUserCurrentPassword" runat="server" TextMode="Password" Width="200px" MaxLength="13"></asp:TextBox>
            </td>
            <td class="auto-style28">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtUserCurrentPassword" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <p>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Update Profile" />
    </p>
    <p class="auto-style15">
        <strong>______________________________________________________________________________________________</strong></p>
    <h3>
        <strong>Password Change</strong></h3>
    <table class="auto-style11">
        <tr>
            <td class="auto-style12">Enter New Password (6-13 characters)</td>
            <td class="auto-style13">
                <asp:TextBox ID="txtUserPassword" runat="server" TextMode="Password" Width="200px" MaxLength="13"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtUserPassword" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="valPassRequire" runat="server" ControlToValidate="txtUserPassword" ErrorMessage="Invalid password" ForeColor="Blue" ValidationExpression=".{6,13}"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
            <td class="auto-style12">Verify New Password</td>
            <td class="auto-style13">
                <asp:TextBox ID="txtUserVerifyPassword" runat="server" TextMode="Password" Width="200px" MaxLength="13"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtUserVerifyPassword" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtUserPassword" ControlToValidate="txtUserVerifyPassword" ErrorMessage="Password mismatch" ForeColor="Blue"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12"><strong>Enter Current Password</strong></td>
            <td class="auto-style13">
                <asp:TextBox ID="txtUserCurrentPassword0" runat="server" TextMode="Password" Width="200px" MaxLength="13"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtUserCurrentPassword0" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
        <asp:Button ID="btnUpdatePassword" runat="server" OnClick="btnUpdatePassword_Click" Text="Update Password" ValidationGroup="2" />
    <br />
    <br />
    <p style="margin-left: 160px">
        <asp:Button ID="btnBack0" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" />
    </p>
</asp:Content>
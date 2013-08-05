<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EmployerProfile.aspx.cs" Inherits="C2C.Pages.EmployerProfile" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <p style="text-align: center">
        <asp:Button ID="btnBack1" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" Height="45px" />
    </p>
<p style="text-align: center">
        <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="True" Font-Names="Arial Unicode MS" Font-Size="Medium" ForeColor="Red"></asp:Label>
    </p>
<h1 class="title2">Employer Profile</h1>
    <h3>Organization Information</h3>
    <table style="width: 699px; height: 461px">
        <tr>
            <td class="auto-style29" style="width: 119px">Organization Name</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtCompName" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style2" style="width: 75px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style29" style="width: 119px">Industry</td>
            <td class="auto-style3">
                <asp:DropDownList ID="drlIndustry" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style2" style="width: 75px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="drlIndustry" ErrorMessage="*Required" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style29" style="width: 119px">Website</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtWebSite" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style2" style="width: 75px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style29" style="width: 119px">Description</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtDescription" runat="server" Height="163px" TextMode="MultiLine" Width="409px"></asp:TextBox>
            </td>
            <td class="auto-style2" style="width: 75px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescription" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style29" style="width: 119px">Street Address</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtCompAddress" runat="server" Height="99px" TextMode="MultiLine" Width="313px"></asp:TextBox>
            </td>
            <td class="auto-style2" style="width: 75px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style29" style="width: 119px">City</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtCompCity" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style2" style="width: 75px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCompCity" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style29" style="width: 119px">State</td>
            <td class="auto-style3">
                <asp:DropDownList ID="drlCompState" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style2" style="width: 75px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="drlCompState" ErrorMessage="*Required" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style29" style="width: 119px">Zipcode</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtCompZipcode" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style2" style="width: 75px">&nbsp;</td>
        </tr>
    </table>
    <h3>Account Information</h3>
    <table style="width: 685px; height: 424px">
        <tr>
            <td class="auto-style30" style="width: 174px">Salutation</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserSalutation" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style30" style="width: 174px">Full Name</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserName" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUserName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style30" style="width: 174px">Street Address</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserAddress" runat="server" Height="60px" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style30" style="width: 174px">City</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserCity" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUserCity" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style30" style="width: 174px">State</td>
            <td class="auto-style3">
                <asp:DropDownList ID="drlUserState" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="drlUserState" ErrorMessage="*Required" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style30" style="width: 174px">Zipcode</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserZipcode" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style30" style="width: 174px">Phone</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserPhone" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtUserPhone" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" style="width: 174px">Email Address (UserName)</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtUserEmail" runat="server" Width="200px" BorderColor="Red" ForeColor="Red" ReadOnly="True" BackColor="#EFEEEF" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Invalid Email" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   </td>
        </tr>
        <tr>
            <td class="auto-style4" style="width: 174px"></td>
            <td class="auto-style5">
            </td>
            <td class="auto-style5">
                   </td>
        </tr>
        <tr>
            <td class="auto-style30" style="width: 174px">
                <strong>Enter Current Password</strong><br />
                </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserCurrentPassword" runat="server" TextMode="Password" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtUserCurrentPassword" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <p style="text-align: center">
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Update Profile" Height="45px" />
    </p>
    <h1 class="title2">
        Password Change</h1>
    <table style="width: 650px; height: 150px">
        <tr>
            <td class="auto-style20">Enter New Password (6-13 characters)</td>
            <td class="auto-style22">
                <asp:TextBox ID="txtUserPassword" runat="server" TextMode="Password" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style26">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtUserPassword" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="valPassRequire" runat="server" ControlToValidate="txtUserPassword" ErrorMessage="Invalid password" ForeColor="Blue" ValidationExpression=".{6,13}"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
            <td class="auto-style21">Verify New Password</td>
            <td class="auto-style23">
                <asp:TextBox ID="txtUserVerifyPassword" runat="server" TextMode="Password" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style27">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtUserVerifyPassword" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtUserPassword" ControlToValidate="txtUserVerifyPassword" ErrorMessage="Password mismatch" ForeColor="Blue"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style27">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24"><strong>Enter Current Password</strong></td>
            <td class="auto-style25">
                <asp:TextBox ID="txtUserCurrentPassword0" runat="server" TextMode="Password" Width="200px" MaxLength="50"></asp:TextBox>
            </td>
            <td class="auto-style28">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtUserCurrentPassword0" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
<p style="text-align: center">
        <asp:Button ID="btnUpdatePassword" runat="server" OnClick="btnUpdatePassword_Click" Text="Update Password" ValidationGroup="2" Height="45px" />
    </p>

<p>
        <asp:Button ID="btnBack0" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" Height="45px" />
    </p>
</asp:Content>
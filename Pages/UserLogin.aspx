<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UserLogin.aspx.cs" Inherits="C2C.Pages.UserLogin" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <div>
    <h1 class="title2">Log In</h1>
        <table class="auto-style3" style="width: 511px; height: 216px">
            <tr>
                <td class="auto-style8"><strong>User Type:</strong></td>
                <td class="auto-style10">
            <asp:DropDownList ID="drlUserType" runat="server">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>Advisor</asp:ListItem>
                <asp:ListItem>Employer</asp:ListItem>
            </asp:DropDownList>
&nbsp;<em><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drlUserType" ErrorMessage="Error: Select User Type" ForeColor="Red" InitialValue="Select" CssClass="auto-style7"></asp:RequiredFieldValidator>
                    </em></td>
            </tr>
            <tr>
                <td class="auto-style6"><strong>
        Email Addess:</strong></td>
                <td class="auto-style10">
    <asp:TextBox ID="txtEmail" runat="server" Width="300px" OnTextChanged="txtEmail_TextChanged" Font-Size="Small"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Password:</strong></td>
                <td class="auto-style12">
    <asp:TextBox ID="txtPassword" runat="server" Width="300px" TextMode="Password" Font-Size="Small"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style10"><em>
      <asp:Label ID="lblMessage" runat="server" ForeColor="Red" style="font-size: medium; " CssClass="auto-style7"></asp:Label>
    
                    </em></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style10">
  
    <asp:Button ID="btnSubmit" runat="server" Text="Sign In" OnClick="btnSubmit_Click" Height="35px" style="font-size: large" Width="103px" />
                    <br />
                    <em>Forgot your password?</em> <em>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Pages/PasswordHelp.aspx" runat="server" CssClass="auto-style1">Get password help</asp:HyperLink>
                    </em>
                    <br />
                    <em>
                    Don&#39;t have an account?<span class="auto-style2"> <strong>
    <asp:HyperLink ID="link1" runat="server" NavigateUrl="~/Pages/SelectType.aspx" CssClass="auto-style9">Register here</asp:HyperLink>
    
                    </strong></span></em></td>
            </tr>
        </table>
        <p>&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
            </p>
    <span class="auto-style1"><strong>
        <br />
        </strong></span><br />
        <br />
    <br />
        <br />
    <br />
  
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
        <br />
        <br />
        <br />
        <p>
            &nbsp;</p>
    
</div>

</asp:Content>








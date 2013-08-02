<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UserRegistration.aspx.cs" Inherits="C2C.Pages.UserRegistration" %>
<%@Register TagPrefix="c2c" TagName="companyForm" Src="~/UserControls/CompanyForm.ascx" %>
<%@Register TagPrefix="c2c" TagName="schoolForm" Src="~/UserControls/SchoolForm.ascx" %>

 <asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="MainContent">
     <asp:Panel ID="pnlMainBody" runat="server" style="text-align: center">

<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>--%>
<%--    <form id="form1" runat="server">--%>
        <h3>User Registration</h3>

        <table>
            <tr>
                <td class="auto-style3">
                    <h4>Personal Information</h4>
                </td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style3">Salutation (Mr., Ms., Mrs., etc):</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtSalutation" runat="server" Width="332px"></asp:TextBox>
                </td>
                 <td class="auto-style2">
                     &nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style3">First Name:<span class="auto-style7"><strong>*</strong></span></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtFirstName" runat="server" Width="332px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="valFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Enter Your First Name" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="auto-style3">Last Name:<span class="auto-style7"><strong>*</strong></span></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtLastName" runat="server" Width="332px"></asp:TextBox></td>
                 <td class="auto-style2"> <asp:RequiredFieldValidator ID="valLastName" runat="server" ErrorMessage="Enter Your Last Name" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
          
             <tr>
                <td class="auto-style3">Address (House#, Street
                    <br />
                    City, State, Zipcode):</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtAddress" runat="server" Height="82px" TextMode="MultiLine" Width="332px"></asp:TextBox></td>
                  <td class="auto-style2"></td>
            </tr>
             <tr>
                <td class="auto-style3">Phone (xxx)xxx-xxxx:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Width="332px"></asp:TextBox></td>
                  <td class="auto-style2">
                      <asp:RegularExpressionValidator ID="valPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Incorrect Phone Number" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                 </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <h4>Account Information</h4>
                </td>
                 <td class="auto-style6"></td>
                <td class="auto-style2"></td>
            </tr>
              <tr>
                <td class="auto-style3">Email Address (username):<span class="auto-style7"><strong>*</strong></span></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="332px"></asp:TextBox></td>
                   <td class="auto-style2"> <asp:RequiredFieldValidator ID="valEmail" runat="server" ErrorMessage="Enter Your Email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   </td>
            </tr>
            <tr>
                <td class="auto-style8">Password:<span class="auto-style7"><strong>*</strong></span></td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="333px"></asp:TextBox></td>
                 <td class="auto-style10"> <asp:RequiredFieldValidator ID="valPassword" runat="server" ErrorMessage="Enter Your Password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="valPassRequire" runat="server" ControlToValidate="txtPassword" ErrorMessage="Passwod length is from 6-13 characters" ForeColor="Red" ValidationExpression=".{6,13}"></asp:RegularExpressionValidator>
                </td>
            </tr>
                       <tr>
                <td class="auto-style3">Confirm Password:<span class="auto-style7"><strong>*</strong></span></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="332px"></asp:TextBox></td>
                            <td class="auto-style2"> <asp:RequiredFieldValidator ID="valConfirmPassword" runat="server" ErrorMessage="Re-enter Password" ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="valMatch" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password mismatch" ForeColor="Red"></asp:CompareValidator>
                           </td>
            </tr>
             <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                  <td class="auto-style2">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drlUserType" ErrorMessage="Select User Type" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                 </td>
            </tr>
        </table>
      
         <br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
         <br />
        <br/>
        <asp:Button ID="btnCreateUser" runat="server" Text="Submit" OnClick="Button1_Click" />
<%--    </form>--%>
<%--</body>
</html>--%>

    
      
   


               </asp:Panel>
             
     <asp:Label ID="lblSelectCompany" runat="server" Text="Select Company:" Visible="False"></asp:Label>
     
           <asp:DropDownList ID="drlSelectCompany" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drlSelectCompany_SelectedIndexChanged" Visible="False">
               <asp:ListItem>Create New Company</asp:ListItem>
           </asp:DropDownList>
        <asp:Panel ID="PanelCompany" runat="server" Visible="False">
             <table class="auto-style2">

              <tr>
        <td class="auto-style13">Name</td>
        <td class="auto-style14">
            <asp:TextBox ID="txtComName" runat="server" Width="292px"></asp:TextBox>
        </td>
        <td class="auto-style15">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtComName" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">Industry</td>
        <td class="auto-style8">
            <asp:DropDownList ID="drlComIndustry" runat="server">
            </asp:DropDownList>
            <asp:SqlDataSource ID="C2CIndustry" runat="server" ConnectionString="<%$ ConnectionStrings:C2CDatabaseConnectionString %>" SelectCommand="SELECT [Name] FROM [Industry] ORDER BY [Name]"></asp:SqlDataSource>
        </td>
        <td class="auto-style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style7">Website</td>
        <td class="auto-style9">
            <asp:TextBox ID="txtComWebsite" runat="server" Width="292px"></asp:TextBox>
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxCity" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListState" ErrorMessage="Required Field" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxDescription" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    </table>

         </asp:Panel>
       
     </asp:Content>
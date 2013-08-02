<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UploadResumeForm.ascx.cs" Inherits="C2C.UserControls.UploadResumeForm" %>
<style type="text/css">
    .auto-style1 {
        width: 73%;
        height: 212px;
    }
    .auto-style2 {
        width: 144px;
        text-align: right;
    }
    .auto-style3 {
        width: 258px;
    }
    .auto-style4 {
        width: 262px;
    }
    .auto-style5 {
        width: 144px;
        height: 30px;
        text-align: right;
    }
    .auto-style6 {
        width: 258px;
        height: 30px;
    }
    .auto-style7 {
        width: 262px;
        height: 30px;
    }
    .auto-style8 {
        font-size: large;
    }
    .auto-style9 {
        width: 144px;
        text-align: right;
        height: 26px;
    }
    .auto-style10 {
        width: 258px;
        height: 26px;
    }
    .auto-style11 {
        width: 262px;
        height: 26px;
    }
</style>

<p class="auto-style8">
    <strong>Upload A Resume</strong></p>
<table class="auto-style1">
    <tr>
        <td class="auto-style9">FirstName:</td>
        <td class="auto-style10">
            <asp:TextBox ID="txtFName" runat="server" Width="250px"></asp:TextBox>
        </td>
        <td class="auto-style11">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style5">LastName:</td>
        <td class="auto-style6">
            <asp:TextBox ID="txtLName" runat="server" Width="250px"></asp:TextBox>
        </td>
        <td class="auto-style7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLName" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style5">Email:</td>
        <td class="auto-style6">
            <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
        </td>
        <td class="auto-style7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="valEmailSyntax" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   </td>
    </tr>
    <tr>
        <td class="auto-style2">School:</td>
        <td class="auto-style3">
            <asp:DropDownList ID="ddlSchool" runat="server" DataSourceID="School" DataTextField="Name" DataValueField="Name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="School" runat="server" ConnectionString="<%$ ConnectionStrings:C2CDatabaseConnectionString %>" SelectCommand="SELECT [Name] FROM [School] ORDER BY [Name]"></asp:SqlDataSource>
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlSchool" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Major:</td>
        <td class="auto-style3">
            <asp:DropDownList ID="ddlMajor" runat="server" DataSourceID="Major" DataTextField="Name" DataValueField="Name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Major" runat="server" ConnectionString="<%$ ConnectionStrings:C2CDatabaseConnectionString %>" SelectCommand="SELECT [Name] FROM [Major] ORDER BY [Name]"></asp:SqlDataSource>
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlMajor" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Type:</td>
        <td class="auto-style3">
            <asp:DropDownList ID="ddlType" runat="server">
                <asp:ListItem>Undergraduate</asp:ListItem>
                <asp:ListItem>Graduate</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlType" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Upload Resume:</td>
        <td class="auto-style3">
            <asp:FileUpload ID="FileResume" runat="server" />
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FileResume" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
    </tr>
</table>


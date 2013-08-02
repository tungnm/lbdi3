<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="ViewJobDetail.aspx.cs" Inherits="C2C.Pages.ViewJobDetail" %>

<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="MainContent">
    <div class="auto-style1">
        <p><asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Browse other Internships" />
            <asp:Button ID="btnBack1" runat="server" OnClick="btnBack1_Click" Text="Go Back to Main Page" CausesValidation="False" />
            <asp:Button ID="btnBack3" runat="server" OnClick="btnBack3_Click" Text="Go Back to Main Page" CausesValidation="False" Visible="False" />
        </p>
        <h1 class="auto-style1">Internship Detail</h1>

        <table border="0">
            <tr>
                <td class="auto-style6">Title</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtTitle" runat="server" Width="800px" ReadOnly="True" AutoPostBack="True" Font-Bold="True" Font-Size="Large" BackColor="#EFEEEF" BorderColor="#3399FF" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    </td>
            </tr>

            <tr>
                <td class="auto-style6">Company</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtCompany" runat="server" Width="800px" ReadOnly="True" AutoPostBack="True" Font-Bold="True" Font-Size="Medium" BackColor="#EFEEEF" BorderColor="#3399FF"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style2">Function</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFunction" runat="server" Width="800px" ReadOnly="True" BackColor="#EFEEEF" BorderColor="#3399FF"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Type</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtJobtype" runat="server" Width="200px" ReadOnly="True" ForeColor="Red" BackColor="#EFEEEF" Font-Bold="True" BorderColor="Red"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">City
                <td class="auto-style3">
                    <asp:TextBox ID="txtCity" runat="server" Width="500px" ReadOnly="True" BackColor="#EFEEEF" BorderColor="#3399FF"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">State</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtState" runat="server" Width="500px" ReadOnly="True" BackColor="#EFEEEF" BorderColor="#3399FF"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Qualification</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtQualification" runat="server" TextMode="MultiLine" Width="800px" ReadOnly="True" BorderColor="Red" BorderStyle="Solid" ForeColor="Red" Font-Bold="True" BackColor="#EFEEEF" Height="150px"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">Description</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="800px" ReadOnly="True" BackColor="#EFEEEF" BorderColor="#3399FF" Height="600px" Font-Size="Small"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style2">Posted Date</td>
                <td class="auto-style3">
                  

                    <asp:TextBox ID="txtPostedDate" runat="server" Width="200px" ReadOnly="True" Font-Bold="True" BackColor="#EFEEEF" BorderColor="#3399FF"></asp:TextBox>


                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style9">Expired Date
                </td>
                <td class="auto-style10">
                  

                    <asp:TextBox ID="txtExpDate" runat="server" Width="200px" ReadOnly="True" Font-Italic="True" BackColor="#EFEEEF" BorderColor="#3399FF"></asp:TextBox>


                &nbsp;&nbsp;</td>

                <td class="auto-style11">
                    </td>

            </tr>

        </table>




    </div>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;
    <asp:Button ID="btnBack0" runat="server" OnClick="btnBack_Click" Text="Browse other Internships" />
        <asp:Button ID="btnBack2" runat="server" OnClick="btnBack1_Click" Text="Go Back to Main Page" CausesValidation="False" />
            <asp:Button ID="btnBack4" runat="server" OnClick="btnBack3_Click" Text="Go Back to Main Page" CausesValidation="False" Visible="False" />
    </p>

                 <%--   </ContentTemplate>
                    
                </asp:UpdatePanel>--%>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="ViewJobDetail.aspx.cs" Inherits="C2C.Pages.ViewJobDetail" %>

<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="MainContent">
    <div class="auto-style1">
        <p style="text-align: center"><asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Browse other Internships" Height="45px" />
            <asp:Button ID="btnBack1" runat="server" OnClick="btnBack1_Click" Text="Go Back to Main Page" CausesValidation="False" Height="45px" />
            <asp:Button ID="btnBack3" runat="server" OnClick="btnBack3_Click" Text="Go Back to Main Page" CausesValidation="False" Visible="False" Height="45px" />
        </p>
        <h1>Internship Detail</h1>

        <table border="0" style="font-size: small; width: 900px;">
            <tr>
                <td class="auto-style6" style="width: 657px; height: 60px">Title</td>
                <td style="width: 442px; height: 60px">
                    <asp:Label ID="lblTitle" runat="server" BackColor="#EFEEEF" Font-Bold="True" Font-Size="Medium"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="auto-style6" style="width: 657px">Company</td>
                <td style="width: 442px">
                    <asp:TextBox ID="txtCompany" runat="server" Width="800px" ReadOnly="True" AutoPostBack="True" Font-Bold="False" Font-Size="Small" BackColor="#EFEEEF" BorderColor="#3399FF" BorderStyle="None" Font-Italic="False" ForeColor="Black"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style2" style="height: 23px; width: 657px">Function</td>
                <td style="width: 442px">
                    <asp:TextBox ID="txtFunction" runat="server" Width="800px" ReadOnly="True" BackColor="#EFEEEF" BorderColor="#3399FF" BorderStyle="None" Font-Bold="False" Font-Italic="False" Font-Size="Small" ForeColor="Black"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="width: 657px">Type</td>
                <td style="width: 442px">
                    <asp:TextBox ID="txtJobtype" runat="server" Width="200px" ReadOnly="True" ForeColor="Black" BackColor="#EFEEEF" Font-Bold="False" BorderColor="Red" BorderStyle="None" Font-Italic="False" Font-Size="Small"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 657px">City</td>
                <td style="width: 442px">
                    <asp:TextBox ID="txtCity" runat="server" Width="500px" ReadOnly="True" BackColor="#EFEEEF" BorderColor="#3399FF" BorderStyle="None" Font-Bold="False" Font-Italic="False" Font-Size="Small" ForeColor="Black"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 657px">State</td>
                <td style="width: 442px">
                    <asp:TextBox ID="txtState" runat="server" Width="500px" ReadOnly="True" BackColor="#EFEEEF" BorderColor="#3399FF" BorderStyle="None" Font-Bold="False" Font-Italic="False" Font-Size="Small" ForeColor="Black"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="width: 657px; height: 40px">Qualification</td>
                <td style="width: 442px; height: 40px">
                    <asp:Label ID="lblQualification" runat="server" BackColor="#EFEEEF" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 657px; height: 40px">Description</td>
                <td style="width: 442px; height: 40px">
                    <asp:Label ID="lblDescription" runat="server" BackColor="#EFEEEF"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="auto-style2" style="width: 657px; height: 22px">Posted Date</td>
                <td style="width: 442px; height: 22px">
                  

                    <asp:TextBox ID="txtPostedDate" runat="server" Width="200px" ReadOnly="True" Font-Bold="False" BackColor="#EFEEEF" BorderColor="#3399FF" BorderStyle="None" Font-Italic="False" Font-Size="Small" ForeColor="Black"></asp:TextBox>


                </td>
            </tr>

            <tr>
                <td class="auto-style9" style="width: 657px; height: 20px">Expired Date
                </td>
                <td style="width: 442px; height: 20px">
                  

                    <asp:TextBox ID="txtExpDate" runat="server" Width="200px" ReadOnly="True" Font-Italic="False" BackColor="#EFEEEF" BorderColor="#3399FF" BorderStyle="None" Font-Bold="False" Font-Size="Small" ForeColor="Black"></asp:TextBox>


                &nbsp;&nbsp;</td>

            </tr>

        </table>




    </div>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p style="text-align: center">
        &nbsp;
    <asp:Button ID="btnBack0" runat="server" OnClick="btnBack_Click" Text="Browse other Internships" Height="45px" />
        <asp:Button ID="btnBack2" runat="server" OnClick="btnBack1_Click" Text="Go Back to Main Page" CausesValidation="False" Height="45px" />
            <asp:Button ID="btnBack4" runat="server" OnClick="btnBack3_Click" Text="Go Back to Main Page" CausesValidation="False" Visible="False" Height="45px" />
    </p>

                 <%--   </ContentTemplate>
                    
                </asp:UpdatePanel>--%>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PostJob.aspx.cs" Inherits="C2C.Pages.PostJob" %>


<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="MainContent">

    <div class="auto-style1">
        <p style="text-align: center">
            <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="True" Font-Names="Arial Unicode MS" Font-Size="Medium" ForeColor="Red"></asp:Label>
        </p>
        <p style="text-align: center">
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" Height="45px" />
        </p>
        <h1 class="auto-style1">Post A New Internship</h1>

        <table border="0" style="font-size: small">
            <tr>
                <td class="auto-style6">Title</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtTitle" runat="server" Width="580px" MaxLength="350" CssClass="auto-style9"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="Please enter Title" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="auto-style5">Field</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="drlFunction" runat="server" CssClass="auto-style9">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="drlFunction" ErrorMessage="Please select Job Function" ForeColor="#FF3300" InitialValue="Select" CssClass="auto-style9"></asp:RequiredFieldValidator>
                    <span class="auto-style9">&nbsp;</span></td>
            </tr>
            <tr>
                <td class="auto-style5">Type</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="drlJobType" runat="server" CssClass="auto-style9">
                        <asp:ListItem>UnPaid Internship</asp:ListItem>
                        <asp:ListItem>Paid Internship</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="drlJobType" ErrorMessage="Please select Type" ForeColor="#FF3300" InitialValue="Select One"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                City
                    </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtCity" runat="server" Width="200px" MaxLength="50" CssClass="auto-style9"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCity" ErrorMessage="Please enter City" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">State</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="drlState" runat="server" CssClass="auto-style9">
                    </asp:DropDownList>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="drlState" ErrorMessage="Please select State" ForeColor="#FF3300" InitialValue="Select"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Qualification</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtQualification" runat="server" Height="100px" TextMode="MultiLine" Width="600px" CssClass="auto-style9"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style5">Description</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDescription" runat="server" Height="600px" TextMode="MultiLine" Width="600px" CssClass="auto-style9"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtDescription" ErrorMessage="Please enter Description" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="auto-style11">Enter Expired Date
                    <br />
                    (Default: in 90 days)</td>
                <td class="auto-style12">
                    <div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtExpDate" runat="server" Width="200px" CssClass="auto-style9" ReadOnly="True" CausesValidation="True"></asp:TextBox>

                            <asp:Button ID="Button1" runat="server" CssClass="auto-style9" Font-Size="Small" Text="Select Date" OnClick="Button1_Click" ValidationGroup="2" />

                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False">
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                            </asp:Calendar>
                        </ContentTemplate>
                         <Triggers> <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" /> </Triggers>
                    </asp:UpdatePanel>
                    </div>
                </td>

                <td class="auto-style13"></td>

            </tr>

            </table>

        <div class="auto-style1">

            <p style="text-align: center">
                <asp:Button ID="btnPost" runat="server" OnClick="btnPost_Click" Text="Post" Width="150px" Height="45px" />
            </p>
            <br />
            <p style="text-align: center">
            <asp:Button ID="btnBack0" runat="server" OnClick="btnBack_Click" Text="Go Back to Main Page" CausesValidation="False" Height="45px" />
            </p>
            <br />
        </div>
    </div>
    <p>
        &nbsp;
    </p>

</asp:Content>


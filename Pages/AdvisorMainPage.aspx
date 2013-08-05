<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AdvisorMainPage.aspx.cs" Inherits="C2C.Pages.AdvisorMainPage" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <h1 class="auto-style3">Advisor Main Menu</h1>

    <div>
    <div class="col-two">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/profilepicture.jpg" />
    </div>

    <div class="col-one">
    <p>
                <asp:Label ID="lblWelcome" runat="server" Text="Welcome" Font-Bold="True" Font-Size="Medium" ForeColor="Red" CssClass="auto-style1"></asp:Label>

    </p>
    <ul style="text-align: left; font-size: large;" class="auto-style1">
        <li>
            <asp:HyperLink ID="HyperLink2" runat="server"
                NavigateUrl='~/Pages/AdvisorProfile.aspx'
                Text="My Profile" ForeColor="#0000ff" CssClass="auto-style2" style="font-size: large"></asp:HyperLink>
        </li>


        <li>
            <asp:HyperLink ID="HyperLink4" runat="server"
                NavigateUrl='~/Pages/BrowseJobs.aspx'
                Text="Browse Internships" ForeColor="#0000ff" CssClass="auto-style2"></asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="HyperLink5" runat="server"
                NavigateUrl='~/Pages/BrowseCompanies.aspx'
                Text="Browse Companies" ForeColor="#0000ff" CssClass="auto-style2"></asp:HyperLink>
        </li>

        <li>
            <asp:HyperLink ID="HyperLink1" runat="server"
                NavigateUrl='~/Pages/PostResume.aspx'
                Text="Upload A New Resume" ForeColor="#0000ff" CssClass="auto-style2"></asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="HyperLink3" runat="server"
                NavigateUrl='~/Pages/LogOut.aspx'
                Text="Log Out" ForeColor="#0000ff" CssClass="auto-style2"></asp:HyperLink>
        </li>
    </ul>
        </div>
        </div>

    <h1 class="auto-style1">______________________________________</h1>
    <p style="text-align: center">
        <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red"></asp:Label>
      </p>  

    <h1 class="auto-style4">My Uploaded Resumes </h1>
    <div class="auto-style3">
        
        <br />
        <div style="text-align: center">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" OnRowCreated="GridView1_RowCreated" ForeColor="#333333" GridLines="Horizontal">
            <EditRowStyle BorderStyle="Solid" BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField AccessibleHeaderText="Download" HeaderText="Download">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server"

                            NavigateUrl='<%# Eval("ID","~/Pages/GetFile.aspx?ID={0}") %>'

                            Text="Download" ForeColor="#0000ff"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Remove" AccessibleHeaderText="Remove">
                    <ItemTemplate>
                        <asp:Button runat="server" ID="btnRemove" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnDelete_Click"></asp:Button>
                        <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="btnRemove" ConfirmText="Are you sure?"></asp:ConfirmButtonExtender>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
        </div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>



    </div>

     <h1>______________________________________</h1>
    <h1>Selected Student List</h1>
    <div style="text-align: center">
    <asp:GridView ID="GridView2" runat="server" CellPadding="4" OnRowCreated="GridView2_RowCreated" ForeColor="#333333" GridLines="Horizontal">
            <EditRowStyle BorderStyle="Solid" BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            
        </asp:GridView>
    </div>
</asp:Content>
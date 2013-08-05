<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EmployerMain.aspx.cs" Inherits="C2C.Pages.EmployerMain" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">

    <p>

    </p>


<h1 class="auto-style4">Employer Menu</h1>
        <div class="col-two">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/profilepicture.jpg" />
        </div>
    <div class ="col-one">
    <p>
       <asp:Label ID="lblWelcome" runat="server" Text="Welcome" Font-Bold="True" Font-Size="Large" ForeColor="Red" CssClass="auto-style1"></asp:Label>

    </p>
        <ul style="text-align: left; font-size: large;">
        <li>
     <asp:HyperLink ID="HyperLink2" runat="server"
                        NavigateUrl='~/Pages/EmployerProfile.aspx'
                        Text="My Profile" ForeColor="#0000ff" CssClass="auto-style2"></asp:HyperLink>
            </li>
        <li>
     <asp:HyperLink ID="HyperLink9" runat="server"
                        NavigateUrl='~/Pages/PostJob.aspx'
                        Text="Post a new Internship" ForeColor="#0000ff" CssClass="auto-style2"></asp:HyperLink>
</li>

        <li>
     <asp:HyperLink ID="HyperLink5" runat="server"
                        NavigateUrl='~/Pages/BrowseResumes.aspx'
                        Text="Browse Resumes" ForeColor="#0000ff" CssClass="auto-style2"></asp:HyperLink>
</li>

            <li>
                <asp:HyperLink ID="HyperLink3" runat="server"
                        NavigateUrl='~/Pages/LogOut.aspx'
                        Text="Log Out" ForeColor="#0000ff" CssClass="auto-style2"></asp:HyperLink>
            </li>
    </ul>
        </div>
    
    <h1 class="auto-style1">______________________________________</h1>
    <p style="text-align: center">

        <asp:Label ID="lblMessage" runat="server" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" ForeColor="Red"></asp:Label>

    </p>
    <h1 class="auto-style3">My Posted Internships</h1>

        <div style="text-align: center">

        <asp:GridView ID="GridView1" runat="server" CellPadding="4" OnRowCreated="GridView1_RowCreated" ForeColor="#333333" GridLines="Horizontal" style="font-size: 13px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            
           <Columns>
                    <asp:TemplateField AccessibleHeaderText="ViewMore" HeaderText="ViewMore">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server"
                                
                                NavigateUrl='<%# Eval("ID","~/Pages/ViewJobDetail.aspx?ID={0}") %>'
     
                                Text="View Detail" ForeColor="#0000ff"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>

            <asp:TemplateField HeaderText="Remove" AccessibleHeaderText="Remove">
                <ItemTemplate>
                    <asp:Button runat="server" ID="btnRemove" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnRemove_Click"></asp:Button>
                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btnRemove" 
                        ConfirmText="Internship will be removed automatically after it expired. Are you sure you want to delete it now?"></asp:ConfirmButtonExtender>
                </ItemTemplate>
            </asp:TemplateField>
                </Columns>

        </asp:GridView>

    </div>

    <div>

        <h1 class="auto-style1">______________________________________</h1>
    <h1 class="auto-style3">Selected Students List</h1>

        <div style="text-align: center">

        <asp:GridView ID="GridView2" runat="server" CellPadding="4" OnRowCreated="GridView2_RowCreated" ForeColor="#333333" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            
           <Columns>
                    <%--<asp:TemplateField AccessibleHeaderText="ViewMore" HeaderText="ViewMore">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server"
                                
                                NavigateUrl='<%# Eval("ID","~/Pages/ViewJobDetail.aspx?ID={0}") %>'
     
                                Text="View Detail" ForeColor="#0000ff"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>--%>

            <asp:TemplateField HeaderText="Update Hiring Status" AccessibleHeaderText="Status">
                <ItemTemplate>
                    <asp:Button runat="server" ID="btnHired" Text="Hired" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnHired_Click"></asp:Button>
                    <asp:Button ID="btnNotHired" runat="server" Text="Not Hired" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnNotHired_Click" />

                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="btnHired"
                        ConfirmText="Confirm! Did you hire this student?"></asp:ConfirmButtonExtender>
                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender3" runat="server" TargetControlID="btnNotHired" 
                        ConfirmText="Confirm! This student was not hired?"></asp:ConfirmButtonExtender>
                </ItemTemplate>
            </asp:TemplateField>
                </Columns>

        </asp:GridView>

        </div>

        <br />
        <h4>
        <asp:Label ID="Label1" runat="server" Text="Please update hiring status after you interviewed students!" BorderColor="#0099CC" BorderStyle="Solid" BorderWidth="1px" CssClass="auto-style5" style="color: #FF0000"></asp:Label>
        </h4>
    </div>
    
    <p>
        

        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        

    </p>



</asp:Content>
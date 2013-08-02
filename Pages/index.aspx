<%@ Page Language="C#" AutoEventWireup="true"MasterPageFile="~/Site.Master" CodeBehind="index.aspx.cs" Inherits="C2C.Pages.index" %>
<%@ Reference Control="~/UserControls/Login.ascx" %>
<%@ Reference Control="~/UserControls/ToolLink.ascx" %>
<%@ Reference Control="~/UserControls/PostJobForm.ascx" %>
<%@ Reference Control="~/UserControls/CompanyForm.ascx" %>

 <asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="MainContent">
     <asp:Panel ID="pnlMainBody" runat="server">
    <h2>C2C website</h2>
          <asp:Label ID="lblMainMessage" runat="server" ForeColor="#009900"></asp:Label>
        <p>hello world. Website is under construction</p>
        
         <p>
            
         </p>
        
      </asp:Panel>
     </asp:Content>
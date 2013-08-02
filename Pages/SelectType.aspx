<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SelectType.aspx.cs" Inherits="C2C.Pages.SelectType" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">

    <h1 class="title2" style="text-align: center">What type of user are you:</h1>
    <h1 style="text-align: center">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/Pages/EmployerRegistration.aspx">Employer</asp:HyperLink>&nbsp;|
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/Pages/AdvisorRegistration.aspx">Advisor</asp:HyperLink></h1>

</asp:Content>




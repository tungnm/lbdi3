<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EmployerIntro.aspx.cs" Inherits="C2C.Pages.EmployerIntro" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h1 class ="title2">Employer</h1>

    <p style="text-align: center">
                <asp:Image ID="Image2" runat="server" src="../images/Web2/page1-img5.jpg" />
    </p>

    <p style="font-size: large">
        Remember organizations can take advantage of the service that best meets their employment needs. Register With Our Online Career Network and We can put you in touch with River Region’s brightest talents, so sign up your organization with Coursework 2 Careers today. </p>
    <ul style="font-size: medium">
        <p style="font-size: large">All you need to do is:</p>
        <li>Create a new account.</li>
        <li>Fill out all fields in the online form.</li>
        <li>Search for interns.</li>
    </ul>


    <h1 class ="title2">Getting Started</h1>
    <p>
    <asp:Image ID="Image1" runat="server" src="../images/Web2/page4-img3.jpg" />
    </p>
    <ul style="font-size: large">
        <li>
            <a href="/Pages/UserLogin.aspx">Login</a> if you already have an account, or
        </li>
        <li>
            First time here? <a href="/Pages/EmployerRegistration.aspx">Sign up</a> now
        </li>
    </ul>


   </asp:Content>

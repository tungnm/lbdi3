<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="AdvisorIntro.aspx.cs" Inherits="C2C.Pages.AdvisorIntro" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h1 class ="title2">Advisor</h1>
                <p style="text-align: center">
                <asp:Image ID="Image2" runat="server" src="../images/Web2/page1-img9.jpg" />


    </p>


    <p style="font-size: medium"><strong>Coursework 2 Career</strong> is designed especially for students attending college in the River Region.  Coursework 2 Career is designed to connect local students with local employers for rewarding internships opportunities. Students will work through their University Career Services Office to find opportunities to gain valuable experience within their programs of study (major).</p>

    <p style="font-size: medium"><strong>Advisor</strong> is responsible for connecting students from their coordinated school to employers.</p>

    

    <h1 class ="title2">Getting Started</h1>
                <p style="text-align: left">
                <asp:Image ID="Image1" runat="server" src="../images/Web2/page4-img2.jpg" />

    </p>

    <ul style="font-size: large">
        <li>
            <a href="/Pages/UserLogin.aspx">Login</a> if you already have an account, or
        </li>
        <li>
            First time here? <a href="/Pages/AdvisorRegistration.aspx">Sign up</a> now
        </li>
    </ul>


   </asp:Content>

<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="C2C.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">



    <div>
        <h1 class="title2">About Us</h1>

        <h2>
            Internships
        </h2>
            <asp:Image ID="Image2" runat="server" src="../images/Web2/page1-img6.jpg" />

        <p style="font-size: medium">Internships are a great way for students to gain experience in their career fields before earning a degree. These opportunities offer valuable networking resources and look great on their resumes.  Learning does not confine itself to academic achievement, but is equally dependent upon practical experience gained through internships.
        </p>
        __________________________________________________________________________________

    </div>

    <div>
        <h2 style="color: #0099CC; text-align: center;">Students -&gt; Advisor &lt;- Employers</h2>
        <p style="text-align: center">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/graduation-hats.jpg" />
        </p>
        __________________________________________________________________________________

    </div>

    <div>

        <h2>
            Coursework 2 Career
        </h2>
        <asp:Image ID="Image3" runat="server" src="../images/Web2/page1-img7.jpg" />
        <p>
            <span style="font-size: medium">Coursework 2 Career is a website for posting resumes and advertising internship opportunities. Powered by CTE, INC this site provides a user-friendly interface available 24 hours a day. It offers the ability to have resumes posted in a series of resume pools easily accessible by businesses with internship opportunities/needs. Coursework 2 Career provides access to hundreds of resumes that may be paired with internship opportunities to meet current and future needs.</span><br />
        </p>
        __________________________________________________________________________________

    </div>



</asp:Content>

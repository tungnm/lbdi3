<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="C2C.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>
            <br />
            Coursework To Career</h1>
    </hgroup>

    <article class="auto-style5">
        <div class="auto-style4">
            <h2>
            <strong>Internships

</strong>
            </h2>
            <br />
            <br />
            <em><span class="auto-style3">Internships are a great way for students to gain experience in their career fields before earning a degree. These opportunities offer valuable networking resources and look great on their resumes.  Learning does not confine itself to academic achievement, but is equally dependent upon practical experience gained through internships.</span><br />
            <br />
            </em>
            &nbsp;<strong>__________________________________________________________________________________</strong><br />

        </div>


        <div class="auto-style1">
            <strong>
            <br />
            <h2>Coursework 2 Career</strong></h2>
            <br />
            <br />
            <em><span class="auto-style3">Coursework 2 Career is a website for posting resumes and advertising internship opportunities. Powered by CTE, INC this site provides a user-friendly interface available 24 hours a day. It offers the ability to have resumes posted in a series of resume pools easily accessible by businesses with internship opportunities/needs. Coursework 2 Career provides access to hundreds of resumes that may be paired with internship opportunities to meet current and future needs.<br />
            </span>
            <br />
            </em>&nbsp;<strong>__________________________________________________________________________________</strong><br />

        </div>


        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>

        <p>
            &nbsp;</p>

        <p>
            &nbsp;</p>
    </article>

    <%--<aside>
        <h3>Aside Title</h3>
        <p>
            Use this area to provide additional information.
        </p>
        <ul>
            <li><a runat="server" href="~/">Home</a></li>
            <li><a runat="server" href="~/About.aspx">About</a></li>
            <li><a runat="server" href="~/Contact.aspx">Contact</a></li>
        </ul>
    </aside>--%>

        <aside class="auto-style6">
        <h3 class="auto-style2">Student -&gt; Advisor &lt;- Employer</h3>
        <p>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/graduation-hats.jpg" />
        </p>
            </aside>

</asp:Content>
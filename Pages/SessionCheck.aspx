<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SessionCheck.aspx.cs" Inherits="C2C.Pages.SessionCheck" %>

<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="MainContent">


    <div>
        <p>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style1" CausesValidation="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredField" ValidationGroup="5"></asp:RequiredFieldValidator>
        </p>

        <p>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>

                    <asp:Button ID="btnSelectDate" runat="server" Text="SelectDate" OnClick="btnSelectDate_Click" />

                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False"></asp:Calendar>

                </ContentTemplate>

                <Triggers> <asp:AsyncPostBackTrigger ControlID="btnSelectDate" EventName="Click" /> </Triggers>

            </asp:UpdatePanel>
        </p>
    </div>


    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="5" />

</asp:Content>

















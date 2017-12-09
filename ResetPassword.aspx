<%@ Page Title="ResetPassword" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Reset Password
    </h2>
    <p>
        &nbsp;<asp:PasswordRecovery ID="PasswordRecovery1" runat="server" 
            SuccessPageUrl="~/Account/Login.aspx">
        </asp:PasswordRecovery>
    </p>

</asp:Content>


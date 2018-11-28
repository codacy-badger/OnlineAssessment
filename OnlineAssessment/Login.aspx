<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineAssessment.Login" %>
<%@ Register TagPrefix="Home" TagName="Head" Src="~/LoginControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 50%;margin-left: 25%;margin-top: 5%;">
        <form runat="server">
            <Home:Head ID="ctrlLogin" runat="server"/>
        </form>
    </div>
</asp:Content>
    
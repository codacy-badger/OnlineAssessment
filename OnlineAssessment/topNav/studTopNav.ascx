<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="studTopNav.ascx.cs" Inherits="OnlineAssessment.topNav.studTopNav" %>
<%@ Register TagPrefix="logout" TagName="logout" Src="logout.ascx" %>

<a class="navbar-brand w3-hover-sepia" href="studDoAssessments.aspx">ASSESSMENT <span>POINT</span></a>

<logout:logout ID="ctlLogout" runat="server" />
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lectTopNav.ascx.cs" Inherits="OnlineAssessment.topNav.lectTopNav" %>
<%@ Register TagPrefix="logout" TagName="logout" Src="logout.ascx" %>

<a class="navbar-brand w3-hover-sepia" href="lectViewAssessments.aspx">ASSESSMENT <span>POINT</span></a>

<logout:logout ID="ctlLogout" runat="server" />
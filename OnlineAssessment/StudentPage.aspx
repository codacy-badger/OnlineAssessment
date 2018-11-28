<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="OnlineAssessment.StudentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 60%;margin-left: 17.5%;margin-top:5%">
        <h2 style="margin-bottom:5px">Student Page</h2>
        <div style="margin:10px;width:45%;float:left;height: 400px;text-align:-webkit-center;padding:40px;">
            <div style="height:80%;padding-top:38px;margin-bottom:25px;background:url(images/selectAss.jpg) no-repeat center;background-size:contain"">             
                <asp:Label ID="Label2" runat="server" Text="Assessment" style="" />
            </div>
            <div>
                <a href="SelectAssessment.aspx" class="button">Select</a>
            </div>
        </div>
        <div style="margin:10px;width:45%;float:left;height: 400px;text-align:-webkit-center;padding:40px;">
            <div style="height:80%;padding-top:38px;margin-bottom:25px;background:url(images/checkmark.jpg) no-repeat center;background-size:contain">            
                <asp:Label ID="Label1" runat="server"  Text="Marks" style="" />
            </div>
            <div>
                <a href="ViewAssessment.aspx" class="button">Select</a>
            </div>
        </div>
    </div>
</asp:Content>
<%@ Page Language="C#"  MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="LecturePage.aspx.cs" Inherits="OnlineAssessment.LecturePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 80%;margin-left: 10%;margin-top:5%;">
        <h2 style="margin-bottom:5px">Lecturer Page</h2>
        <div style="margin:10px;width:22%;float:left;height: 400px;text-align:-webkit-center;padding:40px;background:url(images/createAss.jpg) no-repeat center;background-size:contain">
            <div style="height:80%;margin-bottom:25px">             
                <asp:Label ID="Label2" runat="server" Text="Assessment" style="" />
            </div>
            <div>
                <a href="CreateAssessment.aspx" class="button">Select</a>
            </div>
        </div>
        <div style="margin:10px;width:22%;float:left;height: 400px;text-align:-webkit-center;padding:40px;background:url(images/ViewAssMark.jpg) no-repeat center;background-size:contain">
            <div style="height:80%;margin-bottom:25px">            
                <asp:Label ID="Label1" runat="server"  Text="Marks" style="" />
            </div>
            <div>
                <a href="ViewAllMarks.aspx" class="button">Select</a>
            </div>
        </div>
        <div style="margin:10px;width:22%;float:left;height: 400px;text-align:-webkit-center;padding:40px;background:url(images/enroll.jpg) no-repeat center;background-size:contain">
            <div style="height:80%;margin-bottom:25px">            
                <asp:Label ID="Label3" runat="server"  Text="Enroll Student" style="" />
            </div>
            <div>
                <a href="Enroll.aspx" class="button">Select</a>
            </div>
        </div>
        <div style="margin:10px;width:22%;float:left;height: 400px;text-align:-webkit-center;padding:40px;background:url(images/markAss.jpg) no-repeat center;background-size:contain">
            <div style="height:80%;margin-bottom:25px">            
                <asp:Label ID="Label4" runat="server"  Text="Marking" style="" />
            </div>
            <div>
                <a href="ViewUnmarkAssessment.aspx" class="button">Select</a>
            </div>
        </div>
        </div>
</asp:Content>
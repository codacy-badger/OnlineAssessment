<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="stuPage.aspx.cs" Inherits="OnlineAssessment.stuPage" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div style="width: 70%; margin-left: 15%; margin-top: 5%; border-bottom: 2px solid #a388d3">
        <h2 style="margin-bottom: 5px; text-align: center; font-size: 25px">Online Assessment Site</h2>
        <p style="text-align: center; font-size: 17px;">
            Welcome back! 
                <asp:Label ID="stuName" runat="server" Text=""></asp:Label>
        </p>
    </div>
    <table style="width: 70%; margin-left: 15%; margin-top: 5%;">
        <tr>
            <td style="width: 35%; text-align: center;">
                <div>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/stuDoAssess.aspx">
                        <img src="Images/StudAssess.png" style="max-height: 200px; max-width: 200px" /><br />
                        <asp:Label ID="lblAssess" runat="server" Text="Assessment"></asp:Label>
                    </asp:HyperLink>
                </div>
            </td>
            <td style="width: 35%; text-align: center;">
                <div>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/stuViewAssess.aspx">
                        <img src="Images/Mark.png" style="max-height: 200px; max-width: 200px" /><br />
                        <asp:Label ID="lblMark" runat="server" Text="Mark"></asp:Label>
                    </asp:HyperLink>
                </div>
            </td>
        </tr>
    </table>

</asp:Content>

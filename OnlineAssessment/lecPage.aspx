<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="lecPage.aspx.cs" Inherits="OnlineAssessment.lecPage" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
   
        <div style="width: 70%; margin-left: 15%; margin-top: 5%; border-bottom: 2px solid #a388d3">
            <h2 style="margin-bottom: 5px; text-align: center; font-size: 25px">Online Assessment Site</h2>
            <p style="text-align: center; font-size: 17px;">
                Welcome back! 
                <asp:Label ID="lecName" runat="server" Text=""></asp:Label>
            </p>
        </div>
        <table style="width: 70%; margin-left: 15%; margin-top: 5%;">
            <tr>
                <td style="width: 23%; text-align: center;">
                    <div>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/lecSub.aspx">
                            <img src="Images/Subjuct.png" style="max-height: 200px; max-width: 200px" /><br />
                            <asp:Label ID="lblSubjuct" runat="server" Text="Subject"></asp:Label>
                        </asp:HyperLink>
                    </div>
                </td>
                <td style="width: 23%; text-align: center;">
                    <div>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/lecCreateAssess.aspx">
                            <img src="Images/CreateAssess.png" style="max-height: 200px; max-width: 200px" /><br />
                            <asp:Label ID="lblCreateAssess" runat="server" Text="Create Assessment"></asp:Label>
                        </asp:HyperLink>
                    </div>
                </td>
                <td style="width: 23%; text-align: center;">
                    <div>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/lecWork.aspx">
                            <img src="Images/MarkAssess.png" style="max-height: 200px; max-width: 200px" /><br />
                            <asp:Label ID="lblWork" runat="server" Text="Work"></asp:Label>
                        </asp:HyperLink>
                    </div>
                </td>
            </tr>
        </table>
  
</asp:Content>


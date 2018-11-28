<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Enroll.aspx.cs" Inherits="OnlineAssessment.Enroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 50%;margin-left: 25%;margin-top: 5%;">
        <h2>Enroll Student</h2>
        <form runat="server">
            <div style="font-size:15px">
            </div>
            <table class="alt">
            <tr>
                <td class="auto-style1">Student:</td>
                <td>
                    <asp:TextBox ID="txtStudent" runat="server" MaxLength="30"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td class="auto-style1">Course :</td>
                <td>
                    <asp:TextBox ID="txtCourse" runat="server" MaxLength="20"></asp:TextBox>
                    
            </tr>

            <tr>
          <td>

          </td>
          <td>
                <asp:Button ID="btnEnroll" runat="server" Text="Enroll" OnClick="btnEnroll_Click" />
          </td>
            </table>
        </form>
    </div>
</asp:Content>
    

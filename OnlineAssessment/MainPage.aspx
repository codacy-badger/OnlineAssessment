<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="OnlineAssessment.MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 50%; margin-left: 25%; margin-top: 5%;">

        <div style="font-size: 15px">
            <b><span>Welcome ! Please enter your information ! </span></b>
            <b><span style="float: right">No account yet ? <a href="Register.aspx">Register</a> here.</span></b>
        </div>
        <table class="alt">
            <tr>
                <td class="auto-style1">Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Password:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td>
                    <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember me" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lblErrorMsg" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
                </td>
            </tr>

        </table>

    </div>
</asp:Content>

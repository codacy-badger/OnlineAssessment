<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineAssessment.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <div style="width: 70%; margin-left: 15%; margin-top: 5%;">
            <h2>Register New Account ! 
            </h2>

            <table class="auto-style21, alt">
                <tr>
                    <td class="auto-style1" style="width: 30%">&nbsp;Name:</td>

                    <td class="auto-style4">
                        <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name.."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Email:</td>

                    <td class="auto-style10">
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="chokky-wa16@example.com"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Password:</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtPassword" runat="server" Width="253px" TextMode="Password" placeholder="Password"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">Confirm Password:</td>

                    <td class="auto-style19">
                        <asp:TextBox ID="txtConfirm" runat="server" Width="252px" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Gender:</td>
                    <td class="auto-style19">
                        <asp:RadioButtonList ID="rblGender" runat="server">
                            <asp:ListItem Value="MALE">Male</asp:ListItem>
                            <asp:ListItem Value="FEMALE">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">I am a :</td>
                    <td class="auto-style19">
                        <asp:RadioButtonList ID="rblRole" runat="server" Height="66px">
                            <asp:ListItem Value="Lecturer">Lecturer</asp:ListItem>
                            <asp:ListItem Value="Student">Student</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td></td>

                    <td>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" Width="172px" OnClick="btnRegister_Click" />&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary" Width="175px" /><br />
                        Already have an account ?
                        <div>Please[ <a href="MainPage.aspx">Login</a> ].</div>
                    </td>
                </tr>
            </table>
        </div>
  

</asp:Content>

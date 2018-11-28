<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="OnlineAssessment.LoginControl" %>

<div style="font-size:15px">
            <b><span>Welcome ! Please Login</span></b>
            <b><span style="float:right">New Member ? <a href="Registration.aspx">Register</a> here.</span></b>
          </div>
        <table class="alt">
            <tr>
                <td class="auto-style1">Email :</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="30"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td class="auto-style1">Password :</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                    
            </tr>
            <tr>
                <td class="auto-style1">

                </td>
                <td>
                <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember me" />
                    <a href="#" onclick="window.open('ForgetPassword.aspx','FP','width=500, height=250, top=300, left=500, fullscreen=no resizable=0')"> Forgot Password ?</a></td>
            </tr>
      <tr>
          <td>

          </td>
          <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="False" OnClick="btnReset_Click"  />
            </td>
          </tr>

            <tr>
            <td>
               </td>
                 <td>
                     <asp:Label ID="lblErrorMsg" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
            
            </table>
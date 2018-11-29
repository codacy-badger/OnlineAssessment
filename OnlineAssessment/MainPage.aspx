<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="OnlineAssessment.MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <div class="row w3-animate-opacity">
    <div class="col-xs-10 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
    <div class="login-panel panel panel-default">
    <div class="panel-heading">Log in</div>
    <div class="panel-body">

        <div style="font-size: 15px">
        </div>
        
        
            <fieldset >
                <div class="form-group">
                    <input class="form-control w3-animate-left" placeholder="E-mail" name="txtEmail" type="email" autofocus="">
                </div>
                <div class="form-group">
                    <input class="form-control w3-animate-right" placeholder="Password" name="txtPassword" type="password" value="">
                </div>
                <div class="checkbox">
                    <label>
                        <input name="chkRememberMe" type="checkbox" value="chkRememberMe Me">Remember Me
                    </label>
                </div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"  class="btn btn-primary w3-hover-opacity"/>
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click"  class="btn btn-default w3-hover-opacity"/>

            </fieldset>
        <h5><b><span><a href="Register.aspx">Register</a> here!</span></b></h5>
        <asp:Label ID="lblErrorMsg" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
        

                </div>
            </div>
        </div><!-- /.col-->
    </div><!-- /.row -->	
</asp:Content>

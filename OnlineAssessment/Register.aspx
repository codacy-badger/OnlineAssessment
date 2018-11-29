<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineAssessment.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row w3-animate-opacity">
        <div class="col-xs-10 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">Register New Account</div>
                <div class="panel-body">
                    <div style="font-size: 15px">
                    </div>

                    <fieldset>
                        <div class="form-group">
                            <p>Name:</p>
                        </div>
                        <div class="form-group">
                            <input class="form-control w3-animate-left" placeholder="Name" name="txtName" type="text" autofocus="">
                        </div>
                        <div class="form-group">
                            <p>Email:</p>
                        </div>
                        <div class="form-group">
                            <input class="form-control w3-animate-right" placeholder="abc123@example.com" name="txtEmail" type="text" value="">
                        </div>
                        <div class="form-group">
                            <p>Password:</p>
                        </div>
                        <div class="form-group">
                            <input class="form-control w3-animate-left" placeholder="Password" name="txtPassword" type="Password" value="">
                        </div>
                        <div class="form-group">
                            <p>Confirm Password:</p>
                        </div>
                        <div class="form-group">
                            <input class="form-control w3-animate-right" placeholder="Confirm Password" name="txtConfirm" type="Password" value="">
                        </div>
                        <div class="form-group">
                            <p>Gender:</p>
                        </div>
                        <div class="form-group">

                            <asp:RadioButtonList ID="rblGender" CssClass="radioButtonList" runat="server"   RepeatLayout="Flow">
                                <asp:ListItem Value="MALE" Selected="True">Male</asp:ListItem>
                                <asp:ListItem Value="FEMALE">Female</asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                        <div class="form-group">
                            <p>Role:</p>
                        </div>
                        <div class="form-group">
                            <asp:RadioButtonList ID="rblRole" CssClass="radioButtonList" runat="server"  RepeatLayout="Flow" >
                                <asp:ListItem Value="Lecturer" Selected="True">Lecturer</asp:ListItem>
                                <asp:ListItem Value="Student">Student</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" class="btn btn-primary" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" class="btn btn-default" />
                    </fieldset>
                    <h5><b><span>Already have an account ? <a href="MainPage.aspx">Login</a>  here.</span></b></h5>

                    <asp:Label ID="lblErrorMsg" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>


                </div>
            </div>
        </div>
        <!-- /.col-->
    </div>
    <!-- /.row -->
 

</asp:Content>


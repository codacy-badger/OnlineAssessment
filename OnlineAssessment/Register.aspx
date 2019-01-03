<%@ Page Language="C#" MasterPageFile="~/assessment.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="OnlineAssessment.register" %>

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
                            <p>Name:
                                <asp:RequiredFieldValidator ID="required1" runat="server" ControlToValidate="txtName" ErrorMessage="Required field!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </p>
                        </div>
                        <div class="form-group">
                            <asp:TextBox class="form-control w3-animate-left" placeholder="Name" name="txtName" id="txtName" type="text" autofocus="" runat="server"/>
                        </div>
                        <div class="form-group">
                            <p>Email:
                                <asp:RegularExpressionValidator ID="regex2" runat="server" ErrorMessage="Not an email!" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ControlToValidate="txtEmail" ForeColor="Red"></asp:RegularExpressionValidator>
                            &nbsp;
                                <asp:RequiredFieldValidator ID="required2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required field!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </p>
                        </div>
                        <div class="form-group">
                            <asp:TextBox class="form-control w3-animate-right" placeholder="abc123@example.com" name="txtEmail" id="txtEmail" type="text" value="" runat="server"/>
                        </div>
                        <div class="form-group">
                            <p>Password:
                                <asp:RegularExpressionValidator ID="regex3" runat="server" ErrorMessage="Password must be alphanumerical and between 8-20 characters long." ControlToValidate="password1" ValidationExpression="^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?&lt;![_.])$" ForeColor="Red"></asp:RegularExpressionValidator>
                            &nbsp;
                                <asp:RequiredFieldValidator ID="required3" runat="server" ControlToValidate="password1" ErrorMessage="Required field!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </p>
                        </div>
                        <div class="form-group">
                            <asp:TextBox class="form-control w3-animate-left" placeholder="Password" name="txtPassword" type="Password" value="" id="password1" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <p>Confirm Password: <asp:Label ID="error1" runat="server" ForeColor="Red"></asp:Label>
                            &nbsp;
                                <asp:RequiredFieldValidator ID="required4" runat="server" ControlToValidate="password2" ErrorMessage="Required field!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </p>
                        </div>
                        <div class="form-group">
                            <asp:TextBox class="form-control w3-animate-left" placeholder="Confirm Password" name="txtPassword2" type="Password" value="" id="password2" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <p>Gender:</p>
                        </div>
                        <div class="form-group radioButtonList">
                            <div>
                                <asp:RadioButtonList ID="rblGender" CssClass="radioButtonList" runat="server" RepeatLayout="Flow">
                                    <asp:ListItem Value="MALE" Selected="True">Male</asp:ListItem>
                                    <asp:ListItem Value="FEMALE">Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="form-group">
                            <p>Role:</p>
                        </div>
                        <div class="form-group">
                            <asp:RadioButtonList ID="rblRole" CssClass="radioButtonList" runat="server" RepeatLayout="Flow">
                                <asp:ListItem Value="Lecturer" Selected="True">Lecturer</asp:ListItem>
                                <asp:ListItem Value="Student">Student</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" class="btn btn-primary w3-hover-opacity" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" class="btn btn-default w3-hover-opacity" />
                    </fieldset>
                    <h5><b><span>Already have an account ? <a href="login.aspx">Login</a>  here.</span></b></h5>

                    <asp:Label ID="lblErrorMsg" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>


                </div>
            </div>
        </div>
        <!-- /.col-->
    </div>
    <!-- /.row -->


</asp:Content>


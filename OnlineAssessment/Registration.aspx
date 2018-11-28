<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OnlineAssessment.Registration" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form runat="server">
        <div style="width: 70%;margin-left: 15%;margin-top: 5%;">
            <h1>Member Register
            </h1>

            <table class="auto-style21, alt">

                <tr>
                    <td class="auto-style1" style="width:30%">&nbsp;Name:</td>

                    <td class="auto-style4">
                        <asp:TextBox ID="txtName" runat="server" Width="256px" placeholder="Name ..."></asp:TextBox>
                        <span style="color:red"><asp:RequiredFieldValidator 
                            ID="rfvName" runat="server" 
                            ErrorMessage="*You must enter a name" ControlToValidate="txtName"></asp:RequiredFieldValidator></span>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">Email:</td>

                    <td class="auto-style10">
                        <asp:TextBox ID="txtEmail" runat="server" Width="256px" placeholder="sss@example.com"></asp:TextBox>
                        <span style="color:red"><asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="*You must enter email" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        <br /><asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="*Invalid Email Format"></asp:RegularExpressionValidator></span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Password:</td>

                    <td class="auto-style16">
                        <asp:TextBox ID="txtPassword" runat="server" Width="253px" TextMode="Password" placeholder="Password"></asp:TextBox> 
                         <span style="color:red"><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$" ControlToValidate="txtPassword" 
                            ErrorMessage="*Password must be at least 4 characters, no more than 8 characters, and must include at least one upper case letter, one lower case letter, and one numeric digit."></asp:RegularExpressionValidator></span>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">Confirm Password:</td>

                    <td class="auto-style19">
                        <asp:TextBox ID="txtConfirm" runat="server" Width="252px" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                        <span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="*You must enter password" 
                            ControlToValidate="txtConfirm"
                            CssClass="ValidationError"
                            ToolTip="Compare Password is a REQUIRED field">
                        </asp:RequiredFieldValidator></span>
                         <br />
                        <span style="color:red"><asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToValidate="txtConfirm"
                            CssClass="ValidationError"
                            ControlToCompare="txtPassword"
                            ErrorMessage="*Password has No Match" 
                            ToolTip="Password must be the same" /></span>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">Register As:</td>
                    <td class="auto-style19">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="66px">
                            <asp:ListItem>Lecturer</asp:ListItem>
                            <asp:ListItem>Student</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                        <span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="Please select" ControlToValidate="RadioButtonList1" 
                        InitialValue="--- Pick One ---"></asp:RequiredFieldValidator></span>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>

                    <td>
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" Width="172px" Onclick="btnAdd_Click" />&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary" Width="175px" Onclick="btnCancel_Click" /><br />
                        Already have account ?
                        <div>Please[ <a href="Login.aspx">Login</a> ].</div>
                    </td>
                </tr>
            </table>
        </div>
    </form>

</asp:Content>

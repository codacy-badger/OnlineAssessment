<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="CreateMCQuestion.aspx.cs" Inherits="OnlineAssessment.CreateMCQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        function Preview(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgpreview').css('visibility', 'visible');
                    $('#imgpreview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }

    </script>

    <form runat="server">
          <div style="width:80%;margin-left:10%;margin-top:5%">
                <h2>Create Multiple Choice Question</h2>
            
        <table class="alt">
            <tr>
                <td class="auto-style1" style="width: 50%;">
                    Assessment
                </td>
                <td>
                    <asp:Label ID="title" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                    Insert
                </td>
            </tr>
            <tr id="showMCQ" runat="server" > 
                <td class="auto-style1" colspan="2">
                    <div style="width:66%;float: left;padding: 5px;">
                    <div>
                        <asp:Label ID="question" Text="Question : " runat="server" style="float: left;padding: 5px;width: 95px;"></asp:Label>
                        <asp:TextBox ID="txtDesc" runat="server" style="width: 80%;float: left;padding: 5px;height: 2.25em;"></asp:TextBox>
                    </div>
                    <div style="width:50%;float: left;margin-top:5px">
                        <asp:Label ID="Label1" Text="Option A : " runat="server" style="float: left;padding: 5px;width: 95px;"></asp:Label>
                        <asp:TextBox ID="opt1" runat="server" style="width: 60%;float: left;padding: 5px;height: 2.25em;"></asp:TextBox>
                    </div>
                    <div style="width:50%;float: left;margin-top:5px">
                        <asp:Label ID="Label2" Text="Option B : " runat="server" style="float: left;padding: 5px;width: 95px;"></asp:Label>
                        <asp:TextBox ID="opt2" runat="server" style="width: 60%;float: left;padding: 5px;height: 2.25em;"></asp:TextBox>
                    </div>
                    <div style="width:50%;float: left;margin-top:5px">
                        <asp:Label ID="Label3" Text="Option C : " runat="server" style="float: left;padding: 5px;width: 95px;"></asp:Label>
                        <asp:TextBox ID="opt3" runat="server" style="width: 60%;float: left;padding: 5px;height: 2.25em;"></asp:TextBox>
                    </div>
                    <div style="width:50%;float: left;margin-top:5px">
                        <asp:Label ID="Label4" Text="Option D : " runat="server" style="float: left;padding: 5px;width: 95px;"></asp:Label>
                        <asp:TextBox ID="opt4" runat="server" style="width: 60%;float: left;padding: 5px;height: 2.25em;"></asp:TextBox>
                    </div>
                    <div style="margin-top: 133px;">
                        <asp:Label ID="Label5" Text="Correct Answer : " runat="server" style="float: left;padding: 5px;width: 150px;"></asp:Label>
                           <asp:DropDownList ID="answerddl" runat="server" style="height: 2.25em;width: 72%">
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                            </asp:DropDownList>
                        <br />
                        <span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="Please select" ControlToValidate="answerddl" 
                        InitialValue="--- Pick One ---"></asp:RequiredFieldValidator></span>
                    </div>
                    </div>
                    <div class="col-lg-4" style="float: left;">
                                    <div class="row">
                                        <div class="col-md-1"></div>
                                        <div class="col-lg">
                                            <img id="imgpreview" src="../images/emptyImg.png" alt="Profile_Pic"  style="width: 155px;"  >
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg">
                                            <asp:FileUpload ID="fullImg" runat="server" CssClass="btn" onchange="Preview(this);"/>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="fullImg" Display="Dynamic" ErrorMessage="Only JPG and PNG are allowed for [Photo]" ValidationExpression=".+\.(JPG|jpg|png|jpeg)" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                      </div>
                </td>
            </tr>
          <tr>
              <td colspan="2">                            
                  <span style="color:red"><asp:RequiredFieldValidator ID="rfq1" runat="server" 
                  ErrorMessage="*You must enter something" ControlToValidate="txtDesc"></asp:RequiredFieldValidator></span>
                  <br />                  
                  <span style="color:red"><asp:RequiredFieldValidator ID="rfq2" runat="server" 
                  ErrorMessage="*You must enter an option" ControlToValidate="opt1"></asp:RequiredFieldValidator></span>
                  <br />                  
                  <span style="color:red"><asp:RequiredFieldValidator ID="rfq3" runat="server" 
                  ErrorMessage="*You must enter an option" ControlToValidate="opt2"></asp:RequiredFieldValidator></span>
                  <br />                 
                  <span style="color:red"><asp:RequiredFieldValidator ID="rfq4" runat="server" 
                  ErrorMessage="*You must enter an option" ControlToValidate="opt3"></asp:RequiredFieldValidator></span>
                  <br />                  
                  <span style="color:red"><asp:RequiredFieldValidator ID="rfq5" runat="server" 
                  ErrorMessage="*You must enter an option" ControlToValidate="opt4"></asp:RequiredFieldValidator></span>
                  <br />
              </td>
          </tr>
          <tr>
          <td>
          </td>
          <td>
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                <asp:Button ID="btnDone" runat="server" Text="Done" OnClick="btnDone_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="False" OnClick="btnReset_Click" />
            </td>
          </tr>
            
            </table>
        </div>
              
    </form>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="CreateAssessment.aspx.cs" Inherits="OnlineAssessment.CreateAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <form runat="server">
          <div>
                <h2>Create Assessment</h2>
            
        <table class="alt">
            <tr>
                <td>Assessment Title:</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" MaxLength="100"></asp:TextBox>
                            <span style="color:red"><asp:RequiredFieldValidator 
                            ID="rfvName" runat="server" 
                            ErrorMessage="*You must enter a name" ControlToValidate="txtTitle"></asp:RequiredFieldValidator></span>
                </td>
            </tr>
             <tr>
                <td class="auto-style3">
                    Visibility
                </td>
                <td class="auto-style3">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem>Public</asp:ListItem>
                        <asp:ListItem>Private</asp:ListItem>
                    </asp:RadioButtonList>
                        <br />
                        <span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="Please select" ControlToValidate="RadioButtonList1" 
                        InitialValue="--- Pick One ---"></asp:RequiredFieldValidator></span>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    Question Type
                </td>
                <td class="auto-style4">
                   <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                        <asp:ListItem Value="0">MCQ</asp:ListItem>
                        <asp:ListItem Value="1">Subjective</asp:ListItem>
                    </asp:RadioButtonList>
                        <br />
                        <span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="Please select" ControlToValidate="RadioButtonList2" 
                        InitialValue="--- Pick One ---"></asp:RequiredFieldValidator></span>
                </td>
            </tr>
            <tr>
          <td>

          </td>
          <td>
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"/>
                <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="False" OnClick="btnReset_Click" />
            </td>
          </tr>
            
            </table>
        </div>
              
    </form>
</asp:Content>



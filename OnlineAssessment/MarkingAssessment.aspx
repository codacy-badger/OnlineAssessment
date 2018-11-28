<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="MarkingAssessment.aspx.cs" Inherits="OnlineAssessment.MarkingAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div style="width: 80%;margin-left: 10%;margin-top: 5%;">
            <h2 style="margin-bottom:5px">Mark Assessment</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                <asp:BoundField DataField="WrittenAns" HeaderText="Written Answer" SortExpression="WrittenAns" />
                  <asp:TemplateField HeaderText="Mark">
                    <ItemTemplate>
                         <asp:TextBox ID="txtMark" runat="server"></asp:TextBox>
                        <br />
                         <asp:RangeValidator ID="val" runat="server" ErrorMessage="Invalid Number" SetFocusOnError="true"
                            ControlToValidate="txtMark" Display="Dynamic" ForeColor="red" Type="Integer"
                            MinimumValue="0" MaximumValue='<%# Eval("Score") %>'>
                        </asp:RangeValidator>
                        <br />
                        <span style="color:red"><asp:RequiredFieldValidator 
                            ID="rfvName" runat="server" 
                            ErrorMessage="*You must enter something" ControlToValidate="txtMark"></asp:RequiredFieldValidator></span>
                        <br />
                        <span style="color:red">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ValidationExpression="[0-9]$" ControlToValidate="txtMark" 
                            ErrorMessage="*You can only enter numeric character"></asp:RegularExpressionValidator></span>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Score" HeaderText="Marks Allocated" SortExpression="Score" />
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assessment.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT q.Question, sa.WrittenAns, q.Score FROM WrittenQuestion q, StudAns sa WHERE q.QuestionID = sa.QuestionID AND  sa.AssessmentCode = @AssessmentCode">
            <SelectParameters>
                <asp:SessionParameter Name="AssessmentCode" SessionField="AssessmentCode" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnTotalMark" runat="server"  Text="Email Marks to Student" OnClick="btnTotalMark_Click" CausesValidation="true" style="float:right" />
       <br />
       </div>
    </form>
  </asp:Content>

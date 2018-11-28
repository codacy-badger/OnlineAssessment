<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ViewUnmarkAssessment.aspx.cs" Inherits="OnlineAssessment.ViewUnmarkAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div style="width: 100%;margin-left: 15%;margin-top: 5%;">
            <h2 style="margin-bottom:5px">Mark Assessment</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  Width="70%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="AssessmentCode" HeaderText="AssessmentCode" SortExpression="AssessmentCode" />
                <asp:BoundField DataField="AssessmentTitle" HeaderText="AssessmentTitle" SortExpression="AssessmentTitle" />
                <asp:BoundField DataField="AssStatus" HeaderText="AssStatus" SortExpression="AssStatus" />
                <asp:BoundField DataField="StudID" HeaderText="StudID" SortExpression="StudID" />
                <asp:BoundField DataField="StudName" HeaderText="StudName" SortExpression="StudName" />
            </Columns>
        </asp:GridView>
     
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assessment.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT a.AssessmentCode, a.AssessmentTitle, t.AssStatus, s.StudID, s.StudName FROM Assessment a INNER JOIN TakenAss  t ON a.AssessmentCode = t.AssessmentCode INNER JOIN Student s ON s.StudID = t.StudID WHERE (t.AssStatus = 'Unmark') AND a.LecID = @LecID">
            <SelectParameters>
                <asp:SessionParameter Name="LecID" SessionField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
     
        <br />
        Assessment Code:<asp:TextBox ID="TextBox1" runat="server" style="width:70%;margin-bottom: 10px;"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Confirm" style="float:right;margin-right:30%"/>
        <asp:TextBox ID="studID" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID ="AssId" runat="server" Visible="false"></asp:TextBox>
        </div>
    </form>
 </asp:Content>
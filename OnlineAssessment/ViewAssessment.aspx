<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ViewAssessment.aspx.cs" Inherits="OnlineAssessment.ViewAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="width: 60%;margin-left: 17.5%;margin-top:5%;">
    <form runat="server">
    <div>
        <h2>All Assessment Marks</h2>
    </div>

        <table class="alt">
            <tr>
                <td class="auto-style1">
                    Assessment
                </td>
            </tr>
        </table>
        <table id="asd">
            <tr>
                    <th class="auto-style1">Assessment Code</th>
                    <th class="auto-style1">Assessment Title</th>
                    <th class="auto-style1">Marks</th>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <tr>
                    <td><%# Eval("AssessmentCode") %></td>
                    <td><%# Eval("AssessmentTitle") %></td>
                    <td><%# Eval("mark") %></td>
                </tr>                              
            </ItemTemplate>

            </asp:Repeater>   
    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT a.AssessmentCode, b.AssessmentTitle, a.mark
FROM TakenAss a, Assessment b
WHERE a.AssessmentCode = b.AssessmentCode AND
a.StudID = @StudID">
            <SelectParameters>
                <asp:SessionParameter Name="StudID" SessionField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
            </div>
</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ViewAllMarks.aspx.cs" Inherits="OnlineAssessment.ViewAllMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 60%; margin-left: 17.5%; margin-top: 5%;">
        <form runat="server">
            <div>
                <h2>All Assessment Marks</h2>
            </div>

            <table class="alt">
                <tr>
                    <td class="auto-style1">Assessment
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="AssessmentTitle" DataValueField="AssessmentCode" AutoPostBack="true">
                        </asp:DropDownList>

                    </td>
                </tr>
            </table>
            <table id="asd">
                <tr>
                    <th class="auto-style1">No.</th>
                    <th class="auto-style1">Assessment Title</th>
                    <th class="auto-style1">Student ID</th>
                    <th class="auto-style1">Student Name</th>
                    <th class="auto-style1">Marks</th>
                    <th class="auto-style1">Grade</th>

                </tr>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">

                    <ItemTemplate>
                        <tr>
                            <td><%#(((RepeaterItem)Container).ItemIndex+1).ToString()%></td>
                            <td><%# Eval("AssessmentTitle") %></td>
                            <td><%# Eval("StudID") %></td>
                            <td><%# Eval("StudName") %></td>
                            <td><%# Eval("mark") %></td>
                            <td><asp:Label ID="lblGrade" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </ItemTemplate>

                </asp:Repeater>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [AssessmentCode], [AssessmentTitle] FROM [Assessment] WHERE ([LecID] = @LecID)">
                <SelectParameters>
                    <asp:SessionParameter Name="LecID" SessionField="id" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT b.AssessmentTitle, a.studID, s.studName, a.mark
FROM TakenAss a, Assessment b, Student s
WHERE a.AssessmentCode = b.AssessmentCode AND
a.studID = s.studID AND
 b.AssessmentCode = @AssessmentCode">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="AssessmentCode" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </form>
    </div>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/assessment.Master" AutoEventWireup="true" CodeBehind="lectViewAssessmentList.aspx.cs.aspx.cs" Inherits="OnlineAssessment.lectViewAssessmentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div>
        <h2>
            <asp:Label runat="server" ID="assessDetail" Text=""></asp:Label></h2>
    </div>
    <hr />
    <h3>Mark Assessment</h3>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT stuAssessID,SA.stuID, stuName,email
FROM Student_Assessment SA, Student S
WHERE SA.stuID = S.stuID AND status = 'progress' AND assessID =@assessID">
        <SelectParameters>
            <asp:SessionParameter Name="assessID" SessionField="assessID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
        <HeaderTemplate>
            <asp:Table ID="Table1" runat="server" class="table table-responsive">
                <asp:TableHeaderRow>
                    <asp:TableCell Style="width: 10%">No.</asp:TableCell>
                    <asp:TableCell Style="width: 20%">Student ID</asp:TableCell>
                    <asp:TableCell Style="width: 30%">Name</asp:TableCell>
                    <asp:TableCell Style="width: 30%">Email</asp:TableCell>
                    <asp:TableCell Style="width: 9%">Action</asp:TableCell>

                </asp:TableHeaderRow>
            </asp:Table>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Table runat="server" class="table table-striped table-hover">
                <asp:TableRow>
                    <asp:TableCell Width="10%" Style="text-align: left">
                        <asp:Label ID="Label1" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell Width="20%" Style="text-align: left">
                        <asp:Label runat="server" ID="lblStuID" Text='<%#Eval("stuID")%>'></asp:Label><br />
                    </asp:TableCell>
                    <asp:TableCell Width="30%" Style="text-align: left">
                        <asp:Label runat="server" ID="lblStudName" Text='<%#Eval("stuName")%>'></asp:Label><br />
                    </asp:TableCell>
                    <asp:TableCell Width="30%" Style="text-align: left">
                        <asp:Label runat="server" ID="lblEmail" Text='<%#Eval("email")%>'></asp:Label><br />
                    </asp:TableCell>
                    <asp:TableCell Width="9%" Style="text-align: left">
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary w3-hover-opacity">Mark</asp:LinkButton>
                        <asp:Label runat="server" ID="stuAssessID" Text='<%#Eval("stuAssessID")%>' Visible="false"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </ItemTemplate>
    </asp:Repeater>

    <hr style="height: -86px" />
    <h3>View Student's Assessment Mark</h3>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT stuAssessID,SA.stuID, stuName,email,SA.score, CASE WHEN (SA.score) &gt;= 90 THEN 'A+' WHEN (SA.score) &gt;= 80 THEN 'A' WHEN (SA.score) &gt;= 75 THEN 'A-' WHEN (SA.score) &gt;= 70 THEN 'B+' WHEN (SA.score) &gt;= 65 THEN 'B' WHEN (SA.score) &gt;= 60 THEN 'B-' WHEN (SA.score) &gt;= 55 THEN 'C+' WHEN (SA.score) &gt;= 50 THEN 'C'
 WHEN (SA.score) &lt; 50 AND (SA.score) &gt;= 0 
 THEN 'F' END AS grade FROM Student_Assessment SA, Student S WHERE SA.stuID = S.stuID AND status = 'done' AND assessID =@assessID">
        <SelectParameters>
            <asp:SessionParameter Name="assessID" SessionField="assessID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--IN PROCESS EDITING--%>
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
        <HeaderTemplate>
            <h3>Private Assessment</h3>
            <br />
            <table class="alt table table-responsive table-hover" style="text-align: center">
                <tr>
                    <td class="auto-style1"><b>No.</b></td>
                    <td class="auto-style1"><b>ID</b></td>
                    <td class="auto-style1"><b>Name</b></td>
                    <td class="auto-style1"><b>Email</b></td>
                    <td class="auto-style1"><b>Mark</b></td>
                    <td class="auto-style1" style="width: 74px"><b>Grade</b></td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="studentId" runat="server" Text='<%# Eval("stuID") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="studentName" runat="server" Text='<%# Eval("stuName") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="email" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="score" runat="server" Text='<%# Eval("score") %>'></asp:Label></td>
                <td>
                    <b>
                        <asp:Label ID="grade" runat="server" Text='<%# Eval("grade") %>'></asp:Label></b>
                </td>

            </tr>
            <asp:Label ID="stuAssessID" runat="server" Text='<%# Eval("stuAssessID")%>' Visible="false"></asp:Label>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <%--end--%>
</asp:Content>

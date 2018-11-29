<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="stuViewAssess.aspx.cs" Inherits="OnlineAssessment.stuViewAssess" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div style="width: 70%; margin-left: 15%; margin-top: 3%;">
        <h2 style="margin-bottom: 5px; font-size: 30px">All Assessment Marks</h2>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="lists_ItemDataBound1">
            <HeaderTemplate>
                <h3>Private Assessment</h3>
                <br />
                <table class="alt table table-responsive" style="text-align: center">
                    <tr>
                        <td class="auto-style1"><b>No.</b></td>
                        <td class="auto-style1"><b>Subject</b></td>
                        <td class="auto-style1"><b>Assessment</b></td>
                        <td class="auto-style1"><b>Type</b></td>
                        <td class="auto-style1"><b>Mark</b></td>
                        <td class="auto-style1" style="width: 74px"><b>Grade</b></td>
                        <td class="auto-style1"><b>Status</b></td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="subjectName" runat="server" Text='<%# Eval("subjectName") %>'></asp:Label></td>
                    <td style="text-align: left">
                        <b>#<asp:Label ID="assessID" runat="server" Text='<%# Eval("assessID") %>'></asp:Label></b>
                        <asp:Label ID="assessName" runat="server" Text='<%# Eval("assessName") %>'></asp:Label></td>
                    <td>
                        <asp:Label ID="lblGrade" runat="server" Text=""></asp:Label>
                        <asp:Label ID="questType" runat="server" Text='<%# Eval("questType") %>'></asp:Label></td>
                    <td>
                        <asp:Label ID="score" runat="server" Text='<%# Eval("score") %>'></asp:Label></td>

                    <td>
                        <asp:Label ID="grade" runat="server" Text=""></asp:Label></td>

                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="select_Click" >
                            <asp:Label ID="status" runat="server" Text='<%# Eval("status") %>' class="btn btn-primary w3-hover-opacity"></asp:Label>
                        </asp:LinkButton>
                    </td>
                </tr>
                <asp:Label ID="stuAssessID" runat="server" Text='<%# Eval("stuAssessID")%>' Visible="false"></asp:Label>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater2_ItemCommand" OnItemDataBound="lists_ItemDataBound2">
            <HeaderTemplate>
                <h3>Public Assessment</h3>
                <br />
                <table class="alt table table-hover" style="text-align: center">
                    <tr>
                        <td class="auto-style1"><b>No.</b></td>
                        <td class="auto-style1"><b>Assessment</b></td>
                        <td class="auto-style1"><b>Type</b></td>
                        <td class="auto-style1"><b>Mark</b></td>
                        <td class="auto-style1"><b>Grade</b></td>
                        <td class="auto-style1"><b>Status</b></td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <b>#<asp:Label ID="assessID2" runat="server" Text='<%# Eval("assessID") %>'></asp:Label></b>
                        <asp:Label ID="assessName2" runat="server" Text='<%# Eval("assessName") %>'></asp:Label></td>
                    <td>
                        <asp:Label ID="lblGrade2" runat="server" Text=""></asp:Label>
                        <asp:Label ID="questType2" runat="server" Text='<%# Eval("questType") %>'></asp:Label></td>
                    <td>
                        <asp:Label ID="score2" runat="server" Text='<%# Eval("score") %>'></asp:Label></td>

                    <td>
                        <asp:Label ID="grade2" runat="server" Text=""></asp:Label></td>

                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="select_Click" class="btn btn-primary w3-hover-opacity">
                            <asp:Label ID="status2" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                        </asp:LinkButton>
                    </td>
                </tr>
                <asp:Label ID="stuAssessID2" runat="server" Text='<%# Eval("stuAssessID")%>' Visible="false"></asp:Label>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT A.assessID, assessName,subjectName,status,score,SA.stuAssessID,questType
FROM Student S, Student_Assessment SA, Assessment A, Subject SB, EnrollStudent ES
WHERE S.stuID=SA.stuID AND SA.assessID=A.assessID AND A.subjectID=SB.subjectID AND ES.stuID=S.stuID AND ES.subjectID=SB.subjectID AND assessType = 'private' AND S.stuID=@stuID">
        <SelectParameters>
            <asp:SessionParameter Name="stuID" SessionField="userID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT A.assessID, assessName,status,score,SA.stuAssessID,questType
FROM Student S, Student_Assessment SA, Assessment A
WHERE S.stuID=SA.stuID AND SA.assessID=A.assessID AND assessType = 'public' AND S.stuID=@stuID">
        <SelectParameters>
            <asp:SessionParameter Name="stuID" SessionField="userID" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

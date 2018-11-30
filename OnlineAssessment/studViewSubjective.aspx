<%@ Page Language="C#" MasterPageFile="~/assessment.Master" AutoEventWireup="true" CodeBehind="studViewSubjective.aspx.cs" Inherits="OnlineAssessment.studViewSubjective" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div style="width: 70%; margin-left: 15%; margin-top: 3%;">
        <h2 style="margin-bottom: 5px">Subjective Result Detail</h2>
        <br />
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <b>
                        <asp:Label runat="server" ID="scoreDetail" Text="" Style="font-size: 20px"></asp:Label>
                        <br />
                        <asp:Label runat="server" ID="questionDetail" Text="">
                        </asp:Label>
                    </b>
                </asp:TableCell>
                <asp:TableCell>
                    <br />
                    <br />
                    <asp:Button ID="btnPrevious" runat="server" Text="Back to Previous Page" OnClick="btnPrevious_Click" class="btn btn-primary w3-animate-opacity"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <div class="alt">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <div style="padding: 15px">
                                    <b>Question <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>. <%# Eval("questName") %><br />
                                    </b>
                                    <div style="padding: 15px">
                                        <b>Your Answer:</b>
                                        <div style="padding: 15px">
                                            <asp:TextBox ID="subAns" runat="server" Height="100px" Text='<%#Eval("answer")%>' TextMode="MultiLine" Style="resize: none" Enabled="false"></asp:TextBox>
                                        </div>
                                        <b>Lecturer Comment :</b>
                                        <div style="padding: 15px">
                                            <asp:TextBox ID="lecComment" runat="server" Height="100px" Text='<%#Eval("lecComment")%>' TextMode="MultiLine" Style="resize: none" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div style="float: right; position: inherit; margin-top: 1px;">
                                            <b>
                                                <asp:Label runat="server" Text='<%#"Your Marks : "+Eval("stuScore")+" / "+Eval("mark")%>'></asp:Label></b>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>


                </ItemTemplate>
            </asp:Repeater>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Q.questName,SA.answer, Q.questID , Q.mark, SA.lecComment ,SA.stuScore
FROM StudentAnswer SA, Student_Assessment SAS, Student S, Question Q
WHERE SA.stuAssessID=SAS.stuAssessID AND S.stuID=SAS.stuID AND Q.questID=SA.questID AND SAS.stuAssessID = @stuAssessID AND S.stuID = @stuID">
            <SelectParameters>
                <asp:SessionParameter Name="stuAssessID" SessionField="stuAssessID" />
                <asp:SessionParameter Name="stuID" SessionField="userID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

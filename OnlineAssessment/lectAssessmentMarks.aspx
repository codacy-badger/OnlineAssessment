<%@ Page Language="C#" MasterPageFile="~/assessment.Master" AutoEventWireup="true" CodeBehind="lectAssessmentMarks.aspx.cs" Inherits="OnlineAssessment.lectAssessmentMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="width: 70%; margin-left: 15%; margin-top: 5%;">
        <asp:Table runat="server">
            <asp:TableRow runat="server" ID="displayMsg" Visible="false">
                <asp:TableCell>
                    <b>
                        <asp:Label runat="server" ID="lblMsg" Text="" ForeColor="Orange"></asp:Label>
                    </b>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnPrevious" runat="server" Text="Back to Previous Page" OnClick="btnPrevious_Click" class="btn btn-success w3-hover-opacity" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <h2 style="margin-bottom: 5px">Mark Subjective Question</h2>
        <div>
            <asp:Label runat="server" ID="questionDetail" Text=""></asp:Label>
        </div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div style="padding: 15px">
                    <b>Question <%# Container.ItemIndex + 1 %>. <%#Eval("questName")%></b>
                    <asp:Label ID="questID" runat="server" Text='<%#Eval("questID")%>' Visible="false"></asp:Label><br />
                    Student Answer:<br />
                    <div style="padding: 15px">
                        <asp:TextBox ID="subAns" runat="server" Height="100px" Text='<%#Eval("answer")%>' TextMode="MultiLine" Style="resize: none" Enabled="false"></asp:TextBox>
                    </div>
                    <div style="padding: 15px">
                        Enter your comment :
                        <br />
                        <asp:TextBox ID="lecComment" runat="server" Height="100px" Text="" TextMode="MultiLine" Style="resize: none"></asp:TextBox>
                    </div>
                    <table>
                        <tr>
                            <td style="float: right; position: inherit; margin-top: 1px">/<asp:Label ID="mark" runat="server" Text='<%#Eval("mark") %>'></asp:Label></td>
                            <td style="float: right; width: 90px; height: 30px;">
                                <asp:TextBox ID="stuScore" runat="server" Style="height: unset"></asp:TextBox></td>

                        </tr>
                    </table>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <div style="text-align: right">
            <asp:Button ID="btnSubmit" runat="server" Text="Done" OnClick="btnSubmit_Click"
                OnClientClick="return confirm('Done marking?');" class="btn btn-success w3-hover-opacity"/>
            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" class="btn btn-default w3-hover-opacity"/>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Q.questName,SA.answer, Q.questID , Q.mark
FROM StudentAnswer SA, Question Q
WHERE Q.questID=SA.questID AND SA.stuAssessID = @stuAssessID">
            <SelectParameters>
                <asp:SessionParameter Name="stuAssessID" SessionField="stuAssessID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


</asp:Content>

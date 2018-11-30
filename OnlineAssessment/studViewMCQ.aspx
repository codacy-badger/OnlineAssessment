<%@ Page Language="C#" MasterPageFile="~/assessment.Master" AutoEventWireup="true" CodeBehind="studViewMCQ.aspx.cs" Inherits="OnlineAssessment.studViewMCQ" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div style="width: 70%; margin-left: 15%; margin-top: 3%;">
        <h2 style="margin-bottom: 5px">MCQ Result Detail</h2>
        <br />
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <b>
                        <asp:Label runat="server" ID="scoreDetail" Text="" Style="font-size: 20px"></asp:Label>
                        <br />
                        <asp:Label runat="server" ID="questionDetail" Text=""></asp:Label>
                    </b>
                </asp:TableCell>
                <asp:TableCell>
                    <br />
                    <br />
                    <asp:Button ID="btnPrevious" runat="server" Text="Back to Previous Page" OnClick="btnPrevious_Click" class="btn btn-primary w3-animate-opacity"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT questName,selectA,selectB,selectC,selectD,SA.answer,Q.answer as cAns , score
FROM StudentAnswer SA, Question Q, Student_Assessment SAS, Student S
WHERE SA.questID=Q.questID AND SA.stuAssessID=SAS.stuAssessID AND S.stuID=SAS.stuID AND SA.stuAssessID = @stuAssessID AND S.stuID=@stuID">
            <SelectParameters>
                <asp:SessionParameter Name="stuAssessID" SessionField="stuAssessID" />
                <asp:SessionParameter Name="stuID" SessionField="userID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="lists_ItemDataBound">
            <ItemTemplate>
                <div style="padding: 15px">
                    Question <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>. <%# Eval("questName") %><asp:Label runat="server" ID="stuAns" Text='<%#Eval("answer") %>' Visible="false"></asp:Label><br />
                    <div id="div_A" runat="server">
                        <asp:RadioButton GroupName="a" Text='<%# "A. " + Eval("selectA") %>' runat="server" ID="selectA" Enabled="false" />
                    </div>
                    <div id="div_B" runat="server">
                        <asp:RadioButton GroupName="a" Text='<%# "B. " + Eval("selectB") %>' runat="server" ID="selectB" Enabled="false" />
                    </div>
                    <div id="div_C" runat="server">
                        <asp:RadioButton GroupName="a" Text='<%# "C. " + Eval("selectC") %>' runat="server" ID="selectC" Enabled="false" />
                    </div>
                    <div id="div_D" runat="server">
                        <asp:RadioButton GroupName="a" Text='<%# "D. " + Eval("selectD") %>' runat="server" ID="selectD" Enabled="false" /><br />
                    </div>
                    <div style="padding: 10px">
                        <b>Correct Answer is
                            <asp:Label ID="lblCorrectAns" runat="server" Text=' <%# Eval("cAns")%>'></asp:Label>.
                        </b>
                        <br />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>

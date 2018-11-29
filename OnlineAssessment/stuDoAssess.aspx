<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="stuDoAssess.aspx.cs" Inherits="OnlineAssessment.stuDoAssess" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
        <div style="width: 50%; margin-left: 15%; margin-top: 3%;">
            <h2 style="margin-bottom: 5px; font-size: 20px;">Select an Assessment</h2>
            <h4>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" >
                        <asp:Table runat="server" class="table table-responsive table-hover">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <div style="color: blue">
                                        <asp:Label runat="server" Text='<%#Eval("questType")%>' ID="questType"></asp:Label>
                                        -
                                        <asp:Label runat="server" ID="assessName" Text=' <%#Eval("assessName")%>' ></asp:Label><br />
                                        Subject :
                                        <asp:Label runat="server" ID="subjectName" Text='<%#Eval("subjectName")%>'></asp:Label><br />
                                        Type :
                                        <asp:Label runat="server" ID="assessType" Text='<%#Eval("assessType")%>'></asp:Label><br />
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <div style="text-align: right; padding-right: 20px; color: blue">
                                        
                                        <asp:Label ID="assessID" runat="server" Text='<%#Eval("assessID")%>' Visible="false"></asp:Label>
                                        <asp:Label ID="lecName" runat="server" Text='<%#Eval("lecName")%>' Visible="false"></asp:Label>
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" >
                        <asp:Table runat="server" class="table table-responsive  table-hover">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <div>
                                        <asp:Label runat="server" Text='<%#Eval("questType")%>' ID="questType"></asp:Label>
                                        -
                                        <asp:Label runat="server" ID="assessName" Text=' <%#Eval("assessName")%>'></asp:Label><br />
                                        Type :
                                        <asp:Label runat="server" ID="assessType" Text='<%#Eval("assessType")%>'></asp:Label><br />
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <div style="text-align: right; padding-right: 20px;">
                                        <asp:Label ID="assessID" runat="server" Text='<%#Eval("assessID")%>' Visible="false"></asp:Label>
                                        <asp:Label ID="lecName" runat="server" Text='<%#Eval("lecName")%>' Visible="false"></asp:Label>
                                    </div>
                                    
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM Assessment A, Lecture L WHERE ([assessType] = @assessType) AND L.lecID=A.lecID AND A.assessID NOT IN ( SELECT SA.assessID FROM Student_Assessment SA, Student S WHERE SA.stuID = S.stuID AND S.stuID = @userID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Public" Name="assessType" Type="String" />
                    <asp:SessionParameter DefaultValue="" Name="userID" SessionField="userID" />
                </SelectParameters>

            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT A.assessID, assessName, assessType, questType, subjectName , lecName
FROM Assessment A, Subject S, Lecture L 
WHERE A.subjectID = S.subjectID AND L.lecID=A.lecID AND assessType = 'Private' AND 
A.subjectID IN ( SELECT ES.subjectID FROM Subject S,  EnrollStudent ES,  Student ST WHERE S.subjectID = ES.subjectID AND ST.stuID = ES.stuID AND ES.stuID = @userID) AND A.assessID NOT IN ( SELECT SA.assessID FROM Student_Assessment SA, Student S WHERE SA.stuID = S.stuID AND S.stuID = @userID)">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="userID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
   </h4>
</asp:Content>


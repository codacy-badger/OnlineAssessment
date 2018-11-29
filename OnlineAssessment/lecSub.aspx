<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="lecSub.aspx.cs" Inherits="OnlineAssessment.lecSub" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="col-lg-10">
            <h2>Subject Lists</h2>
            <b><span style="float: left">Select a subject to view</span><span style="float: right">Cant find your subject? <a href="EnrollLecture.aspx">Enroll</a> here.</span></b><br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [subjectCode], [subjectName] 
FROM Lecture L, EnrollLecturer EL, Subject S
WHERE L.lecID = EL.lecID AND EL.subjectID = S.subjectID AND
L.lecID = @lecID">
                <SelectParameters>
                    <asp:SessionParameter Name="lecID" SessionField="userID" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">

                <ItemTemplate>
                    <asp:Table runat="server" class="table table-responsive table-hover">
                        <asp:TableRow>
                            <asp:TableCell width="20%" style="text-align:left">
                                <asp:Label runat="server" ID="lblSubjectCode" Text='<%#Eval("subjectCode")%>'></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell width="70%" style="text-align:left">
                                <asp:Label runat="server" ID="lblSubjectName" Text=' <%#Eval("subjectName")%>'></asp:Label><br />
                            </asp:TableCell>
                            <asp:TableCell width="10%" style="text-align:left">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="view" class="btn btn-primary w3-hover-shadow">View</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('Confirm unenroll?')" CommandName="unenroll" class="btn btn-primary w3-hover-shadow">Unenroll</asp:LinkButton>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </ItemTemplate>
            </asp:Repeater>
            
            <p>
                <asp:Label ID="lblMsg" runat="server" Text="" Style="color:orange"></asp:Label>
            </p>
        </div>

</asp:Content>



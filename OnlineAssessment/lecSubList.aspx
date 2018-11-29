<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="lecSubList.aspx.cs" Inherits="OnlineAssessment.lecSubList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [subjectCode], [subjectName], [subjectDesc] FROM [Subject] WHERE ([subjectID] = @subjectID)">
            <SelectParameters>
                <asp:SessionParameter Name="subjectID" SessionField="@subjectID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <h2>Subject Name :
                <asp:Label ID="lblSubjectName" runat="server" Text=""></asp:Label>
            #<asp:Label ID="lblSubjectCode" runat="server" Text=""></asp:Label></h2>
        <b><span style="float: left; text-decoration: underline">Subject Information :
        </span></b>
        <br />
        <asp:Label ID="lblSubjectInfo" runat="server" Text=""></asp:Label>
        <br />
        <span style="float: right">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnEnrollStudent" runat="server" Text="Enroll New Student" OnClick="btnEnrollStudent_Click" class="btn btn-primary btn-warning w3-hover-shadow"/></span>
    </div>
    <br />
    <br />
    <hr />
    <p>
        <asp:Label ID="lblMsg" runat="server" Text="" Style="color:orange"></asp:Label>
    </p>
    <h3>Student's Information</h3>
    <br />
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater2_ItemCommand">
        <HeaderTemplate>
            <asp:Table ID="Table1" runat="server"  class="table table-responsive table-hover">
                <asp:TableHeaderRow>
                    <asp:TableCell Style="width: 10%">ID</asp:TableCell>
                    <asp:TableCell Style="width: 20%">Student ID</asp:TableCell>
                    <asp:TableCell Style="width: 30%">Name</asp:TableCell>
                    <asp:TableCell Style="width: 30%">Email</asp:TableCell>
                    <asp:TableCell Style="width: 9%">Action</asp:TableCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Table runat="server"  class="table table-responsive table-hover">
                <asp:TableRow>
                    <asp:TableCell Width="10%" Style="text-align: left">
                        <asp:Label runat="server" ID="lblEnrollID" Text='<%#Eval("enrollSID")%>'></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell Width="20%" Style="text-align: left">
                        <asp:Label runat="server" ID="lblStuID" Text=' <%#Eval("stuID")%>'></asp:Label><br />
                    </asp:TableCell>
                    <asp:TableCell Width="30%" Style="text-align: left">
                        <asp:Label runat="server" ID="lblStudName" Text=' <%#Eval("stuName")%>'></asp:Label><br />
                    </asp:TableCell>
                    <asp:TableCell Width="30%" Style="text-align: left">
                        <asp:Label runat="server" ID="lblEmail" Text=' <%#Eval("email")%>'></asp:Label><br />
                    </asp:TableCell>
                    <asp:TableCell Width="9%" Style="text-align: left">
                        <asp:LinkButton ID="LinkButton1" runat="server"
                            OnClientClick="return confirm('Confirm kick?')" OnClick="LinkButton1_Click" class="btn btn-danger w3-animate-opacity">Kick</asp:LinkButton>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </ItemTemplate>
    </asp:Repeater>




    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [enrollSID],ES.stuID, [stuName], [email] 
FROM Student St,EnrollStudent ES,Subject S
WHERE St.stuID = ES.stuID AND S.subjectID = ES.subjectID AND S.subjectID = @subjectID">
        <SelectParameters>
            <asp:SessionParameter Name="subjectID" SessionField="subjectID" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>

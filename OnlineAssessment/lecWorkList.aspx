<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="lecWorkList.aspx.cs" Inherits="OnlineAssessment.lecWorkList" %>

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
                <asp:Table ID="Table1" runat="server" class="table table-striped">
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
                <asp:Table runat="server" class="table table-striped">
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
                            <asp:LinkButton ID="LinkButton1" runat="server">Mark</asp:LinkButton>
                            <asp:Label runat="server" ID="stuAssessID" Text='<%#Eval("stuAssessID")%>' Visible="false"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ItemTemplate>
        </asp:Repeater>

        <hr style="height: -86px" />
        <h3>View Student's Assessment Mark</h3>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT stuAssessID,SA.stuID, stuName,email,SA.score
FROM Student_Assessment SA, Student S
WHERE SA.stuID = S.stuID AND status = 'done' AND assessID =@assessID">
            <SelectParameters>
                <asp:SessionParameter Name="assessID" SessionField="assessID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" class="table table-striped">
            <Columns>
                <asp:TemplateField HeaderText="No">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Student ID" DataField="stuID"></asp:BoundField>
                <asp:BoundField HeaderText="Name" DataField="stuName"></asp:BoundField>
                <asp:BoundField HeaderText="Email" DataField="email"></asp:BoundField>
                <asp:BoundField HeaderText="Mark" DataField="score"></asp:BoundField>
                <asp:TemplateField HeaderText="Grade">
                    <ItemTemplate>
                        <asp:Label ID="lblGrade" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
  
</asp:Content>

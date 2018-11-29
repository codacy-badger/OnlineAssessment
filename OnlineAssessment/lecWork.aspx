<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="lecWork.aspx.cs" Inherits="OnlineAssessment.lecWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 70%; margin-left: 15%; margin-top: 3%;">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT subjectName, [assessName], [questType] ,A.assessID,assessType
FROM Subject S, Assessment A
WHERE S.subjectID = A.subjectID AND assessType = 'private' AND A.lecID=@userID
ORDER BY subjectName">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:Label ID="lblMsg" runat="server" Text="" Style="color:orange"></asp:Label>
        </p>
        <h2 style="margin-bottom: 5px; font-size: 30px">All Assessments</h2>
        
        <br />
        
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater2_ItemCommand">
            <HeaderTemplate>
                <h3>Public</h3>
                <table class="table table-striped table-hover">
                    <tr>
                        <b>
                            <td style="width: 13%">No.</td>
                            <td style="width: 27%">Title</td>
                            <td style="width: 13%">Question Type</td>
                            <td style="width: 13%">Action</td>
                        </b>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align: left; width: 13%">
                        <asp:Label ID="Label1" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>
                    </td>
                    <td style="text-align: left; width: 27%">
                        <asp:Label runat="server" ID="lblAssID" Text=' <%#Eval("assessID")%>' Visible="false"></asp:Label>
                        <asp:Label runat="server" ID="lblAssName" Text=' <%#Eval("assessName")%>'></asp:Label><br />
                    </td>
                    <td style="text-align: left; width: 13%">
                        <asp:Label runat="server" ID="lblAssessType" Text=' <%#Eval("assessType")%>' Visible="false"></asp:Label>
                        <asp:Label runat="server" ID="lblQuestType" Text=' <%#Eval("questType")%>'></asp:Label><br />
                    </td>
                    <td style="text-align: left; width: 13%">
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="view" CommandArgument='<%# Eval("assessID") %>' class="btn btn-primary w3-hover-shadow">View</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('Confirm delete?')" CommandName="delete" CommandArgument='<%# Eval("assessID") %>' class="btn btn-danger w3-hover-shadow">Delete</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="lists_ItemDataBound">
            <HeaderTemplate>
                <h3>Private</h3>
                <table class="table table-striped  table-hover">
                    <tr>
                        <b>
                            <td style="width: 20%">No.</td>
                            <td style="width: 20%">Title</td>
                            <td style="width: 20%">Subject</td>
                            <td style="width: 20%">Question Type</td>
                            <td style="width: 20%">Action</td>
                        </b>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align: left; width: 20%">
                        <asp:Label ID="Label1" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>
                    </td>
                    <td style="text-align: left; width: 20%">
                        <asp:Label runat="server" ID="lblAssessType" Text=' <%#Eval("assessType")%>' Visible="false"></asp:Label>
                        <asp:Label runat="server" ID="lblAssName" Text=' <%#Eval("assessName")%>'></asp:Label>
                    </td>   
                    <td style="text-align: left; width: 20%">
                        <asp:Label runat="server" ID="lblAssID" Text=' <%#Eval("assessID")%>' Visible="false"></asp:Label>
                        <asp:Label runat="server" ID="lblSubname" Text=' <%#Eval("subjectName")%>'></asp:Label>
                    </td>
                    
                    <td style="text-align: left; width: 20%">
                        <asp:Label runat="server" ID="lblQuestType" Text=' <%#Eval("questType")%>'></asp:Label>
                    </td>
                    <td style="text-align: left; width: 20%">
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="view" CommandArgument='<%# Eval("assessID") %>' class="btn btn-primary w3-hover-shadow">View </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" runat="server" OnClientClick="return confirm('Confirm delete?')" CommandName="delete" CommandArgument='<%# Eval("assessID") %>' class="btn btn-danger w3-hover-shadow">Delete</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [assessName], [questType] ,assessID,assessType
FROM Assessment A
WHERE assessType = 'public' AND A.lecID=@userID">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

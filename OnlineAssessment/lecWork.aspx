﻿<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="lecWork.aspx.cs" Inherits="OnlineAssessment.lecWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 70%; margin-left: 15%; margin-top: 3%;">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT subjectName, [assessName], [questType] ,A.assessID,assessType
FROM Subject S, Assessment A
WHERE S.subjectID = A.subjectID AND assessType = 'private' AND A.lecID=@userID
ORDER BY subjectName">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>

        <h2 style="margin-bottom: 5px; font-size: 30px">All Assessment</h2>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="lists_ItemDataBound">
            <HeaderTemplate>
                <h3>Private Assessment</h3>
                <table>
                    <tr>
                        <b>
                            <td style="width: 10%">No.</td>
                            <td style="width: 30%">Subject</td>
                            <td style="width: 30%">Title</td>
                            <td style="width: 20%">Question Type</td>
                            <td style="width: 9%">Action</td>
                        </b>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align: left; width: 10%">
                        <asp:Label ID="Label1" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>
                    </td>
                    <td style="text-align: left; width: 30%">
                        <asp:Label runat="server" ID="lblAssID" Text=' <%#Eval("assessID")%>' Visible="false"></asp:Label>
                        <asp:Label runat="server" ID="lblSubname" Text=' <%#Eval("subjectName")%>'></asp:Label><br />
                    </td>
                    <td style="text-align: left; width: 30%">
                        <asp:Label runat="server" ID="lblAssessType" Text=' <%#Eval("assessType")%>' Visible="false"></asp:Label>
                        <asp:Label runat="server" ID="lblAssName" Text=' <%#Eval("assessName")%>'></asp:Label><br />
                    </td>
                    <td style="text-align: left; width: 20%">
                        <asp:Label runat="server" ID="lblQuestType" Text=' <%#Eval("questType")%>'></asp:Label><br />
                    </td>
                    <td style="text-align: left; width: 9%">
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Green">View</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater2_ItemCommand">
            <HeaderTemplate>
                <h3>Public Assessment</h3>
                <br />
                <table>
                    <tr>
                        <b>
                            <td style="width: 10%">No.</td>
                            <td style="width: 30%">Title</td>
                            <td style="width: 20%">Question Type</td>
                            <td style="width: 9%">Action</td>
                        </b>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align: left; width: 10%">
                        <asp:Label ID="Label1" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>
                    </td>
                    <td style="text-align: left; width: 30%">
                        <asp:Label runat="server" ID="lblAssID" Text=' <%#Eval("assessID")%>' Visible="false"></asp:Label>
                        <asp:Label runat="server" ID="lblAssName" Text=' <%#Eval("assessName")%>'></asp:Label><br />
                    </td>
                    <td style="text-align: left; width: 20%">
                        <asp:Label runat="server" ID="lblAssessType" Text=' <%#Eval("assessType")%>' Visible="false"></asp:Label>
                        <asp:Label runat="server" ID="lblQuestType" Text=' <%#Eval("questType")%>'></asp:Label><br />
                    </td>
                    <td style="text-align: left; width: 9%">
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Green">View</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [assessName], [questType] ,assessID,assessType
FROM Assessment A
WHERE assessType = 'public' AND A.lecID=@userID">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

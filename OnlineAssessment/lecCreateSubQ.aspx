<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="lecCreateSubQ.aspx.cs" Inherits="OnlineAssessment.lecCreateSubQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="width: 80%; margin-left: 10%; margin-top: 5%">
        <h2>Create Subjective Question</h2>

        <table class="alt">
            <tr>
                <td class="auto-style1" style="width: 80%;">Assessment:#<asp:Label ID="assessName" runat="server"></asp:Label>
                </td>
                <td>Type:
                        <asp:Label ID="type" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">Subject:
                        <asp:Label ID="subjectName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr runat="server">
                <td class="auto-style1" colspan="2">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View runat="server" ID="CreateQuestion">
                            <h3>Create Assessment</h3>
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <div>
                                            <asp:Label ID="question" Text="Question: " runat="server" Style="float: left; padding: 5px;" Width="76px"></asp:Label>
                                            <asp:TextBox ID="txtDesc" runat="server" Style="float: left; padding: 5px; height: 2.25em;"></asp:TextBox>
                                        </div>

                                        <div style="margin-top: 45px;">
                                            <asp:Label ID="Label5" Text="Marks: " runat="server" Style="float: left; padding: 5px;" Width="76px"></asp:Label>
                                            <asp:DropDownList ID="ddlMark" runat="server" Style="height: 2.25em;">
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnAdd" runat="server" Text="Add more question" OnClick="btnAdd_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 169px">
                                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" /></td>
                                    <td>
                                        <asp:Button ID="btnDone" runat="server" Text="Done" OnClick="btnDone_Click" /></td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="viewConfirmDetails" runat="server">
                            <h3>Question Preview</h3>
                            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <div>
                                                    <asp:Label ID="lblQuest" runat="server" Text='<%# Eval("questID") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="question" Text="Question: " runat="server" Style="float: left; padding: 5px; width: 76px;"></asp:Label>
                                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("questName") %>' Style="width: 100%; float: left; padding: 5px; height: 2.25em;"></asp:Label>
                                                </div>

                                                <div style="margin-top: 45px;">
                                                    <asp:Label ID="Label5" Text="Marks : " runat="server" Style="float: left; padding: 5px; width: 76px;"></asp:Label>
                                                    <asp:Label ID="lblMark" runat="server" Text='<%# Eval("mark") %>' Style="padding: 5px; height: 2.25em;">
                                                    </asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Edit" runat="server" CommandName="edit" Text="Edit" /></td>
                                            <td>
                                                <asp:Button ID="Delete" runat="server" CommandName="delete" Text="Delete"
                                                    OnClientClick="return confirm('Delete this Item');" /></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="lblQuest" runat="server" Text='<%# Eval("questID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblAssess" runat="server" Text='<%# Eval("assessID") %>' Visible="false"></asp:Label>
                                                <div>
                                                    <asp:Label ID="Label1" Text="Question: " runat="server" Style="float: left; padding: 5px; width: 76px;"></asp:Label>
                                                    <asp:TextBox ID="editQName" runat="server" Text='<%# Eval("questName") %>' Style="float: left; padding: 5px; height: 2.25em;"></asp:TextBox>
                                                </div>
                                                <div style="margin-top: 45px;">
                                                    <asp:Label ID="Label2" Text="Marks: " runat="server" Style="float: left; padding: 5px; width: 76px;"></asp:Label>
                                                    <asp:DropDownList ID="ddlEditMark" runat="server" Style="height: 2.25em;">
                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                        <asp:ListItem Value="2">2</asp:ListItem>
                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                        <asp:ListItem Value="5">5</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <asp:Button ID="Update" runat="server" CommandName="update" Text="Update" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Cancel" runat="server" CommandName="cancel" Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>

                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Question] WHERE ([assessID] = @assessID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="assessID" SessionField="assessID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:View>
                    </asp:MultiView>

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnFinish" runat="server" Text="Finish" OnClick="btnFinish_Click" Visible="false"
                        OnClientClick="return confirm('Finish add question?');" />
                    <asp:Button ID="btnAddMore" runat="server" Text="Add more" Visible="false" OnClick="btnAddMore_Click" />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

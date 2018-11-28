﻿<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="lecCreateMCQ.aspx.cs" Inherits="OnlineAssessment.lecCreateMCQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="width: 80%; margin-left: 10%; margin-top: 5%">
        <h2>Create Multiple Choice Question</h2>

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
                                    <td>Question: </td>
                                    <td>
                                        <asp:TextBox ID="txtQuestion" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rbA" runat="server" GroupName="Answer" Text="A." /></td>
                                    <td>
                                        <asp:TextBox ID="txtA" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rbB" runat="server" GroupName="Answer" Text="B." /></td>
                                    <td>
                                        <asp:TextBox ID="txtB" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rbC" runat="server" GroupName="Answer" Text="C." /></td>
                                    <td>
                                        <asp:TextBox ID="txtC" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rbD" runat="server" GroupName="Answer" Text="D." /></td>
                                    <td>
                                        <asp:TextBox ID="txtD" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Please <b>TICK</b> the correct answer</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnAdd" runat="server" Text="Add more question" OnClick="btnAdd_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
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
                                            <td>Question:</td>
                                            <td>
                                                <asp:Label ID="lblQuest" runat="server" Text='<%# Eval("questID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="questNameLabel" runat="server" Text='<%# Eval("questName") %>' /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">A.<asp:Label ID="selectALabel" runat="server" Text='<%# Eval("selectA") %>' /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">B.<asp:Label ID="selectBLabel" runat="server" Text='<%# Eval("selectB") %>' /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">C.<asp:Label ID="selectCLabel" runat="server" Text='<%# Eval("selectC") %>' /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">D.<asp:Label ID="selectDLabel" runat="server" Text='<% #Eval("selectD") %>' /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Correct Answer :
                                        <asp:Label ID="lblAnswer" runat="server" Text='<%# Eval("answer") %>'> </asp:Label></b></td>
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
                                            <td>
                                                <asp:Label ID="lblQuest" runat="server" Text='<%# Eval("questID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblAssess" runat="server" Text='<%# Eval("assessID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblAnswer" runat="server" Text='<%# Eval("answer") %>' Visible="false"> </asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Question:</td>
                                            <td>
                                                <asp:TextBox ID="editQuest" runat="server" Text='<%# Eval("questName") %>' Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rbEditA" runat="server" GroupName="EditAnswer" Text="A." /></td>
                                            <td>
                                                <asp:TextBox ID="editA" runat="server" Text='<%# Eval("selectA") %>' /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rbEditB" runat="server" GroupName="EditAnswer" Text="B." /></td>
                                            <td>
                                                <asp:TextBox ID="editB" runat="server" Text='<%# Eval("selectB") %>' /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rbEditC" runat="server" GroupName="EditAnswer" Text="C." /></td>
                                            <td>
                                                <asp:TextBox ID="editC" runat="server" Text='<%# Eval("selectC") %>' /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rbEditD" runat="server" GroupName="EditAnswer" Text="D." /></td>
                                            <td>
                                                <asp:TextBox ID="editD" runat="server" Text='<% #Eval("selectD") %>' /></td>
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
                        OnClientClick="return confirm('Finish adding question?');" />
                    <asp:Button ID="btnAddMore" runat="server" Text="Add more" Visible="false" OnClick="btnAddMore_Click" />
                </td>

            </tr>
        </table>
    </div>

</asp:Content>


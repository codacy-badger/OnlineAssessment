<%@ Page Language="C#" MasterPageFile="~/assessment.Master" AutoEventWireup="true" CodeBehind="lectMakeSubjective.aspx.cs" Inherits="OnlineAssessment.lectMakeSubjective" %>

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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDesc" ErrorMessage="Required field!"></asp:RequiredFieldValidator>
                                        </div>
                                        
                                        <div style="margin-top: 45px">
                                            Question Image: 
                                            <asp:FileUpload ID="imageUpload" runat="server" />
                                        </div>

                                        <div style="margin-top: 25px;">
                                            <asp:Label ID="Label5" Text="Marks: " runat="server" Style="float: left; padding: 5px;" Width="76px"></asp:Label>
                                            <asp:DropDownList ID="ddlMark" runat="server" Style="height: 2.25em;">
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                <asp:ListItem Value="7">5</asp:ListItem>
                                                <asp:ListItem Value="8">7</asp:ListItem>
                                                <asp:ListItem Value="9">8</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="11">11</asp:ListItem>
                                                <asp:ListItem Value="12">12</asp:ListItem>
                                                <asp:ListItem Value="13">13</asp:ListItem>
                                                <asp:ListItem Value="14">14</asp:ListItem>
                                                <asp:ListItem Value="15">15</asp:ListItem>
                                                <asp:ListItem Value="16">16</asp:ListItem>
                                                <asp:ListItem Value="17">17</asp:ListItem>
                                                <asp:ListItem Value="18">18</asp:ListItem>
                                                <asp:ListItem Value="19">19</asp:ListItem>
                                                <asp:ListItem Value="20">20</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnAdd" runat="server" Text="Add more question" OnClick="btnAdd_Click" class="btn btn-primary w3-animate-opacity"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="lectMakeAssessments.aspx" ID="btnBack" class="btn btn-default w3-animate-opacity">Back</a>&nbsp;&nbsp;&nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" class="btn btn-default w3-animate-opacity"/>&nbsp;
                                        <asp:Button ID="btnDone" runat="server" class="btn btn-success w3-animate-opacity" OnClick="btnDone_Click" Text="Done" />
                                        &nbsp;
                                        <asp:Label ID="error1" runat="server"></asp:Label>
                                    </td>
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
                                                <asp:Button ID="Edit" runat="server" CommandName="edit" Text="Edit" class="btn btn-primary w3-animate-opacity"/></td>
                                            <td>
                                                <asp:Button ID="Delete" runat="server" CommandName="delete" Text="Delete"
                                                    OnClientClick="return confirm('Delete this Item');" class="btn btn-danger w3-animate-opacity"/></td>
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
                                                <asp:Button ID="Update" runat="server" CommandName="update" Text="Update" class="btn btn-primary w3-animate-opacity"/>
                                            </td>
                                            <td>
                                                <asp:Button ID="Cancel" runat="server" CommandName="cancel" Text="Cancel" class="btn btn-default w3-animate-opacity"/>
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
                        OnClientClick="return confirm('Finish add question?');" class="btn btn-success w3-animate-opacity"/>
                    <asp:Button ID="btnAddMore" runat="server" Text="Add more" Visible="false" OnClick="btnAddMore_Click" class="btn btn-primary w3-animate-opacity"/>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Question] WHERE ([assessID] = @assessID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="assessID" SessionField="assessID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Repeater ID="Repeater1" runat="server">
                    </asp:Repeater>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="stuDoSubQ.aspx.cs" Inherits="OnlineAssessment.stuDoSubQ" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
 
        <div style="width: 70%; margin-left: 15%; margin-top: 3%;">
            <h2 style="margin-bottom: 5px">Answer Subjective Question</h2>
            <div>
                <asp:Label runat="server" ID="questionDetail" Text=""></asp:Label>
            </div>
            <div style="text-align: center; margin-top: 20px">
                <asp:Label ID="lblResult" runat="server" Text="" Font-Bold="true" ForeColor="YellowGreen"></asp:Label>
                <br /><asp:Button ID="btnHome" runat="server" Text="Back to HomePage" OnClick="btnHome_Click" CssClass="btn-primary w3-hover-opacity"/>
            </div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div style="padding: 15px"  >
                        Question <%# Container.ItemIndex + 1 %>. <%# Eval("questName") %>
                        <asp:Label ID="questID" runat="server" Text='<%#Eval("questID")%>' Visible="false"></asp:Label><br />
                        <div style="padding: 15px">
                            <asp:TextBox ID="subAns" runat="server" Height="200px" TextMode="MultiLine" Style="resize: none" Width="522px"></asp:TextBox>
                        </div>
                        <div style="text-align: right">
                            Total Marks :
                            <asp:Label ID="mark" runat="server" Text='<%# Eval("mark") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <div style="text-align: right">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"  CssClass="btn-primary w3-hover-opacity"/>
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btn-default w3-hover-opacity"/>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Question] WHERE ([assessID] = @assessID)">
                <SelectParameters>
                    <asp:SessionParameter Name="assessID" SessionField="assessID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    
</asp:Content>

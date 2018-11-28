<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ViewMCQuestion.aspx.cs" Inherits="OnlineAssessment.ViewMCQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 70%;margin-left: 15%;margin-top: 5%;">
                            <h2 style="margin-bottom:5px">mAnswer Multiple Choice Question</h2>
    <form runat="server">
    <asp:GridView ShowHeader="false" AutoGenerateColumns="false" ID="GridView1" runat="server" GridLines="None">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div style="padding:20px;text-align: center;">
                        <asp:Image ID="Image" Style="" runat="server" ImageUrl='<%# "ShowImage.ashx?id=" + Eval("MCQID") %>'/>
                    </div>
                    <div style="padding:15px">
                        <asp:Label ID="QuestionID" runat="server" Text='<%# Eval("MCQID") %>' Visible="false" />
                        <b><asp:Label runat="server" ID="Question" Text='<%# Eval("MCQuestion") %>' style="font-size:15px"/></b><br />
                    </div>
                    <div style="padding:15px">
                        <div style="width: 50%;float:left;padding:10px">
                        <asp:RadioButton GroupName="a" Text='<%# "A. " + Eval("Opt1") %>' runat="server" ID="Opt1" />
                        </div>
                        <div style="padding:10px">
                        <asp:RadioButton GroupName="a" Text='<%# "B. " + Eval("Opt2") %>' runat="server" ID="Opt2" /><br />
                        </div>
                        <div style="width: 50%;float:left;padding:10px">
                        <asp:RadioButton GroupName="a" Text='<%# "C. " + Eval("Opt3") %>' runat="server" ID="Opt3" />
                        </div>
                        <div style="padding:10px">
                        <asp:RadioButton GroupName="a" Text='<%# "D. " + Eval("Opt4") %>' runat="server" ID="Opt4" /><br />   
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>
        <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
     </form>
     </div>
</asp:Content>
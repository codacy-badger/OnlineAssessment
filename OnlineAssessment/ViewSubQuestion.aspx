<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ViewSubQuestion.aspx.cs" Inherits="OnlineAssessment.ViewSubQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
        <div style="width: 70%;margin-left: 15%;margin-top: 5%;">
                    <h2 style="margin-bottom:5px">Answer Written Question</h2>
        <form runat="server">


        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">  
            <ItemTemplate>  
                  <div>
                    <div style="padding:20px;text-align: center;margin-top:10px">
                        <asp:Image ID="Image" Style="" runat="server" ImageUrl='<%# "ShowImage.ashx?id=" + Eval("QuestionID") %>'/>
                    </div>
                     <div style="padding:15px">
                        <asp:Label ID="Q" runat="server" Text='<%# Eval("QuestionID") %>' Visible="false" />
                        <b><asp:Label runat="server" ID="Question" Text='<%# Eval("Question") %>' style="font-size:15px"/></b><br />
                    </div>
                    <div style="padding:15px">
                        <asp:TextBox ID="subans" runat="server"></asp:TextBox>
                    </div>
                  </div>          
            </ItemTemplate>  
        </asp:Repeater> 

        <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" style="float:right;margin-right:20px"/>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [QuestionID], [Question], [AssessmentCode] FROM [WrittenQuestion] WHERE ([AssessmentCode] = @AssessmentCode)">
            <SelectParameters>
                <asp:SessionParameter Name="AssessmentCode" SessionField="Assessment" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>

        </form>
        </div>
</asp:Content>

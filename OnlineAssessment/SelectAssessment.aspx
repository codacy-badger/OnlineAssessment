<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="SelectAssessment.aspx.cs" Inherits="OnlineAssessment.SelectAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
          <div style="width: 70%;margin-left: 15%;margin-top: 5%;">
                <h2 style="margin-bottom:5px">Select Assessment</h2>
        <table class="alt" style="height: 134px">
            <tr>
                <td class="auto-style1">
                    Assessment
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" style="margin-bottom: 10px;" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="Public">Public</asp:ListItem>
                        <asp:ListItem Value="Private">Private</asp:ListItem>
                    </asp:DropDownList >
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="AssessmentTitle" DataValueField="AssessmentCode" Visible="false">
                    </asp:DropDownList >
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assessment.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [AssessmentCode], [AssessmentTitle] FROM [Assessment] WHERE ([Publicity] = @Publicity)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Publicity" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="AssessmentTitle" DataValueField="AssessmentCode" Visible="false">
                    </asp:DropDownList >
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT A.AssessmentCode, A.AssessmentTitle FROM Assessment A,  Lecturer L WHERE A.LecID = L.LecID AND A.Publicity = @Pub AND L.CourseID = @courseID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Pub" PropertyName="SelectedValue" />
                            <asp:SessionParameter Name="courseID" SessionField="Course" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>

                <tr>
                    <td class="auto-style1">

                    </td>
                    <td>
                        <asp:Button ID="btnSelect" runat="server" Text="Select" CssClass="btn btn-primary" Width="172px" OnClick="btnSelect_Click" />&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary" Width="175px" OnClick="btnCancel_Click" /><br />
                    </td>
                </tr>
        </table>  
              </div>
      </form>
</asp:Content>

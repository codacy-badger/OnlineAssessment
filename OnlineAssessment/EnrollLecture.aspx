<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="EnrollLecture.aspx.cs" Inherits="OnlineAssessment.EnrollLecture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>
        <h2>Enroll Subject</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentConnectionString %>" SelectCommand="SELECT subjectID, (subjectCode + ' ' + subjectName) AS subjectName FROM Subject WHERE subjectID NOT IN 
(SELECT EL.subjectID FROM Subject S, EnrollLecturer EL, Lecture L WHERE S.subjectID = EL.subjectID AND L.lecID = EL.lecID AND EL.lecID = @lecID)">
            <SelectParameters>
                <asp:SessionParameter Name="lecID" SessionField="userID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table class="alt">
            <tr>
                <td>
                    <asp:Label ID="lblSubjectPrompt" runat="server" Text="Please select a subject to enroll :"></asp:Label>
                    <asp:DropDownList ID="ddlSubjectEnroll" runat="server" DataSourceID="SqlDataSource1" DataTextField="subjectName" DataValueField="subjectID">
                    </asp:DropDownList>
                    <br />
                    <br />

                    <span style="float: right">
                        <asp:Button ID="btnEnroll" runat="server" Text="Enroll"
                            OnClientClick="return confirm('Add this subject?');" OnClick="btnEnroll_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnBackAction" runat="server" Text="Back" OnClick="btnBackAction_Click" /></span>
                    <br />
                    <p>
                        <asp:Label ID="lblMsg" runat="server" Text="" Style="color: green"></asp:Label>
                    </p>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

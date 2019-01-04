<%@ Page Language="C#" MasterPageFile="~/assessment.Master" AutoEventWireup="true" CodeBehind="databaseError.aspx.cs" Inherits="OnlineAssessment.error.databaseError" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content2" runat="server">
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <div class="row w3-animate-opacity">
        <div class="col-xs-10 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-body">

                    <div style="font-size: 15px">Can't connect to database! Please check your firewall settings! Yet the database server could be offline as well!
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

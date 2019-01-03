<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="bothSideNav.ascx.cs" Inherits="OnlineAssessment.sideNav.bothSideNav" %>


               
     <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
     <div class="profile-sidebar">
     <div class="profile-userpic">
     
      <asp:PlaceHolder runat="server" ID="genderPicPlaceholder"></asp:PlaceHolder>

     </div>
     <div class="profile-usertitle">
     <div class="profile-usertitle-name"><asp:Label ID="userName" runat="server" Text=""></asp:Label></div>
         
         
         
        <asp:PlaceHolder runat="server" ID="roleStatusPlaceholder"></asp:PlaceHolder>

     </div>
     <div class="clear"></div>
     </div>
     <div class="divider"></div>
              <asp:PlaceHolder runat="server" ID="roleSideLinksPlaceholder"></asp:PlaceHolder>
 </div>
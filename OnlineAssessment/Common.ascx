<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Common.ascx.cs" Inherits="OnlineAssessment.Common" %>

                                    <ul class="icons">
										<li style="padding: 0 1em 0 0"><a href="Homepage.aspx" style="vertical-align: middle;"><span class="label">Home</span></a></li>
								        <li class="account" style="margin-left:10px;color:#f56a6a;display: inline-block; position: relative;min-width: 50px;text-align: center;vertical-align: middle;padding-left: 0">
                                            <div class="dropdown">
                                                <a href="#" class="dropbtn"><asp:Label ID="account" runat="server" Text="Account" />
                                                <i class="fa fa-caret-down"></i>
                                            </a>
                                            <div class="dropdown-content">
                                                <a href="Login.aspx">Login</a>
                                                <a href="Registration.aspx">Register</a>
                                            </div>
                                            </div> 
								    </li>
                                    </ul>
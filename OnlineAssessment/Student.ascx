<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Student.ascx.cs" Inherits="OnlineAssessment.Student" %>

                                    <ul class="icons">
										<li style="padding: 0 1em 0 0"><a href="StudentPage.aspx" style="vertical-align: middle;"><span class="label">Home</span></a></li>
										<li><a href="SelectAssessment.aspx" style="vertical-align: middle;"><span class="label">Assessment</span></a></li>
                                        <li><a href="ViewAssessment.aspx" style="vertical-align: middle;"><span class="label">Marks</span></a></li>
								        <li class="account" style="margin-left:10px;color:#f56a6a;display: inline-block; position: relative;min-width: 50px;text-align: center;vertical-align: middle;padding-left: 0">
                                            <div class="dropdown">
                                                <a href="#" class="dropbtn"><asp:Label ID="account" runat="server" Text="" />
                                                <i class="fa fa-caret-down"></i>
                                            </a>
                                            <div class="dropdown-content">
                                                <a href="Logout.aspx">Logout</a>
                                            </div>
                                            </div> 
								    </li>
                                    </ul>
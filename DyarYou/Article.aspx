<%@ Page Title="" Language="C#" MasterPageFile="~/DyarUMasterPage.master" AutoEventWireup="true" CodeFile="Article.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div id="content">
               <asp:ListView runat="server" ID="lv_Articles">
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server" id="ItemPlaceHolder"></tr>
                        </table>
                        <asp:DataPager runat="server" ID="DataPager" PageSize="4" style="font-size:20px;">
                          <Fields>
                            <asp:NumericPagerField
                              ButtonCount="5"
                              PreviousPageText="<--"
                              NextPageText="-->"/>
                          </Fields>
                        </asp:DataPager>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr class="box">
                            <td>
                                <asp:Image runat="server" ImageUrl="css/images/post-1.jpg"/>
                                <br />
                                <h1><asp:LinkButton runat="server" Text='<%# Eval("Title") %>' OnClick="Title_Click"/></h1>
                                <br />
                                <p><asp:Label runat="server" Text='<%# Eval("Body") %>' /></p>
                                <p>By: <asp:Label runat="server" Text='<%# Eval("Name") %>' /></p>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
        <%-- For the Comments of the post --%>

                       <asp:ListView runat="server" ID="lv_feedback">
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server" id="ItemPlaceHolder"></tr>
                        </table>

                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr >
                            <td class="box">
                                <%-- Dapat yung Image URL eh dipende sa Account --%>
                                <asp:Image runat="server" ImageUrl="css/images/post-1.jpg"/>
                            
                                <h1><asp:Label runat="server" Text='<%# Eval("Name") %>' OnClick="Person_Click" /></h1>
                                <br />
                                <h2 class="box"><asp:Label runat="server" Text= '<%# Eval("Comment") %>'/></h2>
                                 <h3 style="color:gray">      Date: <%# Eval("dateposted") %> </h3>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            <%-- For Adding Comments --%>

        <table class="box">
            <tr>
                <td class="post" >
                    <%-- Dapat yung Image URL eh dipende sa Account --%>
                    <p style="color: dimgray; font-size: 16px; padding:10px 20px 20px 0px">Post a Comment Here: </p>
                    <p style="font-size:17px;font-weight:bold">
                        <asp:Label runat="server" Text="Posting as: " />
                        <asp:Label runat="server" id="person" Text="ANNON " />
                    </p>
                    </td>
                <td>
                    <asp:TextBox runat="server" ID="tbox_feedbackcontent" Width="200px" Height="100px"></asp:TextBox>
                    <asp:Button runat="server" style=" padding:10px 10px 10px 10px" Text="Post Comment" OnClick="Feedbackpost_Click"
                        />
                </td>
            </tr>
        </table>

        </div>
</asp:Content>


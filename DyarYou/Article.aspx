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
        </div>
</asp:Content>


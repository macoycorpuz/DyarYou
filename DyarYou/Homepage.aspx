<%@ Page Title="" Language="C#" MasterPageFile="~/DyarUMasterPage.master" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div id="content">
          <div class="box">
            <h2><span>TECHNOLOGY</span></h2>
            <div class="cl">&nbsp;</div>
            <div class="posts">
               <asp:ListView runat="server" ID="lv_Technology">
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server" id="itemPlaceHolder"></tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr >
                            <td><asp:Image runat="server" ImageUrl="css/images/post-1.jpg"/></td>
                            <td>
                                <p><asp:LinkButton runat="server" Text='<%# Eval("Title") %>' OnClick="Title_Click" /></p>
                                <p><asp:Label runat="server" Text='<%# Eval("Body") %>' /></p>
                                <p>By: <asp:Label runat="server" Text='<%# Eval("Name") %>' /></p>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
          </div>
          <div class="box">
            <h2><span>ENTERTAINMENT</span></h2>
            <div class="cl">&nbsp;</div>
             <div class="posts">
              <asp:ListView runat="server" ID="lv_Entertainment">
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Image runat="server" ImageUrl="css/images/post-3.jpg"/></td>
                            <td>
                                <p><asp:LinkButton runat="server" Text='<%# Eval("Title") %>' OnClick="Title_Click" /></p>
                                <p><asp:Label runat="server" Text='<%# Eval("Body") %>' /></p>
                                <p>By: <asp:Label runat="server" Text='<%# Eval("Name") %>' /></p>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
          </div>
          <div class="box">
            <h2><span>BUSSINESS</span></h2>
            <div class="cl">&nbsp;</div>
            <div class="posts">
              <asp:ListView runat="server" ID="lv_Bussiness">
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Image runat="server" ImageUrl="css/images/post-5.jpg"/></td>
                            <td>
                                <p><asp:LinkButton runat="server" Text='<%# Eval("Title") %>' OnClick="Title_Click"/></p>
                                <p><asp:Label runat="server" Text='<%# Eval("Body") %>' /></p>
                                <p>By: <asp:Label runat="server" Text='<%# Eval("Name") %>' /></p>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
          </div>
          </div>
          <div class="box">
            <h2><span>SPORTS</span></h2>
            <div class="cl">&nbsp;</div>
            <div class="posts">
              <asp:ListView runat="server" ID="lv_Sports">
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Image runat="server" ImageUrl="css/images/post-1.jpg"/></td>
                            <td>
                                <p><asp:LinkButton runat="server" Text='<%# Eval("Title") %>' OnClick="Title_Click" /></p>
                                <p><asp:Label runat="server" Text='<%# Eval("Body") %>' /></p>
                                <p>By: <asp:Label runat="server" Text='<%# Eval("Name") %>' /></p>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
          </div>
          <div class="cl">&nbsp;</div>
        </div>
</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bookmarks.aspx.cs"
     Inherits="Bookmarks.Web.Bookmarks" MasterPageFile="~/Site.Master" Title="Bookmarks" %>

    <asp:Content ContentPlaceHolderID="ContentPlaceHolderTitle" runat="server">
        <asp:Literal Mode="Encode" ID="LiteralPageTitle" runat="server">Bookmarks</asp:Literal>
        <asp:LoginStatus ID="LoginStatus" runat="server" CssClass="logout" />
    </asp:Content>

    <asp:Content ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
        <asp:ListView ID="ListViewBookmarks" runat="server">
            <ItemTemplate>
                <div class="bookmarkItemBox">
                    <div class="bookmarkTitle"><%# Server.HtmlEncode(Eval("Title").ToString()) %></div>
                    <asp:LinkButton class="bookmarkDeleteBox" ID="LinkButtonDelete" runat="server" 
                        CommandArgument='<%# Eval("BookmarkID") %>' 
                        OnClientClick="javascript: return confirm('Do you really want to delete this bookmark?')"
                        CommandName="DeleteBookmark" OnCommand="LinkButtonDelete_Command">X</asp:LinkButton>
                    <a href="<%# Server.HtmlEncode(Eval("URL").ToString()) %>" class="bookmarkUrl">
                        <%# Server.HtmlEncode(Eval("URL").ToString()) %></a></div>
            </ItemTemplate>
        </asp:ListView>

        <div class="dialogBox newBookmarkBox">
            <div>New Bookmark</div>
            <div>Title: <asp:TextBox ID="TextBoxNewBookmarkTitle" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server"
                     ErrorMessage="Title cannot be empty" EnableClientScript="false" Display="Static" Text="*"
                     ControlToValidate="TextBoxNewBookmarkTitle"></asp:RequiredFieldValidator>
            </div>
            <div>URL: <asp:TextBox ID="TextBoxNewBookmarkUrl" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUrl" runat="server"
                    ErrorMessage="URl cannot be empty" EnableClientScript="false" Display="Static" Text="*"
                    ControlToValidate="TextBoxNewBookmarkUrl"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExxpresionValidatorUrl" runat="server"
                ErrorMessage="Invalid url" EnableClientScript="false" ControlToValidate="TextBoxNewBookmarkUrl"
                Tex="*" Display="Static" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">
            </asp:RegularExpressionValidator>
            </div>
            <asp:Button ID="ButtonNewBookmark" runat="server" Text="Add" OnClick="ButtonNewBookmark_Click" />
        </div>

        <asp:DataPager ID="DataPagerBookmarks" runat="server" PagedControlID="ListViewBookmarks" PageSize="5">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true"
                    ShowLastPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ButtonType="Button" 
                    ShowLastPageButton="true" ShowNextPageButton="true" ShowPreviousPageButton="false"
                    ShowFirstPageButton="false" />
            </Fields>
        </asp:DataPager>
    </asp:Content>
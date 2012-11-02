<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" 
    Inherits="Bookmarks.Web.Login" MasterPageFile="~/Site.Master" Title="Login" %>

  <asp:Content ContentPlaceHolderID="ContentPlaceHolderTitle" runat="server">
            Bookmarks
        </asp:Content>

        <asp:Content ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
        
            <div class="dialogBox">
                <h2>Login</h2>
                <hr />
                <asp:Label ID="UserNameLabelReg" runat="server" AssociatedControlID="TextBoxUserName">User Name:</asp:Label>
                <asp:TextBox ID="TextBoxUserName" runat="server" />
                <asp:Label ID="Label1" runat="server" AssociatedControlID="TextBoxPassword">Password:</asp:Label>
                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" />
                <asp:CheckBox ID="CheckBoxRememberCreddentials" Text="Remember me next time" runat="server" />
                <asp:Button ID="ButtonLogin" runat="server" Text="Log In" OnClick="ButtonLogin_Click" />
                <asp:LinkButton ID="LinkButtonRegister" runat="server" PostBackUrl="~/Register.aspx" Text="Register here" />
            </div>

        </asp:Content>
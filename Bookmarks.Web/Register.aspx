<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" 
    Inherits="Bookmarks.Web.Register" MasterPageFile="~/Site.Master" Title="Register" %>

        <asp:Content ContentPlaceHolderID="ContentPlaceHolderTitle" runat="server">
            Bookmarks
        </asp:Content>

        <asp:Content ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

            <div class="dialogBox">

                <asp:CreateUserWizard ID="CreateUserWizard" runat="server" ContinueDestinationPageUrl="~/Bookmarks.aspx" RequireEmail="False" OnCreatedUser="CreateUserWizard_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        
                        <h2>Registration</h2>
                        <hr />

                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                ErrorMessage="User Name is required." ToolTip="User Name is required."
                                ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                           
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                    ErrorMessage="Password is required." ToolTip="Password is required."
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>


                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:
                        </asp:Label>
                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                        ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required."
                                         ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*
                                    </asp:RequiredFieldValidator>

                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" 
                            ControlToValidate="ConfirmPassword" Display="Dynamic" 
                            ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
              
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" />
            </WizardSteps>
        </asp:CreateUserWizard>
                <asp:LinkButton CssClass="linkButtonToLogin" ID="LinkButtonToLogin" runat="server" PostBackUrl="~/Login.aspx"
                            Text="Login" />
            </div>
    </asp:Content>
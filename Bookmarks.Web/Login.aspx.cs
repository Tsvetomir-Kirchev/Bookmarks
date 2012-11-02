using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Error_Handler_Control;

namespace Bookmarks.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string userName = this.TextBoxUserName.Text;
            string password = this.TextBoxPassword.Text;
            bool rememberCredentials = this.CheckBoxRememberCreddentials.Checked;

            if (Membership.ValidateUser(userName, password))
            {
                FormsAuthentication.RedirectFromLoginPage(userName, rememberCredentials, password);
            }
            else
            {
                ErrorSuccessNotifier.AddErrorMessage("Invalid Login");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookmarks.DB;
using Error_Handler_Control;

namespace Bookmarks.Web
{
    public partial class Bookmarks : System.Web.UI.Page
    {
        private void ExecuteAndHandleErrors(Action action)
        {
            try
            {
                action();
            }
            catch(Exception ex)
            {
                ErrorSuccessNotifier.AddErrorMessage("Error: " + ex.Message);
            }
        }

        protected void Page_Prerender(object sender, EventArgs e)
        {
            ExecuteAndHandleErrors(() => 
                {
                    string currentUserName = User.Identity.Name;
                    this.LiteralPageTitle.Text = "Bookmarks - " + currentUserName;

                    BookmarksEntities context = new BookmarksEntities();
                    var bookmarks =
                        from b in context.Bookmarks
                        where b.aspnet_Users.UserName == currentUserName
                        orderby b.CreationDate descending
                        select b;

                    this.ListViewBookmarks.DataSource = bookmarks;
                    this.ListViewBookmarks.DataBind();
                });
        }

        protected void LinkButtonDelete_Command(object sender, CommandEventArgs e)
        {
            ExecuteAndHandleErrors(() =>
                {
                    var bookmarkId = e.CommandArgument;
                    BookmarksEntities context = new BookmarksEntities();
                    int deletedCount = context.ExecuteStoreCommand("DELETE FROM Bookmarks WHERE BookmarkID={0}",
                        bookmarkId);
                    if (deletedCount == 1)
                    {
                        ErrorSuccessNotifier.AddSuccessMessage("Bookmark #" + bookmarkId + " deleted.");
                    }
                    else
                    {
                        ErrorSuccessNotifier.AddErrorMessage("Cannot delete bookmark #" + bookmarkId + ".");
                    }
                });
        }

        protected void ButtonNewBookmark_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                for (int i = 0; i < Page.Validators.Count; i++)
                {
                    var validator = Page.Validators[i];
                    if (!validator.IsValid)
                    {
                        ErrorSuccessNotifier.AddErrorMessage(validator.ErrorMessage);
                    }
                }
                return;
            }

            ExecuteAndHandleErrors(() =>
                {
                    string title = this.TextBoxNewBookmarkTitle.Text;
                    string url = this.TextBoxNewBookmarkUrl.Text;

                    Bookmark newBookmark = new Bookmark();
                    newBookmark.Title = title;
                    newBookmark.URL = url;
                    newBookmark.CreationDate = DateTime.Now;

                    BookmarksEntities context = new BookmarksEntities();
                    string currentUserName = User.Identity.Name.ToLowerInvariant();
                    var userId =
                        (from u in context.aspnet_Users
                         where u.UserName == currentUserName
                         select u.UserId).First();
                    newBookmark.UserID = userId;

                    context.AddToBookmarks(newBookmark);
                    context.SaveChanges();
                });
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Edit_Roles : System.Web.UI.Page
{
    int pageSize = 5;
int totalUsers;
int totalPages;
int currentPage = 1;
        protected void Page_Load()
        {
          if (!IsPostBack)
          {
            GetUsers();
          }

                    
        }

        protected void seeRolesOf(object sender, EventArgs args)
        {
            string user = test_roles_of.Text;

            string[] roles_array;
            string all_roles_of = "";

            response.Text = "";
            current_roles.Text = "";    

            try
            {
                roles_array = Roles.GetRolesForUser(user);

                for (int i = 0; i < roles_array.Length; i++)
                {
                    all_roles_of = all_roles_of + roles_array[i];
                }

                if (roles_array.Length == 1)
                {
                    current_roles.Text = "Current role of " + user + " is " + all_roles_of;
                }
                else
                    if (roles_array.Length > 1)
                    {
                        current_roles.Text = "Current roles of " + user + " are " + all_roles_of;
                    }
                    else
                        if (roles_array.Length == 0)
                        {
                            current_roles.Text = "There is no user named " + user + ".";
                        }
            }
            catch (Exception ex)
            {
                response.Text = ex.Message;
            }
        }

        private void GetUsers()
        {
          UsersOnlineLabel.Text = Membership.GetNumberOfUsersOnline().ToString();

          UserGrid.DataSource = Membership.GetAllUsers(currentPage-1, pageSize, out totalUsers);
          totalPages = ((totalUsers - 1) / pageSize) + 1;

          // Ensure that we do not navigate past the last page of users.

          if (currentPage > totalPages)
          {
            currentPage = totalPages;
            GetUsers();
            return;
          }

          UserGrid.DataBind();
          CurrentPageLabel.Text = currentPage.ToString();
          TotalPagesLabel.Text = totalPages.ToString();

          if (currentPage == totalPages)
            NextButton.Visible = false;
          else
            NextButton.Visible = true;

          if (currentPage == 1)
            PreviousButton.Visible = false;
          else
            PreviousButton.Visible = true;

          if (totalUsers <= 0)
            NavigationPanel.Visible = false;
          else
            NavigationPanel.Visible = true;
        }

        public void NextButton_OnClick(object sender, EventArgs args)
        {
          currentPage = Convert.ToInt32(CurrentPageLabel.Text);
          currentPage++;
          GetUsers();
        }

        public void PreviousButton_OnClick(object sender, EventArgs args)
        {
          currentPage = Convert.ToInt32(CurrentPageLabel.Text);
          currentPage--;
          GetUsers();
        }

        public void submitNewRole(object sender, EventArgs args)
        {
            string[] roles;

            roles = Roles.GetRolesForUser(user.Text);
            
            response.Text = "";
            current_roles.Text = "";

            try
            {
                for (int i = 0; i < roles.Length; i++)
                {
                    Roles.RemoveUserFromRole(user.Text, roles[i]);
                }
                Roles.AddUserToRole(user.Text, new_role.Text);
                

                response.Text = "Role added !";
            }
            catch (Exception ex)
            {
                response.Text = ex.Message;
            }
        }
            /*
        public void removeRole(object sender, EventArgs args)
        {
            response.Text = "";
            current_roles.Text = "";

            try
            {
                Roles.AddUserToRole(user.Text, "Member");
                Roles.RemoveUserFromRole(user.Text, remove_role.Text);
                response.Text = "Role dropped !";
            }
            catch (Exception ex)
            {
                response.Text = ex.Message;
            }
        } */
}

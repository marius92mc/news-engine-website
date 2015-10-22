using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e) 
    {
        string username = CreateUserWizard1.UserName;
        Roles.AddUserToRole(username, "Member");
    }

    protected void CreateUserWizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e) 
    {
        TextBox TextBoxNume = CreateUserWizard1.FindControl("TextBoxNume") as TextBox;
        if (TextBoxNume != null) {
            Profile.Nume = TextBoxNume.Text;
        }
        TextBox TextBoxPrenume = CreateUserWizard1.FindControl("TextBoxPrenume") as TextBox;
        if (TextBoxPrenume != null) {
            Profile.Prenume = TextBoxPrenume.Text;
        }
        TextBox TextBoxOras = CreateUserWizard1.FindControl("TextBoxOras") as TextBox;
        if (TextBoxOras != null) {
            Profile.Oras = TextBoxOras.Text;
        }

        RadioButtonList RadioButtonListSex = CreateUserWizard1.FindControl("RadioButtonListSex") as RadioButtonList;
        if (RadioButtonListSex != null) {
            Profile.Sex = Int32.Parse(RadioButtonListSex.SelectedValue);
        }

        TextBox TextBoxDataNasterii = CreateUserWizard1.FindControl("TextBoxDataNasterii") as TextBox;
        if (TextBoxDataNasterii != null) {
            Profile.DataNasterii = DateTime.Parse(TextBoxDataNasterii.Text);
        }
    }

    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e) 
    {
        Response.Redirect("~/Default.aspx");
    }
}
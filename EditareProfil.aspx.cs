using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditareProfil : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            // vreau sa completez formul cu ce era in Profile
            TextBox TextBoxNume = LoginViewProfil.FindControl("TextBoxNume") as TextBox;
            if (TextBoxNume != null) {
                TextBoxNume.Text = Profile.Nume;
            }
            TextBox TextBoxPrenume = LoginViewProfil.FindControl("TextBoxPrenume") as TextBox;
            if (TextBoxPrenume != null) {
                TextBoxPrenume.Text = Profile.Prenume;
            }
            TextBox TextBoxOras = LoginViewProfil.FindControl("TextBoxOras") as TextBox;
            if (TextBoxOras != null) {
                TextBoxOras.Text = Profile.Oras;
            }

            RadioButtonList RadioButtonListSex = LoginViewProfil.FindControl("RadioButtonListSex") as RadioButtonList;
            if (RadioButtonListSex != null) {
                RadioButtonListSex.SelectedValue = Profile.Sex.ToString();
            }

            TextBox TextBoxDataNasterii = LoginViewProfil.FindControl("TextBoxDataNasterii") as TextBox;
            if (TextBoxDataNasterii != null &&
                Profile.DataNasterii.Year > DateTime.Now.Year - 100) {
                TextBoxDataNasterii.Text = Profile.DataNasterii.ToShortDateString();
            }



        }
    }


    protected void ButtonSubmit_Click(object sender, EventArgs e) {
        // vreau sa salvez ce am completat in form
        TextBox TextBoxNume = LoginViewProfil.FindControl("TextBoxNume") as TextBox;
        if (TextBoxNume != null) {
            Profile.Nume = TextBoxNume.Text;
        }
        TextBox TextBoxPrenume = LoginViewProfil.FindControl("TextBoxPrenume") as TextBox;
        if (TextBoxPrenume != null) {
            Profile.Prenume = TextBoxPrenume.Text;
        }
        TextBox TextBoxOras = LoginViewProfil.FindControl("TextBoxOras") as TextBox;
        if (TextBoxOras != null) {
            Profile.Oras = TextBoxOras.Text;
        }

        RadioButtonList RadioButtonListSex = LoginViewProfil.FindControl("RadioButtonListSex") as RadioButtonList;
        if (RadioButtonListSex != null) {
            Profile.Sex = Int32.Parse(RadioButtonListSex.SelectedValue);
        }

        TextBox TextBoxDataNasterii = LoginViewProfil.FindControl("TextBoxDataNasterii") as TextBox;
        if (TextBoxDataNasterii != null) {
            Profile.DataNasterii = DateTime.Parse(TextBoxDataNasterii.Text);
        }



    }
}
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

       <link rel="Stylesheet" href="dist/css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>

    <div class="form-group">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        oncreateduser="CreateUserWizard1_CreatedUser" 
        oncontinuebuttonclick="CreateUserWizard1_ContinueButtonClick" 
        onfinishbuttonclick="CreateUserWizard1_FinishButtonClick">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:WizardStep runat="server" Title="Profile">

            <asp:Label ID="LabelPrenume" runat="server" Text="Prenume"> </asp:Label>
                <asp:TextBox ID="TextBoxPrenume" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrenume" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TextBoxPrenume"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="LabelNume" runat="server" Text="Nume"> </asp:Label>
                <asp:TextBox ID="TextBoxNume" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNume" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TextBoxNume"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="LabelSex" runat="server" Text="Sex"> </asp:Label>
                <asp:RadioButtonList ID="RadioButtonListSex" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">F</asp:ListItem>
                    <asp:ListItem Value="1">M</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="LabelDataNasterii" runat="server" Text="Data nasterii"> </asp:Label>
                <asp:TextBox ID="TextBoxDataNasterii" runat="server"></asp:TextBox>  <!-- exemplu 2012-06-18 10:34:09 -->
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDataNasterii" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxDataNasterii"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="LabelOras" runat="server" Text="Oras"> </asp:Label>
                <asp:TextBox ID="TextBoxOras" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorOras" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TextBoxOras"></asp:RequiredFieldValidator>
          
            </asp:WizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
</asp:Content>


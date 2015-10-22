<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditareProfil.aspx.cs" Inherits="EditareProfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" runat="Server"
    Visible="True">

        <link rel="Stylesheet" href="dist/css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>

    <asp:LoginView ID="LoginViewProfil" runat="server">
        <LoggedInTemplate>
            <div class="form-group>
                <asp:Label ID="LabelPrenume" runat="server" Text=""> </asp:Label>
                <asp:TextBox ID="TextBoxPrenume" runat="server"
                             type="email" class="form-control" placeholder="First Name" style="width:200px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrenume" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TextBoxPrenume"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="LabelNume" runat="server" Text=""> </asp:Label>
                <asp:TextBox ID="TextBoxNume" runat="server"
                             type="email" class="form-control" placeholder="Last Name" style="width:200px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNume" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TextBoxNume"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="LabelSex" runat="server" Text=""> </asp:Label>
                <asp:RadioButtonList ID="RadioButtonListSex" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">F</asp:ListItem>
                    <asp:ListItem Value="1">M</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="LabelDataNasterii" runat="server" Text=""> </asp:Label>
                <asp:TextBox ID="TextBoxDataNasterii" runat="server"
                             type="email" class="form-control" placeholder="Birth date" style="width:200px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDataNasterii" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxDataNasterii"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="LabelOras" runat="server" Text=""> </asp:Label>
                <asp:TextBox ID="TextBoxOras" runat="server"
                             type="email" class="form-control" placeholder="City" style="width:200px;" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorOras" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TextBoxOras"></asp:RequiredFieldValidator>
          
                <br />
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" class="btn btn-primary"
                    onclick="ButtonSubmit_Click" />
        </LoggedInTemplate>
        <AnonymousTemplate>
           Nu esti autorizat sa vezi aceasta pagina!
        </AnonymousTemplate>
    </asp:LoginView>
</asp:Content>

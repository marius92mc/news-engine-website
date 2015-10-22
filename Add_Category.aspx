<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Category.aspx.cs" Inherits="Add_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

    <asp:Label ID="label_category" runat="server" Text=""></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="form-group">
                Name of the new category <asp:TextBox ID="Body" runat="server" style="width:200px;"  Rows="1" 
                                                      type="email" class="form-control" placeholder="Body"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="Body field missing !" 
                    Display="Dynamic" ControlToValidate="Body"></asp:RequiredFieldValidator>
                    </div>
            <br />
            <br />
        <asp:Button ID="button_new_article" runat="server" Text="Add" 
            onclick="Insereaza" class="btn btn-success" style="left:200px; position:relative;"/>
                <asp:Literal ID="Raspuns" runat="server"></asp:Literal>

</asp:Content>


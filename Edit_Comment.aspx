<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Edit_Comment.aspx.cs" Inherits="Edit_Comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

    <div class="form-group">
        <asp:TextBox runat="server" ID="comment_box"  Rows="9" TextMode="MultiLine"
                     type="email" class="form-control" placeholder="Body" style="width:400px;"></asp:TextBox>
         <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="Body field missing !" 
                    Display="Dynamic" ControlToValidate="comment_box"></asp:RequiredFieldValidator>
        <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="editComment" class="btn btn-primary" />
            <asp:Literal ID="Raspuns" runat="server"></asp:Literal>
    </div>


</asp:Content>


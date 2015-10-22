<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete_Category.aspx.cs" Inherits="Delete_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

        <div id="confirmare" runat="server">
       Do you want to delete this category ?
       <br />
        <asp:Button ID="ButtonDa" runat="server" Text="Da" onclick="ButtonDa_Click" class="btn btn-danger"/>
        <asp:Button ID="ButtonNu" runat="server" Text="Nu" onclick="ButtonNu_Click" class="btn btn-success"/>
    </div>

    <asp:Literal ID="Raspuns" runat="server"></asp:Literal>


</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete_Proposed_Article.aspx.cs" Inherits="Delete_Proposed_Article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

     <link rel="Stylesheet" href="dist/css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>

    <div id="confirmare" runat="server">
       Do you want to delete the proposed article <asp:Label ID="label_proposed_article" runat="server" Text=""></asp:Label> ?
       <br />
        <asp:Button ID="ButtonDa" runat="server" Text="Da" onclick="ButtonDa_Click" />
        <asp:Button ID="ButtonNu" runat="server" Text="Nu" onclick="ButtonNu_Click" />
    </div>

    <asp:Literal ID="Raspuns" runat="server"></asp:Literal>


</asp:Content>


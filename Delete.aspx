<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

        <link rel="Stylesheet" href="dist/css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>

    <div id="confirmare" runat="server">
       Do you want to delete the article called <asp:Label ID="LabelNumeCarte" runat="server" Text=""></asp:Label> ?
       <br />
        <asp:Button ID="ButtonDa" runat="server" Text="Yes" onclick="ButtonDa_Click" class="btn btn-danger" />
        <asp:Button ID="ButtonNu" runat="server" Text="No" onclick="ButtonNu_Click" class="btn btn-success" />
    </div>

    <asp:Literal ID="Raspuns" runat="server"></asp:Literal>
</asp:Content>


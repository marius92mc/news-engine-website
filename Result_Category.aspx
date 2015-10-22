<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Result_Category.aspx.cs" Inherits="Result_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

    <link rel="Stylesheet" href="dist/css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>

    <div style="/*left:110px;*/ width:90%; position:absolute;">

    <asp:SqlDataSource ID="result_category" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient"
            SelectCommand="SELECT News.ID, News.IMAGE, News.TITLE, News.DESCRIPTION, News.BODY, News.EDITOR, News.DATE, CATEGORII.CATEGORY FROM News INNER JOIN CATEGORII ON News.ID_CATEGORY = CATEGORII.ID">
    </asp:SqlDataSource>

    <asp:GridView ID="GridView_category" 
        runat="server" AllowPaging="true" style="width:100%; position:absolute;" 
        AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="ID"
        DataSourceID="result_category" ShowHeader="true">
        <Columns>
            <asp:ImageField DataImageUrlField="IMAGE" />
            <asp:HyperLinkField DataNavigateUrlFields="ID"
                DataNavigateUrlFormatString="~/Result_Article.aspx?id={0}" 
                DataTextField="TITLE" 
                HeaderText="Title" 
                SortExpression="TITLE"/>
            <asp:BoundField DataField="DESCRIPTION" 
                            HeaderText="Description" 
                            SortExpression="DESCRIPTION"/>
            <asp:BoundField DataField="EDITOR" 
                            HeaderText="Editor" 
                            SortExpression="EDITOR" />
            <asp:BoundField DataField="CATEGORY" 
                            HeaderText="Category" 
                            SortExpression="CATEGORY"/>
            <asp:BoundField DataField="DATE" 
                            HeaderText="Date" 
                            SortExpression="date"/>
        </Columns>
    </asp:GridView>
    
    </div>

</asp:Content>


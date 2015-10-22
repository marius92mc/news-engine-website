<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

        <link rel="Stylesheet" href="dist/css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <div class="container">   
    <asp:SqlDataSource ID="result_search" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient"
             SelectCommand="SELECT News.ID, News.IMAGE, News.TITLE, News.DESCRIPTION, News.EDITOR, News.BODY, News.DATE FROM News" >
    </asp:SqlDataSource>
 
    <asp:Repeater ID = "Repeater1" runat = "server" DataSourceID = "result_search">
<ItemTemplate>
<div class="danger">
	<div class="row clearfix" >
		<div class="col-md-12 column">
			<div class="jumbotron">
                        
                    <image>
                            <img src='<%# DataBinder.Eval(Container.DataItem, "IMAGE") %>' 
                                 runat="server" /> <br />
                    </image>
                    <h2 style="font-family:@Meiryo;">
                            <asp:HyperLink ID="HyperLink1" 
                                           runat="server"  
                                           class="" 
                                           NavigateUrl='<%# "~/Result_Article.aspx?id=" + DataBinder.Eval(Container.DataItem, "ID") %>'>
                                  <%# DataBinder.Eval(Container.DataItem, "TITLE") %>
                            </asp:HyperLink>
                    </h2>

                    <p style="font-size:18px;">
                            <b><%# DataBinder.Eval(Container.DataItem, "DESCRIPTION") %></b>
                    </p>
                    
                    <p style="font-size:12px;">
                            <i>Editor: <%# DataBinder.Eval(Container.DataItem, "EDITOR") %> </i>
                    </p>
                    
                  <%--   <p style="word-wrap:break-word; width:50%; font-size:17px;">
                            <%# DataBinder.Eval(Container.DataItem, "BODY") %>
                    </p> --%>
                    
                    <p style="font-size:12px;">
                            Posted on: <%# DataBinder.Eval(Container.DataItem, "DATE") %>
                    </p>
                
			</div>
		</div>
	</div>
    </div>
    
              </ItemTemplate>           
                

        <SeparatorTemplate>
            <div style="height:2px; width:300px;">
            </div>
         </SeparatorTemplate>
         
    </asp:Repeater>

</div>

</asp:Content>




<%--
         <AlternatingItemTemplate>
            <div style="background:yellow">
                <h4>
                     <%# DataBinder.Eval(Container.DataItem, "TITLE") %> <br /> <%# DataBinder.Eval(Container.DataItem, "DESCRIPTION") %>
                </h4>
                <p>
                      <%# DataBinder.Eval(Container.DataItem, "EDITOR") %>
                </p>
                <p>
                     <%# DataBinder.Eval(Container.DataItem, "BODY") %>
                </p>
                <p>
                     <%# DataBinder.Eval(Container.DataItem, "DATE") %>
                </p>
            </div>
         </AlternatingItemTemplate>
         --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Result_Proposed_Article.aspx.cs" Inherits="Result_Proposed_Article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

    <div class="container">

    <asp:SqlDataSource ID="SqlDataSource_proposed_article" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient"
            SelectCommand="SELECT PROPOSED_ARTICLES.ID, PROPOSED_ARTICLES.USERNAME, PROPOSED_ARTICLES.IMAGE, PROPOSED_ARTICLES.TITLE, PROPOSED_ARTICLES.DESCRIPTION, CATEGORII.CATEGORY, PROPOSED_ARTICLES.BODY, PROPOSED_ARTICLES.DATE, PROPOSED_ARTICLES.STATUS FROM PROPOSED_ARTICLES INNER JOIN CATEGORII ON PROPOSED_ARTICLES.ID_CATEGORY = CATEGORII.ID ORDER BY PROPOSED_ARTICLES.DATE DESC">
    </asp:SqlDataSource>

    <asp:Repeater ID = "Repeater1" runat = "server" DataSourceID = "SqlDataSource_proposed_article">
        <ItemTemplate>
                 <%-- ----------------------------- Article in Collection of News Style ----------------------------------- --%>
                        <section>
                            <div class="danger">
	                            <div class="row clearfix" >
		                            <div class="col-md-12 column">
			                            <div class="jumbotron">
                                            
                                            <p class="text-center" style="font-size:14px;">
                                                Proposed by <i> <%# DataBinder.Eval(Container.DataItem, "USERNAME") %> </i>.
                                            </p>
                                            <img id="Img1" src='<%# DataBinder.Eval(Container.DataItem, "IMAGE") %>' runat="server" />
                                                <br />
                                            <asp:HyperLink ID="HyperLink1" runat="server" class="" 
                                                   NavigateUrl='<%# "~/Result_Proposed_Article.aspx?id=" + DataBinder.Eval(Container.DataItem, "ID") %>'>
                                                <%# DataBinder.Eval(Container.DataItem, "TITLE") %>
                                            </asp:HyperLink>
                                                <br />
                                    
                                            <p class="lead">
                                                <i> <%# DataBinder.Eval(Container.DataItem, "DESCRIPTION") %> </i>
                                            </p>
                                            
                                            <p style="font-size:13px;">
                                                <b> Category: <%# DataBinder.Eval(Container.DataItem, "CATEGORY") %></b>
                                            </p>

                                            <p style="word-wrap:break-word; width:50%; font-size:17px;">
                                                    <%# DataBinder.Eval(Container.DataItem, "BODY") %>
                                             </p>        

                                            <p style="font-size:15px;"> <small> <cite>
                                                <i>Editor: <%# DataBinder.Eval(Container.DataItem, "USERNAME") %> </i>
                                                </cite> </small>
                                            </p>    
                                    
                                            <p class="text-muted text-right" style="font-size:15px;"> 
                                                Posted on: <%# DataBinder.Eval(Container.DataItem, "DATE") %>
                                            </p>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </section>
                 
                 <%-- ----------------------------- /Article in Collection of news Style ----------------------------------- --%>
              </ItemTemplate>
    </asp:Repeater>

    </div>

</asp:Content>


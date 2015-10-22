<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">
        <link rel="Stylesheet" href="dist/css/bootstrap.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="//code.jquery.com/jquery.js"></script>
        <script src="dist/js/bootstrap.min.js"></script>


    <div class="container">        
    
        <asp:Literal ID="Adauga" runat="server"></asp:Literal>   
   
        



            <asp:SqlDataSource ID="SqlDataSource_title_description_editor_date" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            DeleteCommand="DELETE FROM [News] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [News] ([TITLE], [DESCRIPTION], [BODY], [EDITOR], [IMAGE]) VALUES (@TITLE, @DESCRIPTION, @BODY, @EDITOR, @IMAGE)" 
            SelectCommand="SELECT News.ID, News.TITLE, News.DESCRIPTION, News.BODY, News.EDITOR, News.DATE, News.IMAGE, CATEGORII.CATEGORY FROM News INNER JOIN CATEGORII ON News.ID_CATEGORY = CATEGORII.ID ORDER BY News.DATE DESC"
            UpdateCommand="UPDATE [News] SET [TITLE] = @TITLU, [DESCRIPTION] = @DESCRIPTION, [BODY] = @BODY, [EDITOR] = @EDITOR, [IMAGE] = @IMAGE WHERE [ID] = @ID" 
           >
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TITLE" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="BODY" Type="String" />
                <asp:Parameter Name="EDITOR" Type="String" />
                <asp:Parameter Name="IMAGE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TITLE" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="BODY" Type="String" />
                <asp:Parameter Name="EDITOR" Type="String" />
                <asp:Parameter Name="IMAGE" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:LoginView ID="LoginView1" runat="server">
            <%--
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate> 
                        <asp:GridView ID="GridView_Admin" runat="server" style="width:100%; position:absolute;" 
                         AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="ID"
                         DataSourceID="SqlDataSource_title_description_editor_date" ShowHeader="false"
                         AllowPaging="true" pagesize="10"
                         class = "table">
                            <Columns>
                                <asp:ImageField DataImageUrlField="IMAGE" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID"
                               DataNavigateUrlFormatString="~/Result_Article.aspx?id={0}" DataTextField="TITLE" />
                                <asp:BoundField DataField="DESCRIPTION" />
                                <asp:BoundField DataField="EDITOR" />
                                <asp:BoundField DataField="CATEGORY" />
                                <asp:BoundField DataField="Date" />
                               <asp:HyperLinkField DataNavigateUrlFields="ID" 
                                    DataNavigateUrlFormatString="~/Edit.aspx?id={0}" 
                                    Text="Edit" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID" 
                                    DataNavigateUrlFormatString="~/Delete.aspx?id={0}"  
                                    Text="Delete" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
            --%>
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                        <asp:ListView ID="list_view_admin" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource_title_description_editor_date">

                                <ItemTemplate>
                 <%-- ----------------------------- Article in Collection of News Style ----------------------------------- --%>
                        <section>
                            <div class="danger">
	                            <div class="row clearfix" >
		                            <div class="col-md-12 column">
			                            <div class="jumbotron">
                                            
                                            <img src='<%# DataBinder.Eval(Container.DataItem, "IMAGE") %>' runat="server" />
                                                <br />
                                            <asp:HyperLink ID="HyperLink1" runat="server" class="" 
                                                   NavigateUrl='<%# "~/Result_Article.aspx?id=" + DataBinder.Eval(Container.DataItem, "ID") %>'>
                                                <%# DataBinder.Eval(Container.DataItem, "TITLE") %>
                                            </asp:HyperLink>
                                                <br />
                                    
                                            <p class="lead">
                                                <i> <%# DataBinder.Eval(Container.DataItem, "DESCRIPTION") %> </i>
                                            </p>
                                    
                                            <p style="font-size:18px; font-family:Adobe Garamond Pro;"> 
                                                
                                                Category:<b> <%# DataBinder.Eval(Container.DataItem, "CATEGORY") %> </b>     
                                            </p>

                                            <p style="font-size:15px;"> <small> <cite>
                                                <i>Editor: <%# DataBinder.Eval(Container.DataItem, "EDITOR") %> </i>
                                                </cite> </small>
                                            </p>    
                                    
                                            <p class="text-muted text-right" style="font-size:15px;"> 
                                                Posted on: <%# DataBinder.Eval(Container.DataItem, "DATE") %>
                                            </p>
                                            <p>
                                                <asp:Button ID="edit_article_admin" runat="server" class="btn btn-primary" 
                                                        oncommand="editArticle"
                                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Edit" /> 
                                            
                                                <asp:Button ID="delete_article_admin" runat="server" class="btn btn-danger" 
                                                        oncommand="deleteArticle"
                                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Delete" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </section>
                 
                 <%-- ----------------------------- /Article in Collection of news Style ----------------------------------- --%>
                                </ItemTemplate>
                         </asp:ListView>
                         <asp:DataPager runat="server" ID="DataPager"
                                               PagedControlID="list_view_admin"
                                               PageSize="10">
                            <Fields>
                            <asp:NumericPagerField
                                ButtonCount="7"
                                PreviousPageText="<--"
                                NextPageText="-->" />
                            </Fields>
                         </asp:DataPager>                       
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        
        <%--
            <RoleGroups>
                <asp:RoleGroup Roles="Editor">
                    <ContentTemplate>
                        <br />
                        <asp:GridView ID="GridView_Editor" runat="server" AllowPaging="true" style="width:100%; position:absolute;" 
                         AllowSorting="true" pagesize="10" AutoGenerateColumns="false" DataKeyNames="ID"
                         DataSourceID="SqlDataSource_title_description_editor_date" ShowHeader="false">
                            <Columns>
                                <asp:ImageField DataImageUrlField="IMAGE" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID"
                               DataNavigateUrlFormatString="~/Result_Article.aspx?id={0}" DataTextField="TITLE" />
                                <asp:BoundField DataField="DESCRIPTION" />
                                <asp:BoundField DataField="EDITOR" />
                                <asp:BoundField DataField="CATEGORY" />
                                <asp:BoundField DataField="Date" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        --%>

         <RoleGroups>
                <asp:RoleGroup Roles="Editor">
                    <ContentTemplate>
                        <asp:ListView ID="list_view_editor" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource_title_description_editor_date">

                                <ItemTemplate>
                 <%-- ----------------------------- Article in Collection of News Style ----------------------------------- --%>
                        <section>
                            <div class="danger">
	                            <div class="row clearfix" >
		                            <div class="col-md-12 column">
			                            <div class="jumbotron">
                                            
                                            <img src='<%# DataBinder.Eval(Container.DataItem, "IMAGE") %>' runat="server" />
                                                <br />
                                            <asp:HyperLink ID="HyperLink1" runat="server" class="" 
                                                   NavigateUrl='<%# "~/Result_Article.aspx?id=" + DataBinder.Eval(Container.DataItem, "ID") %>'>
                                                <%# DataBinder.Eval(Container.DataItem, "TITLE") %>
                                            </asp:HyperLink>
                                                <br />
                                    
                                            <p class="lead">
                                                <i> <%# DataBinder.Eval(Container.DataItem, "DESCRIPTION") %> </i>
                                            </p>
                                            
                                            <p style="font-size:18px; font-family:Adobe Garamond Pro;"> 
                                                
                                                Category:<b> <%# DataBinder.Eval(Container.DataItem, "CATEGORY") %> </b>     
                                            </p>

                                            <p style="font-size:15px;"> <small> <cite>
                                                <i>Editor: <%# DataBinder.Eval(Container.DataItem, "EDITOR") %> </i>
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
                         </asp:ListView>
                         <asp:DataPager runat="server" ID="DataPager"
                                               PagedControlID="list_view_editor"
                                               PageSize="10">
                            <Fields>
                            <asp:NumericPagerField
                                ButtonCount="7"
                                PreviousPageText="<--"
                                NextPageText="-->" />
                            </Fields>
                         </asp:DataPager>                       
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>


                
             <RoleGroups>
                <asp:RoleGroup Roles="Member">
                    <ContentTemplate>
                        <asp:ListView ID="list_view_member" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource_title_description_editor_date">

                                <ItemTemplate>
                 <%-- ----------------------------- Article in Collection of News Style ----------------------------------- --%>
                        <section>
                            <div class="danger">
	                            <div class="row clearfix" >
		                            <div class="col-md-12 column">
			                            <div class="jumbotron">
                                            
                                            <img src='<%# DataBinder.Eval(Container.DataItem, "IMAGE") %>' runat="server" />
                                                <br />
                                            <asp:HyperLink ID="HyperLink1" runat="server" class="" 
                                                   NavigateUrl='<%# "~/Result_Article.aspx?id=" + DataBinder.Eval(Container.DataItem, "ID") %>'>
                                                <%# DataBinder.Eval(Container.DataItem, "TITLE") %>
                                            </asp:HyperLink>
                                                <br />
                                    
                                            <p class="lead">
                                                <i> <%# DataBinder.Eval(Container.DataItem, "DESCRIPTION") %> </i>
                                            </p>
                                    
                                            <p style="font-size:18px; font-family:Adobe Garamond Pro;"> 
                                                
                                                Category:<b> <%# DataBinder.Eval(Container.DataItem, "CATEGORY") %> </b>     
                                            </p>

                                            <p style="font-size:15px;"> <small> <cite>
                                                <i>Editor: <%# DataBinder.Eval(Container.DataItem, "EDITOR") %> </i>
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
                         </asp:ListView>
                         <asp:DataPager runat="server" ID="DataPager"
                                               PagedControlID="list_view_member"
                                               PageSize="10">
                            <Fields>
                            <asp:NumericPagerField
                                ButtonCount="7"
                                PreviousPageText="<--"
                                NextPageText="-->" />
                            </Fields>
                         </asp:DataPager>                       
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        
        </asp:LoginView>

        <!-- AnonymousTemplate for a non LogedIn User  -->
       <asp:Panel ID="panel_nonLogedIn" runat="server" Visible="true">

        <asp:LoginView ID="LoginView3" runat="server">
                    <AnonymousTemplate>
                         <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                        <asp:ListView ID="list_view_user" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource_title_description_editor_date">

                                <ItemTemplate>
                 <%-- ----------------------------- Article in Collection of News Style ----------------------------------- --%>
                        <section>
                            <div class="danger">
	                            <div class="row clearfix" >
		                            <div class="col-md-12 column">
			                            <div class="jumbotron">
                                            
                                            <img id="Img1" src='<%# DataBinder.Eval(Container.DataItem, "IMAGE") %>' runat="server" />
                                                <br />
                                            <asp:HyperLink ID="HyperLink1" runat="server" class="" 
                                                   NavigateUrl='<%# "~/Result_Article.aspx?id=" + DataBinder.Eval(Container.DataItem, "ID") %>'>
                                                <%# DataBinder.Eval(Container.DataItem, "TITLE") %>
                                            </asp:HyperLink>
                                                <br />
                                    
                                            <p class="lead">
                                                <i> <%# DataBinder.Eval(Container.DataItem, "DESCRIPTION") %> </i>
                                            </p>
                                            
                                            <p style="font-size:18px; font-family:Adobe Garamond Pro;"> 
                                                
                                                Category:<b> <%# DataBinder.Eval(Container.DataItem, "CATEGORY") %> </b>     
                                            </p>

                                            <p style="font-size:15px;"> <small> <cite>
                                                <i>Editor: <%# DataBinder.Eval(Container.DataItem, "EDITOR") %> </i>
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
                         </asp:ListView>
                         <asp:DataPager runat="server" ID="DataPager"
                                               PagedControlID="list_view_user"
                                               PageSize="10">
                            <Fields>
                            <asp:NumericPagerField
                                ButtonCount="7"
                                PreviousPageText="<--"
                                NextPageText="-->" />
                            </Fields>
                         </asp:DataPager>                       
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
                        
                    </AnonymousTemplate>
           </asp:LoginView>
    </asp:Panel>

            <!-- /AnonymousTemplate for a non LogedIn User  -->
    </div>

  </asp:Content>  
  


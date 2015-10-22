<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Propose_Article.aspx.cs" Inherits="Propose_Article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

    <div class="container">

    <asp:Literal ID="Adauga" runat="server"></asp:Literal>
    
    <!--
    <div id="categories" style="left:-30px; position:absolute;">
      
             <menu>
                <asp:SqlDataSource ID="SqlDataSource_menu" runat="server" 
                    ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True" 
                    ProviderName="System.Data.SqlClient"
                    SelectCommand="SELECT CATEGORII.ID, CATEGORII.CATEGORY FROM CATEGORII">
                </asp:SqlDataSource>

                <asp:GridView ID="GridView_menu" runat="server" AllowPaging="true" style="width:100%; position:absolute;" 
                         AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="ID"
                         DataSourceID="SqlDataSource_menu" ShowHeader="false"
                         class = "table">
                            <Columns>
                                <asp:HyperLinkField DataNavigateUrlFields="ID"
                                 DataNavigateUrlFormatString="~/Result_Category.aspx?id_category={0}" 
                                 DataTextField="CATEGORY" />
                            </Columns>
                </asp:GridView>

             </menu>
        
        </div>
        
        -->    
        

            


            <asp:SqlDataSource ID="SqlDataSource_propose_article" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            DeleteCommand="DELETE FROM [PROPOSED_ARTICLES] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [PROPOSED_ARTICLES] ([USERNAME], [IMAGE], [TITLE], [DESCRIPTION], [ID_CATEGORY], [BODY], [DATE], [STATUS]) VALUES (@USERNAME, @IMAGE, @TITLE, @DESCRIPTION, @ID_CATEGORY, @BODY, @DATE, @STATUS)" 
            SelectCommand="SELECT PROPOSED_ARTICLES.ID, PROPOSED_ARTICLES.USERNAME, PROPOSED_ARTICLES.IMAGE, PROPOSED_ARTICLES.TITLE, PROPOSED_ARTICLES.DESCRIPTION, CATEGORII.CATEGORY, PROPOSED_ARTICLES.BODY, PROPOSED_ARTICLES.DATE, PROPOSED_ARTICLES.STATUS FROM PROPOSED_ARTICLES INNER JOIN CATEGORII ON PROPOSED_ARTICLES.ID_CATEGORY = CATEGORII.ID ORDER BY PROPOSED_ARTICLES.DATE DESC"
            >
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="IMAGE" Type="String" />
                <asp:Parameter Name="TITLE" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="BODY" Type="String" />
                <asp:Parameter Name="STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="IMAGE" Type="String" />
                <asp:Parameter Name="TITLE" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="BODY" Type="String" />
                <asp:Parameter Name="STATUS" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:LoginView ID="LoginView1" runat="server">
            <%--
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate> 
                        <asp:GridView ID="GridView_Admin" runat="server" style="width:100%; position:absolute;" 
                         AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="ID"
                         DataSourceID="SqlDataSource_propose_article" ShowHeader="true"
                         AllowPaging="true" pagesize="100"
                         class = "table">
                            <Columns>
                                <asp:BoundField DataField="USERNAME" />
                                <asp:ImageField DataImageUrlField="IMAGE" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID"
                               DataNavigateUrlFormatString="~/Result_Proposed_Article.aspx?id={0}" DataTextField="TITLE" />
                                <asp:BoundField DataField="DESCRIPTION" />
                                <asp:BoundField DataField="CATEGORY" /> 
                                <asp:BoundField DataField="DATE" />
                                <asp:BoundField DataField="STATUS" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID"
                                    DataNavigateUrlFormatString="~/Add_Proposed_Article.aspx?id={0}"
                                    Text="Add" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID" 
                                    DataNavigateUrlFormatString="~/Delete_Proposed_Article.aspx?id={0}"  
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
                        <asp:ListView ID="list_view_admin" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource_propose_article">

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
                                            <img src='<%# DataBinder.Eval(Container.DataItem, "IMAGE") %>' runat="server" />
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

                                            <p style="font-size:15px;"> <small> <cite>
                                                <i>Editor: <%# DataBinder.Eval(Container.DataItem, "USERNAME") %> </i>
                                                </cite> </small>
                                            </p>    
                                    
                                            <p style="font-size:13px;">
                                                Status: pending...
                                            </p>
                                            <p class="text-muted text-right" style="font-size:15px;"> 
                                                Posted on: <%# DataBinder.Eval(Container.DataItem, "DATE") %>
                                            </p>
                                            <p>
                                                <asp:Button ID="add_proposed_article_admin" runat="server" class="btn btn-success" 
                                                        oncommand="addProposedArticle"
                                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Add" /> 
                                            
                                                <asp:Button ID="delete_proposed_article_admin" runat="server" class="btn btn-danger" 
                                                        oncommand="deleteProposedArticle"
                                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Remove" />
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




            
        </asp:LoginView>
            






<asp:Panel ID="panel_LogedIn" runat="server" Visible="true">


            <form role="form">
                
                <asp:FileUpload id="FileUploadControl" runat="server" />
                
                <br />
                <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
                <br />

            <!-- ---------------------------------------------------------------------------------------- -->
             <div class="form-group">
                <asp:Label ID="label_title" runat="server" for="exampleInputEmail1" >  </asp:Label>
                <asp:TextBox ID="Title" runat="server" Columns="39" style="width:550px;"
                            type="email" class="form-control" placeholder="Enter title"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title field missing !" 
                    Display="Dynamic" ControlToValidate="Title"></asp:RequiredFieldValidator>
  
             </div>
            <!-- ---------------------------------------------------------------------------------------- --> 
             <div class="form-group">
                <asp:Label ID="label_description" runat="server" Text="" for="exampleInputEmail1"></asp:Label>
                <asp:TextBox ID="Description" runat="server" style="width:550px;" TextMode="MultiLine" Rows="4"
                             type="email" class="form-control" placeholder="Enter description"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description field missing !" 
                    Display="Dynamic" ControlToValidate="Description"></asp:RequiredFieldValidator>
  
            </div>
            <!-- ---------------------------------------------------------------------------------------- -->
              <div class="form-group">
                <asp:Label ID="label_editor" runat="server" Text="" for="exampleInputEmail1"></asp:Label>
                <asp:TextBox ID="Editor" runat="server" style="width:550px;"
                             type="email" class="form-control" placeholder="Editor"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator7" runat="server" ErrorMessage="Editor field missing !" 
                    Display="Dynamic" ControlToValidate="Description"></asp:RequiredFieldValidator>
              </div>
            <!-- ---------------------------------------------------------------------------------------- -->
            
                <asp:Label ID="label_category" runat="server" Text="Category"></asp:Label>
            
                <asp:SqlDataSource ID="SqlDataSource_category" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [ID], [CATEGORY] FROM [CATEGORII]">
                </asp:SqlDataSource>
                    &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="Category" runat="server" 
            DataSourceID="SqlDataSource_category" DataTextField="CATEGORY" DataValueField="ID">
                    
                    <asp:ListItem Text="Please Select an item" Value ="-1"></asp:ListItem>

                </asp:DropDownList>

                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="Category field missing !"
                    Display="Dynamic" ControlToValidate="Category"></asp:RequiredFieldValidator>

             <!-- ---------------------------------------------------------------------------------------- -->
              <div class="form-group">
                <asp:Label ID="label_body" runat="server" Text="" for="exampleInputEmail1"></asp:Label>
                <asp:TextBox ID="Body" runat="server" style="width:550px;" Textmode="MultiLine" Rows="10"
                             type="email" class="form-control" placeholder="Body"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="Body field missing !" 
                    Display="Dynamic" ControlToValidate="Body"></asp:RequiredFieldValidator>
              </div>
             <!-- ---------------------------------------------------------------------------------------- -->
     



      
                 <asp:Button ID="button_new_article" runat="server" Text="Add" class="btn btn-primary"
            onclick="Insereaza" />
                <asp:Literal ID="Raspuns" runat="server"></asp:Literal>
                    <br /> <br /> <br />
        </asp:Panel>   
            
        </form>


                        <%--
                        
             <asp:FileUpload ID="FileUploadControl" runat="server" />
                
                <br />
                <asp:Label runat="server" ID="StatusLabel" text="Upload status: " />
                <br />

            <!-- ---------------------------------------------------------------------------------------- -->
                <asp:Label ID="label_title" runat="server" Text="Title"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Title" runat="server" Columns="39"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title field missing !" 
                    Display="Dynamic" ControlToValidate="Title"></asp:RequiredFieldValidator>
  
             <br>
            <!-- ---------------------------------------------------------------------------------------- --> 
                <asp:Label ID="label_description" runat="server" Text="Description"></asp:Label>
                <asp:TextBox ID="Description" runat="server" Columns="39" TextMode="MultiLine" Rows="3"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description field missing !" 
                    Display="Dynamic" ControlToValidate="Description"></asp:RequiredFieldValidator>
  

            <br>
            <!-- ---------------------------------------------------------------------------------------- -->
                <asp:Label ID="label_category" runat="server" Text="Category"></asp:Label>
        
                <asp:SqlDataSource ID="SqlDataSource_category" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [ID], [CATEGORY] FROM [CATEGORII]">
                </asp:SqlDataSource>
                    &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="Category" runat="server" 
            DataSourceID="SqlDataSource_category" DataTextField="CATEGORY" DataValueField="ID">
                </asp:DropDownList>

                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="Category field missing !"
                    Display="Dynamic" ControlToValidate="Category"></asp:RequiredFieldValidator>

             </br>
             <!-- ---------------------------------------------------------------------------------------- -->


                <asp:Label ID="label_body" runat="server" Text="Body"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Body" runat="server" Columns="70" Textmode="MultiLine" Rows="8"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="Body field missing !" 
                    Display="Dynamic" ControlToValidate="Body"></asp:RequiredFieldValidator>
  
             <br />
             <!-- ---------------------------------------------------------------------------------------- -->
     
      
                 <asp:Button ID="button_new_article" runat="server" Text="Adauga" 
            onclick="Insereaza" />
                <asp:Literal ID="Raspuns" runat="server"></asp:Literal>

                    



            </asp:Panel>

            --%>
    </div>

  </asp:Content>  
  



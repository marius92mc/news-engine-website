<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Result_Article.aspx.cs" Inherits="Result_Article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

        <link rel="Stylesheet" href="dist/css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    
    <asp:SqlDataSource ID="result_search" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient"
            SelectCommand="SELECT News.ID, News.IMAGE, News.TITLE, News.DESCRIPTION, News.EDITOR, News.BODY, News.DATE FROM News">
    </asp:SqlDataSource>

    
    <div class="container">


    <div class="danger">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
                <asp:Repeater ID = "Repeater1" runat = "server" DataSourceID = "result_search">
                    <ItemTemplate>
                        <div class="media">
                            <p>
                                    <img id="Img1" src='<%# DataBinder.Eval(Container.DataItem, "IMAGE") %>' runat="server" /> <br />
                            </p>
                            <h2 style="font-family:@Meiryo;">
                                    <%# DataBinder.Eval(Container.DataItem, "TITLE") %> 
                            </h2>
                            <p style="font-size:18px;">
                                    <b><%# DataBinder.Eval(Container.DataItem, "DESCRIPTION") %></b>
                            </p>
                            <p style="font-size:12px;">
                                    <i>Editor: <%# DataBinder.Eval(Container.DataItem, "EDITOR") %> </i>
                            </p>
                            <p style="word-wrap:break-word; width:50%; font-size:17px;">
                                    <%# DataBinder.Eval(Container.DataItem, "BODY") %>
                            </p>
                            <p style="font-size:12px;">
                                    Posted on: <%# DataBinder.Eval(Container.DataItem, "DATE") %>
                            </p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </p>
				
			</div>
		</div>
	</div>














       
       <br /> <br />
       <!--               COMMENTARIES                 -->



       <asp:Panel ID="panel_loggedin_commentaries" runat="server" Visible="false">

                        <!-- insert comment area  -->
    <div class="form-group">
       <asp:TextBox runat="server" ID="comment_box" style="width:550px;" Rows="9" TextMode="MultiLine"
                    type="email" class="form-control" placeholder="Body"></asp:TextBox>
        <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="Body field missing !" 
                    Display="Dynamic" ControlToValidate="comment_box"></asp:RequiredFieldValidator>
       <asp:Button runat="server" Text="Post comment" class="btn btn-primary" OnClick="postComment" />
                <asp:Literal ID="Raspuns" runat="server"></asp:Literal>

    </div>
                        <!-- /insert comment area -->

    

            <asp:SqlDataSource ID="SqlDataSource_commentaries" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            DeleteCommand="DELETE FROM [COMMENTS] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [COMMENTS] ([USERNAME], [COMMENT], [ID_NEWS]) VALUES (@USERNAME, @COMMENT, @ID_NEWS)" 
            >
            
            </asp:SqlDataSource>
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="COMMENT" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                            <asp:Parameter Name="COMMENT" Type="String" />
</UpdateParameters>
        </asp:SqlDataSource>


        <asp:LoginView ID="LoginView1" runat="server">
        
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                    
                            <asp:Repeater ID = "Repeater1" runat = "server" DataSourceID = "SqlDataSource_commentaries">
<ItemTemplate>
<div class="danger">
	<div class="row clearfix" >
		<div class="col-md-12 column">
			<div class="jumbotron">
                      

                    <p style="font-size:18px;">
                            <b><%# DataBinder.Eval(Container.DataItem, "USERNAME") %></b>
                    </p>
                    
                    <p style="font-size:14px;" class="text-right">
                            <i> <%# DataBinder.Eval(Container.DataItem, "DATE") %> </i>
                    </p>
                    
                  <%--   <p style="word-wrap:break-word; width:50%; font-size:17px;">
                            <%# DataBinder.Eval(Container.DataItem, "BODY") %>
                    </p> --%>
                    
                    <p style="font-size:13px;">
                             <%# DataBinder.Eval(Container.DataItem, "COMMENT") %>
                    </p>

                    <p>
                        <asp:Button ID="edit_comment" runat="server" class="btn btn-success" 
                                oncommand="editComment"  CausesValidation="false"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Edit" /> 
                                            
                        <asp:Button ID="remove_comment" runat="server" class="btn btn-danger" 
                                oncommand="deleteComment" CausesValidation="false"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Delete" />
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
                    
                    
                    
                     
                        <%--<asp:GridView ID="GridView_Admin" runat="server" style="width:100%; position:relative;" 
                         AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="ID"
                         DataSourceID="SqlDataSource_commentaries" ShowHeader="false"
                         AllowPaging="false"
                         class = "table">
                            <Columns>
                                <asp:BoundField DataField="USERNAME" />
                                <asp:BoundField DataField="DATE" />
                                <asp:BoundField DataField="COMMENT" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID,ID_NEWS"
                                    DataNavigateUrlFormatString="~/Edit_Comment.aspx?id={0}&id_news={1}" Text="Edit" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID,ID_NEWS" 
                                    DataNavigateUrlFormatString="~/Delete_Comment.aspx?id={0}&id_news={1}"  
                                    Text="Delete" />
                            </Columns>
                        </asp:GridView> --%>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>

        
            <RoleGroups>
            <asp:RoleGroup Roles="Editor">
                    <ContentTemplate>
                    
                            <asp:Repeater ID = "Repeater1" runat = "server" DataSourceID = "SqlDataSource_commentaries">
<ItemTemplate>
<div class="danger">
	<div class="row clearfix" >
		<div class="col-md-12 column">
			<div class="jumbotron">
                      

                    <p style="font-size:18px;">
                            <b><%# DataBinder.Eval(Container.DataItem, "USERNAME") %></b>
                    </p>
                    
                    <p style="font-size:14px;" class="text-right">
                            <i> <%# DataBinder.Eval(Container.DataItem, "DATE") %> </i>
                    </p>
                    
                  <%--   <p style="word-wrap:break-word; width:50%; font-size:17px;">
                            <%# DataBinder.Eval(Container.DataItem, "BODY") %>
                    </p> --%>
                    
                    <p style="font-size:13px;">
                             <%# DataBinder.Eval(Container.DataItem, "COMMENT") %>
                    </p>

                    <p>
                        <asp:Button ID="edit_comment" runat="server" class="btn btn-success" 
                                oncommand="editComment" CausesValidation="false"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Edit" /> 
                    </p> <%--                              
                        <asp:Button ID="remove_comment" runat="server" class="btn btn-danger" 
                                oncommand="deleteComment"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Delete" />
                     </p>
                --%>
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

    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>


        <RoleGroups>
                
            <asp:RoleGroup Roles="Member">
                    <ContentTemplate>
                    
                            <asp:Repeater ID = "Repeater1" runat = "server" DataSourceID = "SqlDataSource_commentaries">
<ItemTemplate>
<div class="danger">
	<div class="row clearfix" >
		<div class="col-md-12 column">
			<div class="jumbotron">
                      

                    <p style="font-size:18px;">
                            <b><%# DataBinder.Eval(Container.DataItem, "USERNAME") %></b>
                    </p>
                    
                    <p style="font-size:14px;" class="text-right">
                            <i> <%# DataBinder.Eval(Container.DataItem, "DATE") %> </i>
                    </p>
                    
                  <%--   <p style="word-wrap:break-word; width:50%; font-size:17px;">
                            <%# DataBinder.Eval(Container.DataItem, "BODY") %>
                    </p> --%>
                    
                    <p style="font-size:13px;">
                             <%# DataBinder.Eval(Container.DataItem, "COMMENT") %>
                    </p>

                <%--   <p>
                        <asp:Button ID="edit_comment" runat="server" class="btn btn-success" 
                                oncommand="editComment"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Edit" /> 
                                            
                        <asp:Button ID="remove_comment" runat="server" class="btn btn-danger" 
                                oncommand="deleteComment"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Text="Delete" />
                     </p>
                --%>
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
        
        </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>

        </asp:LoginView>

    </asp:Panel>
    </div>

    

</asp:Content>


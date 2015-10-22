<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Insert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

        <link rel="Stylesheet" href="dist/css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>

    <div class="container">
        
                <div class="row">
          <div class="col-lg-6" style="width:630px;">
            <div class="well">

        <form class="bs-example form-horizontal">
         <asp:Panel ID="panel_LogedIn" runat="server" Visible="true">
            
            <form role="form">
                
                <asp:FileUpload id="FileUploadControl" runat="server" />
                
                <asp:Label runat="server" id="StatusLabel" text="" />
                

            <!-- ---------------------------------------------------------------------------------------- -->
             <div class="form-group">
                <asp:Label ID="label_title" runat="server" for="exampleInputEmail1" >  </asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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

                <br /> <br />
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
    </div>
    </div>
       </div>
    </div>
    
</asp:Content>


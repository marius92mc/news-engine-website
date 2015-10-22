<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

        <link rel="Stylesheet" href="dist/css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>

     <asp:Panel ID="panel_LogedIn" runat="server" Visible="true">
            

            <asp:FileUpload id="FileUploadControl" runat="server" />
                
                <br />
                <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
                <br />
        <div class="form-group">
           <!-- ---------------------------------------------------------------------------------------- -->
            <asp:Label ID="label_title" runat="server" Text="Title"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Title" runat="server" type="email" class="form-control" placeholder="Body" style="width:400px;"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title field missing !" 
                    Display="Dynamic" ControlToValidate="Title"></asp:RequiredFieldValidator>
  
             <br>
            <!-- ---------------------------------------------------------------------------------------- --> 
                <asp:Label ID="label_description" runat="server" Text="Description"></asp:Label>
                <asp:TextBox ID="Description" runat="server" Columns="39" TextMode="MultiLine" Rows="3" type="email" class="form-control" placeholder="Body" style="width:400px;"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description field missing !" 
                    Display="Dynamic" ControlToValidate="Description"></asp:RequiredFieldValidator>
  
  
            <br>
            <!-- ---------------------------------------------------------------------------------------- -->
                <asp:Label ID="label_editor" runat="server" Text="Editor"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Editor" runat="server" Columns="39" type="email" class="form-control" placeholder="Body" style="width:400px;"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator7" runat="server" ErrorMessage="Editor field missing !" 
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
                <asp:TextBox ID="Body" runat="server" Textmode="MultiLine" Rows="8" type="email" class="form-control" placeholder="Body" style="width:400px;"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="Body field missing !" 
                    Display="Dynamic" ControlToValidate="Body"></asp:RequiredFieldValidator>
  
             <br />
             <!-- ---------------------------------------------------------------------------------------- -->
     </div>
      
                 <asp:Button ID="button_edit_article" runat="server" Text="Edit" class="btn btn-primary"
            onclick="Editeaza" />
                <asp:Literal ID="Raspuns" runat="server"></asp:Literal>
                <br /><br /><br />
        </asp:Panel>   
    
</asp:Content>


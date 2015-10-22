<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Edit_Roles.aspx.cs" Inherits="Edit_Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">
   <div class="form-group">
    <asp:Label ID="response" runat="server"></asp:Label>
    <br />
    
    <p>
        <asp:TextBox ID="test_roles_of" runat="server" type="email" 
                                   class="form-control" placeholder="See roles for"
                                   style="width:200px;"></asp:TextBox>
        <asp:Button ID="see_roles" runat="server" OnClick="seeRolesOf" Text="Display roles" class="btn btn-primary" />
        &nbsp; &nbsp;
        <asp:Label ID="current_roles" runat="server"></asp:Label>

        <div style="top:37%; position:relative">
        
        <asp:TextBox ID="user" runat="server" type="email" 
                     class="form-control" placeholder="User"
                     style="width:200px;"></asp:TextBox>
        </div>
    
     
        <asp:TextBox ID="new_role" runat="server" 
                     type="email" class="form-control" placeholder="New role"
                     style="width:200px;"></asp:TextBox>
        <asp:Button ID="submit_new_role" runat="server" Text="Submit" OnClick="submitNewRole" class="btn btn-success" />
    
    <%--
    <div style="left:13%; top:45%; position:relative;" >
     Remove role
        <asp:TextBox ID="remove_role" runat="server"></asp:TextBox>
        <asp:Button ID="submit_remove_role" runat="server" Text="Remove role" OnClick="removeRole" />
    </div> --%>
    </p>
    

   </div>
    <h3>User List</h3>

  Number of Users Online: <asp:Label id="UsersOnlineLabel" runat="Server" /><br />

  <asp:Panel id="NavigationPanel" Visible="false" runat="server">
    <table border="0" cellpadding="3" cellspacing="3">
      <tr>
        <td style="width:100">Page <asp:Label id="CurrentPageLabel" runat="server" />
            of <asp:Label id="TotalPagesLabel" runat="server" /></td>
        <td style="width:60"><asp:LinkButton id="PreviousButton" Text="< Prev"
                            OnClick="PreviousButton_OnClick" runat="server" /></td>
        <td style="width:60"><asp:LinkButton id="NextButton" Text="Next >"
                            OnClick="NextButton_OnClick" runat="server" /></td>
      </tr>
    </table>
  </asp:Panel>

  <asp:DataGrid id="UserGrid" runat="server"
                CellPadding="2" CellSpacing="1"
                Gridlines="Both">
    <HeaderStyle BackColor="darkblue" ForeColor="white" />
  </asp:DataGrid>







</asp:Content>


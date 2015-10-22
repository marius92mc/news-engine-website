<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceholder" Runat="Server">

    <asp:Literal ID="Adauga" runat="server"></asp:Literal> 



    <div style="/*left:110px;*/ width:90%; position:absolute; left:40%;">

            <asp:Button ID="add_article" runat="server" class="btn btn-success" Text="Add category" OnClick="addCategory"
                        CausesValidation="false" />
            <br /> <br />
            <asp:SqlDataSource ID="SqlDataSource_categories" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            DeleteCommand="DELETE FROM [CATEGORII] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [CATEGORII] ([CATEGORY]) VALUES (@CATEGORY)" 
            SelectCommand="SELECT ID, CATEGORY FROM CATEGORII"
            UpdateCommand="UPDATE [CATEGORII] SET [CATEGORY] = @CATEGORY" 
           >
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CATEGORY" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CATEGORY" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:LoginView ID="LoginView1" runat="server">
        
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate> 
                        <asp:GridView ID="GridView_Admin" runat="server" style="width:20%; position:absolute;" 
                         AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="ID"
                         DataSourceID="SqlDataSource_categories" ShowHeader="true"
                         AllowPaging="true" pagesize="100"
                         class = "table">
                            <Columns>
                                <asp:BoundField DataField="CATEGORY" HeaderText="CATEGORY" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID" 
                                    DataNavigateUrlFormatString="~/Delete_Category.aspx?id={0}"  
                                    Text="Delete" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>

        
            

        </asp:LoginView>
        
    </div>
    <br /><br />
    
</asp:Content>


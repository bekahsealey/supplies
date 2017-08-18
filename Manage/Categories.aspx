<%@ Page Title="Manage Categories" Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Manage_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:GridView ID="CategoryGridView" runat="server" AllowPaging="True" 
  AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
  DataSourceID="SqlDataSource1" 
  EmptyDataText="There are no data records to display." PageSize="25">
  <Columns>
    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
      ShowSelectButton="True" />
    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
  </Columns>
</asp:GridView>
<asp:DetailsView ID="AddCategory" runat="server" AutoGenerateRows="False" 
  DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
  Height="50px" Width="125px">
  <Fields>
    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
      ReadOnly="True" SortExpression="ID" />
    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
    <asp:CommandField ShowInsertButton="True" />
  </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
  ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
  DeleteCommand="DELETE FROM [CATEGORY] WHERE [ID] = @ID" 
  InsertCommand="INSERT INTO [CATEGORY] ([NAME]) VALUES (@NAME)" 
  ProviderName="<%$ ConnectionStrings:SuppliesConnectionString1.ProviderName %>" 
  SelectCommand="SELECT [ID], [NAME] FROM [CATEGORY]" 
  UpdateCommand="UPDATE [CATEGORY] SET [NAME] = @NAME WHERE [ID] = @ID">
  <DeleteParameters>
    <asp:Parameter Name="ID" Type="Int32" />
  </DeleteParameters>
  <InsertParameters>
    <asp:Parameter Name="NAME" Type="String" />
  </InsertParameters>
  <UpdateParameters>
    <asp:Parameter Name="NAME" Type="String" />
    <asp:Parameter Name="ID" Type="Int32" />
  </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>


<%@ Page Title="Manage Supplies" Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="Supplies.aspx.cs" Inherits="Manage_Supplies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:GridView ID="SuppliesGridView" runat="server" AutoGenerateColumns="False" 
  DataKeyNames="ID" DataSourceID="SqlDataSource1" 
  EmptyDataText="There are no data records to display." AllowPaging="True" 
    AllowSorting="True" PageSize="25">
  <Columns>
    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
      ShowSelectButton="True" />
    <asp:BoundField DataField="ITEM" HeaderText="ITEM" SortExpression="ITEM" />
    <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
      SortExpression="DESCRIPTION" />
  </Columns>
</asp:GridView>
  <h3>Add a New Supply Item:</h3>
  <asp:DetailsView ID="AddSupply" runat="server" AutoGenerateRows="False" 
    DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
    Height="50px" Width="125px">
    <Fields>
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
        ReadOnly="True" SortExpression="ID" />
      <asp:BoundField DataField="ITEM" HeaderText="ITEM" SortExpression="ITEM" />
      <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
        SortExpression="DESCRIPTION" />
      <asp:CommandField ShowInsertButton="True" />
    </Fields>
  </asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
  ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
  DeleteCommand="DELETE FROM [SUPPLY] WHERE [ID] = @ID" 
  InsertCommand="INSERT INTO [SUPPLY] ([ITEM], [DESCRIPTION]) VALUES (@ITEM, @DESCRIPTION)" 
  SelectCommand="SELECT [ID], [ITEM], [DESCRIPTION] FROM [SUPPLY] ORDER BY [ITEM], [DESCRIPTION]" 
  
    UpdateCommand="UPDATE [SUPPLY] SET [ITEM] = @ITEM, [DESCRIPTION] = @DESCRIPTION WHERE [ID] = @ID">
  <DeleteParameters>
    <asp:Parameter Name="ID" Type="Int32" />
  </DeleteParameters>
  <InsertParameters>
    <asp:Parameter Name="ITEM" Type="String" />
    <asp:Parameter Name="DESCRIPTION" Type="String" />
  </InsertParameters>
  <UpdateParameters>
    <asp:Parameter Name="ITEM" Type="String" />
    <asp:Parameter Name="DESCRIPTION" Type="String" />
    <asp:Parameter Name="ID" Type="Int32" />
  </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>


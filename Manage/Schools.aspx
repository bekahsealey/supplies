<%@ Page Title="Manage Schools" Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="Schools.aspx.cs" Inherits="Manage_Schools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:GridView ID="SchoolsGridView" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
    DataSourceID="SqlDataSource1" 
    EmptyDataText="There are no data records to display." PageSize="25">
    <Columns>
      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
        ShowSelectButton="True" />
      <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
      <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
      <asp:BoundField DataField="STATE" HeaderText="STATE" SortExpression="STATE" />
      <asp:HyperLinkField DataNavigateUrlFields="ID" 
        DataNavigateUrlFormatString="AddEditSchoolGrades.aspx?SID={0}" 
        HeaderText="GRADES" Text="View or Edit Grades" />
    </Columns>
  </asp:GridView>
  <h3>Add a New School:</h3>
  <asp:DetailsView ID="AddSchool" runat="server" AutoGenerateRows="False" 
    DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
    Height="50px" Width="125px">
    <Fields>
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
        ReadOnly="True" SortExpression="ID" />
      <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
      <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
      <asp:BoundField DataField="STATE" HeaderText="STATE" SortExpression="STATE" />
      <asp:CommandField ShowInsertButton="True" />
    </Fields>
  </asp:DetailsView>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    DeleteCommand="DELETE FROM [SCHOOL] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [SCHOOL] ([NAME], [CITY], [STATE]) VALUES (@NAME, @CITY, @STATE)" 
    SelectCommand="SELECT [ID], [NAME], [CITY], [STATE] FROM [SCHOOL] ORDER BY [STATE], [CITY], [NAME]" 
    
    UpdateCommand="UPDATE [SCHOOL] SET [NAME] = @NAME, [CITY] = @CITY, [STATE] = @STATE WHERE [ID] = @ID">
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
      <asp:Parameter Name="NAME" Type="String" />
      <asp:Parameter Name="CITY" Type="String" />
      <asp:Parameter Name="STATE" Type="String" />
    </InsertParameters>
    <UpdateParameters>
      <asp:Parameter Name="NAME" Type="String" />
      <asp:Parameter Name="CITY" Type="String" />
      <asp:Parameter Name="STATE" Type="String" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
  </asp:SqlDataSource>
</asp:Content>


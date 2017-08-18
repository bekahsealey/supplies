<%@ Page Title="Manage Grades" Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="Grades.aspx.cs" Inherits="Manage_Grades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:GridView ID="GradeGridView" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
    DataSourceID="SqlDataSource1" 
    EmptyDataText="There are no data records to display." PageSize="25">
    <Columns>
      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
        ShowSelectButton="True" />
      <asp:BoundField DataField="GRADE_LEVEL" HeaderText="GRADE_LEVEL" 
        SortExpression="GRADE_LEVEL" />
      <asp:BoundField DataField="SORT_ORDER" HeaderText="SORT_ORDER" 
        SortExpression="SORT_ORDER" />
    </Columns>
  </asp:GridView>
  <h3>Add a New Grade Level:</h3>
  <asp:DetailsView ID="AddGrade" runat="server" AutoGenerateRows="False" 
    DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
    Height="50px" Width="125px">
    <Fields>
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
        ReadOnly="True" SortExpression="ID" />
      <asp:BoundField DataField="GRADE_LEVEL" HeaderText="GRADE_LEVEL" 
        SortExpression="GRADE_LEVEL" />
      <asp:BoundField DataField="SORT_ORDER" HeaderText="SORT_ORDER" 
        SortExpression="SORT_ORDER" />
      <asp:CommandField ShowInsertButton="True" />
    </Fields>
  </asp:DetailsView>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    DeleteCommand="DELETE FROM [GRADE] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [GRADE] ([GRADE_LEVEL], [SORT_ORDER]) VALUES (@GRADE_LEVEL, @SORT_ORDER)" 
    SelectCommand="SELECT [ID], [GRADE_LEVEL], [SORT_ORDER] FROM [GRADE] ORDER BY [SORT_ORDER]" 
    
    UpdateCommand="UPDATE [GRADE] SET [GRADE_LEVEL] = @GRADE_LEVEL, [SORT_ORDER] = @SORT_ORDER WHERE [ID] = @ID">
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
      <asp:Parameter Name="GRADE_LEVEL" Type="String" />
      <asp:Parameter Name="SORT_ORDER" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
      <asp:Parameter Name="GRADE_LEVEL" Type="String" />
      <asp:Parameter Name="SORT_ORDER" Type="Int32" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
  </asp:SqlDataSource>
</asp:Content>


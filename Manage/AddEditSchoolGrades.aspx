<%@ Page Title="Insert and Update School Grades" Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="AddEditSchoolGrades.aspx.cs" Inherits="Manage_AddEditSchoolGrades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Insert New or Update Existing School Grade Records</h1>
  <asp:GridView ID="GradeLevelView" runat="server" AllowSorting="True" 
    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
    <Columns>
      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
        ShowSelectButton="True" />
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
        ReadOnly="True" SortExpression="ID" Visible="False" />
      <asp:BoundField DataField="SCHOOL_ID" HeaderText="SCHOOL_ID" ReadOnly="True" 
        SortExpression="SCHOOL_ID" Visible="False" />
      <asp:BoundField DataField="GRADE_ID" HeaderText="GRADE_ID" ReadOnly="True" 
        SortExpression="GRADE_ID" />
      <asp:BoundField DataField="TEACHER" HeaderText="TEACHER" 
        SortExpression="TEACHER" />
      <asp:BoundField DataField="MEMO" HeaderText="MEMO" SortExpression="MEMO" />
      <asp:BoundField DataField="UPDATE_DATE_TIME" DataFormatString="{0:g}" 
        HeaderText="UPDATE_DATE_TIME" SortExpression="UPDATE_DATE_TIME" />
    </Columns>
  </asp:GridView>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    DeleteCommand="DELETE FROM [SCHOOL_GRADE] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [SCHOOL_GRADE] ([SCHOOL_ID], [GRADE_ID], [TEACHER], [MEMO]) VALUES (@SCHOOL_ID, @GRADE_ID, @TEACHER, @MEMO)" 
    SelectCommand="SELECT [ID], [SCHOOL_ID], [GRADE_ID], [TEACHER], [MEMO], [UPDATE_DATE_TIME] FROM [SCHOOL_GRADE] WHERE ([SCHOOL_ID] = @SCHOOL_ID)" 
    UpdateCommand="UPDATE [SCHOOL_GRADE] SET [SCHOOL_ID] = @SCHOOL_ID, [GRADE_ID] = @GRADE_ID, [TEACHER] = @TEACHER, [MEMO] = @MEMO, [UPDATE_DATE_TIME] = @UPDATE_DATE_TIME WHERE [ID] = @ID">
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
      <asp:Parameter Name="SCHOOL_ID" Type="Int32" />
      <asp:Parameter Name="GRADE_ID" Type="Int32" />
      <asp:Parameter Name="TEACHER" Type="String" />
      <asp:Parameter Name="MEMO" Type="String" />
      <asp:Parameter Name="UPDATE_DATE_TIME" Type="DateTime" />
    </InsertParameters>
    <SelectParameters>
      <asp:QueryStringParameter Name="SCHOOL_ID" QueryStringField="SID" 
        Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
      <asp:Parameter Name="SCHOOL_ID" Type="Int32" />
      <asp:Parameter Name="GRADE_ID" Type="Int32" />
      <asp:Parameter Name="TEACHER" Type="String" />
      <asp:Parameter Name="MEMO" Type="String" />
      <asp:Parameter Name="UPDATE_DATE_TIME" Type="DateTime" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
  </asp:SqlDataSource>
  <asp:Panel ID="AddGradePanel" runat="server" Visible="True">
  <h2>Add New Grade Level to this School</h2>
    <asp:DropDownList ID="SelectGradeLevel" runat="server" AutoPostBack="True" 
      DataSourceID="SqlDataSource2" DataTextField="GRADE_LEVEL" 
      DataValueField="ID" AppendDataBoundItems="True">
      <asp:ListItem Value="">Select a Grade Level</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
      ErrorMessage="Select a Grade Level" ControlToValidate="SelectGradeLevel">Select a Grade Level</asp:RequiredFieldValidator>
    <h3>Optional:</h3>
    <asp:DetailsView ID="AddGrade" runat="server" AutoGenerateRows="False" 
      DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
      Height="50px" oniteminserting="AddGrade_ItemInserting" Width="125px" 
      oniteminserted="AddGrade_ItemInserted">
      <Fields>
        <asp:TemplateField HeaderText="SCHOOL_ID" SortExpression="SCHOOL_ID" 
          Visible="False">
          <EditItemTemplate>
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SCHOOL_ID") %>'></asp:TextBox>
          </EditItemTemplate>
          <InsertItemTemplate>
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SCHOOL_ID") %>'></asp:TextBox>
          </InsertItemTemplate>
          <ItemTemplate>
            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SCHOOL_ID") %>'></asp:Label>
          </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="GRADE_ID" SortExpression="GRADE_ID" 
          Visible="False">
          <EditItemTemplate>
            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GRADE_ID") %>'></asp:TextBox>
          </EditItemTemplate>
          <InsertItemTemplate>
            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GRADE_ID") %>'></asp:TextBox>
          </InsertItemTemplate>
          <ItemTemplate>
            <asp:Label ID="Label2" runat="server" Text='<%# Bind("GRADE_ID") %>'></asp:Label>
          </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="TEACHER" HeaderText="TEACHER" 
          SortExpression="TEACHER" />
        <asp:BoundField DataField="MEMO" HeaderText="MEMO" SortExpression="MEMO" />
        <asp:CommandField ShowInsertButton="True" />
      </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
      ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
      SelectCommand="SELECT [GRADE_LEVEL], [ID] FROM [GRADE] ORDER BY [SORT_ORDER]">
    </asp:SqlDataSource>
  </asp:Panel>
</asp:Content>


<%@ Page Title="Insert and Update Lists" Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="AddEditList.aspx.cs" Inherits="Manage_AddEditList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:DetailsView ID="ListDetailsView" runat="server" AutoGenerateRows="False" 
    DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
    Height="50px" Width="125px" onitemupdated="ListDetailsView_ItemUpdated">
    <Fields>
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
        ReadOnly="True" SortExpression="ID" Visible="False" />
      <asp:BoundField DataField="TEACHER" HeaderText="TEACHER" 
        SortExpression="TEACHER" />
      <asp:TemplateField HeaderText="MEMO" SortExpression="MEMO">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MEMO") %>' TextMode="MultiLine" Rows="6"></asp:TextBox>
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MEMO") %>' TextMode="MultiLine" Rows="6"></asp:TextBox>
        </InsertItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("MEMO") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:CommandField ShowEditButton="True" />
    </Fields>
  </asp:DetailsView>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="ID" DataSourceID="SqlDataSource2">
    <Columns>
      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
        ReadOnly="True" SortExpression="ID" Visible="False" />
      <asp:BoundField DataField="ITEM" HeaderText="ITEM" ReadOnly="True" 
        SortExpression="ITEM" />
      <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
        ReadOnly="True" SortExpression="DESCRIPTION" />
      <asp:BoundField DataField="NOTE" HeaderText="NOTE" SortExpression="NOTE" />
      <asp:BoundField DataField="QUANTITY" HeaderText="QUANTITY" 
        SortExpression="QUANTITY" />
      <asp:BoundField DataField="NAME" HeaderText="CATEGORY" ReadOnly="True" 
        SortExpression="NAME" />
    </Columns>
  </asp:GridView>
  <h2>Add to List</h2>
  <asp:DropDownList ID="SelectItemList" runat="server" AppendDataBoundItems="True" 
    DataSourceID="SqlDataSource4" DataTextField="ITEM_DES" DataValueField="ID">
    <asp:ListItem Value="">Select an Item</asp:ListItem>
  </asp:DropDownList>
  <asp:DropDownList ID="SelectCatList" runat="server" AppendDataBoundItems="True" 
    DataSourceID="SqlDataSource3" DataTextField="NAME" DataValueField="ID">
    <asp:ListItem Value="">Select a Category (optional)</asp:ListItem>
  </asp:DropDownList>
  <asp:DetailsView ID="NewItemDetails" runat="server" AutoGenerateRows="False" 
    DataKeyNames="ID" DataSourceID="SqlDataSource2" DefaultMode="Insert" 
    Height="50px" oniteminserted="NewItemDetails_ItemInserted" 
    oniteminserting="NewItemDetails_ItemInserting" Width="125px">
    <Fields>
      <asp:BoundField DataField="QUANTITY" HeaderText="QUANTITY" 
        SortExpression="QUANTITY" />
      <asp:BoundField DataField="NOTE" HeaderText="NOTE" SortExpression="NOTE" />
      <asp:CommandField ShowInsertButton="True" />
    </Fields>
  </asp:DetailsView>
  <a href="Supplies.aspx" runat="server" id="Return">Item not found? Add New Supply Item.</a>
  <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    SelectCommand="SELECT ID, ITEM + ', ' + ISNULL(DESCRIPTION, '') AS ITEM_DES FROM SUPPLY">
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    SelectCommand="SELECT * FROM [CATEGORY] ORDER BY [ID]"></asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    DeleteCommand="DELETE FROM [GRADE_SUPPLY_LIST] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [GRADE_SUPPLY_LIST] ([SCHOOL_GRADE_ID], [SUPPLY_ID], [QUANTITY], [CATEGORY_ID], [NOTE]) VALUES (@SCHOOL_GRADE_ID, @SUPPLY_ID, @QUANTITY, @CATEGORY_ID, @NOTE)" 
    SelectCommand="SELECT GRADE_SUPPLY_LIST.ID, GRADE_SUPPLY_LIST.SCHOOL_GRADE_ID, GRADE_SUPPLY_LIST.SUPPLY_ID, GRADE_SUPPLY_LIST.QUANTITY, GRADE_SUPPLY_LIST.CATEGORY_ID, GRADE_SUPPLY_LIST.NOTE, SUPPLY.DESCRIPTION, SUPPLY.ITEM, CATEGORY.NAME FROM GRADE_SUPPLY_LIST FULL OUTER JOIN CATEGORY ON GRADE_SUPPLY_LIST.CATEGORY_ID = CATEGORY.ID INNER JOIN SUPPLY ON GRADE_SUPPLY_LIST.SUPPLY_ID = SUPPLY.ID WHERE (GRADE_SUPPLY_LIST.SCHOOL_GRADE_ID = @SCHOOL_GRADE_ID) ORDER BY GRADE_SUPPLY_LIST.CATEGORY_ID" 
    UpdateCommand="UPDATE [GRADE_SUPPLY_LIST] SET [QUANTITY] = @QUANTITY, [NOTE] = @NOTE WHERE [ID] = @ID">
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
      <asp:Parameter Name="SCHOOL_GRADE_ID" Type="Int32" />
      <asp:Parameter Name="SUPPLY_ID" Type="Int32" />
      <asp:Parameter Name="QUANTITY" Type="Int32" />
      <asp:Parameter Name="CATEGORY_ID" Type="Int32" />
      <asp:Parameter Name="NOTE" Type="String" />
    </InsertParameters>
    <SelectParameters>
      <asp:QueryStringParameter Name="SCHOOL_GRADE_ID" QueryStringField="SGID" 
        Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
      <asp:Parameter Name="QUANTITY" Type="Int32" />
      <asp:Parameter Name="NOTE" Type="String" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    DeleteCommand="DELETE FROM [SCHOOL_GRADE] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [SCHOOL_GRADE] ([TEACHER], [MEMO]) VALUES (@TEACHER, @MEMO)" 
    SelectCommand="SELECT [TEACHER], [MEMO], [ID] FROM [SCHOOL_GRADE] WHERE ([ID] = @ID)" 
    UpdateCommand="UPDATE [SCHOOL_GRADE] SET [TEACHER] = @TEACHER, [MEMO] = @MEMO WHERE [ID] = @ID">
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
      <asp:Parameter Name="TEACHER" Type="String" />
      <asp:Parameter Name="MEMO" Type="String" />
    </InsertParameters>
    <SelectParameters>
      <asp:QueryStringParameter Name="ID" QueryStringField="SGID" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
      <asp:Parameter Name="TEACHER" Type="String" />
      <asp:Parameter Name="MEMO" Type="String" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
  </asp:SqlDataSource>
</asp:Content>


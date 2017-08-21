<%@ Page Title="Manage Master Lists" Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="Lists.aspx.cs" Inherits="Manage_Lists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:DropDownList ID="selectSchool" runat="server" AppendDataBoundItems="True" 
    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SCHOOL_NAME" 
    DataValueField="ID" 
    onselectedindexchanged="selectSchool_SelectedIndexChanged">
    <asp:ListItem Value="">Select your School</asp:ListItem>
  </asp:DropDownList>
  <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" 
    PageSize="25">
    <Columns>
      <asp:BoundField DataField="ID" HeaderText="ID" 
        SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
      <asp:BoundField DataField="GRADE_LEVEL" HeaderText="GRADE_LEVEL" 
        SortExpression="GRADE_LEVEL" />
      <asp:BoundField DataField="TEACHER" 
        HeaderText="TEACHER" SortExpression="TEACHER" 
        NullDisplayText="Not Entered" />
      <asp:BoundField DataField="MEMO" HeaderText="MEMO" 
        SortExpression="MEMO" NullDisplayText="Not Entered" />
      <asp:BoundField DataField="GRADE_UPDATE" 
        HeaderText="GRADE_UPDATE" SortExpression="GRADE_UPDATE" 
        DataFormatString="{0:d}" />
      <asp:HyperLinkField DataNavigateUrlFields="ID" 
        DataNavigateUrlFormatString="AddEditList.aspx?SGID={0}" 
        HeaderText="Manage Lists" Text="Create or Update List" />
    </Columns>
  </asp:GridView>
  <a href="AddEditSchoolGrades.aspx" runat="server" id="SchoolLink" visible="false">Insert New Grade for this School</a>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    
    
    
    SelectCommand="SELECT GRADE.GRADE_LEVEL, GRADE.SORT_ORDER, SCHOOL_GRADE.TEACHER, SCHOOL_GRADE.ID, SCHOOL_GRADE.UPDATE_DATE_TIME AS GRADE_UPDATE, SCHOOL_GRADE.MEMO FROM GRADE INNER JOIN SCHOOL_GRADE ON GRADE.ID = SCHOOL_GRADE.GRADE_ID WHERE (SCHOOL_GRADE.SCHOOL_ID = @SCHOOL_ID) ORDER BY GRADE.SORT_ORDER">
    <SelectParameters>
      <asp:ControlParameter ControlID="selectSchool" Name="SCHOOL_ID" 
        PropertyName="SelectedValue" />
    </SelectParameters>
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    SelectCommand="SELECT ID, RTRIM(STATE) + ' - ' + RTRIM(CITY) + ':  ' + RTRIM(NAME) AS SCHOOL_NAME FROM SCHOOL ORDER BY STATE, CITY, NAME">
  </asp:SqlDataSource>
</asp:Content>


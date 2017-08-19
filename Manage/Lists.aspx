<%@ Page Title="Manage Master Lists" Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="Lists.aspx.cs" Inherits="Manage_Lists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:DropDownList ID="selectSchool" runat="server" AppendDataBoundItems="True" 
    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SCHOOL_NAME" 
    DataValueField="ID">
    <asp:ListItem Value="">Select your School</asp:ListItem>
  </asp:DropDownList>
  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" 
    PageSize="25">
    <Columns>
      <asp:HyperLinkField DataNavigateUrlFields="ID" 
        DataNavigateUrlFormatString="AddEditList.aspx?ID={0}" 
        DataTextField="GRADE_LEVEL" HeaderText="GRADE LEVEL" />
      <asp:BoundField DataField="TEACHER" HeaderText="TEACHER" 
        SortExpression="TEACHER" />
      <asp:BoundField DataField="UPDATE_DATE_TIME" DataFormatString="{0:g}" 
        HeaderText="LAST UPDATE" SortExpression="UPDATE_DATE_TIME" />
      <asp:CommandField HeaderText="DELETE" ShowDeleteButton="True" />
    </Columns>
  </asp:GridView>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SuppliesConnectionString1 %>" 
    SelectCommand="SELECT GRADE.GRADE_LEVEL, GRADE.SORT_ORDER, SCHOOL_GRADE.TEACHER, SCHOOL_GRADE.ID, GRADE_SUPPLY_LIST.UPDATE_DATE_TIME FROM GRADE INNER JOIN SCHOOL_GRADE ON GRADE.ID = SCHOOL_GRADE.GRADE_ID INNER JOIN GRADE_SUPPLY_LIST ON SCHOOL_GRADE.ID = GRADE_SUPPLY_LIST.SCHOOL_GRADE_ID WHERE (SCHOOL_GRADE.SCHOOL_ID = @SCHOOL_ID) ORDER BY GRADE.SORT_ORDER">
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


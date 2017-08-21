using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_AddEditList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      Return.HRef = "Supplies.aspx?SGID=" + Request.QueryString["SGID"];
    }
    protected void ListDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
      ListDetailsView.DefaultMode = DetailsViewMode.ReadOnly;
    }
    protected void AddItemDetails_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
      e.Values["SCHOOL_GRADE_ID"] = Request.QueryString["SGID"];
      e.Values["SUPPLY_ID"] = SelectItemList.SelectedValue;
      if (SelectCatList.SelectedIndex != 0)
      {
        e.Values["CATEGORY_ID"] = SelectCatList.SelectedValue;
      }
    }
    protected void NewItemDetails_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
      e.Values["SCHOOL_GRADE_ID"] = Request.QueryString["SGID"];
      e.Values["SUPPLY_ID"] = SelectItemList.SelectedValue;
      if (SelectCatList.SelectedIndex != 0)
      {
        e.Values["CATEGORY_ID"] = SelectCatList.SelectedValue;
      }
    }
    protected void NewItemDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
      SelectItemList.SelectedIndex = 0;
      SelectCatList.SelectedIndex = 0;
    }
}
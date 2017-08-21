using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Supplies : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (Request.QueryString["SGID"] != null && Request.QueryString["SGID"] != "")
    {
      Return.Visible = true;
      Return.HRef = "AddEditList.aspx?SGID=" + Request.QueryString["SGID"];
    }
    else
    {
      Return.Visible = false;
    }
  }
}
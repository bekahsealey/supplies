using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Lists : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
    {

    }
  protected void selectSchool_SelectedIndexChanged(object sender, EventArgs e)
  {
    if (selectSchool.SelectedIndex != 0)
    {
      SchoolLink.Visible = true;
      SchoolLink.HRef = "AddEditSchoolGrades.aspx?SID=" + selectSchool.SelectedValue;
    }
    else
    {
      SchoolLink.Visible = false;
    }
  }
}
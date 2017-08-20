using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_AddEditSchoolGrades : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddGrade_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
      e.Values["SCHOOL_ID"] = Request.QueryString["SID"];
      e.Values["GRADE_ID"] = SelectGradeLevel.SelectedValue;
    }
    protected void AddGrade_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
      SelectGradeLevel.SelectedIndex = 0;
    }
}
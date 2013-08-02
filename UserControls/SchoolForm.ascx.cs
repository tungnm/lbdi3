using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C2C.UserControls
{
    public partial class SchoolForm : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void DropDownSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownSchool.SelectedIndex == 0) LabelWebsite.Text = "www.alasu.edu";
            else if (DropDownSchool.SelectedIndex == 1) LabelWebsite.Text = "www.aum.edu";
            else if (DropDownSchool.SelectedIndex == 2) LabelWebsite.Text = "www.faulkner.edu";
            else if (DropDownSchool.SelectedIndex == 3) LabelWebsite.Text = "www.huntingdon.edu";
            else if (DropDownSchool.SelectedIndex == 4) LabelWebsite.Text = "ww.southuniversity.edu";
            else if (DropDownSchool.SelectedIndex == 5) LabelWebsite.Text = "www.trenholmstate.edu";
            else if (DropDownSchool.SelectedIndex == 6) LabelWebsite.Text = "www.troy.edu";
            else if (DropDownSchool.SelectedIndex == 7) LabelWebsite.Text = "www.tuskegee.edu";
        }
        
    }
}
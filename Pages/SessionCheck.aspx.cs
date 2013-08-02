using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C2C.Pages
{
    public partial class SessionCheck : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }


        protected void btnSelectDate_Click(object sender, EventArgs e)
        {
            if (Calendar1.Visible == false)
            {
                Calendar1.Visible = true;
            }
            else Calendar1.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == "") return;
            else
            {
                TextBox2.Text = "LON";
            }
        }
    }
}
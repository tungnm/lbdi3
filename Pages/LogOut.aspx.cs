using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.ModelLayer;
namespace C2C.Pages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session[C2CUtil.MESSAGE] = "You have logged out!";
            Response.Redirect("~/Pages/UserLogin.aspx");
            return;
        }
    }
}
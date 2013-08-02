using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.ModelLayer;

namespace C2C.UserControls
{
    public partial class Login : System.Web.UI.UserControl
    {
     //   public string
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    //Verify with database
        //    User aboutToLogInUser = ModelManager.VerifyUser(txtEmail.Text, txtPassword.Text);

        //    if (aboutToLogInUser != null) //log in succesfully
        //    {
        //        Session[C2CUtil.LOGED_IN] = true;
        //        //store the user model retrived from the database, so other page knows that who is this just loged in guy.
        //        Session[C2CUtil.CURRENT_USER] = aboutToLogInUser;
        //        Response.Redirect("~/Pages/index.aspx");
               
        //    }
        //    else
        //    {
        //        lblMessage.Text = "Log in Failed. Incorrect email or password";
        //        return;
        //    }
            
        //}
    }
}
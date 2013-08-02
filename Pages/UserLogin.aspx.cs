using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.ModelLayer;
using C2C.DataLayer;
using C2C.UserControls;

namespace C2C.Pages
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
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
                if (drlUserType.SelectedValue == "Advisor")
                {
                    Advisor AttemptAdvisor = ModelManager.VerifyAdvisor(txtEmail.Text, txtPassword.Text);
                    if (AttemptAdvisor != null) //log in succesfully
                    {
                        Session[C2CUtil.LOGED_IN] = true;
                        Session[C2CUtil.USER_ADVISOR] = true; 
                        ////store the user model retrived from the database, so other page knows that who is this just loged in guy.
                        Session[C2CUtil.CURRENT_USER] = AttemptAdvisor;
                        //Response.Redirect("~/Pages/index.aspx");
                        //lblMessage.Text = "LOGIN OK";

                        //go to Employer main page site
                        Response.Redirect("~/Pages/AdvisorMainPage.aspx");

                    }
                    else
                    {
                        lblMessage.Text = "Log in Failed. Incorrect email or password";
                        return;
                    }

                }
                else if (drlUserType.SelectedValue == "Employer")
                {
                    Employer AttemptEmployer = ModelManager.VerifyEmployer(txtEmail.Text, txtPassword.Text);
                    if (AttemptEmployer != null) //log in succesfully
                    {
                        Session[C2CUtil.LOGED_IN] = true;
                        Session[C2CUtil.USER_EMPLOYER] = true;
                        ////store the user model retrived from the database, so other page knows that who is this just loged in guy.
                        Session[C2CUtil.CURRENT_USER] = AttemptEmployer;
                        //Response.Redirect("~/Pages/index.aspx");
                        lblMessage.Text = "LOGIN OK";

                        //go to postjob page
                        Response.Redirect("~/Pages/EmployerMain.aspx");

                    }
                    else
                    {
                        lblMessage.Text = "Log in Failed. Incorrect email or password";
                        return;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Operation FAILED. The following error occured: " + ex.Message;
            } 
            
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
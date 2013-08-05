using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.DataLayer;
using C2C.ModelLayer;
using System.Net.Mail;

namespace C2C.Pages
{
    public partial class PasswordHelp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string pw = null;
                if (drlUserType.SelectedValue == "Advisor")
                {
                    pw = DataManager.getAdvisorPasword(txtEmail.Text);
                }
                else if (drlUserType.SelectedValue == "Employer")
                {
                    pw = DataManager.getAdvisorPasword(txtEmail.Text);
                }

                if (pw == null)
                {
                    lblMessage.Text = "There is not any account associated with this email address.";
                    return;
                }
                else
                {
                    List<string> toEmail = new List<string>();
                    toEmail.Add(txtEmail.Text);

                    string mailTitle = "C2C Notification: Password Help from C2C Website";

                    string mailBody = "<html><body>"
                                        + "Your Password From Coursework2Career website<br/>"
                                        + "Email: <b><font color=#336699>" + txtEmail.Text + "</font></b><br/>"
                                        + "Password: <b>" + pw + "</b><br/>"
                                        + "<font color=#FF0000>PLEASE DO NOT REPLY THIS AUTO GENERATED EMAIL.</body></html>";

                    ModelManager.SendEmail(toEmail, mailTitle, mailBody);

                    lblMessage.Text = "Please check your email's inbox (possibly spam box) for your password. Thank you!";
                }
            }
            catch (Exception er)
            {
                lblMessage.Text = "ERROR: " + er.Message;
                return;
            }
        }
    }
}
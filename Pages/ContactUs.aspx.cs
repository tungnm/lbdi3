using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using C2C.ModelLayer;

namespace C2C.Pages
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtComment.Text.Length > 1000)
            {
                lblMessage.Text = "Error: Comment field is limited to 1000 characters. You typed in: " + txtComment.Text.Length + " characters. Please try again!";
                return;
            }
            try
            {
                List<string> toEmail = new List<string>();
                toEmail.Add("longbodie@gmail.com");
                //toEmail.Add("longbodie2@gmail.com");
                string mailTitle = "C2C Notification: Somebody has contacted you on C2C website";

                string mailBody = "<html><body>"
                                    + "Name: <b>" + txtName.Text + "</b><br/>"
                                    + "Email: <b><font color=#336699>" + txtEmail.Text + "</font></b><br/>"
                                    + "Phone: <b>" + txtPhone.Text + "</b><br/>"
                                    + "Best time to contact: <b>" + txtTime.Text + "</b><br/>"
                                    + "Comment: <p>" + txtComment.Text + "</p>"
                                    + "<p><b>Please respond this request to the email address above.</b> <br/><font color=#FF0000>PLEASE DO NOT REPLY THIS AUTO GENERATED EMAIL.</body></html>";

                ModelManager.SendEmail(toEmail, mailTitle, mailBody);

                lblMessage.Text = "Thank you for contacting us. We will get back to you soon.";
            }
            catch (Exception er)
            {
                lblMessage.Text = "Error: Operation failed. The following error occured: " + er.Message; 
            }
        }
    }
}
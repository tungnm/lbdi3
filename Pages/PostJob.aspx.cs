using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.ModelLayer;
using C2C.DataLayer;
using C2C.UserControls;
using System.Net;
namespace C2C.Pages
{
    public partial class PostJob : System.Web.UI.Page
    {
        public static Dictionary<QueryResult, string> queryResultMessage = new Dictionary<QueryResult, string> { 
           { QueryResult.InsertFail, "Error: Can't insert into the database"} ,
           { QueryResult.Success, "Success"},
           { QueryResult.UnknowDatabaseIssue, "Error when connecting to DB"}
           };

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //verified if loged in
                if (Session[C2CUtil.LOGED_IN] == null)
                {
                    //if not yet log in then show the log in box
                    Response.Redirect("~/Pages/UserLogin.aspx");
                    return;
                }

                //default expire date is 90 days from posted date
                txtExpDate.Text = System.DateTime.Now.AddDays(90).ToString();

                List<State> states = ModelManager.GetAllState();
                for (int i = 0; i < states.Count; i++)
                    drlState.Items.Add(new ListItem(states[i].Name, states[i].Id.ToString()));

                List<Function> functions = ModelManager.GetAllFunction();
                for (int i = 0; i < functions.Count; i++)
                    drlFunction.Items.Add(new ListItem(functions[i].Name, functions[i].Id.ToString()));
            }
            else Validate();
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            if (txtTitle.Text == "" || txtCity.Text == "" || txtDescription.Text == "")
            {
                lblMessage.Text = "Please fulfill all required fields";
                return;
            }
            
            try
            {
                //get current User:
                ModelLayer.Employer currentUser = (ModelLayer.Employer)Session[C2CUtil.CURRENT_USER];

                Job newJob = new Job(txtTitle.Text, currentUser.EmployerId, System.Convert.ToInt32(drlFunction.SelectedValue), drlJobType.SelectedValue, txtCity.Text,
                    System.Convert.ToInt32(drlState.SelectedValue), txtQualification.Text, txtDescription.Text, System.DateTime.Now.ToString(), txtExpDate.Text);
                int justInsertedJobId = -1;
                QueryResult result = DataManager.InsertJob(newJob, ref justInsertedJobId);

                //Session[C2CUtil.MESSAGE] = queryResultMessage[result];
                //TODO: Do SAME thing with all othe page using GLOBAL MESSAGE

                if (result == QueryResult.Success)
                {

                    //List<String> allEmails = ModelManager.GetAllAdvisorEmails();
                    List<String> allEmails = new List<string>();
                    allEmails.Add("longbodie@GMAIL.COM");
                    string emailTitle = "C2C Internship Notification";

                    string emailBody = "<html><body><p>A new Internship has been posted at C2C website:<br>"
                        + "<b>Internship Title: " + newJob.Title + "</b><br>"
                        + "<b>From Orgnization: " + currentUser.Comp_Name + "</b><br>"
                        + "<b>Posted On: " + newJob.PostDate + "</b><br>"
                        + "<b>Detail :</b><font color=\"blue\"><a href=" + "c2c.somee.com/Pages/ViewJobDetail.aspx?ID=" + justInsertedJobId + ">Click here to view Internship details</a></font><br>"
                    + "Visit C2C webite to check it out. Please DO NOT reply this electronically generated email!</p></body></html>";
                    ModelManager.SendEmail(allEmails, emailTitle, emailBody);

                    /*dunb back sla
                    // Gmail Address from where you send the mail
                    var fromAddress = "longnguyen@ctex-inc.com";
                    // any address where the email will be sendin:
                   //Password of your gmail address ok roi day
                    const string fromPassword = "ditmemay123";
            
                    System.Net.Mail.SmtpClient ss = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                    ss.EnableSsl = true;
                    ss.Timeout = 10000;
                    ss.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    ss.UseDefaultCredentials = false;
                    ss.Credentials = new NetworkCredential(fromAddress, fromPassword);

              
                    // Passing values to smtp object
                    for (int i = 0; i < allEmails.Count; i++)
                    {
                        System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage(fromAddress, allEmails[i], "C2C Job Notification", "A new job has been posted at C2C website. Check it out and please do not reply this email, it was electronically generated!");
                        //   mm.BodyEncoding = System.NUTF8Encoding.UTF8;
                        mm.DeliveryNotificationOptions = System.Net.Mail.DeliveryNotificationOptions.OnFailure;
                        ss.Send(mm);
                    }
                    */

                    //Session[C2CUtil.MESSAGE] = "Job has been posted successfully!";
                    txtTitle.Text = "";
                    txtCity.Text = "";
                    txtQualification.Text = "";
                    txtDescription.Text = "";
                    txtExpDate.Text = "";
                    lblMessage.Text = "Internship has been posted successfully! All advisors will be notified by emails.";

                    return;
                }
                else
                {
                    lblMessage.Text = "Error: An error occurred, please try again!";
                    return;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Operation FAILED. Internship has been posted but system can not send out notification emails to advisors.<br> The following error occured: " + ex.Message;
            } 

        }

        //protected void btnReset_Click(object sender, EventArgs e)
        //{
        //    txtTitle.Text = null;
        //    txtCity.Text = null;
        //    txtQualification.Text = null;
        //    txtDescription.Text = null;
        //}

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/EmployerMain.aspx");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtExpDate.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Calendar1.Visible == false)
            {
                Calendar1.Visible = true;
            }
            else Calendar1.Visible = false;
        }



    }
}
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
    public partial class EmployerRegistration : System.Web.UI.Page
    {
        public static Dictionary<QueryResult, string> queryResultMessage = new Dictionary<QueryResult, string> { 
           { QueryResult.EmailExisted, "This email has already been registered"  }, 
           { QueryResult.InsertFail, "Error: Can't insert into the database"} ,
           { QueryResult.Success, "Success"},
           { QueryResult.UnknowDatabaseIssue, "Error when connecting to DB"}
           };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Industry> industries = ModelManager.GetAllIndustries();
                for (int i = 0; i < industries.Count; i++)
                    drlIndustry.Items.Add(new ListItem(industries[i].Name, industries[i].Id.ToString()));

                List<State> states = ModelManager.GetAllState();
                for (int i = 0; i < states.Count; i++)
                {
                    drlCompState.Items.Add(new ListItem(states[i].Name, states[i].Id.ToString()));
                    drlUserState.Items.Add(new ListItem(states[i].Name, states[i].Id.ToString()));
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                ModelLayer.Employer newEmployer = new ModelLayer.Employer(txtCompName.Text, System.Convert.ToInt32(drlIndustry.SelectedValue), txtWebSite.Text, txtDescription.Text, txtCompAddress.Text, txtCompCity.Text, System.Convert.ToInt32(drlCompState.SelectedValue), txtCompZipcode.Text, txtUserSalutation.Text, txtUserName.Text, txtUserAddress.Text, txtUserCity.Text, System.Convert.ToInt32(drlUserState.SelectedValue), txtUserZipcode.Text, txtUserPhone.Text, txtUserEmail.Text);
                QueryResult result = ModelManager.EmployerRegister(newEmployer, txtUserPassword.Text);
                if (result == QueryResult.Success)
                {
                    lblMessage.Text = queryResultMessage[result] + ". Now you can Login and Manage your account. An email with your login info will be sent to your registered email address.";

                    List<string> toUserEmail = new List<string>();
                    toUserEmail.Add("longbodie@gmail.com");
                    //toUserEmail.Add(txtUserEmail.Text);
                    string mailTitle = "C2C Notification: You have just registered an account on C2C";
                    string mailBody = "<html><body>"
                                        + "Your account information on C2C webiste:<br/>"
                                        + "Email: <b><font color=#336699>" + txtUserEmail.Text + "</font></b><br/>"
                                        + "Password: <b>" + txtUserPassword.Text + "</b><br>"
                                        + "<p><b><font color=#FF0000>PLEASE DO NOT REPLY THIS AUTO GENERATED EMAIL.<b></body></html>";

                    ModelManager.SendEmail(toUserEmail, mailTitle, mailBody);

                    List<string> toAdmin = new List<string>();
                    toAdmin.Add("longbodie@gmail.com");
                    //toAdmin.Add("MRS NANCY EMAIL");
                    //toAdmin.Add("MRS ABC EMAIL");

                    string mailTitle2 = "C2C Notification: A new Employer user just registered an account on C2C";
                    string mailBody2 = "<html><body>"
                                        + "User account information on C2C webiste:<br/>"
                                        + "Email: <b><font color=#336699>" + txtUserEmail.Text + "</font></b><br/>"
                                        + "Name: <b>" + txtUserName.Text + "</b><br>"
                                        + "Company: <b>" + txtCompName.Text + "</b><br>"
                                        + "<p><b><font color=#FF0000>PLEASE DO NOT REPLY THIS AUTO GENERATED EMAIL.<b></body></html>";

                    ModelManager.SendEmail(toAdmin, mailTitle2, mailBody2);
                }
                else lblMessage.Text = queryResultMessage[result];
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Operation failed. The following error occured: " + ex.Message;
            } 

        }
    }
}
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
    public partial class AdvisorRegistration : System.Web.UI.Page
    {
        public static Dictionary<QueryResult, string> queryResultMessage =
           new Dictionary<QueryResult, string> { 
           {QueryResult.EmailExisted, "This email has already been registered"  }, 
           { QueryResult.InsertFail, "Error: Can't insert into the database"} ,
           { QueryResult.Success, "Success"},
           {QueryResult.UnknowDatabaseIssue, "Error when connecting to DB"}
           };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<School> schools = ModelManager.GetAllSchool();
                for (int i = 0; i < schools.Count; i++)
                    drlSchoolName.Items.Add(new ListItem(schools[i].Name, schools[i].Id.ToString()));

                List<State> states = ModelManager.GetAllState();
                for (int i = 0; i < states.Count; i++)
                {
                    drlUserState.Items.Add(new ListItem(states[i].Name, states[i].Id.ToString()));
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // can lam o day
                ModelLayer.Advisor newAdvisor = new ModelLayer.Advisor(System.Convert.ToInt32(drlSchoolName.SelectedValue), txtWebSite.Text, txtSchoolAddress.Text, txtUserSalutation.Text, txtUserName.Text, txtUserAddress.Text, txtUserCity.Text, System.Convert.ToInt32(drlUserState.SelectedValue), txtUserZipcode.Text, txtUserPhone.Text, txtUserEmail.Text);
                QueryResult result = ModelManager.AdvisorRegister(newAdvisor, txtUserPassword.Text);
                if (result == QueryResult.Success)
                {
                    lblMessage.Text = queryResultMessage[result] + ". Now you can Login and Manage your account.";
                }
                else lblMessage.Text = queryResultMessage[result];
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Registration failed. The following error occured: " + ex.Message;
            } 
        }

        protected void drlSchoolName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drlSchoolName.SelectedIndex == 1) txtWebSite.Text = "www.alasu.edu";
            else if (drlSchoolName.SelectedIndex == 2) txtWebSite.Text = "www.aum.edu";
            else if (drlSchoolName.SelectedIndex == 3) txtWebSite.Text = "www.faulkner.edu";
            else if (drlSchoolName.SelectedIndex == 4) txtWebSite.Text = "www.huntingdon.edu";
            else if (drlSchoolName.SelectedIndex == 5) txtWebSite.Text = "ww.southuniversity.edu";
            else if (drlSchoolName.SelectedIndex == 6) txtWebSite.Text = "www.trenholmstate.edu";
            else if (drlSchoolName.SelectedIndex == 7) txtWebSite.Text = "www.troy.edu";
            else if (drlSchoolName.SelectedIndex == 8) txtWebSite.Text = "www.tuskegee.edu";
            else txtWebSite.Text = null;
        }
    }
}
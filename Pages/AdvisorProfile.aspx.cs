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
    public partial class AdvisorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verified if loged in
            if (Session[C2CUtil.LOGED_IN] == null)
            {
                //if not yet log in then show the log in box
                Response.Redirect("~/Pages/UserLogin.aspx");
                return;
            }

            

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

                Advisor thisAdvisor = (Advisor)Session[C2CUtil.CURRENT_USER];
                drlSchoolName.Items.FindByText(DataManager.getSchoolName(thisAdvisor.SchoolId)).Selected = true;
                txtWebSite.Text = thisAdvisor.School_Website;
                txtSchoolAddress.Text = thisAdvisor.School_Address;
                txtUserSalutation.Text = thisAdvisor.User_Salutation;
                txtUserName.Text = thisAdvisor.User_Fullname;
                txtUserAddress.Text = thisAdvisor.User_Address;
                txtUserCity.Text = thisAdvisor.User_City;
                drlUserState.Items.FindByText(DataManager.getStateName(thisAdvisor.User_StateId)).Selected = true;
                txtUserZipcode.Text = thisAdvisor.User_Zipcode;
                txtUserPhone.Text = thisAdvisor.User_Phone;
                txtUserEmail.Text = thisAdvisor.User_Email;
                txtUserPassword.Text = DataManager.getAdvisorUPassword(thisAdvisor.AdvisorId);
                txtUserVerifyPassword.Text = DataManager.getAdvisorUPassword(thisAdvisor.AdvisorId);
            }

        }

        //Update profile information (same password)
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //verified if loged in
                if (Session[C2CUtil.LOGED_IN] == null)
                {
                    //if not yet log in then show the log in box
                    Response.Redirect("~/Pages/UserLogin.aspx");
                    return;
                }
                Advisor thisAdvisor1 = (Advisor)Session[C2CUtil.CURRENT_USER];
                if (txtUserCurrentPassword.Text != DataManager.getAdvisorUPassword(thisAdvisor1.AdvisorId))
                {
                    lblMessage.Text = "Current password is invalid";
                    return;
                }
                Advisor updateAdvisor = new Advisor(System.Convert.ToInt32(drlSchoolName.SelectedValue), txtWebSite.Text, txtSchoolAddress.Text, txtUserSalutation.Text, txtUserName.Text, txtUserAddress.Text, txtUserCity.Text, System.Convert.ToInt32(drlUserState.SelectedValue), txtUserZipcode.Text, txtUserPhone.Text, txtUserEmail.Text);
                QueryResult result = DataManager.UpdateAdvisor(updateAdvisor, txtUserCurrentPassword.Text, thisAdvisor1.AdvisorId);
                if (result == QueryResult.Success)
                {
                    lblMessage.Text = "Profile information has been updated successfully.";
                    //Session[C2CUtil.LOGED_IN] = null;
                }
                else lblMessage.Text = "Update failed";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Operation failed. The following error occured: " + ex.Message;
                return;
            } 
        }

        //Update password
        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            try
            {
                //verified if loged in
                if (Session[C2CUtil.LOGED_IN] == null)
                {
                    //if not yet log in then show the log in box
                    Response.Redirect("~/Pages/UserLogin.aspx");
                    return;
                }
                Advisor thisAdvisor1 = (Advisor)Session[C2CUtil.CURRENT_USER];
                if (txtUserCurrentPassword0.Text != DataManager.getAdvisorUPassword(thisAdvisor1.AdvisorId))
                {
                    lblMessage.Text = "Current password is invalid";
                    return;
                }
                string result = DataManager.updateAdvisorPassword(txtUserPassword.Text, thisAdvisor1.AdvisorId);
                if (result == "Success")
                {
                    lblMessage.Text = "Password updated successfully. Please use your new password to login.";
                    Session[C2CUtil.LOGED_IN] = null;
                    return;
                }
                else
                {
                    lblMessage.Text = "Update failed";
                    return;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Operation failed. The following error occured: " + ex.Message;
                return;
            } 
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/AdvisorMainPage.aspx");
        }

        
    }
}
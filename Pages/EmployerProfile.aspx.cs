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
    public partial class EmployerProfile : System.Web.UI.Page
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
                List<Industry> industries = ModelManager.GetAllIndustries();
                for (int i = 0; i < industries.Count; i++)
                    drlIndustry.Items.Add(new ListItem(industries[i].Name, industries[i].Id.ToString()));

                List<State> states = ModelManager.GetAllState();
                for (int i = 0; i < states.Count; i++)
                {
                    drlCompState.Items.Add(new ListItem(states[i].Name, states[i].Id.ToString()));
                    drlUserState.Items.Add(new ListItem(states[i].Name, states[i].Id.ToString()));
                }

                Employer thisEmployer = (Employer)Session[C2CUtil.CURRENT_USER];
                txtCompName.Text = thisEmployer.Comp_Name;
                drlIndustry.Items.FindByText(DataManager.getIndustryName(thisEmployer.Comp_IndustryId)).Selected = true;
                txtWebSite.Text = thisEmployer.Comp_Website;
                txtDescription.Text = thisEmployer.Comp_Description;
                txtCompAddress.Text = thisEmployer.Comp_Address;
                txtCompCity.Text = thisEmployer.Comp_City;
                drlCompState.Items.FindByText(DataManager.getStateName(thisEmployer.Comp_StateId)).Selected = true;
                txtCompZipcode.Text = thisEmployer.Comp_Zipcode;

                txtUserSalutation.Text = thisEmployer.User_Salutation;
                txtUserName.Text = thisEmployer.User_Fullname;
                txtUserAddress.Text = thisEmployer.User_Address;
                txtUserCity.Text = thisEmployer.User_City;
                drlUserState.Items.FindByText(DataManager.getStateName(thisEmployer.User_StateId)).Selected = true;
                txtUserZipcode.Text = thisEmployer.User_Zipcode;
                txtUserPhone.Text = thisEmployer.User_Phone;
                txtUserEmail.Text = thisEmployer.User_Email;
                txtUserPassword.Text = DataManager.getEmployerUPassword(thisEmployer.EmployerId);
                txtUserVerifyPassword.Text = DataManager.getEmployerUPassword(thisEmployer.EmployerId);
            }
        }

        //Update employer profile
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
                Employer thisEmployer1 = (Employer)Session[C2CUtil.CURRENT_USER];
                if (txtUserCurrentPassword.Text != DataManager.getEmployerUPassword(thisEmployer1.EmployerId))
                {
                    lblMessage.Text = "Current password is invalid";
                    return;
                }
                Employer updateEmployer = new Employer(txtCompName.Text, System.Convert.ToInt32(drlIndustry.SelectedValue), txtWebSite.Text, txtDescription.Text, txtCompAddress.Text, txtCompCity.Text, System.Convert.ToInt32(drlCompState.SelectedValue), txtCompZipcode.Text, txtUserSalutation.Text, txtUserName.Text, txtUserAddress.Text, txtUserCity.Text, System.Convert.ToInt32(drlUserState.SelectedValue), txtUserZipcode.Text, txtUserPhone.Text, txtUserEmail.Text); 
                    //(System.Convert.ToInt32(drlSchoolName.SelectedValue), txtWebSite.Text, txtSchoolAddress.Text, txtUserSalutation.Text, txtUserName.Text, txtUserAddress.Text, txtUserCity.Text, System.Convert.ToInt32(drlUserState.SelectedValue), txtUserZipcode.Text, txtUserPhone.Text, txtUserEmail.Text);
                QueryResult result = DataManager.UpdateEmployer(updateEmployer, txtUserCurrentPassword.Text, thisEmployer1.EmployerId);
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
            } 
        }

        //Update employer password
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
                Employer thisEmployer1 = (Employer)Session[C2CUtil.CURRENT_USER];
                if (txtUserCurrentPassword0.Text != DataManager.getEmployerUPassword(thisEmployer1.EmployerId))
                {
                    lblMessage.Text = "Current password is invalid";
                    return;
                }
                string result = DataManager.updateEmployerPassword(txtUserPassword.Text, thisEmployer1.EmployerId);
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
            Response.Redirect("~/Pages/EmployerMain.aspx");
        }
    }
}
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

    public partial class UserRegistration : System.Web.UI.Page
    {
        //static private Dictionary<QueryResult, string> queryResultMessage =
        //   new Dictionary<QueryResult, string> { 
        //   {QueryResult.EmailExisted, "This email has already been registered"  }, 
        //   { QueryResult.InsertFail, "Error: Can't insert into the database"} ,
        //   { QueryResult.Success, "Success"},
        //   {QueryResult.UnknowDatabaseIssue, "Error when connecting to DB"}
        //   };


          protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// SUBMit button click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
     //   protected void Button1_Click(object sender, EventArgs e)
     //   {
     //       //call to model layer to create this user
     //       ModelLayer.User newUser = new ModelLayer.User(txtSalutation.Text, txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtAddress.Text, txtPhone.Text, C2CUtil.UserTypeMap[drlUserType.SelectedValue]);
     ////       QueryResult result = ModelLayer.ModelManager.CreateUser(newUser, txtPassword.Text);
     //       lblMessage.Text = queryResultMessage[result];
     //       //go to some page...
     //       //if success -> go to page..
     //       if (result == QueryResult.Success)
     //       {
     //           //go to log in again:
     //           Session[C2CUtil.HOME_PAGE_MESSAGE] = "You have registered succesfully,  please log in";
     //           Response.Redirect("~/Pages/index.aspx");
     //       }
     //   }

        //When select User Type: First_Selection
        protected void drlUserType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (drlUserType.SelectedIndex == 2)//select employer
            //{
            //    lblSelectCompany.Visible = true;
            //    drlSelectCompany.Visible = true;
            //    LoadAllExisintCompany();
            //    ShowCreateNewCompany();//default is to create new company
                
             
            //   // PanelSchool.Visible = false;
            //}
            //else if (drlUserType.SelectedIndex == 1)
            //{
            // //   PanelSchool.Visible = true;
            //  //  PanelCompany.Visible = false;
            //}
            //else
            //{
            // //   PanelSchool.Visible = false;
            //    PanelCompany.Visible = false;
            //}
        }

        //private void LoadAllExisintCompany()
        //{
        //    List<Company> allCompany = ModelManager.GetAllCompanies();
        //    for (int i = 0; i < allCompany.Count; i++)
        //        drlSelectCompany.Items.Add(new ListItem(allCompany[i].Name, allCompany[i].CompanyID.ToString()));
        //}
      
        //private void ShowExistingCompanyInfo(int compId)
        //{
        //    //load the company that the user selected from the drop down
        //    Company selectedCompany = ModelManager.GetCompany(compId);
        //    //populate contros:
        //    //TODO: make the controls below not editable( only to show to information)
        //    txtComName.Text = selectedCompany.Name;
        //    txtComWebsite.Text = selectedCompany.Website;
        //    drlComIndustry.Items.Clear();
        //    drlComIndustry.Items.Add(new ListItem(selectedCompany.Industry.Name, selectedCompany.Industry.Id.ToString()));
        //}
        //private void ShowCreateNewCompany()
        //{
        //    //display 
        //     PanelCompany.Visible = true;
        //    //load all industries:
        //     List<Industry> industries = ModelManager.GetAllIndustries();
        //     for (int i = 0; i < industries.Count; i++)
        //         drlComIndustry.Items.Add(new ListItem(industries[i].Name, industries[i].Id.ToString()));
            
        //}
        ////When user decide to create a new company or pick an existing one: Second_Selection
        //protected void drlSelectCompany_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (drlSelectCompany.SelectedIndex == 0) //case1
        //    {
        //        ShowCreateNewCompany();
        //        return;
        //    }
        //    else //case2
        //    {
        //        ShowExistingCompanyInfo(System.Convert.ToInt32(drlSelectCompany.SelectedValue));
        //    }
        //}

    }
}
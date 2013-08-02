using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.ModelLayer;
using C2C.UserControls;

namespace C2C.Pages
{
    public partial class index : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session[C2CUtil.HOME_PAGE_MESSAGE] != null)
            //{
            //    lblMainMessage.Text = Session[C2CUtil.HOME_PAGE_MESSAGE].ToString();
            //    Session.Remove(C2CUtil.HOME_PAGE_MESSAGE);
            //                }
         
            //verified if loged in
            if (Session[C2CUtil.LOGED_IN] == null)
            {
                //if not yet log in then show the log in box
                C2C.UserControls.Login  myLogin = (C2C.UserControls.Login)LoadControl("~/UserControls/Login.ascx");
                pnlMainBody.Controls.Add(myLogin);
                return;
                            
            }
            else //already log in then update the tool link box
            {
                if (Request.QueryString["action"] == C2CUtil.LOG_OUT)
                {
                    Session.Clear();
               //     Session[C2CUtil.HOME_PAGE_MESSAGE] = "You have logged out";
                    Response.Redirect("~/Pages/index.aspx");
                    return;
                }
                 ModelLayer.User currentUser = (ModelLayer.User)Session[C2CUtil.CURRENT_USER];
                //show some welcome message to the loged in advisor:
                Label welcomeMessage = new Label();
                welcomeMessage.Text = "Welcome, " + currentUser.FirstName + currentUser.LastName;
                pnlMainBody.Controls.Add(welcomeMessage);
                //add the tool link:
                ToolLink tool1 = (C2C.UserControls.ToolLink)LoadControl("~/UserControls/ToolLink.ascx");
                tool1.EnableToolsForUser(currentUser.Type);
                pnlMainBody.Controls.Add(tool1);
                 //only allow advisor to post job
                if (Request.QueryString["action"] == C2CUtil.POST_JOB && currentUser.Type == UserType.Employer)
                {
                   //TODO:insert post job control here
                    //add the job post control:
                    PostJobForm jobPost = (PostJobForm)LoadControl("~/UserControls/PostJobForm.ascx");
                    pnlMainBody.Controls.Add(jobPost);
                    CompanyForm newCompany = (CompanyForm)LoadControl("~/UserControls/CompanyForm.ascx");
                    //pnlMainBody.Controls.Add(newCompany);

                }
              
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            C2C.UserControls.Login loginControl1 = new C2C.UserControls.Login();
            pnlMainBody.Controls.Add(loginControl1);
        }
    }
}
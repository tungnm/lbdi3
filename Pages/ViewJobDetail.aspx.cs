using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.ModelLayer;
using C2C.DataLayer;

namespace C2C.Pages
{
    public partial class ViewJobDetail : System.Web.UI.Page
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

            if (Session[C2CUtil.USER_ADVISOR] == null)
            {
                btnBack.Visible = false;
                btnBack0.Visible = false;
                btnBack1.Visible = false;
                btnBack2.Visible = false;
            }

            if (Session[C2CUtil.USER_EMPLOYER] != null)
            {
                btnBack3.Visible = true;
                btnBack4.Visible = true;
            }


                //get jobID from the query string
            //if (Request.QueryString[C2CUtil.REQUESTED_JOB_ID] == null)
            //{
            //     Session[C2CUtil.MESSAGE] = "Invalid JobId";
            //    return;
            //}
            if (Request.QueryString["ID"] == null)
            {
                Session[C2CUtil.MESSAGE] = "Invalid Id";
                return;
            }
            try
            {

                //int jobId = System.Convert.ToInt32(Request.QueryString[C2CUtil.REQUESTED_JOB_ID]);
                int jobId = System.Convert.ToInt32(Request.QueryString["ID"]);
                //if valid jobId then go to database to pull out the job model
                Job thisJob = DataManager.GetJobDetailbyJobId(jobId);
                string thisJobFunction = DataManager.getFunctionName(thisJob.FunctionId);
                string thisJobState = DataManager.getStateName(thisJob.StateId);


                //txtTitle.Text = thisJob.Title.ToString();
                lblTitle.Text = thisJob.Title.ToString();
                txtCompany.Text = DataManager.getCompanyNamebyJobID(jobId);
                txtFunction.Text = thisJobFunction;
                txtJobtype.Text = thisJob.JType.ToString();
                txtCity.Text = thisJob.City.ToString();
                txtState.Text = thisJobState;
                //txtQualification.Text = thisJob.Qualification.ToString();
                lblQualification.Text = thisJob.Qualification.ToString();
                //txtDescription.Text = thisJob.Description.ToString();
                lblDescription.Text = thisJob.Description.ToString();
                txtPostedDate.Text = thisJob.PostDate.ToString();
                txtExpDate.Text = thisJob.ExpireDate.ToString();
                Session[C2CUtil.MESSAGE] = "Displaying Internship Detail";
                return;
            }
            catch (Exception ee)
            {
                //Session[C2CUtil.MESSAGE] = "Error: " + ee.ToString();
                Session[C2CUtil.MESSAGE] = "Internship is not existed. Error: " + ee.Message;
                return;
            }
            
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/BrowseJobs.aspx");
        }

        protected void btnBack1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/AdvisorMainPage.aspx");
        }

        protected void btnBack3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/EmployerMain.aspx");
        }


    }
}
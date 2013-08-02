using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using C2C.ModelLayer;
using C2C.DataLayer;
using C2C.UserControls;

namespace C2C.Pages
{
    public partial class EmployerMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //verified if logged in and is employer
                if (Session[C2CUtil.LOGED_IN] == null || Session[C2CUtil.USER_EMPLOYER] == null)
                {
                    //if not yet log in or is not employer then show the log in box
                    Response.Redirect("~/Pages/UserLogin.aspx");
                    return;
                }

                 //get current User:
                ModelLayer.Employer currentUser = (ModelLayer.Employer)Session[C2CUtil.CURRENT_USER];
                lblWelcome.Text = "Welcome, " + currentUser.User_Salutation + " " + currentUser.User_Fullname;

                //internship list
                DataTable myjobList = DataManager.GetAllJobPostedBy(currentUser.EmployerId);
                GridView1.DataSource = myjobList;
                GridView1.DataBind();

                //select student list
                DataTable mySelectedStudent = DataManager.getSelectedStudentID_byEmployerID(currentUser.EmployerId);
                GridView2.DataSource = mySelectedStudent;
                GridView2.DataBind();
            }
        }


        //Delete button action
        protected void btnRemove_Click(object sender, EventArgs e)
        {

            //ConfirmButtonExtender1.Enabled = true;
            try
            {
                int jobId = System.Convert.ToInt32(GridView1.Rows[Convert.ToInt32(((Button)sender).CommandArgument.ToString())].Cells[0].Text);
                //lblMessage.Text = studentId.ToString();
                try
                {
                    string result = DataManager.deleteJob(jobId);
                    if (result == "Success")
                    {
                        //refresh the list of posted internship after removing
                        ModelLayer.Employer currentUser = (ModelLayer.Employer)Session[C2CUtil.CURRENT_USER];
                        lblWelcome.Text = "Welcome, " + currentUser.User_Salutation + " " + currentUser.User_Fullname;

                        DataTable myjobList = DataManager.GetAllJobPostedBy(currentUser.EmployerId);
                        GridView1.DataSource = myjobList;
                        GridView1.DataBind();

                        lblMessage.Text = "Internship has been deleted successfully.";
                    }
                    else lblMessage.Text = "Error: Can not delete this internship. Please try again!";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    return;
                }

            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                return;
            }
        }

        protected void btnHired_Click(object sender, EventArgs e)
        {

        }

        protected void btnNotHired_Click(object sender, EventArgs e)
        {

        }



        // move all of those AutoGenerate Columns to the leftmost columns of the GridView
        // so the template filed
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            GridViewRow row = e.Row;
            // Intitialize TableCell list
            List<TableCell> columns = new List<TableCell>();
            foreach (DataControlField column in GridView1.Columns)
            {
                //Get the first Cell /Column
                TableCell cell = row.Cells[0];
                // Then Remove it after
                row.Cells.Remove(cell);
                //And Add it to the List Collections
                columns.Add(cell);
            }

            // Add cells
            row.Cells.AddRange(columns.ToArray());
        }


        // move all of those AutoGenerate Columns to the leftmost columns of the GridView
        // so the template filed
        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            GridViewRow row = e.Row;
            // Intitialize TableCell list
            List<TableCell> columns = new List<TableCell>();
            foreach (DataControlField column in GridView2.Columns)
            {
                //Get the first Cell /Column
                TableCell cell = row.Cells[0];
                // Then Remove it after
                row.Cells.Remove(cell);
                //And Add it to the List Collections
                columns.Add(cell);
            }

            // Add cells
            row.Cells.AddRange(columns.ToArray());
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.DataLayer;
using System.Data;
using C2C.ModelLayer;

namespace C2C.Pages
{
    public partial class AdvisorMainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verified if loged in and is advisor
            if (Session[C2CUtil.LOGED_IN] == null || Session[C2CUtil.USER_ADVISOR] == null)
            {
                //if not yet log in or is not advisor then show the log in box
                Response.Redirect("~/Pages/UserLogin.aspx");
                return;
            }

        
          
            if (!IsPostBack)
            {
                ModelLayer.Advisor currentUser = (ModelLayer.Advisor)Session[C2CUtil.CURRENT_USER];
                lblWelcome.Text = "Welcome, " + currentUser.User_Salutation + " " + currentUser.User_Fullname;
                
                //get current advisor to retrieve his uploaded resume from the database
                 //get current User:
                DataTable fileList = DataManager.GetAllResumeUploadedBy(currentUser.AdvisorId);
                //gvFiles.DataSource = fileList;
                //gvFiles.DataBind();
                GridView1.DataSource = fileList;
                GridView1.DataBind();
            }
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            //ConfirmButtonExtender1.Enabled = true;
            try
            {
                int studentId = System.Convert.ToInt32(GridView1.Rows[Convert.ToInt32(((Button)sender).CommandArgument.ToString())].Cells[0].Text);
                //lblMessage.Text = studentId.ToString();
                try
                {
                    string result = DataManager.deleteStudent(studentId);
                    if (result == "Success")
                    {
                        ModelLayer.Advisor currentUser = (ModelLayer.Advisor)Session[C2CUtil.CURRENT_USER];
                        lblWelcome.Text = "Welcome, " + currentUser.User_Salutation + " " + currentUser.User_Fullname;

                        //get current advisor to retrieve his uploaded resume from the database
                        //get current User:
                        DataTable fileList = DataManager.GetAllResumeUploadedBy(currentUser.AdvisorId);
                        //gvFiles.DataSource = fileList;
                        //gvFiles.DataBind();
                        GridView1.DataSource = fileList;
                        GridView1.DataBind();
                        lblMessage.Text = "Resume has been deleted successfully.";
                    }
                    else lblMessage.Text = "Error: Can not delete this resume. Please try again!";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "DISPLAYING";
        }


    }
}
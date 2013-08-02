using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.DataLayer;
using C2C.ModelLayer;
using System.Data;
namespace C2C.Pages
{
    public partial class BrowseResumes : System.Web.UI.Page
    {
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

                List<School> schools = ModelManager.GetAllSchool();
                drlSchool.Items.Add(new ListItem("All Schools", "all"));
                for (int i = 0; i < schools.Count; i++)
                    drlSchool.Items.Add(new ListItem(schools[i].Name, schools[i].Id.ToString()));

                List<Major> majors = ModelManager.GetAllMajor();
                drlMajor.Items.Add(new ListItem("All Majors","all"));
                for (int i = 0; i < majors.Count; i++)
                    drlMajor.Items.Add(new ListItem(majors[i].Name, majors[i].Id.ToString()));

                DataTable fileList = DataManager.GetAllResumeList();
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/EmployerMain.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                int? schoolSelection;
                if (drlSchool.SelectedValue == "all") schoolSelection = null;
                else schoolSelection = System.Convert.ToInt32(drlSchool.SelectedValue);

                int? majorSelection;
                if (drlMajor.SelectedValue == "all") majorSelection = null;
                else majorSelection = System.Convert.ToInt32(drlMajor.SelectedValue);

                string type;
                if (drlType.SelectedValue == "all") type = null;
                else type = drlType.SelectedValue;

                string keyword;
                if (txtKeyword.Text == "") keyword = null;
                else keyword = txtKeyword.Text;

                DataTable resumeList = DataManager.ResumeSearch(schoolSelection, majorSelection, type, keyword);
                //gvFiles.DataSource = fileList;
                //gvFiles.DataBind();
                GridView1.DataSource = resumeList;
                GridView1.DataBind();
                lblMessage.Text = "Search Result: ";
            }
            catch (Exception er)
            {
                lblMessage.Text = "Error: operation failed. Please try again" + er.ToString();
            }
   
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                int studentId = System.Convert.ToInt32(GridView1.Rows[Convert.ToInt32(((Button)sender).CommandArgument.ToString())].Cells[0].Text);
                string studentFullName = GridView1.Rows[Convert.ToInt32(((Button)sender).CommandArgument.ToString())].Cells[1].Text + " " + GridView1.Rows[Convert.ToInt32(((Button)sender).CommandArgument.ToString())].Cells[2].Text; ;
                string studentSchool = GridView1.Rows[Convert.ToInt32(((Button)sender).CommandArgument.ToString())].Cells[4].Text;
                string studentEmail = GridView1.Rows[Convert.ToInt32(((Button)sender).CommandArgument.ToString())].Cells[3].Text;
                string advisorEmail = DataManager.getAdvisorEmailbyStudentID(studentId);
                
                List<string> toAdemails = new List<String>();
                toAdemails.Add(advisorEmail);

                List<string> toStemails = new List<String>();
                toStemails.Add(studentEmail);
                
                Employer thisEmployer = (Employer)Session[C2CUtil.CURRENT_USER];
                
                //email for advisor:
                string mailTitle = "C2C Notification: " + thisEmployer.Comp_Name + " company is interested in this student";
                string mailBody = "<html><body>This email has been sent to following student and his/her advisor: <br>"
                                    + "Student Name: <b>" + studentFullName + "</b><br>"
                                    + "Student Email: <b>" + studentEmail + "</b><br>"
                                    + "College/ University: " + studentSchool + "</b><br>"
                                    + thisEmployer.Comp_Name + " company has viewed the student's resume on C2C website and they want to interview this student.<br>"
                                    + "If you are student please contact your advisor for further detail.<br>"
                                    + "If you are advisor please notify to your student about this opportunity.<br>Visit C2C webite to check it out. Please DO NOT reply this electronically generated email!</body></html>";
                //ModelManager.SendEmail(toAdemails, mailTitle, mailBody);


                //email for student
                string mailTitle2 = "C2C Notification: A company is interested in your resume";
                string mailBody2 = "<html><body>This email has been sent to following student and his/her advisor: <br>"
                                    + "Student Name: <b>" + studentFullName + "</b><br>"
                                    + "Student Email: <b>" + studentEmail + "</b><br>"
                                    + "College/ University: " + studentSchool + "</b><br>"
                                    + "A company has viewed your resume on C2C website and they want to get in touch with you.<br>"
                                    + "Please contact your advisor for further detail. If you are not this student please disregard this email.<br>"
                                    + "Please DO NOT reply this electronically generated email!</body></html>";               
                ModelManager.SendEmail(toStemails, mailTitle2, mailBody2);
                
                //insert into SelectedStudent table database
                if (DataManager.InsertSelectedStudent(studentId, thisEmployer.EmployerId, System.DateTime.Now.ToString()) == "Success")
                {
                    lblMessage.Text = "You have selected this student at: " + studentEmail + ". Notification emails has been sent to both student and his/her advisor. Student was saved to your list, you can see it at your main page.";

                }
                else
                {
                    lblMessage.Text = "You have selected this student at: " + studentEmail + ". Notification emails has been sent to both student and his/her advisor. System FAILED to save this student to your list.";
                }




            }
            catch (Exception ex)
            {
                lblMessage.Text = "Operation FAILED. The following error occured: " + ex.Message;
            } 

        }

    }
    
}
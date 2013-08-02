using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using C2C.ModelLayer;
using C2C.DataLayer;

namespace C2C.Pages
{
    public partial class ViewCompanyDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    int employerID = System.Convert.ToInt32(Request.QueryString["ID"]);
                    DataTable compInfo = DataManager.getCompanyInfo(employerID);
                    DataTable jobList = DataManager.GetAllJobPostedBy(employerID);

                    GridView1.DataSource = compInfo;
                    GridView1.DataBind();

                    GridView2.DataSource = jobList;
                    GridView2.DataBind();
                }
                catch (Exception er)
                {
                    lblMessage.Text = "Error: operation failed. Please try again" + er.ToString();
                }
            }

        }

        // move all of those AutoGenerate Columns to the leftmost columns of the GridView2
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
        
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/BrowseCompanies.aspx");
        }
    }
}
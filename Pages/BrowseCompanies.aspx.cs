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
    public partial class BrowseCompanies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////verified if loged in
            //if (Session[C2CUtil.LOGED_IN] == null)
            //{
            //    //if not yet log in then show the log in box
            //    Response.Redirect("~/Pages/UserLogin.aspx");
            //    return;
            //}

            if (!IsPostBack)
            {
                List<Industry> industries = ModelManager.GetAllIndustries();
                drlIndustry.Items.Add(new ListItem("All Industries", "all"));
                for (int i = 0; i < industries.Count; i++)
                    drlIndustry.Items.Add(new ListItem(industries[i].Name, industries[i].Id.ToString()));

                List<State> states = ModelManager.GetAllState();
                drlState.Items.Add(new ListItem("All States", "all"));
                for (int i = 0; i < states.Count; i++)
                {
                    drlState.Items.Add(new ListItem(states[i].Name, states[i].Id.ToString()));
                }

                //ModelLayer.Advisor currentUser = (ModelLayer.Advisor)Session[C2CUtil.CURRENT_USER];

                DataTable fileList = DataManager.getCompanyList(null, null);
                fileList.Columns.Remove("Description");
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                //ModelLayer.Advisor currentUser = (ModelLayer.Advisor)Session[C2CUtil.CURRENT_USER];
                int? IndustrySelection;
                if (drlIndustry.SelectedValue == "all") IndustrySelection = null;
                else IndustrySelection = System.Convert.ToInt32(drlIndustry.SelectedValue);

                int? StateSelection;
                if (drlState.SelectedValue == "all") StateSelection = null;
                else StateSelection = System.Convert.ToInt32(drlState.SelectedValue);

                DataTable fileList = DataManager.getCompanyList(IndustrySelection, StateSelection);
                fileList.Columns.Remove("Description");
                GridView1.DataSource = fileList;
                GridView1.DataBind();

                lblMessage.Text = "Search Result: ";
            }
            catch (Exception er)
            {
                lblMessage.Text = "Error: operation failed. Please try again" + er.ToString();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/AdvisorMainPage.aspx");
        }
    }
}
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
    public partial class AllJobs : System.Web.UI.Page
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

                List<State> states = ModelManager.GetAllState();
                drlState.Items.Add(new ListItem("All States", "all"));
                for (int i = 0; i < states.Count; i++)
                    drlState.Items.Add(new ListItem(states[i].Name, states[i].Id.ToString()));

                List<Function> functions = ModelManager.GetAllFunction();
                drlFunction.Items.Add(new ListItem("All Functions", "all"));
                for (int i = 0; i < functions.Count; i++)
                    drlFunction.Items.Add(new ListItem(functions[i].Name, functions[i].Id.ToString()));

                DataTable jobList = DataManager.browseJobs(null, null, null, null);
                GridView1.DataSource = jobList;
                GridView1.DataBind();
                //hide id column
                //GridView1.Columns[0].Visible = false;
                //resize company colun
             //   GridView1.Columns[5].ItemStyle.Width = 10;
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
                int? FunctionSelection;
                if (drlFunction.SelectedValue == "all") FunctionSelection = null;
                else FunctionSelection = System.Convert.ToInt32(drlFunction.SelectedValue);

                int? StateSelection;
                if (drlState.SelectedValue == "all") StateSelection = null;
                else StateSelection = System.Convert.ToInt32(drlState.SelectedValue);

                string type;
                if (drlType.SelectedValue == "all") type = null;
                else type = drlType.SelectedValue;

                string keyword;
                if (txtKeyword.Text == "") keyword = null;
                else keyword = txtKeyword.Text;

                DataTable jobList = DataManager.browseJobs(FunctionSelection, StateSelection, type, keyword);
                //gvFiles.DataSource = fileList;
                //gvFiles.DataBind();
                GridView1.DataSource = jobList;
                GridView1.DataBind();
                lblMessage.Text = "Search Result: ";
            }
            catch (Exception er)
            {
                lblMessage.Text = "Error: operation failed. Please try again" + er.Message;
                return;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/AdvisorMainPage.aspx");
        }


    }
}
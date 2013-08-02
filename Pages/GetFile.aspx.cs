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
    public partial class GetFile : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the file id from the query string

            string link = Request.QueryString.ToString();
            int id = Convert.ToInt32(Request.QueryString["ID"]);
            //string url = Request.RawUrl;         

            // Get the file from the database
            DataTable file = DataManager.GetAFile(id);
            DataRow row = file.Rows[0];

            string fname = (string)row["FName"];
            string lname = (string)row["LName"];
            string name = (string)row["FileName"];
            string contentType = (string)row["FileType"];
            Byte[] data = (Byte[])row["File"];

            // Send the file to the browser
            Response.AddHeader("Content-type", contentType);
            Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(name));
            Response.Charset = "UTF-8";
            Response.BinaryWrite(data);
            Response.Flush();
            Response.End();
        }
         
    }
}
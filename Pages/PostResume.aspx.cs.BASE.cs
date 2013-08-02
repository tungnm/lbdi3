using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//using ASPNetFileUpDownLoad.Utilities;
using C2C.ModelLayer;
using C2C.DataLayer;
using C2C.UserControls;
using System.IO;

namespace C2C.Pages
{
    public partial class PostResume : System.Web.UI.Page
    {
        public static Dictionary<QueryResult, string> queryResultMessage = new Dictionary<QueryResult, string> { 
           { QueryResult.InsertFail, "Error: Can't insert into the database"} ,
           { QueryResult.Success, "Success"},
           { QueryResult.UnknowDatabaseIssue, "Error when connecting to DB"}
           };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<School> schools = ModelManager.GetAllSchool();
                for (int i = 0; i < schools.Count; i++)
                    drlSchool.Items.Add(new ListItem(schools[i].Name, schools[i].Id.ToString()));

                List<Major> majors = ModelManager.GetAllMajor();
                for (int i = 0; i < majors.Count; i++)
                    drlMajor.Items.Add(new ListItem(majors[i].Name, majors[i].Id.ToString()));

            }
        }

        //button upload file
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            
            //string filename = Path.GetFileName(FileResume.PostedFile.FileName);
            //Stream str = FileResume.PostedFile.InputStream;
            //BinaryReader br = new BinaryReader(str);
            //Byte[] theFile = br.ReadBytes((int)str.Length);


            HttpFileCollection files = Request.Files;
            foreach (string fileTagName in files)
            {
                HttpPostedFile file = Request.Files[fileTagName];
                if (file.ContentLength > 0)
                {
                    // Due to the limit of the max for a int type, the largest file can be
                    // uploaded is 2147483647, which is very large anyway.
                    int size = file.ContentLength;
                    string filename = file.FileName;
                    int position = filename.LastIndexOf("\\");
                    filename = filename.Substring(position + 1);
                    string contentType = file.ContentType;
                    byte[] fileData = new byte[size];
                    file.InputStream.Read(fileData, 0, size);

                    //FileUtilities.SaveFile(name, contentType, size, fileData);
                    Student newStudent = new Student(5, txtFName.Text, txtLName.Text, txtEmail.Text, System.Convert.ToInt32(drlSchool.SelectedValue)
                , System.Convert.ToInt32(drlMajor.SelectedValue), drlType.SelectedValue, filename, contentType, size, null, fileData);
                    QueryResult result = ModelManager.InsertNewStudent(newStudent);
                    lblMessage.Text = queryResultMessage[result];
                }
            }

            //Student newStudent = new Student(txtFName.Text, txtLName.Text, txtEmail.Text, System.Convert.ToInt32(drlSchool.SelectedValue)
            //    , System.Convert.ToInt32(drlMajor.SelectedValue), drlType.SelectedValue, filename, "resume cha co' cac gi", theFile);
            //QueryResult result = ModelManager.InsertNewStudent(newStudent);
            //lblMessage.Text = queryResultMessage[result];
        }

        //button submit resume
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}
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
           { QueryResult.InsertFail, "Error: Can't insert into the database!"} ,
           { QueryResult.Success, "Resume has been posted successfully!"},
           { QueryResult.UnknowDatabaseIssue, "Error when connecting to DB!"}
           };

        protected void Page_Load(object sender, EventArgs e)
        {
            //verified if loged in
            if (Session[C2CUtil.LOGED_IN] == null)
            {
                //if not yet log in then show the log in box
                Response.Redirect("~/Pages/UserLogin.aspx");
                return;
            }


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

            try
            {
                //get current user to use the AdvisorId:
                ModelLayer.Advisor currentUser = (ModelLayer.Advisor)Session[C2CUtil.CURRENT_USER];

                if (FileResume.HasFile)
                {
                    // Get the name of the file to upload.
                    string fileName = Server.HtmlEncode(FileResume.FileName);

                    // Get the extension of the uploaded file.
                    string extension = System.IO.Path.GetExtension(fileName);

                    int fileSize = FileResume.PostedFile.ContentLength;

                    // Allow only files with .doc .docx .txt .pdf extensions
                    // to be uploaded.
                    if (((extension == ".doc") || (extension == ".docx") || (extension == ".txt") || (extension == ".pdf")) && fileSize <= 2097152)
                    {
                        //HttpFileCollection files = Request.Files;
                        //foreach (string fileTagName in files)
                        //{
                        //    HttpPostedFile file = Request.Files[fileTagName];
                        //    //only file < 5MB is allowed
                        //    if (file.ContentLength > 0 && file.ContentLength <= 5242880)
                        //    {
                        //        // Due to the limit of the max for a int type, the largest file can be
                        //        // uploaded is 2147483647, which is very large anyway.
                        //        int size = file.ContentLength;
                        //        string filename = file.FileName;
                        //        int position = filename.LastIndexOf("\\");
                        //        filename = filename.Substring(position + 1);
                        //        string contentType = file.ContentType;
                        //        byte[] fileData = new byte[size];
                        //        file.InputStream.Read(fileData, 0, size);

                                //FileUtilities.SaveFile(name, contentType, size, fileData);
                        string contentType = FileResume.PostedFile.ContentType;
                        int size = FileResume.PostedFile.ContentLength;
                        string filename = Server.HtmlEncode(FileResume.PostedFile.FileName);               
                        Stream str = FileResume.PostedFile.InputStream;
                     
                        //parse txt
                        StreamReader ss = new StreamReader(str);
                        string rawText = ss.ReadToEnd();                                                             
                        //end

                        str.Seek(0, SeekOrigin.Begin); //len tren dau
                        BinaryReader br = new BinaryReader(str);
      
                        Byte[] fileData = br.ReadBytes((int)str.Length);

                                Student newStudent = new Student(currentUser.AdvisorId, txtFName.Text, txtLName.Text, txtEmail.Text, System.Convert.ToInt32(drlSchool.SelectedValue)

                            , System.Convert.ToInt32(drlMajor.SelectedValue), drlType.SelectedValue, filename, contentType, size, rawText, fileData);
                                QueryResult result = ModelManager.InsertNewStudent(newStudent);
                                //if post succesfullly then clear the form so the advisor can upload another student
                                if (result == QueryResult.Success)
                                {
                                    txtEmail.Text = "";
                                    txtFName.Text = "";
                                    txtLName.Text = "";
                                    drlMajor.SelectedIndex = 0;
                                    drlSchool.SelectedIndex = 0;
                                    drlType.SelectedIndex = 0;

                                }
                                lblMessage.Text = queryResultMessage[result];
                            }
                    
                    else
                    {
                        lblMessage.Text = "Only allow files with .doc .docx .txt .pdf extensions and Maximum file size is 2 MB";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            } 
          
        }
        
        //go back to main page
        protected void btnBackToMainPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/AdvisorMainPage.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using C2C.ModelLayer;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace C2C.DataLayer
{
    public enum QueryResult { EmailExisted, Success, InsertFail, UnknowDatabaseIssue };

    /// <summary>
    /// HANDLE THINGS IN DATABASE LAYER
    /// </summary>
    public static class DataManager
    {
        public static List<Industry> getIndustry()
        {
            List<Industry> result = new List<Industry>();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string query = "SELECT [IndustryID], [Name] FROM [C2CDatabase].[dbo].[Industry] ORDER BY [Name] ASC";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                while (reader.Read())
                {
                    result.Add(new Industry { Name = reader["Name"].ToString(), Id = System.Convert.ToInt32(reader["IndustryID"]) });
                }
                DisconnectFromDB();
                return result;
            }
        }

        public static List<State> getState()
        {
            List<State> result = new List<State>();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string query = "SELECT [StateID], [state_full] FROM [C2CDatabase].[dbo].[State] ORDER BY [state_full] ASC";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                while (reader.Read())
                {
                    result.Add(new State { Name = reader["state_full"].ToString(), Id = System.Convert.ToInt32(reader["StateID"]) });
                }
                DisconnectFromDB();
                return result;
            }
        }

        public static List<Function> getFunction()
        {
            List<Function> result = new List<Function>();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string query = "SELECT [FunctionID], [Name] FROM [C2CDatabase].[dbo].[Function] ORDER BY [Name] ASC";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                while (reader.Read())
                {
                    result.Add(new Function { Name = reader["Name"].ToString(), Id = System.Convert.ToInt32(reader["FunctionID"]) });
                }
                DisconnectFromDB();
                return result;
            }
        }

        public static List<School> getSchool()
        {
            List<School> result = new List<School>();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string query = "SELECT [SchoolID], [Name], [Website] FROM [C2CDatabase].[dbo].[School] ORDER BY [Name] ASC";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                while (reader.Read())
                {
                    result.Add(new School { Id = System.Convert.ToInt32(reader["SchoolID"]), Name = reader["Name"].ToString(), Website = reader["Website"].ToString() });
                }
                DisconnectFromDB();
                return result;
            }
        }

        public static List<Major> getMajor()
        {
            List<Major> result = new List<Major>();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string query = "SELECT [MajorID], [Name] FROM [C2CDatabase].[dbo].[Major] ORDER BY [Name] ASC";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                while (reader.Read())
                {
                    result.Add(new Major { Id = System.Convert.ToInt32(reader["MajorID"]), Name = reader["Name"].ToString() });
                }
                DisconnectFromDB();
                return result;
            }
        }

        public static QueryResult InsertEmployer(Employer newEmployer, string password)
        {
            int insertOK;
            if (ConnectToDB() != QueryResult.Success) return QueryResult.UnknowDatabaseIssue;
            using (myConnection)
            {
                string query = "select count (*) as existed from [C2CDatabase].[dbo].[Employer] where UEmail = '" + newEmployer.User_Email.ToString() + "'";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                //check existed email
                int emailExisted = (int)myCommnand.ExecuteScalar();
                if (emailExisted > 0) return QueryResult.EmailExisted;
                query = "INSERT INTO [C2CDatabase].[dbo].[Employer] VALUES('" + newEmployer.Comp_Name.ToString() + "'," +
                                                                                newEmployer.Comp_IndustryId.ToString() + ",'" +
                                                                                newEmployer.Comp_Website.ToString() + "','" +
                                                                                newEmployer.Comp_Description.ToString() + "','" +
                                                                                newEmployer.Comp_Address.ToString() + "','" +
                                                                                newEmployer.Comp_City.ToString() + "'," +
                                                                                newEmployer.Comp_StateId.ToString() + ",'" +
                                                                                newEmployer.Comp_Zipcode.ToString() + "','" +
                                                                                newEmployer.User_Salutation.ToString() + "','" +
                                                                                newEmployer.User_Fullname.ToString() + "','" +
                                                                                newEmployer.User_Address.ToString() + "','" +
                                                                                newEmployer.User_City.ToString() + "'," +
                                                                                newEmployer.User_StateId.ToString() + ",'" +
                                                                                newEmployer.User_Zipcode.ToString() + "','" +
                                                                                newEmployer.User_Phone.ToString() + "','" +
                                                                                newEmployer.User_Email.ToString() + "','" +
                                                                                password + "')";
                myCommnand = new SqlCommand(query, myConnection);
                insertOK = myCommnand.ExecuteNonQuery();
            }
            //close DB
            DisconnectFromDB();
            if (insertOK > 0) return QueryResult.Success;
            else return QueryResult.InsertFail;
        }

        //Update Employer table
        public static QueryResult UpdateEmployer(Employer newEmployer, string password, int ID)
        {
            int updateOK;
            if (ConnectToDB() != QueryResult.Success) return QueryResult.UnknowDatabaseIssue;
            using (myConnection)
            {
                string query = "UPDATE [dbo].[Employer] SET [CName] = '" + newEmployer.Comp_Name.ToString() + "', [IndustryID] = " +

                                                                                newEmployer.Comp_IndustryId.ToString() + ", [CWebsite] = '" +
                                                                                newEmployer.Comp_Website.ToString() + "', [CDescription] = '" +
                                                                                newEmployer.Comp_Description.ToString() + "', [CAddress] = '" +
                                                                                newEmployer.Comp_Address.ToString() + "', [CCity] = '" +
                                                                                newEmployer.Comp_City.ToString() + "', [CStateID] = " +
                                                                                newEmployer.Comp_StateId.ToString() + ", [CZipcode] = '" +
                                                                                newEmployer.Comp_Zipcode.ToString() + "', [USalutation] = '" +

                                                                                newEmployer.User_Salutation.ToString() + "', [UName] = '" +
                                                                                newEmployer.User_Fullname.ToString() + "', [UAddress] = '" +
                                                                                newEmployer.User_Address.ToString() + "', [UCity]  ='" +
                                                                                newEmployer.User_City.ToString() + "', [UStateID] = " +
                                                                                newEmployer.User_StateId.ToString() + ", [UZipcode] = '" +
                                                                                newEmployer.User_Zipcode + "', [UPhone] = '" +
                                                                                newEmployer.User_Phone.ToString() + "', [UEmail] = '" +
                                                                                newEmployer.User_Email.ToString() + "', [UPassword] = '" +
                                                                                password + "' WHERE [EmployerID] = " + ID.ToString();
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                updateOK = myCommnand.ExecuteNonQuery();
            }
            //close DB
            DisconnectFromDB();
            if (updateOK > 0) return QueryResult.Success;
            else return QueryResult.InsertFail;
        }

        private static string GetCleanString(string input)
        {
            if (input == null) return input;
            else
                return System.Text.RegularExpressions.Regex.Replace(input, @"\?|\%|\$|\!|\*|&|\(|\)|<|>|'", "");
        }
        public static DataTable ResumeSearch(int? schoolId, int? majorId, string type, string keyword)
        {
            keyword = GetCleanString(keyword);
            //string query = "select buoi from lon where 1=1";
            //if (schoolId != null)
            //    query += "AND SchooID =" + schoolId;
            //if (majorId != null)
            //    query += "AND MajoeID = " + majorId;

            ////...

            //query += ";";
            DataTable resumeList = new DataTable();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;

                string query = "SELECT [StudentID] AS [ID], [FName] AS [First Name], [LName] AS [Last Name], [Email], [School].[Name] AS [School], [Major].[Name] AS [Major], [Type], [FileName] AS [Resume File], [FileSize] AS [Size(Byte)] FROM [Student], [School], [Major] WHERE [Student].[SchoolID] = [School].[SchoolID] AND [Student].[MajorID] = [Major].[MajorID]";
                if (schoolId != null) query += " AND [Student].[SchoolID] =" + schoolId;
                if (majorId != null) query += " AND [Student].[MajorID] =" + majorId;
                if (type != null) query += " AND [Student].[Type] ='" + type + "'";
                if (keyword != null) query += " AND [Student].[FileContent] like '%" + keyword + "%'";
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = cmd;
                adapter.Fill(resumeList);

                DisconnectFromDB();

            }
            return resumeList;
        }

        public static QueryResult InsertAdvisor(Advisor newAdvisor, string password)
        {
            int insertOK;
            if (ConnectToDB() != QueryResult.Success) return QueryResult.UnknowDatabaseIssue;
            using (myConnection)
            {
                string query = "select count (*) as existed from [C2CDatabase].[dbo].[Advisor] where UEmail = '" + newAdvisor.User_Email.ToString() + "'";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                //check existed email
                int emailExisted = (int)myCommnand.ExecuteScalar();
                if (emailExisted > 0) return QueryResult.EmailExisted;
                query = "INSERT INTO [C2CDatabase].[dbo].[Advisor] VALUES(" + newAdvisor.SchoolId.ToString() + ",'" +

                                                                                newAdvisor.School_Website.ToString() + "','" +

                                                                                newAdvisor.School_Address.ToString() + "','" +

                                                                                newAdvisor.User_Salutation.ToString() + "','" +
                                                                                newAdvisor.User_Fullname.ToString() + "','" +
                                                                                newAdvisor.User_Address.ToString() + "','" +
                                                                                newAdvisor.User_City.ToString() + "'," +
                                                                                newAdvisor.User_StateId.ToString() + ",'" +
                                                                                newAdvisor.User_Zipcode.ToString() + "','" +
                                                                                newAdvisor.User_Phone.ToString() + "','" +
                                                                                newAdvisor.User_Email.ToString() + "','" +
                                                                                password + "')";
                myCommnand = new SqlCommand(query, myConnection);
                insertOK = myCommnand.ExecuteNonQuery();
            }
            //close DB
            DisconnectFromDB();
            if (insertOK > 0) return QueryResult.Success;
            else return QueryResult.InsertFail;
        }

        //Update advisor table
        public static QueryResult UpdateAdvisor(Advisor newAdvisor, string password, int ID)
        {
            int updateOK;
            if (ConnectToDB() != QueryResult.Success) return QueryResult.UnknowDatabaseIssue;
            using (myConnection)
            {
                string query = "UPDATE [dbo].[Advisor] SET [SchoolID] = " + newAdvisor.SchoolId.ToString() + ", [SWebsite] = '" +

                                                                                newAdvisor.School_Website.ToString() + "', [SAddress] = '" +

                                                                                newAdvisor.School_Address.ToString() + "', [USalutation] = '" +

                                                                                newAdvisor.User_Salutation.ToString() + "', [UName] = '" +
                                                                                newAdvisor.User_Fullname.ToString() + "', [UAddress] = '" +
                                                                                newAdvisor.User_Address.ToString() + "', [UCity]  ='" +
                                                                                newAdvisor.User_City.ToString() + "', [UStateID] = " +
                                                                                newAdvisor.User_StateId.ToString() + ", [UZipcode] = '" +
                                                                                newAdvisor.User_Zipcode + "', [UPhone] = '" +
                                                                                newAdvisor.User_Phone.ToString() + "', [UEmail] = '" +
                                                                                newAdvisor.User_Email.ToString() + "', [UPassword] = '" +
                                                                                password + "' WHERE [AdvisorID] = " + ID.ToString();
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                updateOK = myCommnand.ExecuteNonQuery();
            }
            //close DB
            DisconnectFromDB();
            if (updateOK > 0) return QueryResult.Success;
            else return QueryResult.InsertFail;
        }

        //Update Advisor user password
        public static string updateAdvisorPassword(string newPass, int ID)
        {
            //connect to DB
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.Text;
                string query = "UPDATE [Advisor] SET UPassword = @password WHERE AdvisorID = @ID";
                cmd.Parameters.Add("@password", SqlDbType.VarChar, 13);
                cmd.Parameters["@Password"].Value = newPass;
                cmd.Parameters.Add("@ID", SqlDbType.Int);
                cmd.Parameters["@ID"].Value = ID;

                cmd.CommandText = query;
                if (cmd.ExecuteNonQuery() < 1) return null;
                DisconnectFromDB();
            }
            return "Success";
        }

        //Update Employer user password
        public static string updateEmployerPassword(string newPass, int ID)
        {
            //connect to DB
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.Text;
                string query = "UPDATE [Employer] SET UPassword = @password WHERE EmployerID = @ID";
                cmd.Parameters.Add("@password", SqlDbType.VarChar, 13);
                cmd.Parameters["@Password"].Value = newPass;
                cmd.Parameters.Add("@ID", SqlDbType.Int);
                cmd.Parameters["@ID"].Value = ID;

                cmd.CommandText = query;
                if (cmd.ExecuteNonQuery() < 1) return null;
                DisconnectFromDB();
            }
            return "Success";
        }

        public static Employer EmployerLogin(string email, string password)
        {
            //connect to DB
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string query = "SELECT * FROM [C2CDatabase].[dbo].[Employer] WHERE UEmail = '" + email + "' AND UPassword = '" + password + "'";

                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                Employer loggedEmployer = new Employer(
                                                        reader["CName"].ToString(),
                                                        System.Convert.ToInt32(reader["IndustryID"]),
                                                        reader["CWebsite"].ToString(),
                                                        reader["CDescription"].ToString(),
                                                        reader["CAddress"].ToString(),
                                                        reader["CCity"].ToString(),
                                                        System.Convert.ToInt32(reader["CStateID"]),
                                                        reader["CZipcode"].ToString(),
                                                        reader["USalutation"].ToString(),
                                                        reader["UName"].ToString(),
                                                        reader["UAddress"].ToString(),
                                                        reader["UCity"].ToString(),
                                                        System.Convert.ToInt32(reader["UStateID"]),
                                                        reader["UZipcode"].ToString(),
                                                        reader["UPhone"].ToString(),
                                                        reader["UEmail"].ToString());
                loggedEmployer.EmployerId = System.Convert.ToInt32(reader["EmployerID"]);
                DisconnectFromDB();
                return loggedEmployer;
            }
        }


        public static Advisor AdvisorLogin(string email, string password)
        {
            //connect to DB
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string query = "SELECT * FROM [C2CDatabase].[dbo].[Advisor] WHERE UEmail = '" + email + "' AND UPassword = '" + password + "'";

                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                Advisor loggedAdvisor = new Advisor(
                                                        System.Convert.ToInt32(reader["SchoolID"]),
                                                        reader["SWebsite"].ToString(),
                                                        reader["SAddress"].ToString(),
                                                        reader["USalutation"].ToString(),
                                                        reader["UName"].ToString(),
                                                        reader["UAddress"].ToString(),
                                                        reader["UCity"].ToString(),
                                                        System.Convert.ToInt32(reader["UStateID"]),
                                                        reader["UZipcode"].ToString(),
                                                        reader["UPhone"].ToString(),
                                                        reader["UEmail"].ToString());
                loggedAdvisor.AdvisorId = System.Convert.ToInt32(reader["AdvisorID"]);
                DisconnectFromDB();
                return loggedAdvisor;
            }
        }


        // insert job and get job ID to make job link when send email out to advisor
        public static QueryResult InsertJob(Job newJob, ref int newJobId)
        {


            //connect to DB
            if (ConnectToDB() != QueryResult.Success) return QueryResult.UnknowDatabaseIssue;

            using (myConnection)
            {

//                string query = @"INSERT INTO [dbo].[Job]
//            ([Title]
//           ,[EmployerID]
//           ,[FunctionID]
//           ,[Type]
//           ,[City]
//           ,[StateID]
//           ,[Qualification]
//           ,[Description]
//           ,[PostDate]
//           ,[ExpireDate])
//    OUTPUT Inserted.JobID
//     VALUES
//           ('" + newJob.Title +
//               "'," + newJob.EmployerId +
//               "," + newJob.FunctionId +
//               ",'" + newJob.JType.ToString() +
//               "','" + newJob.City +
//               "'," + newJob.StateId +
//               ",'" + newJob.Qualification +
//               "','" + newJob.Description +
//               "','" + newJob.PostDate +
//               "','" + newJob.ExpireDate + "')";

                string query = "INSERT INTO Job OUTPUT Inserted.JobID VALUES (@title, @employerID, @functionID, @jtype, @city, @stateID, @qualification, @description, @pdate, @edate)";

                try
                {           
                    SqlCommand myCommnand = new SqlCommand(query, myConnection);
                    myCommnand.CommandText = query;
                    myCommnand.CommandType = CommandType.Text;

                    myCommnand.Parameters.Add("@title", SqlDbType.VarChar, 50);
                    myCommnand.Parameters.Add("@employerID", SqlDbType.Int);
                    myCommnand.Parameters.Add("@functionID", SqlDbType.Int);
                    myCommnand.Parameters.Add("@jtype", SqlDbType.VarChar, 50);
                    myCommnand.Parameters.Add("@city", SqlDbType.VarChar, 50);
                    myCommnand.Parameters.Add("@stateID", SqlDbType.Int);
                    myCommnand.Parameters.Add("@qualification", SqlDbType.VarChar);
                    myCommnand.Parameters.Add("@description", SqlDbType.VarChar);
                    myCommnand.Parameters.Add("@pdate", SqlDbType.VarChar, 50);
                    myCommnand.Parameters.Add("@edate", SqlDbType.VarChar, 50);

                    myCommnand.Parameters["@title"].Value = newJob.Title;
                    myCommnand.Parameters["@employerID"].Value = newJob.EmployerId;
                    myCommnand.Parameters["@functionID"].Value = newJob.FunctionId;
                    myCommnand.Parameters["@jtype"].Value = newJob.JType;
                    myCommnand.Parameters["@city"].Value = newJob.City;
                    myCommnand.Parameters["@stateID"].Value = newJob.StateId;
                    myCommnand.Parameters["@qualification"].Value = newJob.Qualification;
                    myCommnand.Parameters["@description"].Value = newJob.Description;
                    myCommnand.Parameters["@pdate"].Value = newJob.PostDate;
                    myCommnand.Parameters["@edate"].Value = newJob.ExpireDate;

                    //InsertOK = myCommnand.ExecuteNonQuery(); change to execute scalar di
                    newJobId = (int)myCommnand.ExecuteScalar();
                }
                catch
                {
                    return QueryResult.InsertFail;
                }
            }
            DisconnectFromDB();
            return QueryResult.Success;

        }


        public static QueryResult InsertStudent(Student newStudent)
        {


            //connect to DB
            if (ConnectToDB() != QueryResult.Success) return QueryResult.UnknowDatabaseIssue;
            int InsertOK;
            using (myConnection)
            {
                string commandText;
                commandText = "INSERT INTO [C2CDatabase].[dbo].[Student] VALUES(@AdvisorID, @FName, @Lname, @Email, @SchoolID, @MajorID, @Type, @FileName, @FileType, @FileSize, @File, @FileContent)";
                SqlCommand cmd = new SqlCommand(commandText, myConnection);
                cmd.CommandText = commandText;
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add("@AdvisorID", SqlDbType.Int);
                cmd.Parameters.Add("@FName", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@LName", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@SchoolID", SqlDbType.Int);
                cmd.Parameters.Add("@MajorID", SqlDbType.Int);
                cmd.Parameters.Add("@Type", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@FileName", SqlDbType.VarChar);
                cmd.Parameters.Add("@FileType", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@FileSize", SqlDbType.Int);
                cmd.Parameters.Add("@File", SqlDbType.VarBinary);
                cmd.Parameters.Add("@FileContent", SqlDbType.VarChar);

                cmd.Parameters["@AdvisorID"].Value = newStudent.AdvisorID;
                cmd.Parameters["@FName"].Value = newStudent.FirstName.ToString();
                cmd.Parameters["@LName"].Value = newStudent.LastName.ToString();
                cmd.Parameters["@Email"].Value = newStudent.Email.ToString();
                cmd.Parameters["@SchoolID"].Value = newStudent.School_ID.ToString();
                cmd.Parameters["@MajorID"].Value = newStudent.Major_ID.ToString();
                cmd.Parameters["@Type"].Value = newStudent.Type.ToString();
                cmd.Parameters["@FileName"].Value = newStudent.ResumeName;
                cmd.Parameters["@FileType"].Value = newStudent.FileType;
                cmd.Parameters["@FileSize"].Value = newStudent.FileSize;
                cmd.Parameters["@File"].Value = newStudent.ResumeFile;
                cmd.Parameters["@FileContent"].Value = newStudent.ResumeContent;

                InsertOK = cmd.ExecuteNonQuery();
            }
            //close DB
            DisconnectFromDB();
            if (InsertOK > 0) return QueryResult.Success;
            else return QueryResult.InsertFail;
        }

        // Get the list of the resume files in the database
        public static DataTable GetAllResumeList()
        {
            DataTable fileList = new DataTable();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;

                cmd.CommandText = "SELECT [StudentID] AS [ID], [FName] AS [First Name], [LName] AS [Last Name], [Email], [School].[Name] AS [School], [Major].[Name] AS [Major], [Type], [FileName] AS [Resume File], [FileSize] AS [Size(Byte)] FROM [Student], [School], [Major] WHERE [Student].[SchoolID] = [School].[SchoolID] AND [Student].[MajorID] = [Major].[MajorID]";
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = cmd;
                adapter.Fill(fileList);

                DisconnectFromDB();

            }
            return fileList;

        }

        // Get the list of the resume uploaded by an advisor
        public static DataTable GetAllResumeUploadedBy(int advisorId)
        {
            DataTable fileList = new DataTable();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;

                cmd.CommandText = @"SELECT [StudentID] AS [ID], [FName] AS [First Name], [LName] AS [Last Name], [Email], [School].[Name] AS [School], 
                [Major].[Name] AS [Major], [Type], [FileName] AS [Resume File], [FileSize] AS [Size(Byte)] 
                FROM [Student], [School], [Major] 
                WHERE [Student].[SchoolID] = [School].[SchoolID] AND [Student].[MajorID] = [Major].[MajorID]
                AND [Student].[AdvisorID] = " + advisorId + ";";
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = cmd;
                adapter.Fill(fileList);

                DisconnectFromDB();

            }
            return fileList;

        }


        // Get all the jobs posted by this employer
        public static DataTable GetAllJobPostedBy(int empID)
        {
            DataTable myjobList = new DataTable();

            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;


                cmd.CommandText = " SELECT [JobID] AS [ID], [Title] AS [Title], [Type], [City], [State].[state_full] AS [State], [PostDate] AS [Posted Date]"
                + "FROM [Job], [State]"
                + "WHERE [Job].[StateID] = [State].[StateID] AND [Job].[EmployerID] = @empID";

                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                cmd.Parameters.Add("@empID", SqlDbType.Int);
                cmd.Parameters["@empID"].Value = empID;

                adapter.SelectCommand = cmd;
                adapter.Fill(myjobList);

                DisconnectFromDB();

            }

            return myjobList;

        }

        //browse jobs page
        public static DataTable browseJobs(int? functionId, int? stateId, string type, string keyword)
        {
            keyword = GetCleanString(keyword);

            DataTable jobList = new DataTable();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;

                string query = " SELECT [Job].[JobID] AS [ID], [Job].[Title] AS [Title], [Function].[Name] AS [Function], [Employer].[CName] AS [Company], [Job].[Type], [Job].[City], [State].[state_full] AS [State], [Job].[PostDate] AS [Posted Date], [Job].[ExpireDate] AS [Expire Date]"
                                + " FROM [Job], [Employer], [Function], [State]"
                                + " WHERE [Job].[EmployerID] = [Employer].[EmployerID] AND [Job].[FunctionID] = [Function].[FunctionID] AND [Job].[StateID] = [State].[StateID] ";

                if (functionId != null) query += " AND [Job].[FunctionID] =" + functionId;
                if (stateId != null) query += " AND [Job].[StateID] =" + stateId;
                if (type != null) query += " AND [Job].[Type] ='" + type + "'";
                if (keyword != null) query += " AND ([Job].[Title] like '%" + keyword + "%' OR [Job].[Qualification] like '%" + keyword + "%' OR [Job].[Description] like '%" + keyword + "%')";
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = cmd;
                adapter.Fill(jobList);

                DisconnectFromDB();

            }
            return jobList;
        }

        // Get a file from the database by StudentID
        public static DataTable GetAFile(int id)
        {
            DataTable file = new DataTable();
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;

                cmd.CommandText = "SELECT [StudentID], [FName], [LName], [FileName], [File], [FileType] FROM [Student] "
                    + "WHERE [StudentID]=@ID";
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                cmd.Parameters.Add("@ID", SqlDbType.Int);
                cmd.Parameters["@ID"].Value = id;

                adapter.SelectCommand = cmd;
                adapter.Fill(file);

                DisconnectFromDB();

            }
            return file;

        }

        //get job detail by jobID
        public static Job GetJobDetailbyJobId(int jobID)
        {

            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;


                cmd.CommandText = @"SELECT [Job].*
                                    FROM [Job]
                                    WHERE [JobID] = @jobID";

                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add("@jobID", SqlDbType.Int);
                cmd.Parameters["@jobID"].Value = jobID;



                SqlDataReader reader;
                reader = cmd.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                Job jobInfo = new Job(reader["Title"].ToString(),
                                        System.Convert.ToInt32(reader["EmployerID"]),
                                        System.Convert.ToInt32(reader["FunctionID"]),
                                        reader["Type"].ToString(),
                                        reader["City"].ToString(),
                                        System.Convert.ToInt32(reader["StateID"]),
                                        reader["Qualification"].ToString(),
                                        reader["Description"].ToString(),
                                        reader["PostDate"].ToString(),
                                        reader["ExpireDate"].ToString());

                DisconnectFromDB();
                return jobInfo;
            }


        }

        //get Job function Name by FunctionID
        public static string getFunctionName(int fId)
        {
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string function;
                string query = "SELECT [Name] FROM [Function] Where [FunctionID] = @functionID";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                myCommnand.Parameters.Add("@functionID", SqlDbType.Int);
                myCommnand.Parameters["@functionID"].Value = fId;
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                function = reader["Name"].ToString();
                DisconnectFromDB();
                return function;
            }
        }

        //get State Name by StateID
        public static string getStateName(int stateId)
        {
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string state;
                string query = "SELECT [state_full] FROM [State] Where [StateID] = @stateID";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                myCommnand.Parameters.Add("@stateID", SqlDbType.Int);
                myCommnand.Parameters["@stateID"].Value = stateId;
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                state = reader["state_full"].ToString();
                DisconnectFromDB();
                return state;
            }
        }

        //get Industry Name by IndustryID
        public static string getIndustryName(int IndustryId)
        {
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string industry;
                string query = "SELECT [Name] FROM [Industry] Where [IndustryID] = @IndustryID";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                myCommnand.Parameters.Add("@IndustryID", SqlDbType.Int);
                myCommnand.Parameters["@IndustryID"].Value = IndustryId;
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                industry = reader["Name"].ToString();
                DisconnectFromDB();
                return industry;
            }
        }

        //get School Name by SchoolID
        public static string getSchoolName(int SchoolId)
        {
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string School;
                string query = "SELECT [Name] FROM [School] Where [SchoolID] = @SchoolID";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                myCommnand.Parameters.Add("@SchoolID", SqlDbType.Int);
                myCommnand.Parameters["@SchoolID"].Value = SchoolId;
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                School = reader["Name"].ToString();
                DisconnectFromDB();
                return School;
            }
        }

        //get AdvisorPassword by AdvisorID
        public static string getAdvisorUPassword(int AdvisorId)
        {
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string AdvisorPassword;
                string query = "SELECT [UPassword] FROM [Advisor] Where [AdvisorID] = @AdvisorID";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                myCommnand.Parameters.Add("@AdvisorID", SqlDbType.Int);
                myCommnand.Parameters["@AdvisorID"].Value = AdvisorId;
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                AdvisorPassword = reader["UPassword"].ToString();
                DisconnectFromDB();
                return AdvisorPassword;
            }
        }

        //get EmployerPassword by EmployerID
        public static string getEmployerUPassword(int EmployerId)
        {
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string EmployerPassword;
                string query = "SELECT [UPassword] FROM [Employer] Where [EmployerID] = @EmployerID";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                myCommnand.Parameters.Add("@EmployerID", SqlDbType.Int);
                myCommnand.Parameters["@EmployerID"].Value = EmployerId;
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                EmployerPassword = reader["UPassword"].ToString();
                DisconnectFromDB();
                return EmployerPassword;
            }
        }

        //get all advisor emails
        public static List<string> getAllAdvisorEmail()
        {

            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                List<String> AdvisorEmail = new List<string>();
                string query = "SELECT [UEmail] FROM [Advisor]";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                while (reader.Read())
                {
                    AdvisorEmail.Add(reader["UEmail"].ToString());
                }
                DisconnectFromDB();
                return AdvisorEmail;
            }
        }

        //get CompanyName by JobID
        public static string getCompanyNamebyJobID(int jobID)
        {
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string CName;
                string query = "SELECT [CName] from [Employer], [Job] WHERE [Employer].[EmployerID] = [Job].[EmployerID] AND [jobID] = @jobID";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                myCommnand.Parameters.Add("@jobID", SqlDbType.Int);
                myCommnand.Parameters["@jobID"].Value = jobID;
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                CName = reader["CName"].ToString();
                DisconnectFromDB();
                return CName;
            }
        }


        //get advisor email by studentID
        public static string getAdvisorEmailbyStudentID(int studentId)
        {

            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string AdvisorEmail;
                string query = "SELECT [Advisor].[UEmail] FROM [Advisor], [Student] WHERE [Advisor].[AdvisorID] = [Student].[AdvisorID] AND [Student].[StudentID] = " + studentId;
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                {
                    DisconnectFromDB();
                    return null;
                }
                reader.Read();
                AdvisorEmail = (reader["UEmail"].ToString());
                DisconnectFromDB();
                return AdvisorEmail;
            }
        }

        //Browse All Companies
        public static DataTable getCompanyList(int? industryID, int? stateID)
        {
            DataTable companyList = new DataTable();

            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;


                string query = "SELECT [EmployerID] AS [ID], [CName] AS [Name], [CWebsite] AS [Website], [Industry].[Name] AS [Industry], [CCity] AS [City], [State].[state_full] AS [State], [CDescription] AS [Description]"
                + "FROM [Employer], [State], [Industry]"
                + "WHERE [Employer].[CStateID] = [State].[StateID] AND [Industry].[IndustryID] = [Employer].[IndustryID]";
                if (industryID != null) query += " AND [Employer].[IndustryID] =" + industryID;
                if (stateID != null) query += " AND [Employer].[CStateID] =" + stateID;
                
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = cmd;
                adapter.Fill(companyList);

                DisconnectFromDB();

            }

            return companyList;

        }

        //Browse Company by employerID
        public static DataTable getCompanyInfo(int empID)
        {
            DataTable companyInfo = new DataTable();

            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;


                string query = "SELECT [EmployerID] AS [ID], [CName] AS [Name], [CWebsite] AS [Website], [Industry].[Name] AS [Industry], [CCity] AS [City], [State].[state_full] AS [State], [CDescription] AS [Description]"
                + "FROM [Employer], [State], [Industry]"
                + "WHERE [EmployerID] =" + empID + " AND [Employer].[CStateID] = [State].[StateID] AND [Industry].[IndustryID] = [Employer].[IndustryID]";

                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = cmd;
                adapter.Fill(companyInfo);

                DisconnectFromDB();

            }

            return companyInfo;

        }
        
        //Delete student by studentID
        public static string deleteStudent(int studentID)
        {
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;


                string query = "DELETE FROM Student WHERE StudentID = @id";
                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = studentID;
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                if (cmd.ExecuteNonQuery() < 1) return null;
                DisconnectFromDB();
            }
            return "Success";
        }

        //Delete Job by jobID
        public static string deleteJob(int JobID)
        {
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;


                string query = "DELETE FROM Job WHERE JobID = @id";
                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = JobID;
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                if (cmd.ExecuteNonQuery() < 1) return null;
                DisconnectFromDB();
            }
            return "Success";
        }


        // insert into selectStudent table when employer click to select a student
        public static string InsertSelectedStudent(int studentID, int employerID, string date)
        {

            //connect to DB
            if (ConnectToDB() != QueryResult.Success) return null;
            int InsertOK;
            using (myConnection)
            {
                string commandText;
                commandText = "INSERT INTO [C2CDatabase].[dbo].[SelectedStudent] ([StudentID], [EmployerID], [SelectedDate]) VALUES (@studentID, @employerID, @date)";
                SqlCommand cmd = new SqlCommand(commandText, myConnection);
                cmd.CommandText = commandText;
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add("@studentID", SqlDbType.Int);
                cmd.Parameters.Add("@employerID", SqlDbType.Int);
                cmd.Parameters.Add("@date", SqlDbType.VarChar, 50);


                cmd.Parameters["@studentID"].Value = studentID;
                cmd.Parameters["@employerID"].Value = employerID;
                cmd.Parameters["@date"].Value = date;


                InsertOK = cmd.ExecuteNonQuery();
            }
            //close DB
            DisconnectFromDB();
            if (InsertOK > 0) return "Success";
            else return null;
        }


        //Browse SelectedStudent by employerID
        public static DataTable getSelectedStudentID_byEmployerID(int empID)
        {
            DataTable selectedstudentList = new DataTable();

            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandTimeout = 0;


                //string query = "SELECT [Student].[StudentID] AS [ID], [FName] AS [First Name], [LName] AS [Last Name], [Email], [School].[Name] AS [School], [Major].[Name] AS [Major], [Type], [FileName] AS [Resume File], [FileSize] AS [Size(Byte)], [SelectedStudent].[SelectedDate], [SelectedStudent].[Hire] AS [Hiring Status]"
                string query = "SELECT [Student].[StudentID] AS [ID], [FName] AS [First Name], [LName] AS [Last Name], [Email], [School].[Name] AS [School], [Major].[Name] AS [Major], [Type], [SelectedStudent].[SelectedDate], [SelectedStudent].[Hire] AS [Hiring Status]"
                + "FROM [Student], [School], [Major], [SelectedStudent]"
                + " WHERE [Student].[SchoolID] = [School].[SchoolID] AND [Student].[MajorID] = [Major].[MajorID] AND [SelectedStudent].[StudentID] = [Student].[StudentID] AND [SelectedStudent].[EmployerID] =" + empID;

                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = cmd;
                adapter.Fill(selectedstudentList);

                DisconnectFromDB();

            }

            return selectedstudentList;

        }

        //-----------------------------------------------------OLD------------------

        /// <summary>
        /// User registration
        /// </summary>
        /// <param name="newUser"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public static QueryResult InsertUser(User newUser, string password)
        {
            //call to database and insert into dbo.User table.
            if (ConnectToDB() != QueryResult.Success) return QueryResult.UnknowDatabaseIssue;
            int InsertOK;
            using (myConnection)
            {
                string query = "select count (*) as existed from [C2CDatabase].[dbo].[User] where Email = '" + newUser.Email.ToString() + "'";

                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                //check existed email
                int emailExisted = (int)myCommnand.ExecuteScalar();
                if (emailExisted > 0) return QueryResult.EmailExisted;
                //insert
                query = "INSERT INTO [C2CDatabase].[dbo].[User] VALUES('" + newUser.Email.ToString() + "','"
                                                                                    + password + "','"
                                                                                    + newUser.Salutation.ToString() + "','"
                                                                                    + newUser.FirstName.ToString() + "','"
                                                                                    + newUser.LastName.ToString() + "','"
                                                                                    + newUser.Address.ToString() + "','"
                                                                                    + newUser.Phone.ToString() + "','"
                                                                                    + newUser.Type.ToString() + "')";

                myCommnand = new SqlCommand(query, myConnection);

                InsertOK = myCommnand.ExecuteNonQuery();
            }
            //close DB
            DisconnectFromDB();
            if (InsertOK > 0) return QueryResult.Success;
            else return QueryResult.InsertFail;
        }

        public static QueryResult InsertCompany(Company company)
        {
            //connect to DB
            if (ConnectToDB() != QueryResult.Success) return QueryResult.UnknowDatabaseIssue;
            int InsertOK;
            using (myConnection)
            {
                //insert
                string query = "INSERT INTO [C2CDatabase].[dbo].[Company] VALUES(" + company.Industry.Id.ToString() + ",'"
                                                                                    + company.Name + "','"
                                                                                    + company.Website + "','"
                                                                                    + company.Address + "','"
                                                                                    + company.City + "',"
                                                                                    + company.State.Id.ToString() + ",'"
                                                                                    + company.Zipcode + "','"
                                                                                    + company.Descrtiption + "')";
                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                InsertOK = myCommnand.ExecuteNonQuery();
            }
            //close DB
            DisconnectFromDB();
            if (InsertOK > 0) return QueryResult.Success;
            else return QueryResult.InsertFail;
        }

        //public static List<Industry> GetINdustriesFromDatabase()
        //{

        //    //call query: select... 
        //}
        /// <summary>
        /// User login verifycation
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public static User UserLogin(string email, string password)
        {

            //connect to DB
            if (ConnectToDB() != QueryResult.Success) return null;
            using (myConnection)
            {
                string query = "SELECT * FROM [C2CDatabase].[dbo].[User] WHERE Email = '" + email + "' AND Password = '" + password + "'";

                SqlCommand myCommnand = new SqlCommand(query, myConnection);
                SqlDataReader reader;
                reader = myCommnand.ExecuteReader();
                if (!reader.HasRows)
                { DisconnectFromDB(); return null; }
                reader.Read();
                User loggedUser = new User(reader["Salutation"].ToString(), reader["FirstName"].ToString(), reader["LastName"].ToString(), reader["Email"].ToString(),
                    reader["Address"].ToString(), reader["Phone"].ToString(), C2CUtil.UserTypeMap[reader["UserType"].ToString()]);
                DisconnectFromDB();
                return loggedUser;
            }

        }


        //Private Methods
        private static SqlConnection myConnection;
        private static QueryResult ConnectToDB()
        {

            myConnection = new SqlConnection();
            myConnection.ConnectionString = @"workstation id=C2CDatabase.mssql.somee.com;packet size=4096;user id=longbodie_SQLLogin_1;pwd=sgcezje96h;data source=C2CDatabase.mssql.somee.com;persist security info=False;initial catalog=C2CDatabase";
            //myConnection.ConnectionString = @"Data Source=localhost\SQLEXPRESS;" + "Initial Catalog=C2CDatabase;Integrated Security=SSPI";
            // Try to open the connection.
            try
            {
                myConnection.Open();
            }
            catch (Exception err)
            {
                System.Console.WriteLine("\n Database connect error: " + err.Message);
                // Handle an error by displaying the information.
                return QueryResult.UnknowDatabaseIssue;
            }
            return QueryResult.Success;
        }

        private static void DisconnectFromDB()
        {
            myConnection.Close();
        }



        // TEST METHOD
        private static User fakeUser = new User("Dr. ", "bill", "zhong", "zhong@troy.edu", "park street", "3342434", UserType.Advisor);
        public static void InsertUser()
        {
            //call to database and insert into dbo.User table.

            InsertUser(fakeUser, "cac12");
        }


    }
}
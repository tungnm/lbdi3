using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using C2C.DataLayer;
using System.Net;
using System.Net.Mail;

namespace C2C.ModelLayer
{
    public static class ModelManager
    {

        public static Employer VerifyEmployer(string email, string pass)
        {
            return DataManager.EmployerLogin(email, pass);
        }
        //public static QueryResult InsertNewJob(Job newJob)
        //{
        //   // return DataManager.InsertJob(newJob);
        //}

        public static QueryResult InsertNewStudent(Student newStudent)
        {
            return DataManager.InsertStudent(newStudent);
        }

        public static Advisor VerifyAdvisor(string email, string pass)
        {
            return DataManager.AdvisorLogin(email, pass);
        }

        public static List<String> GetAllAdvisorEmails()
        {
            //TODO: call databae
            //List<String> allEmailList = new List<string>();
            //allEmailList.Add("longbodie@gmail.com");
            //allEmailList.Add("mtung09@gmail.com");
            //allEmailList.Add("keithellis@ctex-inc.com");

            return DataManager.getAllAdvisorEmail();

            //TODO:
            //allEmailList = DataLayer.DataManager.GetAllEmails()
        }
        public static QueryResult EmployerRegister(Employer newEmployer, string password)
        {
            QueryResult EmployerRegisterResult = DataManager.InsertEmployer(newEmployer, password);
            return EmployerRegisterResult;
        }

        public static QueryResult AdvisorRegister(Advisor newAdvisor, string password)
        {
            QueryResult AdvisorRegisterResult = DataManager.InsertAdvisor(newAdvisor, password);
            return AdvisorRegisterResult;
        }

        public static List<Industry> GetAllIndustries()
        {
            return DataLayer.DataManager.getIndustry();
        }

        public static List<State> GetAllState()
        {
            return DataLayer.DataManager.getState();
        }

        public static List<Function> GetAllFunction()
        {
            return DataLayer.DataManager.getFunction();
        }

        public static List<School> GetAllSchool()
        {
            return DataLayer.DataManager.getSchool();
        }

        public static List<Major> GetAllMajor()
        {
            return DataLayer.DataManager.getMajor();
        }

        //Send out emails
        public static void SendEmail(List<string> toEmails, string mailTitle, string mailBody)
        {
            // Gmail Address from where you send the mail
            var fromAddress = "longnguyen@ctex-inc.com";
            
            // any address where the email will be sendin:
            //pull all emails from database
            //List<String> allEmails = ModelManager.GetAllEmails();
            
            //Password of your gmail address
            const string fromPassword = "ditmemay123";

            System.Net.Mail.SmtpClient ss = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            ss.EnableSsl = true;
            ss.Timeout = 10000;
            ss.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            ss.UseDefaultCredentials = false;
            ss.Credentials = new NetworkCredential(fromAddress, fromPassword);


            // Passing values to smtp object
            for (int i = 0; i < toEmails.Count; i++)
            {
                System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage(fromAddress, toEmails[i], mailTitle, mailBody);
                mm.BodyEncoding = System.Text.Encoding.Unicode;
                mm.IsBodyHtml = true;
                mm.DeliveryNotificationOptions = System.Net.Mail.DeliveryNotificationOptions.OnFailure;
                ss.Send(mm);
            }

        }
        //public static List<Company> GetAllCompanies()
        //{
        //    //fake company to test
        //    List<Company> fakeList = new List<Company>();
        //    //fakeList.Add(new Company(0, "CGI", "cig.com", "troy", "Troy", "Alabama", "36082", "cong ty vl"));
        //     //fakeList.Add(new Company(1, "Mr Ho", "ho.com", "troy", "Troy", "Alabama", "36081", "ho ho ho"));
        //    fakeList.Add(new Company(1, "CGI", "cig.com", new Industry { Name = "buoi", Id = 1 }, "Park st", "Troy", new State { Name = "Alabama", Id = 12 }, "36081", "Cty buoi lon cac"));
        //    fakeList.Add(new Company(2, "Ho", "ho.com", new Industry { Name = "lon industry", Id = 2 }, "Park st", "Troy", new State { Name = "Cali", Id = 45 }, "36081", "Ho buffet vl giam gia"));

        //     return fakeList;
        //}


        //will be used to pull out 1 company object to display the information
        //public static Company GetCompany(int companyId)
        //{
        //    Company fakeResult = new Company(333, "Tran Anh", "tranaanh.com.vn", new Industry { Name = "may tinh industry", Id = 3 }, "so 3 quang trung", "Hanoi", new State { Name = "Alabama", Id = 12 }, "334234", "cong ty vl");
        //    return fakeResult;
        //}
        //public void RegisterNewUser(User newUser,
        //public static List<State> GetAllState()
        //{
        //    List<State> fakeStates = new List<State>();
        //    fakeStates.Add(new State { Name = "AL", Id = 123 });
        //    fakeStates.Add(new State { Name = "GA", Id = 567 });
        //    fakeStates.Add(new State { Name = "FL", Id = 783 });
        //    return fakeStates;
        //}
        //    public static QueryResult RegisterUser(User newUser, string pass, Company newCompany, School newSchool)
        //    {
        //       //insert new user, get ID of newUSEr
        //        //if new user = advisor, insert newSchool( from parameter)
        //        //else insert newCompany(from paramenter)
        //        //if company/school succes -> done, elsel delete User using the ID from step 1
        //        QueryResult insertUserResult = DataManager.InsertUser(newUser, pass);
        //        if (insertUserResult != QueryResult.Success)
        //            return insertUserResult;

        //        if (newUser.Type == UserType.Employer)
        //        {
        //            QueryResult insertCompanyResult = DataManager.InsertCompany(newCompany);
        //            if (insertCompanyResult != QueryResult.Success)
        //            {
        //                //call to datamanager: deleteUser(newUser.email)
        //            }
        //            return insertCompanyResult;
        //        }
        //        else //advisor
        //        {
        //            //dsataManater.InsertSchool(newSchool); ... tuong tu. employerok
        //        }

        //        return QueryResult.Success; //default result, if no error happened
        //    }

        //}
    }
}
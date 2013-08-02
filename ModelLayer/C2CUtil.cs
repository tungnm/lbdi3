using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace C2C.ModelLayer
{
    public struct Industry
    {
        public string Name;
        public int Id;
    }

    public struct State
    {
        public string Name;
        public int Id;
    }

    public struct Function
    {
        public string Name;
        public int Id;
    }

    public struct School
    {
        public string Name;
        public string Website;
        public int Id;
    }

    public struct Major
    {
        public string Name;
        public int Id;
    }

    public static class C2CUtil
    {
        public static string GetChangeActionUrl(string newAction)
        {

            return "~/Pages/index.aspx" + "?" + C2CUtil.ACTION + "=" + newAction;
        }
        public static string USER_EMPLOYER = "userEmp";
        public static string USER_ADVISOR = "userAvi";
        public static string LOGED_IN= "LogedIn";
        public static string CURRENT_USER = "currentUser";
        public static string POST_JOB = "postJob";
        public static string ACTION = "action";
        public static string MESSAGE = "hpageMes";
        public static string MY_ACCOUNT = "MyAccount";
        public static string LOG_OUT = "logout";

        public static string REQUESTED_JOB_ID = "rjobId";



        public static Dictionary<string, ModelLayer.UserType> UserTypeMap =
            new Dictionary<string, UserType> { { "Advisor", UserType.Advisor }, { "Employer", UserType.Employer } };

        public static Dictionary<string, ModelLayer.JobType> JobTypeMap =
            new Dictionary<string, JobType> { { "Paid Internship", JobType.Paid_Intership }, { "UnPaid Internship", JobType.UnPaid_Intership } };

        public static Dictionary<string, ModelLayer.StudentType> StudentTypeMap =
            new Dictionary<string, StudentType> { {"Undergraduate", StudentType.Undergraduate}, {"Graduate", StudentType.Graduate} };
    
    }
}
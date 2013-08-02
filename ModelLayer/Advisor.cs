using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace C2C.ModelLayer
{
    public class Advisor
    {
        public Advisor(int schoolId, string school_website, string school_address,string user_salutation, string user_fullname,
            string user_address, string user_city, int user_stateId, string user_zipcode, string user_phone, string user_email)
        {
            SchoolId = schoolId;
            School_Website = school_website;
            School_Address = school_address;
            User_Salutation = user_salutation;
            User_Fullname = user_fullname;
            User_Address = user_address;
            User_City = user_city;
            User_StateId = user_stateId;
            User_Zipcode = user_zipcode;
            User_Phone = user_phone;
            User_Email = user_email;
        }

        public int AdvisorId { get; set; }
        public int SchoolId { get; set; }
        public string School_Website { get; set; }
        public string School_Address { get; set; }
        public string User_Salutation { get; set; }
        public string User_Fullname { get; set; }
        public string User_Address { get; set; }
        public string User_City { get; set; }
        public int User_StateId { get; set; }
        public string User_Zipcode { get; set; }
        public string User_Phone { get; set; }
        public string User_Email { get; set; }
    }
}
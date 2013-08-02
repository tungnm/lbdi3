using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace C2C.ModelLayer
{
    public class Employer
    {

        public Employer(string comp_name, int comp_industryId, string comp_website, string comp_description, string comp_address,
            string comp_city, int comp_stateId, string comp_zipcode,string user_salutation, string user_fullname,
            string user_address, string user_city, int user_stateId, string user_zipcode, string user_phone, string user_email)
        {
            Comp_Name = comp_name;
            Comp_IndustryId = comp_industryId;
            Comp_Website = comp_website;
            Comp_Description = comp_description;
            Comp_Address = comp_address;
            Comp_City = comp_city;
            Comp_StateId = comp_stateId;
            Comp_Zipcode = comp_zipcode;
            User_Salutation = user_salutation;
            User_Fullname = user_fullname;
            User_Address = user_address;
            User_City = user_city;
            User_StateId = user_stateId;
            User_Zipcode = user_zipcode;
            User_Phone = user_phone;
            User_Email = user_email;
            //User_Password = user_password;
              
        }
        public int EmployerId { get; set; }
        public string Comp_Name { get; set; }
        public int Comp_IndustryId { get; set; }
        public string Comp_Website { get; set; }
        public string Comp_Description { get; set; }
        public string Comp_Address { get; set; }
        public string Comp_City { get; set; }
        public int Comp_StateId { get; set; }
        public string Comp_Zipcode { get; set; }
        public string User_Salutation { get; set; }
        public string User_Fullname { get; set; }
        public string User_Address { get; set; }
        public string User_City { get; set; }
        public int User_StateId { get; set; }
        public string User_Zipcode { get; set; }
        public string User_Phone { get; set; }
        public string User_Email { get; set; }
        //public string User_Password { get; set; }
    }
}
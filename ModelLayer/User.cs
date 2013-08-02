using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace C2C.ModelLayer
{
    public enum UserType {Advisor, Employer};

    public class User
    {
        public User(string salutation, string firstName, string lastName, string email, string add, string phone, UserType type)
        {
            Salutation = salutation;
            FirstName = firstName;
            LastName = lastName;
            Email = email;
            Address = add;
            Phone = phone;
            Type = type;
        }

        //Properties
        public string Salutation { get; set; }
        public string FirstName {get;set;}
        public string LastName {get;set;}
        public string Email { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public UserType Type { get; set; }

    }
}
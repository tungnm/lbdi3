using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace C2C.ModelLayer
{



    public class Company
    {
        public Company(int id, string name, string website, Industry industry, string address, string city, State state, string zipcode, string des)
        {
            CompanyID = id;
            Name = name;
            Industry = industry;
            Website = website;
            Address = address;
            City = city;
            State = state;
            Zipcode = zipcode;
            Descrtiption = des;
        }

        //Properties
        public int CompanyID { get; set; }
        public string Name { get; set; }
        public Industry Industry { get; set; }
        public State State { get; set; }
        public string Website { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Zipcode { get; set; }
        public string Descrtiption { get; set; }
    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace C2C.ModelLayer
{
    public enum JobType { Paid_Intership, UnPaid_Intership };

    public class Job
    {
        public Job(string title, int employerId, int functionId, string jtype,
                   string city, int stateId, string qualification, string description, string pdate, string edate)
        {
            Title = title;
            EmployerId = employerId;
            FunctionId = functionId;
            JType = jtype;
            City = city;
            StateId = stateId;
            Qualification = qualification;
            Description = description;
            PostDate = pdate;
            ExpireDate = edate;
        }

        public string Title { get; set; }
        public int EmployerId { get; set; }
        public int FunctionId { get; set; }
        public string JType { get; set; }
        public string City { get; set; }
        public int StateId { get; set; }
        public string Qualification { get; set; }
        public string Description { get; set; }
        public string PostDate { get; set; }
        public string ExpireDate { get; set; }

    }
}
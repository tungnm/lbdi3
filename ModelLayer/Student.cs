using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace C2C.ModelLayer
{
    public enum StudentType {Undergraduate, Graduate};

    public class Student
    {
        public Student(int advisorId, string firstName, string lastName, string email, int school_id, int major_id, 
                       string type, string resumename, string filetype, int filesize, string resumecontent, byte[] resumefile)
        {
            AdvisorID = advisorId;
            FirstName = firstName;
            LastName = lastName;
            Email = email;
            School_ID = school_id;
            Major_ID = major_id;
            Type = type;
            ResumeContent = resumecontent;
            FileSize = filesize;
            FileType = filetype;
            ResumeFile = resumefile;
            ResumeName = resumename;         
        }

        //Properties
        public int AdvisorID { get; set; }
        public string FirstName {get;set;}
        public string LastName {get;set;}
        public string Email { get; set; }
        public int School_ID { get; set; }
        public int Major_ID { get; set; }
        public string ResumeName { get; set; }
        public string ResumeContent { get; set; }
        public byte[] ResumeFile { get; set; }
        public string Type { get; set; }
        public int FileSize { get; set; }
        public string FileType { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.ModelLayer;

namespace C2C.UserControls
{
    public partial class ToolLink : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void EnableToolsForUser(UserType uType)
        {
            //My Account for all users
            HyperLink myAccountLink = new HyperLink();
            myAccountLink.Text = "My Account";
            myAccountLink.NavigateUrl = Request.RawUrl + "?" + C2CUtil.ACTION + "=" + C2CUtil.MY_ACCOUNT;

            pnlLinkList.Controls.Add(myAccountLink);

            //Employer
            if (uType == UserType.Employer)
            {
                HyperLink postJobLink = new HyperLink();
                postJobLink.Text = "Post a new job";
                postJobLink.NavigateUrl = Request.RawUrl + "?" + C2CUtil.ACTION + "=" +C2CUtil.POST_JOB;

                pnlLinkList.Controls.Add(postJobLink);
            }

            //Advisor
            else if (uType == UserType.Advisor)
            {
 
            }
            //My Account for all users
            HyperLink logoutLink = new HyperLink();
            logoutLink.Text = "LogOut";
            logoutLink.NavigateUrl = C2CUtil.GetChangeActionUrl(C2CUtil.LOG_OUT);

            pnlLinkList.Controls.Add(logoutLink);
        }

    }
}
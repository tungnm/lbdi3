﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2C.ModelLayer;
namespace C2C
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");

            if (Session[C2CUtil.MESSAGE] != null)
            {
                lblGlobalMessage.Text = Session[C2CUtil.MESSAGE].ToString();
                Session[C2CUtil.MESSAGE] = null;
            }
            //if not logged
            if (Session[C2CUtil.LOGED_IN] == null)
            {
                panelLogin.Visible = true;
                panelAdvisorLogged.Visible = false;
                panelEmployerLogged.Visible = false;
            }
            //if advisor logged
            if (Session[C2CUtil.USER_ADVISOR] != null)
            {
                ModelLayer.Advisor currentUser = (ModelLayer.Advisor)Session[C2CUtil.CURRENT_USER];
                lblAdvisorWelcome.Text = "Welcome, " + currentUser.User_Salutation + " " + currentUser.User_Fullname;
                panelAdvisorLogged.Visible = true;
                panelLogin.Visible = false;
                panelEmployerLogged.Visible = false;
            }

            //if Employer logged
            if (Session[C2CUtil.USER_EMPLOYER] != null)
            {
                ModelLayer.Employer currentUser = (ModelLayer.Employer)Session[C2CUtil.CURRENT_USER];
                lblEmployerWelcome.Text = "Welcome, " + currentUser.User_Salutation + " " + currentUser.User_Fullname;
                panelAdvisorLogged.Visible = false;
                panelLogin.Visible = false;
                panelEmployerLogged.Visible = true;
            }
        }
    }
}
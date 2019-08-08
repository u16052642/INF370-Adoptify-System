using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Google.Authenticator;

namespace AdoptifySystem.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        private const string key = "qaz123!@@)(*";//this needs to be generated for each person so that it is unique barcode
        /* any 10-12 char string for use as private key in google authenticator
        use later for generate Google authenticator code.*/
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(User_ login)
        {
            
            bool status = false;
            Wollies_ShelterEntities db = new Wollies_ShelterEntities();
            //check username and password form our database here
            //for demo I am going to use Admin as Username and Password1 as Password static value
            List<User_> Users;
            try
            {
                User_ user = new User_();
                user.Username = "Divin";
                user.Password = "food";
                db.User_.Add(user);
                db.SaveChanges();
                Users = db.User_.ToList();
                
            }
            catch (Exception e)
            {

                throw ;
            }
            
            foreach (var item in Users)
            {
                if (item.Username == login.Username && item.Password == login.Password)
                {
                    status = true; // show 2FA form
                    Session["Username"] = login.Username;

                    //2FA Setup
                    TwoFactorAuthenticator tfa = new TwoFactorAuthenticator();
                    string UserUniqueKey = (login.Username + key);
                    Session["UserUniqueKey"] = UserUniqueKey;
                    var setupInfo = tfa.GenerateSetupCode("Wollies Shelter", login.Username, UserUniqueKey, 300, 300);
                    ViewBag.BarcodeImageUrl = setupInfo.QrCodeSetupImageUrl;
                    ViewBag.SetupCode = setupInfo.ManualEntryKey;
                    //message = "Credentials are correct";
                    return View("Authorize",setupInfo);
                }
            }
            return View();
        }

        public ActionResult Authorize()
        {
            return View();
        }
        //authorized user will be redirected to after successful login
        public ActionResult MyProfile()
        {
            if (Session["Username"] == null || Session["IsValid2FA"] == null || !(bool)Session["IsValid2FA"])
            {
                return RedirectToAction("Login");
            }

            ViewBag.Message = "Welcome " + Session["Username"].ToString();
            return View();
        }
        //here this is where we go and authorize the code that was genereated on the user mobile application
        public ActionResult Verify2FA()
        {
            var token = Request["passcode"];
            TwoFactorAuthenticator tfa = new TwoFactorAuthenticator();
            string UserUniqueKey = Session["UserUniqueKey"].ToString();
            bool isValid = tfa.ValidateTwoFactorPIN(UserUniqueKey, token);
            if (isValid)
            {
                Session["IsValid2FA"] = true;
                return RedirectToAction("MyProfile", "Login");
            }
            return RedirectToAction("Login", "Login");
        }
        public ActionResult Logout()
        {
            return View();
        }
        public ActionResult ResetPassword()
        {
            return View();
        }
        public ActionResult Checkin()
        {
            return View();
        }
        public ActionResult Checkout()
        {
            return View();
        }

        public ActionResult ChangePassword()
        {
            return View();
        }

        public ActionResult AddUserRole()
        {
            return View();
        }
        public ActionResult SearchUserRole()
        {
            return View();
        }
        public ActionResult MaintainUserRole()
        {
            return View();
        }
    }
}
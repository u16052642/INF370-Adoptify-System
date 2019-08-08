using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Google.Authenticator;
using AdoptifySystem.Models;

namespace AdoptifySystem.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        private const string key = "qaz123!@@)(*";//this needs to be generated for each person so that it is unique barcode
        /* any 10-12 char string for use as private key in google authenticator
        use later for generate Google authenticator code.*/

        //this is the Db that i will be unstatnitatiung to use thought the whole controller
        Wollies_ShelterEntities1 db = new Wollies_ShelterEntities1();
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(User_ login)
        {
            
            bool status = false;
            Wollies_ShelterEntities1 db = new Wollies_ShelterEntities1();
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
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Login", "Admin");
        }
        public ActionResult Logout()
        {
            return Redirect("Login");
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
        [HttpPost]
        public ActionResult AddUserRole(Role_ role)
        {
            //These variables are here to direct person depending on where they have to go
            string controllername = "";
            string actionname = "";

            //first check if its in similar data on the database
            try
            {
                int counter = 0;
                //Role_ dummy = new Role_();
                //dummy.Role_Name = "manager";
                //db.Role_.Add(dummy);
                //db.SaveChanges();
                var roles = db.Role_.ToList();
                foreach (var item in roles)
                {
                    if (item.Role_Name == role.Role_Name)
                    {
                        controllername = "Admin";
                        actionname = "AddUserRole";
                        ViewBag.errormessage = "There is a duplicate";
                        counter++;
                    }

                }
                if (counter <= 1)
                {
                    return RedirectToAction(actionname, controllername);
                }
            }
            catch
            {
                return RedirectToAction("Error", "ErrorController");
            }
            return RedirectToAction(actionname, controllername);
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
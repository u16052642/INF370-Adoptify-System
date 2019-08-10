using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Google.Authenticator;
using AdoptifySystem.Models;
using System.Net.Mail;
using System.Net;
using System.Web.Security;

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
        public static Flexible flex = new Flexible();
        public ActionResult Login()
        {
            var time = DateTime.Now;
            //var nextime = DateTime.Now + 30; 
            //while (time == )
            //{
            
            //}
            //ViewBag.Time = await time;
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
                //User_ user = new User_();
                //user.Username = "Divin";
                //user.Password = "food";
                //db.User_.Add(user);
                //db.SaveChanges();
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
        [HttpPost]
        //here this is where we go and authorize the code that was genereated on the user mobile application
        public ActionResult Verify2FA(string token)
        {
            //var token = Request["passcode"];
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
        [HttpPost]
        public ActionResult ResetPassword(string EmailID)
        {
            //Verify Email ID
            //Generate Reset password link 
            //Send Email 
            string message = "";
            bool status = false;

            using (Wollies_ShelterEntities1 dc = new Wollies_ShelterEntities1())
            {

                //adding a employee
                //Employee emp = new Employee();
                //emp.Emp_Name = "jem";
                //emp.Emp_Email = "jemimakola99@gmail.com";
                //dc.Employees.Add(emp);
                //dc.SaveChanges();

                //User_ useremp = new User_();
                //useremp.Emp_ID = 1;
                //useremp.Username = "nick";
                //useremp.Password = "john";
                //dc.User_.Add(useremp);
                //dc.SaveChanges();
                var account = dc.Employees.Where(a => a.Emp_Email == EmailID).FirstOrDefault();
                var user = dc.User_.Where(a => a.Emp_ID == account.Emp_ID).FirstOrDefault();
                if (user != null)
                {
                    //Send email for reset password
                    string resetCode = Membership.GeneratePassword(12, 1);
                    SendVerificationLinkEmail(account.Emp_Email, resetCode, "ResetPassword");
                    user.Password = resetCode;
                    //This line I have added here to avoid confirm password not match issue , as we had added a confirm password property 
                    //in our model class in part 1
                    dc.Configuration.ValidateOnSaveEnabled = false;
                    dc.SaveChanges();
                    message = "Reset password link has been sent to your email id.";
                }
                else
                {
                    message = "Account not found";
                }
            }
            ViewBag.Message = message;
            return View();
        }
        public ActionResult Checkin()
        {

            //Employee emp = new Employee();
            //emp.Emp_Name = "nick";
            //emp.Emp_Surname = "Sibanyoni";
            //db.Employees.Add(emp);
            //Employee emp1 = new Employee();
            //emp1.Emp_Name = "james";
            //emp1.Emp_Surname = "High";
            //db.Employees.Add(emp1);
            //Employee emp2 = new Employee();
            //emp2.Emp_Name = "Mercury";
            //emp2.Emp_Surname = "Freddy";
            //db.Employees.Add(emp2);
            //db.SaveChanges();
            
            flex.employeelist = db.Employees.ToList();
            return View(flex);
        }
        [HttpPost]
        public ActionResult Checkin(int id)
        {
            return View();
        }
        [HttpPost]
        public ActionResult GetUserDetails()
        {
            int userId = Convert.ToInt32(Request.Form["id"]);
            //fetch the data by userId and assign in a variable, for ex: myUser
            //Flexible myUser = new Flexible();
                flex.employee = db.Employees.Find(userId);
            return View("Checkin", flex);
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

        [NonAction]
        public void SendVerificationLinkEmail(string emailID, string activationCode, string emailFor = "VerifyAccount")
        {
           using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("u17136319@tuks.co.za");
                mail.To.Add(emailID);
                mail.Subject = "Hello World";
                mail.Body = "<h1>Hello Jem</h1><br><br><p>please find your code attached</p>";
                mail.IsBodyHtml = true;
                //mail.Attachments.Add(new Attachment("C:\\file.zip"));

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new NetworkCredential("u17136319@tuks.co.za", "Urahara123");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
                //var smtp = new SmtpClient
                //{
                //    Host = "smtp.gmail.com",
                //    Port = 587,
                //    EnableSsl = true,
                //    DeliveryMethod = SmtpDeliveryMethod.Network,
                //    UseDefaultCredentials = false,
                //    Credentials = new NetworkCredential(fromEmail.Address, fromEmailPassword)
                //};

                //using (var message = new MailMessage(fromEmail, toEmail)
                //{
                //    Subject = subject,
                //    Body = body,
                //    IsBodyHtml = true
                //})
                //    smtp.Send(message);
            }
    }
}
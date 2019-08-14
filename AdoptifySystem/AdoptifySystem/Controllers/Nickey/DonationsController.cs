using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AdoptifySystem.Models;

namespace AdoptifySystem.Controllers
{
    public class DonationsController : Controller
    {
        // GET: Donations
        
        public ActionResult AddDonor()
        {
            return View();
        }
        public ActionResult MaintainDonor()
        {
            return View();
        }
        public ActionResult AddDonation()
        {
            return View();
        }
        public ActionResult SearchDonor()
        {
            return View();
        }
        public ActionResult SearchDonation()
        {
            return View();
        }

        public ActionResult AddDonationType()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddDonationType(Donation_Type donation_Type)
        {
            return View();
        }
        
        public ActionResult SearchDonationType()
        {
            return View();
        }
        public ActionResult MaintainDonationType()
        {
            return View();
        }
        [HttpPost]
        public ActionResult MaintainDonationType(Donation_Type Donationtype)
        {

            return View();
        }
    }
}
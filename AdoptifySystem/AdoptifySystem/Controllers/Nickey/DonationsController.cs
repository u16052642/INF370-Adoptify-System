using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

        public ActionResult SearchDonationType()
        {
            return View();
        }
        public ActionResult MaintainDonationType()
        {
            return View();
        }
    }
}
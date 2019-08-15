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
        Wollies_ShelterEntities db = new Wollies_ShelterEntities();
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
        public ActionResult AddDonationType(Donation_Type donation_Type, string button)
        {
            //Donation_Type asd = new Donation_Type();
            
            try
            {

                List<Donation_Type> donationtypes = new List<Donation_Type>();
                if(donationtypes.Count != 0)
                {
                    int count = 0;
                    foreach (var item in donationtypes)
                    {
                        if (item.Donation_Type_Name == donation_Type.Donation_Type_Name )
                        {
                            count++;
                            return View();
                        }
                        
                    }
                    if (count == 0)
                    {
                        db.Donation_Type.Add(donation_Type);
                        db.SaveChanges();
                    }
                }
                else {

                    db.Donation_Type.Add(donation_Type);
                    db.SaveChanges();

                }
            }
            catch (Exception)
            {

                return View();
            }
            
            
            return RedirectToAction("Index","Home");
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
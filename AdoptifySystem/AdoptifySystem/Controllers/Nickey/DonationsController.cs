using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
        [HttpPost]
        public ActionResult AddDonor(Donor donor)
        {

            return View();
        }
        public ActionResult MaintainDonor(int? id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donor donor = db.Donors.Find(id);
            if (donor == null)
            {
                return HttpNotFound();
            }
            return View(donor);
        }
        public ActionResult AddDonation()
        {
            return View();
        }
        public ActionResult SearchDonor()
        {
            ViewBag.errormessage = "";
            List<Donor> donors = new List<Donor>();
            try
            {
                donors = db.Donors.ToList();
                if (donors.Count == 0)
                {

                }
                return View(donors);
            }
            catch (Exception e)
            {
                ViewBag.errormessage = "there was a network error: " + e.Message;
                return View();
            }
          
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
            ViewBag.errorMessage = "";
            //Donation_Type asd = new Donation_Type();
            if (button == "Save")
            {
                try
                {

                    List<Donation_Type> donationtypes = new List<Donation_Type>();
                    donationtypes = db.Donation_Type.ToList();
                    if (donationtypes.Count != 0)
                    {
                        int count = 0;
                        foreach (var item in donationtypes)
                        {
                            if (item.Donation_Type_Name == donation_Type.Donation_Type_Name)
                            {
                                count++;
                                ViewBag.errorMessage = "There is a duplicate Donation Type Already";
                                return View();
                            }

                        }
                        if (count == 0)
                        {
                            db.Donation_Type.Add(donation_Type);
                            db.SaveChanges();
                        }
                    }
                    else
                    {

                        db.Donation_Type.Add(donation_Type);
                        db.SaveChanges();
                       

                    }
                    
                }
                catch (Exception e)
                {
                    ViewBag.errorMessage = "There was an Error with network please try again: "+e.Message;
                    return View();
                }
                
            }
            else if (button == "Cancel")
            {

                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Index", "Home");

        }
        [HttpGet]
        public ActionResult SearchDonationType()
        {
            ViewBag.errormessage = "";
            List<Donation_Type> donation_Types = new List<Donation_Type>();
            try
            {
                donation_Types = db.Donation_Type.ToList();
                if(donation_Types.Count == 0)
                {

                }
                return View(donation_Types);
            }
            catch (Exception e)
            {
                ViewBag.errormessage = "there was a network error: "+ e.Message;
                return View();
            }
            
        }
        public ActionResult MaintainDonationType(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donation_Type donation_Type = db.Donation_Type.Find(id);
            if (donation_Type == null)
            {
                return HttpNotFound();
            }
            return View(donation_Type);
        }
        [HttpPost]
        public ActionResult MaintainDonationType(Donation_Type Donationtype)
        {

            return View();
        }
    }
}
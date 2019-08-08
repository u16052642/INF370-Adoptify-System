﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AdoptifySystem;
using AdoptifySystem.Models;

namespace AdoptifySystem.Controllers
{
    public class VeterinarianController : Controller
    {
        // GET: Veterinarian
        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public ActionResult GetVeterinarians()
        {
            using (Wollies_ShelterEntities1 dc = new Wollies_ShelterEntities1())
            {
                var veterinarians = dc.Veterinarians.OrderBy(a => a.Vet_Name).ToList();
                return Json(new { data = veterinarians }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
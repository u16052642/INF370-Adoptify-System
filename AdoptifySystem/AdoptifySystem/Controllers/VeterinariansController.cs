using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AdoptifySystem;

namespace AdoptifySystem.Controllers
{
    public class VeterinariansController : Controller
    {


        // GET: Veterinarians
        public ActionResult Index()
        {
            return View();
        }

        // GET: Veterinarians/Details/5
        public ActionResult GetData()
        {
            using (Wollies_ShelterEntities db = new Wollies_ShelterEntities())
            {
                List<Veterinarian> vetList = db.Veterinarians.ToList<Veterinarian>();
                return Json(new { data = vetList }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult AddOrEdit(int id = 0)
        {
            if (id == 0)
                return View(new Veterinarian());
            else
            {
                using (Wollies_ShelterEntities db = new Wollies_ShelterEntities())
                {
                    return View(db.Veterinarians.Where(x => x.Vet_ID == id).FirstOrDefault<Veterinarian>());
                }
            }
        }

        // POST: Veterinarians/Create
        [HttpPost]
        public ActionResult AddOrEdit(Veterinarian vet)
        {
            using (Wollies_ShelterEntities db = new Wollies_ShelterEntities())
            {
                if (vet.Vet_ID == 0)
                {
                    db.Veterinarians.Add(vet);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Saved Veterinarian Successfully" }, JsonRequestBehavior.AllowGet);
                }
                else {
                    db.Entry(vet).State = EntityState.Modified;
                    db.SaveChanges();
                    return Json(new { success = true, message = "Updated Veterinarian Successfully" }, JsonRequestBehavior.AllowGet);
                }
            }


        }
        
        // POST: Veterinarians/Delete/5
        [HttpPost]
        public ActionResult Delete(int id)
        {
            using (Wollies_ShelterEntities db = new Wollies_ShelterEntities())
            {
                Veterinarian veterinarian = db.Veterinarians.Find(id);
                db.Veterinarians.Remove(veterinarian);
                db.SaveChanges();
                return Json(new { danger = true, message = "Deleted Veterinarian Successfully" }, JsonRequestBehavior.AllowGet);
                // return Json(new { success = true, html = RedirectToAction("Index"), message = "Deleted Veterinarian Successfully" }, JsonRequestBehavior.AllowGet);

            }

        }

    }
}

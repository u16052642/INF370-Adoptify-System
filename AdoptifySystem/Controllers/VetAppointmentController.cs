using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdoptifySystem.Controllers
{
    public class VetAppointmentController : Controller
    {
        // GET: VetAppointment
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult getAnimals()
        {
            List<Animal> animals = new List<Animal>();
            using (Wollies_ShelterEntities dc = new Wollies_ShelterEntities())
            {
                animals = dc.Animals.OrderBy(a => a.Animal_Name).ToList();
            }
            return new JsonResult { Data = animals, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public JsonResult getSickType(int Animal_Type_ID)
        {
            List<VetAppReason> reason = new List<VetAppReason>();
            using (Wollies_ShelterEntities dc = new Wollies_ShelterEntities())
            {
                reason = dc.VetAppReasons.Where(a => a.Animal_Type_ID.Equals(Animal_Type_ID)).OrderBy(a => a.Reason).ToList();
            }
            return new JsonResult { Data = reason, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        [HttpPost]
        public JsonResult save(Vet_Appointment_Master vetApp)
        {
            bool status = false;
            DateTime dateOrg;
            var isValidDate = DateTime.TryParseExact(vetApp.VetDateString, "mm-dd-yyyy", null, System.Globalization.DateTimeStyles.None, out dateOrg);
            if (isValidDate)
            {
                vetApp.Appointment_Date = dateOrg;
            }

            var isValidModel = TryUpdateModel(vetApp);
            if (isValidModel)
            {
                using (Wollies_ShelterEntities dc = new Wollies_ShelterEntities())
                {
                    dc.Vet_Appointment_Master.Add(vetApp);
                    dc.SaveChanges();
                    status = true;
                }
            }
            return new JsonResult { Data = new { status = status } };
        }

    }
}
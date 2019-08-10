using AdoptifySystem.Models.Zinhle;
using System.Linq;
using System.Web.Mvc;

namespace AdoptifySystem.Controllers.Zinhle
{
    public class EmployeesController : Controller
    {
        // GET: Employees
        public static Innovation innovation = new Innovation();
        public ActionResult AddEmployee()
        {
            //innovation.empTypeList = db.EmployeeList.ToList();
            return View(innovation);
        }

        public ActionResult SearchEmployee()
        {
            return View();
        }

        public ActionResult MaintainEmployee()
        {
            return View();
        }

        public ActionResult AddEmployeeType()
        {
            return View();
        }

        public ActionResult SearchEmployeeType()
        {
            return View();
        }

        public ActionResult MaintainEmployeeType()
        {
            return View();
        }
    }
}
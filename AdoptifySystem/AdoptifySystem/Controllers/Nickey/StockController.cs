using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdoptifySystem.Controllers
{
    public class StockController : Controller
    {
        // GET: Stock
        public ActionResult AddStock()
        {
            return View();
        }
        public ActionResult SearchStock()
        {
            return View();
        }
        public ActionResult MaintainStock()
        {
            return View();
        }

        public ActionResult CaptureStockTake()
        {
            return View();
        }
        public ActionResult AddStockType()
        {
            return View();
        }
        public ActionResult SearchStockType()
        {
            return View();
        }
        public ActionResult MaintainStockType()
        {
            return View();
        }
        public ActionResult ReceiveStock()
        {
            return View();
        }
    }
}
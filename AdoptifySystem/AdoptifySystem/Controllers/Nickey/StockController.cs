﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace AdoptifySystem.Controllers
{
    public class StockController : Controller
    {
        // GET: Stock
        Wollies_ShelterEntities db = new Wollies_ShelterEntities();
        public ActionResult AddStock()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddStock(Stock stock, string button)
        {
            return View();
        }
        public ActionResult SearchStock()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SearchStock(Stock stock)
        {
            return View();
        }
        public ActionResult MaintainStock()
        {
            return View();
        }
        [HttpPost]
        public ActionResult MaintainStock(Stock stock, string button)
        {
            return View();
        }

        public ActionResult CaptureStockTake()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CaptureStockTake(Stock stock, string button)
        {
            return View();
        }
        public ActionResult AddStockType()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddStockType(Stock_Type stock_type,string button)
        {
            ViewBag.errorMessage = "";
            if (button == "Save")
            {
                try
                {

                    List<Stock_Type> stock_types = new List<Stock_Type>();
                    stock_types = db.Stock_Type.ToList();
                    if (stock_types.Count != 0)
                    {
                        int count = 0;
                        foreach (var item in stock_types)
                        {
                            if (item.Stock_Type_Name == stock_type.Stock_Type_Name && item.Stock_Type_Description == stock_type.Stock_Type_Description)
                            {
                                count++;
                                ViewBag.errorMessage = "There is a duplicate Stock Type Already";
                                return View();
                            }

                        }
                        if (count == 0)
                        {
                            db.Stock_Type.Add(stock_type);
                            db.SaveChanges();
                        }
                    }
                    else
                    {

                        db.Stock_Type.Add(stock_type);
                        db.SaveChanges();


                    }

                }
                catch (Exception e)
                {
                    ViewBag.errorMessage = "There was an Error with network please try again: " + e.Message;
                    return View();
                }

            }
            else if (button == "Cancel")
            {

                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Index", "Home");
        }
        public ActionResult ReceiveStock()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ReceiveStock(Stock stock, string button)
        {
            return View();
        }
        public ActionResult AddDonationType()
        {
            return View();
        }
        [HttpGet]
        public ActionResult SearchStockType()
        {
            ViewBag.errormessage = "";
            List<Stock_Type> stock_Types = new List<Stock_Type>();
            try
            {
                stock_Types = db.Stock_Type.ToList();
                if (stock_Types.Count == 0)
                {

                }
                return View(stock_Types);
            }
            catch (Exception e)
            {
                ViewBag.errormessage = "there was a network error: " + e.Message;
                return View();
            }

        }
        public ActionResult MaintainStockType(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Stock_Type stock_Type = db.Stock_Type.Find(id);
            if (stock_Type == null)
            {
                return HttpNotFound();
            }
            return View(stock_Type);
        }
        [HttpPost]
        public ActionResult MaintainStockType(Stock_Type stock_Type)
        {

            return View();
        }
    }
}
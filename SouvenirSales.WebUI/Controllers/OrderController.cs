using SouvenirSales.WebUI.Models.Context;
using SouvenirSales.WebUI.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SouvenirSales.WebUI.Controllers
{
    public class OrderController : Controller
    {
        SouvenirSalesDbContext context = new SouvenirSalesDbContext();

        public ActionResult Index()
        {
            int userId = Convert.ToInt32(Session["userId"]);

            var order = context.Orders.Include(u=>u.User).Where(o=>o.UserId==userId).ToList();
            foreach (var item in order)
            {
                var products = context.OrderProducts.Include(p => p.Product).Where(o => o.OrderId==item.ID).ToList();
                item.OrderProducts = products;
            }
           
            return View(order);
        }

        // GET: Order/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Order/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Order/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Order/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Order/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Order/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Order/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

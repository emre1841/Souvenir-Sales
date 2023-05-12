using SouvenirSales.WebUI.Models.Context;
using SouvenirSales.WebUI.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SouvenirSales.WebUI.Controllers
{
    public class CategoryController : Controller
    {
        SouvenirSalesDbContext context = new SouvenirSalesDbContext();

        public ActionResult Index()
        {
            var categories = context.Categories.ToList();
            return View(categories);
        }

        // GET: Category/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Category/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Category/Create
        [HttpPost]
        public ActionResult Create(Category category)
        {
            int userId =Convert.ToInt32(Session["userId"]);
            try
            {
                category.IsActive = true;
                category.CreateDate = DateTime.Now;
                category.CreateUserID = userId;
                context.Categories.Add(category);
                context.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Category/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Category/Edit/5
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

        // GET: Category/Delete/5
       

        // POST: Category/Delete/5
      
        public ActionResult Delete(int id)
        {
            try
            {
                var category = context.Categories.Where(c=>c.ID==id).First();
                context.Categories.Remove(category);
                context.SaveChanges();
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                return RedirectToAction("Index");
            }
        }
    }
}

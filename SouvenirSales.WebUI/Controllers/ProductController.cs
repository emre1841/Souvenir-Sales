using SouvenirSales.WebUI.Models.Context;
using SouvenirSales.WebUI.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SouvenirSales.WebUI.Controllers
{
    public class ProductController : Controller
    {
        SouvenirSalesDbContext context = new SouvenirSalesDbContext();

        // GET: Product
        public ActionResult Index()
        {
            var products = context.Products.Include(c=>c.Category).ToList();
            return View(products);
        }

        // GET: Product/Details/5
        public ActionResult Details(int id)
        {
            var product = context.Products.Include( d=>d.Category).Where(c => c.ID == id).FirstOrDefault();
            return View(product);
        }

        // GET: Product/Create
        public ActionResult Create()
        {
            var categories = context.Categories.ToList();
            ViewBag.Categories = categories;
            return View();
        }

        // POST: Product/Create
        [HttpPost]
            public ActionResult Create(Product product, HttpPostedFileBase file) 

        {
            string path = "";
            if (file != null && file.ContentLength > 0)

                try
                {
                    path = Path.Combine(Server.MapPath("~/Content/images"),
                    Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                }
                catch (Exception ex)
                {
                    ViewBag.Message = "ERROR:" + ex.Message.ToString();
                }
            else
            {
                ViewBag.Message = "You have not specified a file.";
            }
            try
            {
            int userId =Convert.ToInt32(Session["userId"]);

                product.ImageUrl = "/Content/images/"+file.FileName;
                product.CreateDate = DateTime.Now;
                product.CreateUserID = userId;
                context.Products.Add(product);
                context.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Product/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Product/Edit/5
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

        // GET: Product/Delete/5
        public ActionResult Delete(int id)
        {
            var product = context.Products.Where(p=>p.ID==id).First();
            context.Products.Remove(product);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        
        
    }
}

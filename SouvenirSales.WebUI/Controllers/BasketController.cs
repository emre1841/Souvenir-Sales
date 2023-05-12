using SouvenirSales.WebUI.Models.Context;
using SouvenirSales.WebUI.Models.Entities;
using SouvenirSales.WebUI.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SouvenirSales.WebUI.Controllers
{
    public class BasketController : Controller
    {
        SouvenirSalesDbContext context = new SouvenirSalesDbContext();
        // GET: Basket
        public ActionResult Index()
        {
            
            int userId = Convert.ToInt32(Session["userId"]);

            var baskets = context.Baskets.Include(b => b.Product).Where(b=>b.UserID==userId).ToList();

            return View(baskets);
        }

        // GET: Basket/Details/5
        public ActionResult AddToBasket(int id)
        {
            Basket basket = new Basket();
            int userId = Convert.ToInt32(Session["userId"]);

            var product = context.Products.Where(p => p.ID == id).FirstOrDefault();
            var baskets = context.Baskets.Where(p => p.ProductId == id).FirstOrDefault();
            if (baskets==null)
            {

                basket.ProductId = product.ID;
                basket.Quantity = 1;
                basket.CreateDate = DateTime.Now;
                basket.UserID = userId;
                basket.CreateUserID = userId;
                basket.Product = product;
               

                context.Baskets.Add(basket);
            }
            else
            {
                baskets.Quantity++;
                context.Entry(baskets).State = EntityState.Modified;
            }
           
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Basket/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Basket/Create
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

        // GET: Basket/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Basket/Edit/5
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

        // GET: Basket/Delete/5
        public ActionResult Delete(int id)
        {
            var basket = context.Baskets.Where(b=>b.ID==id).FirstOrDefault();
            context.Baskets.Remove(basket);
            context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult AddToOrder()
        {
            int userId = Convert.ToInt32(Session["userId"]);

            var basket = context.Baskets.Include(p=>p.Product).Where(b => b.UserID == userId).ToList();

            decimal total = 0;
            foreach (var item in basket)
            {
                total = (item.Product.Price * item.Quantity) + total;
            }
            Order order = new Order
            {
                UserId=userId,
                CreateDate=DateTime.Now,
                TotalPrice=total,
                CreateUserID=userId

            };
            context.Orders.Add(order);
            context.SaveChanges();

            foreach (var item in basket)
            {
                OrderProduct orderProduct = new OrderProduct
                {
                    OrderId = order.ID,
                    Order = order,
                    Product = item.Product,
                    Quantity = item.Quantity,
                    ProductId = item.ProductId,
                    CreateUserID = userId,
                    CreateDate = DateTime.Now
                };
                context.OrderProducts.Add(orderProduct);
                context.SaveChanges();

            }
            foreach (var item in basket)
            {
                context.Baskets.Remove(item);
                context.SaveChanges();
            }

            return RedirectToAction("Index","Order");
        }

    }
}

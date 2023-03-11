﻿using ApplicationCore.Services;
using Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Web.Utils;

namespace Web.Controllers
{
    public class IncidenceController : Controller
    {
        // GET: Incidence
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Maintenance()
        {
            IEnumerable<Incidence> list = null;
            try
            {
                IServiceIncidence _ServiceIncidence = new ServiceIncidence();
                list = _ServiceIncidence.GetIncidences();
            }
            catch (Exception ex)
            {
                Log.Error(ex, MethodBase.GetCurrentMethod());
                TempData["Message"] = "Error at procesing data: " + ex.Message;
                return RedirectToAction("Default", "Error");
            }
            return View(list);
        }

        public ActionResult Create()
        {
            ViewBag.IDUser = listUsers();
            return View();  
        }

        public ActionResult Edit(int? id)
        {
            IServiceIncidence _ServiceIncidence = new ServiceIncidence();
            Incidence oIncidence = null;
            try
            {
                if (id == null)
                {
                    return RedirectToAction("Maintenance");
                }
                oIncidence = _ServiceIncidence.GetIncidenceByID(Convert.ToInt32(id));
                if (oIncidence == null)
                {
                    TempData["Message"] = "The requested Incidence does not exist";
                    //Controlador
                    TempData["Redirect"] = "Incidence";
                    //Acción
                    TempData["Redirect-Action"] = "Maintenance";
                    return RedirectToAction("Default", "Error");
                }
                ViewBag.IDUser = listUsers();
                return View(oIncidence);
            }
            catch (Exception ex)
            {
                Log.Error(ex, MethodBase.GetCurrentMethod());
                TempData["Message"] = "Error at procesing data: " + ex.Message;
                return RedirectToAction("Default", "Error");
            }
        }

        private MultiSelectList listUsers(ICollection<User> users = null)
        {
            IServiceUser _ServiceUser = new ServiceUser();
            IEnumerable<User> lista = _ServiceUser.GetUsers();
            //Seleccionar categorias
            long[] listUserSelect = null;
            if (users != null)
            {
                listUserSelect = users.Select(c => c.IDUser).ToArray();
            }

            return new MultiSelectList(lista, "IDUser", "FullName", listUserSelect);
        }
    }
}
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using VehicleManagement.Models;

namespace VehicleManagement.Controllers
{
    public class HomeController : Controller
    {
        private AssesmentEntities db = new AssesmentEntities();

        public ActionResult Index()
        {
            return View();
        }

        public async Task<ActionResult> GetVehicles(string nickname)
        {
            var query = from v in db.Vehicles
                        select v;

            if (!string.IsNullOrEmpty(nickname))
            {
                query = from v in query
                        where v.Nickname.ToLower().Contains(nickname.ToLower())
                        select v;
            }

            return  Json(await query.ToListAsync(), JsonRequestBehavior.AllowGet);
        }
    }
}
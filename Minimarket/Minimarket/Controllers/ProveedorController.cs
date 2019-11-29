using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Minimarket.Controllers
{
    public class ProveedorController : Controller
    {
        // GET: Proveedor
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult listarTodo()
        {
            List<Minimarket.Models.Proveedor> elListado = new List<Models.Proveedor>();


            MinimarketEntities misDatos = new MinimarketEntities();
            foreach (tblProveedor elemento in misDatos.tblProveedor)
            {
                Minimarket.Models.Proveedor objeto01 = new Models.Proveedor();
                objeto01.Codigo = elemento.Codigo;
                objeto01.RUC = elemento.RUC;
                objeto01.Nombre = elemento.Nombre;
                objeto01.Direccion = elemento.Direccion;
                objeto01.Ciudad = elemento.Ciudad;
                objeto01.Telefono = elemento.Telefono;
                objeto01.Correo = elemento.Correo;
                elListado.Add(objeto01);
            }


            return Json(elListado, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Buscar_PorCodigo(int argCodigo)
        {
            List<Minimarket.Models.Proveedor> elListado = new List<Models.Proveedor>();

            MinimarketEntities misDatos = new MinimarketEntities();
            foreach (tblProveedor elemento in misDatos.tblProveedor.Where(x => x.Codigo == argCodigo))
            {

                Minimarket.Models.Proveedor objeto01 = new Models.Proveedor();
                objeto01.Codigo = elemento.Codigo;
                objeto01.RUC = elemento.RUC;
                objeto01.Nombre = elemento.Nombre;
                objeto01.Direccion = elemento.Direccion;
                objeto01.Ciudad = elemento.Ciudad;
                objeto01.Correo = elemento.Correo;
                objeto01.Telefono = elemento.Telefono;
                elListado.Add(objeto01);
            }

            return Json(elListado, JsonRequestBehavior.AllowGet);
        }

        public bool Editar(Minimarket.Models.Proveedor argNuevosDatosDeProveedor)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            tblProveedor proveedorExistente =
                misDatos.tblProveedor.Where(x => x.Codigo == argNuevosDatosDeProveedor.Codigo).First();

            proveedorExistente.Nombre = argNuevosDatosDeProveedor.Nombre;
            proveedorExistente.RUC = argNuevosDatosDeProveedor.RUC;
            proveedorExistente.Direccion = argNuevosDatosDeProveedor.Direccion;
            proveedorExistente.Ciudad = argNuevosDatosDeProveedor.Ciudad;
            proveedorExistente.Correo = argNuevosDatosDeProveedor.Correo;
            proveedorExistente.Telefono = argNuevosDatosDeProveedor.Telefono;

            try
            {
                misDatos.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public bool Insertar(tblProveedor proveedor)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            misDatos.tblProveedor.Add(proveedor);

            try
            {
                misDatos.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public bool Eliminar(Minimarket.Models.Proveedor argIdProveedor)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            tblProveedor proveedor =
                misDatos.tblProveedor.Where(x => x.Codigo == argIdProveedor.Codigo).First();
            misDatos.tblProveedor.Remove(proveedor);

            try
            {
                misDatos.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

    }
}
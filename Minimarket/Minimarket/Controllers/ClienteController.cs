using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Minimarket.Controllers
{
    public class ClienteController : Controller
    {
        // GET: Cliente
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult listarTodo()
        {
            List<Minimarket.Models.Cliente> elListado = new List<Models.Cliente>();


            MinimarketEntities misDatos = new MinimarketEntities();
            foreach (tblCliente elemento in misDatos.tblCliente)
            {
                Minimarket.Models.Cliente objeto01 = new Models.Cliente();
                objeto01.Codigo = elemento.Codigo;
                objeto01.Nombre = elemento.Nombre;
                objeto01.Direccion = elemento.Direccion;
                objeto01.Ciudad = elemento.Ciudad;
                objeto01.Email = elemento.Email;
                objeto01.Telefono = elemento.Telefono;

                elListado.Add(objeto01);
            }


            return Json(elListado, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Buscar_PorCodigo(int argCodigo)
        {
            List<Minimarket.Models.Cliente> elListado = new List<Models.Cliente>();

            MinimarketEntities misDatos = new MinimarketEntities();
            foreach (tblCliente elemento in misDatos.tblCliente.Where(x => x.Codigo == argCodigo))
            {

                Minimarket.Models.Cliente objeto01 = new Models.Cliente();
                objeto01.Codigo = elemento.Codigo;
                objeto01.Nombre = elemento.Nombre;
                objeto01.Direccion = elemento.Direccion;
                objeto01.Ciudad = elemento.Ciudad;
                objeto01.Email = elemento.Email;
                objeto01.Telefono = elemento.Telefono;
                elListado.Add(objeto01);
            }

            return Json(elListado, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public bool Editar(Minimarket.Models.Cliente argNuevosDatosDeCliente)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            tblCliente clienteExistente =
                misDatos.tblCliente.Where(x => x.Codigo == argNuevosDatosDeCliente.Codigo).First();

            clienteExistente.Nombre = argNuevosDatosDeCliente.Nombre;
            clienteExistente.Direccion = argNuevosDatosDeCliente.Direccion;
            clienteExistente.Ciudad = argNuevosDatosDeCliente.Ciudad;
            clienteExistente.Email = argNuevosDatosDeCliente.Email;
            clienteExistente.Telefono = argNuevosDatosDeCliente.Telefono;

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

        public bool Insertar(tblCliente cliente)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            misDatos.tblCliente.Add(cliente);

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

        public bool EliminarCliente(Minimarket.Models.Cliente argIdCliente)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            tblCliente clienteExistente =
                misDatos.tblCliente.Where(x => x.Codigo == argIdCliente.Codigo).First();
            misDatos.tblCliente.Remove(clienteExistente);

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
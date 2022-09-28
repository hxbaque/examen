using System;
using capaEntidad;
using capaDatos;
using System.Windows.Forms;
using System.Data;

namespace capaNegocio
{
    public class CNCliente
    {
        CDDatos cddatos = new CDDatos();
        
        public void pruebamysql(){
            cddatos.pruebaConexion();
        }
        public DataSet ObtenerDatos()
        {
            return cddatos.Listar();
        }
    }
}

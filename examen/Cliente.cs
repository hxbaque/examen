using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using capaEntidad;
using capaNegocio;

namespace examen
{
    public partial class Cliente : Form
    {
        CECliente cecliente = new CECliente();
        CNCliente cncliente = new CNCliente();
        public Cliente()
        {
            InitializeComponent();
        }

        private void Cliente_Load(object sender, EventArgs e)
        {
            gridDatos.DataSource = cncliente.ObtenerDatos().Tables["tbl"];
            gridDatos.Columns[0].HeaderText = "IdContacto";
            gridDatos.Columns[1].HeaderText = "Cliente";
            gridDatos.Columns[2].HeaderText = "Tipo Contacto";
            gridDatos.Columns[3].HeaderText = "Valor";
        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            cncliente.pruebamysql();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void botonConsultar_Click(object sender, EventArgs e)
        {
            CECliente cecliente = new CECliente();
            cecliente.cedula = txtcedula.Text;
            cecliente.nombre = txtnombre.Text;
            cecliente.apellido = txtapellido.Text;
            cecliente.valor = txtdirrecion.Text;
            gridDatos.DataSource = cncliente.consulta().Tables["tbl"];
        }

        private void gridDatos_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}

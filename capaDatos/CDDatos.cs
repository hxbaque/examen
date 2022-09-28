using System;
using MySql.Data.MySqlClient;
using capaEntidad;
using System.Windows.Forms;
using System.Data;

namespace capaDatos
{
    public class CDDatos
    {
        string CadenaConexion = "Server=localhost;User=root;Password=root;Port=3306;database=examen";
        public void pruebaConexion() {
            MySqlConnection mySqlConnection = new MySqlConnection(CadenaConexion);
            try
            {
                mySqlConnection.Open();
            }catch(Exception e)
            {
                MessageBox.Show(e.Message);
                return;
            }
            mySqlConnection.Close();
            MessageBox.Show("Conectado");
        }

        public DataSet Listar() {
            MySqlConnection mySqlConnection = new MySqlConnection(CadenaConexion);
            mySqlConnection.Open();
            String query = "SELECT * FROM contacto";
            MySqlDataAdapter adaptador;
            DataSet dataSet = new DataSet();
            adaptador = new MySqlDataAdapter(query, mySqlConnection);
            adaptador.Fill(dataSet, "tbl");
            return dataSet;

        }
    }
}

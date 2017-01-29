using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Configuration;

namespace DAL
{
    public class Pessoa
    {

        public void Criar(Entity.Pessoa Pessoa)
        {
         
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

                  SqlConnection con = new SqlConnection(connectionString);
                  SqlCommand cmd = new SqlCommand("INS_Pessoa", con);
                  cmd.Parameters.AddWithValue("@ccNome", Pessoa.ccNome);
                  cmd.Parameters.AddWithValue("@ccEndereco", Pessoa.ccEndereco);
                  cmd.Parameters.AddWithValue("@ccCidade", Pessoa.ccCidade);
                  cmd.Parameters.AddWithValue("@ccCEP", Pessoa.ccCEP);
                  cmd.Parameters.AddWithValue("@ccTelefoneCelular", Pessoa.ccTelefoneCelular);
                  cmd.Parameters.AddWithValue("@ccTelefoneComercial", Pessoa.ccTelefoneComercial);
                  cmd.Parameters.AddWithValue("@cvIdEstadoCivil", Pessoa.cvIdEstadoCivil);
                  cmd.Parameters.AddWithValue("@ccTelefoneResidencial", Pessoa.ccTelefoneResidencial);
                  cmd.Parameters.AddWithValue("@ccUF", Pessoa.ccUF);
                  cmd.Parameters.AddWithValue("@ccEmail", Pessoa.ccEmail);
                  cmd.Parameters.AddWithValue("@cdNascimento", Pessoa.cdNascimento);
                  cmd.CommandType = CommandType.StoredProcedure;
                  con.Open();
   
                  try
                  {
                      int i = cmd.ExecuteNonQuery();
                      //if (i > 0)
                      //    MessageBox.Show("Registro incluido com sucesso!");
                  }
                  catch (Exception ex)
                  {
                      //MessageBox.Show("Erro: " + ex.ToString());
                  }
                  finally
                  {
                      con.Close();
                  }
              }
        }
    
    }


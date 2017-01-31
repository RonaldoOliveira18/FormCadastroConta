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
    {        public void Criar(Entity.Pessoa Pessoa)
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
                  cmd.Parameters.AddWithValue("@ccRG", Pessoa.ccRG);
                  cmd.Parameters.AddWithValue("@ccCPF", Pessoa.ccCPF);
                  cmd.Parameters.AddWithValue("@ccTelefoneResidencial", Pessoa.ccTelefoneResidencial);
                  cmd.Parameters.AddWithValue("@ccUF", Pessoa.ccUF);
                  cmd.Parameters.AddWithValue("@ccEmail", Pessoa.ccEmail);
                  cmd.Parameters.AddWithValue("@cdNascimento", Pessoa.cdNascimento);
                  cmd.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;
                  cmd.CommandType = CommandType.StoredProcedure;
                  con.Open();
   
                  try
                  {
                      cmd.ExecuteNonQuery();
                      Pessoa.cvIdPessoa = Convert.ToInt32(cmd.Parameters["@NewId"].Value);
                  }
                  catch (Exception ex)
                  {
                      Pessoa.ccRet = 'N';
                  }
                  finally
                  {
                      con.Close();
                  }
              }

        public void Atualizar(Entity.Pessoa Pessoa)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("UPD_Pessoa", con);
            cmd.Parameters.AddWithValue("@cvIdPessoa", Pessoa.cvIdPessoa);
            cmd.Parameters.AddWithValue("@ccNome", Pessoa.ccNome);
            cmd.Parameters.AddWithValue("@ccEndereco", Pessoa.ccEndereco);
            cmd.Parameters.AddWithValue("@ccCidade", Pessoa.ccCidade);
            cmd.Parameters.AddWithValue("@ccCEP", Pessoa.ccCEP);
            cmd.Parameters.AddWithValue("@ccTelefoneCelular", Pessoa.ccTelefoneCelular);
            cmd.Parameters.AddWithValue("@ccTelefoneComercial", Pessoa.ccTelefoneComercial);
            cmd.Parameters.AddWithValue("@ccRG", Pessoa.ccRG);
            cmd.Parameters.AddWithValue("@ccCPF", Pessoa.ccCPF);
            cmd.Parameters.AddWithValue("@ccTelefoneResidencial", Pessoa.ccTelefoneResidencial);
            cmd.Parameters.AddWithValue("@ccUF", Pessoa.ccUF);
            cmd.Parameters.AddWithValue("@ccEmail", Pessoa.ccEmail);
            cmd.Parameters.AddWithValue("@cdNascimento", Pessoa.cdNascimento);
            cmd.Parameters.AddWithValue("@ccImage", Pessoa.ccImage);
            cmd.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();

            try
            {
                cmd.ExecuteNonQuery();
                Pessoa.cvIdPessoa = Convert.ToInt32(cmd.Parameters["@NewId"].Value);

            }
            catch (Exception ex)
            {
                Pessoa.ccRet = 'N';
            }
            finally
            {
                con.Close();
            }
        }

        public void Excluir(Entity.Pessoa Pessoa)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("DEL_Pessoa", con);
            cmd.Parameters.AddWithValue("@cvIdPessoa", Pessoa.cvIdPessoa);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Pessoa.ccRet = 'N';
            }
            finally
            {
                con.Close();
            }
        }

        public void AtualizarAnexo(Entity.Pessoa Pessoa)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("UPD_PessoaAnexo", con);
            cmd.Parameters.AddWithValue("@cvIdPessoa", Pessoa.cvIdPessoa);
            cmd.Parameters.AddWithValue("@ccImage", Pessoa.ccImage);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Pessoa.ccRet = 'N';
            }
            finally
            {
                con.Close();
            }
        }

        public DataTable Obter(Entity.Pessoa Pessoa)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            
            SqlDataAdapter da = new SqlDataAdapter("SEL_PESSOA", con);
            if (Pessoa.cvIdPessoa != 0) { 
            da.SelectCommand.Parameters.AddWithValue("@cvIdPessoa", Pessoa.cvIdPessoa);
            }
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public byte[] ObterImagem(Entity.Pessoa Pessoa)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            Entity.Pessoa objPessoaEntity = new Entity.Pessoa();

            SqlConnection con = new SqlConnection(connectionString);
  
            SqlCommand cmd = new SqlCommand("SEL_Imagem", con);
            cmd.Parameters.AddWithValue("@cvIdPessoa", Pessoa.cvIdPessoa);

            con.Open();
            SqlDataReader myReader = cmd.ExecuteReader();

            if (myReader.Read())
            {
                 objPessoaEntity.ccImage = (byte[])myReader["ImgComprovResid"];
                 
            }

            myReader.Close();
            con.Close();

            return objPessoaEntity.ccImage;
        }

        }
    
    }


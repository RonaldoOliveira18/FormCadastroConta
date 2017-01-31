using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace BLL
{
    public class Pessoa
    {
        public void Criar(Entity.Pessoa Pessoa)
        {
                try
                {
                    DAL.Pessoa PessoaDAL = new DAL.Pessoa();
                    PessoaDAL.Criar(Pessoa);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
        }

        public void Atualizar(Entity.Pessoa Pessoa)
        {
            try
            {
                DAL.Pessoa PessoaDAL = new DAL.Pessoa();
                PessoaDAL.Atualizar(Pessoa);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void AtualizarAnexo(Entity.Pessoa Pessoa)
        {
            try
            {
                DAL.Pessoa PessoaDAL = new DAL.Pessoa();
                PessoaDAL.AtualizarAnexo(Pessoa);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Excluir(Entity.Pessoa Pessoa)
        {
            try
            {
                DAL.Pessoa PessoaDAL = new DAL.Pessoa();
                PessoaDAL.Excluir(Pessoa);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataTable Obter(Entity.Pessoa Pessoa)
        {
            try
            {
                DAL.Pessoa PessoaDAL = new DAL.Pessoa();
                return PessoaDAL.Obter(Pessoa);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public byte[] ObterImagem(Entity.Pessoa Pessoa)
        {
            try
            {
                DAL.Pessoa PessoaDAL = new DAL.Pessoa();
                return PessoaDAL.ObterImagem(Pessoa);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}

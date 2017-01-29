using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    }
}

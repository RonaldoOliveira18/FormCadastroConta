using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Serialization;
using System.IO;
using System.Data;
using System.Text;

namespace CriarConta
{
    public partial class CriarConta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static int Salvar(Entity.Pessoa Pessoa)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            Entity.Pessoa objCriarContaEntity = new Entity.Pessoa();
            BLL.Pessoa objCriarContaBLL = new BLL.Pessoa();
            try
            {
                if (Pessoa.ccNascimento != ""){
                    Pessoa.cdNascimento = Convert.ToDateTime(Pessoa.ccNascimento);
                }

                objCriarContaEntity = Pessoa;

                if (Pessoa.cvIdPessoa != 0 && Pessoa.cvIdPessoa != null)
                {

                    objCriarContaBLL.Atualizar(objCriarContaEntity);
                }
                else
                {
                    objCriarContaBLL.Criar(objCriarContaEntity);
                }

                return objCriarContaEntity.cvIdPessoa;
            }
            catch (Exception ex)
            {
                return 0;
            }

        }

        [System.Web.Services.WebMethod]
        public static int Excluir(int cvIdPessoa)
        {
            Entity.Pessoa objCriarContaEntity = new Entity.Pessoa();
            BLL.Pessoa objCriarContaBLL = new BLL.Pessoa();
            try
            {
                objCriarContaEntity.cvIdPessoa = cvIdPessoa;

                objCriarContaBLL.Excluir(objCriarContaEntity);

                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }

        }

        public Entity.Pessoa objJSON = new Entity.Pessoa();
        public Entity.Pessoa rows = new Entity.Pessoa();
        [System.Web.Services.WebMethod]
        public static string CarregarDados(int idPessoa)
        {
            JavaScriptSerializer objSerializer = new JavaScriptSerializer();

            System.Data.DataTable dt = new System.Data.DataTable();
            BLL.Pessoa objPessoaBLL = new BLL.Pessoa();
            Entity.Pessoa objPessoaEntity = new Entity.Pessoa();
            objPessoaEntity.cvIdPessoa = idPessoa;

            dt = objPessoaBLL.Obter(objPessoaEntity);

            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = null;

            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return objSerializer.Serialize(rows);
        }


    }

}
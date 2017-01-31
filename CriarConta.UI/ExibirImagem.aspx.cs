using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class ExibirImagem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int idPessoa = Convert.ToInt32(Request.QueryString["idPessoa"]);
            BLL.Pessoa objPessoaBLL = new BLL.Pessoa();
            Entity.Pessoa objPessoaEntity = new Entity.Pessoa();

            objPessoaEntity.cvIdPessoa = idPessoa;

            objPessoaEntity.ccImage = objPessoaBLL.ObterImagem(objPessoaEntity);

            if (objPessoaEntity.ccImage != null) { 

            Response.BinaryWrite(objPessoaEntity.ccImage);
            }
        }


        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}

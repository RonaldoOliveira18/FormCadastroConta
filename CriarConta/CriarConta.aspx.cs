using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CriarConta
{
    public partial class CriarConta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string Salvar(Entity.Pessoa Pessoa)
        {

            Entity.Pessoa objCriarContaEntity = new Entity.Pessoa();
            BLL.Pessoa objCriarContaBLL = new BLL.Pessoa();

            objCriarContaEntity = Pessoa;

            objCriarContaBLL.Criar(objCriarContaEntity);

            

            return "1";

            //return "Hello " + ccNome + Environment.NewLine + "The Current Time is: "
            //    + DateTime.Now.ToString();
        }

    }

 



}
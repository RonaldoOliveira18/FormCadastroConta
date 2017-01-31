using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace CriarConta
{
    /// <summary>
    /// Summary description for Arquivo
    /// </summary>
    public class Arquivo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            foreach (string file in context.Request.Files)
            {
                HttpPostedFile hpf = context.Request.Files[file];

                String idPessoa = context.Request.QueryString["idPessoa"];

                string savedFileName = Path.Combine(context.Server.MapPath("~/App_Data"), Path.GetFileName(hpf.FileName));

                byte[] imageBytes = new byte[hpf.InputStream.Length + 1];

                hpf.InputStream.Read(imageBytes, 0, imageBytes.Length);

                Entity.Pessoa objPessoaEntity = new Entity.Pessoa();
                BLL.Pessoa objPessoaBLL = new BLL.Pessoa();

                objPessoaEntity.ccImage = imageBytes;
                objPessoaEntity.cvIdPessoa = Convert.ToInt32(idPessoa);

                objPessoaBLL.AtualizarAnexo(objPessoaEntity);
            }

        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
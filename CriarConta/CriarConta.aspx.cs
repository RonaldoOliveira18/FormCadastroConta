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

        [System.Web.Services.WebMethod]
        public static string processImages(HttpContext htp1)
        {
            string Files = htp1.Items.ToString();
            HttpPostedFile f1 = htp1.Request.Files["file"];
            HttpFileCollection selectedFiles = htp1.Request.Files;
            string fName = Path.GetFileName(selectedFiles[0].FileName);

            string FileName = htp1.Server.MapPath("c:\\inetpub\\wwwroot\\corpDirectory\\" + fName);

            f1.SaveAs(fName);

            System.IO.StreamWriter file1 = new System.IO.StreamWriter("c:\\inetpub\\wwwroot\\corpDirectory\\testOutput.txt", true);
            //System.IO.StreamWriter s1 = new StreamWriter(f1);
            file1.WriteLine("First Ajax call completed..");

            return f1.ToString();



        }

        [System.Web.Services.WebMethod]

        public static void upload(HttpContext context)
        {

            foreach (string file in context.Request.Files)
            {
                HttpPostedFile hpf = context.Request.Files[file];

                string savedFileName = Path.Combine(context.Server.MapPath("~/App_Data"), Path.GetFileName(hpf.FileName));
                hpf.SaveAs(savedFileName);

            }

            //Returns json
            //return context.Response.Write("{\"name\":\"" + r[0].Name + "\",\"type\":\"" + r[0].Type + "\",\"size\":\"" + string.Format("{0} bytes", r[0].Length) + "\"}");

        }





        //public static string upload()
        //{

        //    //HttpPostedFile myFile = htp1.Request.Files["MyFile"];
        //    bool isUploaded = false;
        //    string message = "File upload failed";

        //    //if (myFile != null && myFile.ContentLength != 0)
        //    //{
        //        //string pathForSaving = Server.MapPath("~/Uploads");
        //        //if (this.CreateFolderIfNeeded(pathForSaving))
        //        //{
        //        //    try
        //        //    {
        //        //        myFile.SaveAs(Path.Combine(pathForSaving, myFile.FileName));
        //        //        isUploaded = true;
        //        //        message = "File uploaded successfully!";
        //        //    }
        //        //    catch (Exception ex)
        //        //    {
        //        //        message = string.Format("File upload failed: {0}", ex.Message);
        //        //    }
        //        //}
        //    //}

        //    //return Json(new { isUploaded = isUploaded, message = message }, "text/html");
        //    return "S";
        //}

        public Entity.Pessoa objJSON = new Entity.Pessoa();
        public Entity.Pessoa rows = new Entity.Pessoa();
        [System.Web.Services.WebMethod]
        public static string CarregarDados(int idPessoa)
        {
            JavaScriptSerializer objSerializer = new JavaScriptSerializer();
            //Try
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

            //Catch ex As Exception
            //    TrataErro(ex)
            //End Try

            return objSerializer.Serialize(rows);
        }


    }

}
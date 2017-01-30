using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data;

namespace CriarConta
{
    public partial class wfInicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Entity.Pessoa objJSON = new Entity.Pessoa();
        public JavaScriptSerializer objSerializer = new JavaScriptSerializer();
        public Entity.Pessoa rows = new Entity.Pessoa();

        protected string ConvertDataTabletoString()
        {
            //Try
            System.Data.DataTable dt = new System.Data.DataTable();
            BLL.Pessoa objPessoaBLL = new BLL.Pessoa();
            Entity.Pessoa objPessoaEntity = new Entity.Pessoa();


            dt = objPessoaBLL.Obter(objPessoaEntity);

            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = null;

            foreach (DataRow dr in dt.Rows) {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns) {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }

            ////Catch ex As Exception
            ////    TrataErro(ex)
            ////End Try

            return objSerializer.Serialize(rows);
        }

    }
}
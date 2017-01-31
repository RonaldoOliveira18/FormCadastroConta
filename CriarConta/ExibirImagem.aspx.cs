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


            //nomeArquivo], [horaUpload], [MIME], [imagem]
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString))
            {
                const string SQL = "SELECT [ImgComprovResid] FROM [tb_pessoa] WHERE [cvIdPessoa] = @id";
                SqlCommand myCommand = new SqlCommand(SQL, Conn);
                myCommand.Parameters.AddWithValue("@id", idPessoa);

                Conn.Open();
                SqlDataReader myReader = myCommand.ExecuteReader();

                if (myReader.Read())
                {
                    //Response.ContentType = myReader["MIME"].ToString();
                    Response.BinaryWrite((byte[])myReader["ImgComprovResid"]);
                }

                myReader.Close();
                Conn.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        } 
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //protected void btnEnviar_Click(object sender, EventArgs e)
    //{
    //    if (fupld.PostedFile == null || string.IsNullOrEmpty(fupld.PostedFile.FileName) || fupld.PostedFile.InputStream == null)
    //    {
    //        lblmsg.Text = "<br />Erro - Não foi possível enviar o arquivo.<br />";
    //        return;
    //    }
    //    else
    //    {
    //        string extension = Path.GetExtension(fupld.PostedFile.FileName).ToLower();
    //        string fileType = null;

    //        switch (extension)
    //        {
    //            case ".gif":
    //                fileType = "image/gif";
    //                break;
    //            case ".jpg":
    //            case ".jpeg":
    //            case ".jpe":
    //                fileType = "image/jpeg";
    //                break;
    //            default:
    //                lblmsg.Text = "<br />Erro - tipo de arquivo inválido.<br />";
    //                return;
    //        }

    //        using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
    //        {
    //            try
    //            {
    //                const string SQL = "INSERT INTO [Imagens] ([nomeArquivo], [horaUpload], [MIME], [imagem])VALUES(@nomeArquivo, @horaUpload, @MIME, @imagem) SELECT SCOPE_IDENTITY()";
    //                SqlCommand cmd = new SqlCommand(SQL, Conn);
    //                cmd.Parameters.AddWithValue("@nomeArquivo", txtNomeArquivo.Text.Trim());
    //                cmd.Parameters.AddWithValue("@MIME", fileType);

    //                byte[] imageBytes = new byte[fupld.PostedFile.InputStream.Length + 1];
    //                fupld.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length);
    //                cmd.Parameters.AddWithValue("@imagem", imageBytes);
    //                cmd.Parameters.AddWithValue("@horaUpload", DateTime.Now);

    //                lblmsg.Text = "<br />Arquivo enviado com sucesso <br />";

    //                Conn.Open();
    //                int imagemID = Convert.ToInt16(cmd.ExecuteScalar());
    //                hplnkExibeImagem.NavigateUrl = "~/ExibirImagem.aspx?ID=" + imagemID.ToString();
    //                Conn.Close();
    //            }
    //            catch
    //            {
    //                lblmsg.Text = " Erro ao enviar imagem ";
    //                Conn.Close();
    //            }
    //        }
    //    }
    //}
}

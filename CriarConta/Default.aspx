<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
        }
        .style2
        {
            width: 294px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div><table class="style1">
            <tr>
                <td bgcolor="#FFFFCA" class="style1" colspan="2" style="text-align: center">
                    Envie somente arquivos no formato .GIF ou .JPG</td>
            </tr>
            <tr>
                <td class="style3">Nome do Arquivo</td>
                <td class="style2"><asp:TextBox ID="txtNomeArquivo" runat="server" Width="214px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="style3">Arquivo a Enviar</td>
                <td class="style2"><asp:FileUpload ID="fupld" runat="server" Width="226px" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="style2"><asp:Button ID="btnEnviar" runat="server" Text="Enviar" 
                        Width="125px" onclick="btnEnviar_Click" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

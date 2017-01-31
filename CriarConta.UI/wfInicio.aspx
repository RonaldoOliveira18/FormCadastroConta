<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wfInicio.aspx.cs" Inherits="CriarConta.wfInicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/Justified-Nav.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/modernizr-2.6.2.js"></script>
    <script src="~/Scripts/jquery-2.1.3.min.js"></script>
    <script src="Scripts/pace.js"></script>
    <link href="Content/pace/templates/pace-theme-center-circle.tmpl.css" rel="stylesheet" />
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="table-responsive col-md-12">
                <table id="tbConta" class="table table-striped" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Header 1</th>
                            <th>Header 2</th>
                            <th>Header 3</th>
                            <th class="actions">Ações</th>
                        </tr>
                    </thead>
                    </table>
         </div>
    </div>
    </form>
</body>
</html>

    
<script type="text/javascript" language="javascript">

    //Monta o JSON com os Usuarios
    var jsonEstrutura = <%=ConvertDataTabletoString()%>

    jQuery.each(jsonEstrutura, function (chave, dados) {
        CriarLinhaTabelaPessoa(dados);
    });

    function CriarLinhaTabelaPessoa(DadosJSON) {

        novaLinha = "<tr name='trPessoa'><td>'" + DadosJSON.ccnome + "'</td><td>'" + DadosJSON.ccEmail + "'</td><td>'" + DadosJSON.ccNome + "'</td><td>'" + DadosJSON.ccNome + "'</td><td class='actions'><a class='btn btn-success btn-xs' href='view.html'>Visualizar</a><a class='btn btn-warning btn-xs' href='edit.html'>Editar</a><a class='btn btn-danger btn-xs'  href='#' data-toggle='modal' data-target='#delete-modal'>Excluir</a></td></tr>"

        $('#tbConta > tbody > tr').after(novaLinha);

    }

 </script>

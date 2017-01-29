<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CriarConta.aspx.cs" Inherits="CriarConta.CriarConta" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
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
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });

    function Salvar() {

        //if ($("#form")[0].checkValidity()) {
                var Pessoa = {};
                Pessoa.ccNome = $("#txtNomeCompleto").val();
                Pessoa.ccEndereco = $("#txtEndereco").val();
                Pessoa.ccCidade = $("#txtCidade").val();
                Pessoa.ccCEP = $("#txtCEP").val();
                Pessoa.ccTelefoneCelular = $("#txtCelular").val();
                Pessoa.ccTelefoneComercial = $("#txtComercial").val();
                Pessoa.ccTelefoneResidencial = $("#txtResidencial").val();
                Pessoa.cvIdEstadoCivil = $("#txtEstadoCivil").val
                Pessoa.ccUF = $("#txtUF").val();
                Pessoa.ccEmail = $("#txtEmail").val();
                Pessoa.cdNascimento = $("#txtDataNascimento").val();

                var Objeto = { 'Pessoa': Pessoa };
                //Pace.start // Pace.restart ?
                $.ajax({
                    type: "POST",
                    url: "CriarConta.aspx/Salvar",
                    data: JSON.stringify(Objeto),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
        //}       
    }
    function OnSuccess(response) {

        alert(response.d);
    }
</script>
</head>


<body>
    <div class="container">
        <div class="masthead">
            <h3 class="text-muted" style="color: blue">Teste Itaú - Abertura de Conta</h3>
        </div>
    </div>
    <form id="form">
        <div class="row">
            <section class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <header>
                            <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Você</h2>
                            <span>Nessa seção, preencha seus dados pessoais</span>
                        </header>
                    </div>
                </div>
                <!-- Nesta seção temos o nome e o email -->
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="txtNomeCompleto" class="col-sm-3 col-md-1 control-label" style="text-align: left">Nome:</label>
                        <div class="col-sm-4 col-md-4">
                            <input type="text" id="txtNomeCompleto" class="form-control" placeholder="Preencha seu nome " required="">
                        </div>
                        <label for="txtEmail" class="col-sm-1 col-md-2 control-label">Email:</label>
                        <div class="col-sm-4 col-md-3">
                            <input type="email" class="form-control" id="txtEmail" placeholder="Preencha seu email" required="">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3 col-md-2 col-sm-4 col-md-3">
                        <label for="txtEndereco">Endereco</label>
                        <input type="text" class="form-control" id="txtEndereco" placeholder="Preencha o Endereco" required="">
                    </div>
                    <div class="form-group col-xs-6 col-sm-4 col-md-3 col-lg-3">
                        <label for="txtCidade">Cidade</label>
                        <input type="text" class="form-control" id="txtCidade" placeholder="Preencha a Cidade" required="">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2">
                        <label for="txtUF">UF</label>
                        <input type="text" class="form-control" id="txtUF" maxlength="2" placeholder="Preencha o Estrado" required="">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2">
                        <label for="txtCep">CEP</label>
                        <input type="text" class="form-control" id="txtCEP" placeholder="Preencha o CEP Sem Tracos" required="">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2 ">
                        <label for="txtCelular">Tel. Celular</label>
                        <input type="text" class="form-control" id="txtCelular" placeholder="(00)00000-0000" required="">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2">
                        <label for="txtComercial">Tel. Comercial</label>
                        <input type="text" class="form-control" id="txtComercial" placeholder="(00)0000-0000">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2">
                        <label for="txtResidencial">Tel. Residencial</label>
                        <input type="text" class="form-control" id="txtResidencial" placeholder="(00)0000-0000">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-0">
                        <label for="txtDataNascimento">Data Nascimento</label>
                        <input type="date" class="form-control" id="txtDataNascimento" placeholder="00/00/0000" required="">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2">
                        <label for="txtEstadoCivil">Estado Civil</label>
                        <select class="form-control" name="txtEstadoCivil" id="txtEstadoCivil" required="">
                            <option value="Solteiro(a)">Solteiro(a)</option>
                            <option value="Casado">Casado(a)</option>
                            <option value="Divorciado(a)">Divorciado(a)</option>
                            <option value="Viúvo(a)">Viúvo(a)</option>
                        </select>
                    </div>
                </div>
                <div class="row">


                    <div class="form-group">
                        <label for="txtNomeCompleto" class="col-sm-3 col-md-3 control-label">Enviar Comprovante de Residencia:</label>
                        <div class="col-sm-4 col-md-4">
                            <input id="Imagens do Imóvel" name="Imagens do Imóvel" class="input-file" type="file" required="">
                        </div>
                    </div>
                </div>
            </section>
            <!-- fim da primeira seção -->
            <!--seção 2 -->
            <section class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <header>
                            <h2><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Outros Dados</h2>
                            <span>Nessa seção, preencha os dados sobre a conta e empresa</span>
                        </header>
                    </div>
                </div>
                <div class="form-inline ">
                    <div class="row form-inline-space">
                        <div class="form-group col-sm-8 col-md-7">
                            <label>Esta Empregado?</label>
                            <div class="radio">
                                <div class="clearfix clear-columns"></div>
                                <label class="control-label">
                                    <input type="radio" name="emprego" value="sim" checked>
                                    Sim
                                </label>
                                <label class="control-label">
                                    <input type="radio" name="emprego" value="sim" checked>
                                    Não
                                </label>
                            </div>
                            <input type="text" class="form-control" placeholder="Qual Empresa?">
                        </div>

                    </div>
                    <div class="row">
                        <div class="form-group col-xs-6 col-sm-3 col-md-3 col-lg-2">
                            <label for="txtTipoConta">Tipo de Conta</label>
                            <select class="form-control" id="txtTipoConta">
                                <option>Conta-Corrente</option>
                                <option>Salario</option>
                                <option>Poupanca</option>
                            </select>
                        </div>
                        <div class="form-group col-xs-6 col-sm-3 col-md-3 col-lg-2">
                            <label for="txtEstadoAgencia">Estado da Agencia</label>
                            <select class="form-control" id="txtEstadoAgencia">
                                <option></option>
                                <option>SP</option>
                                <option>RJ</option>
                                <option>RS</option>
                            </select>
                        </div>
                        <div class="form-group col-xs-6 col-sm-3 col-md-3 col-lg-2">
                            <label for="txtCidadeAgencia">Cidade da Agencia</label>
                            <select class="form-control" id="txtCidadeAgencia" disabled>
                                <option></option>
                                <option>SP</option>
                                <option>RJ</option>
                                <option>RS</option>
                            </select>
                        </div>
                        <div class="form-group col-xs-6 col-sm-3 col-md-3 col-lg-2">
                            <label for="txtAgencia">Agencia</label>
                            <select class="form-control" id="txtAgencia" disabled>
                                <option>Conta-Corrente</option>
                                <option>Salario</option>
                                <option>Poupanca</option>
                            </select>
                        </div>
                    </div>
            </section>
            <br />
            <br />
            <div class="row">
                <div class="form-group">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-8">
                        <button id="btnSalvar" class="btn btn-success" type="submit" onclick="Salvar();">Salvar</button>
                        <button id="Limpar" name="Limpar" class="btn btn-danger">Excluir Conta</button>
                    </div>
                </div>
            </div>
            <!-- fim da segunda seção -->

        </div>
    </form>
</body>



</html>

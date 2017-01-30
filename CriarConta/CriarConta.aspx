<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CriarConta.aspx.cs" Inherits="CriarConta.CriarConta" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link href="Content/datepicker.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/Justified-Nav.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/modernizr-2.6.2.js"></script>
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/sweetalert.min.js"></script>

    <%--Pace--%>
    <link href="Content/pace/templates/pace-theme-center-circle.tmpl.css" rel="stylesheet" />
    <script src="Scripts/pace.js"></script>


    <%--File Upload--%>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="Scripts/jQuery.FileUpload/jquery.fileupload.js"></script>
    <script src="Scripts/jQuery.FileUpload/jquery.fileupload-ui.js"></script>
    <script src="Scripts/jQuery.FileUpload/jquery.iframe-transport.js"></script>
    <script src="view-source:https://rawgit.com/RobinHerbots/jquery.inputmask/3.x/dist/jquery.inputmask.bundle.js"> </script>



    <%--DatePicker--%>
    <script src="Scripts/bootstrap-datepicker.js"></script>

    <script>

        var cbEsclusao;

        $(function () {
            $('[data-toggle="tooltip"]').tooltip();

            $('#txtDataNascimento').datepicker({
                format: "dd/mm/yyyy",
                language: "pt-BR"
            });

            CarregarDados(0);

        });
        var fi = $('#fu-my-simple-upload');
        var jqXHRData;

        //});


        $(document).ready(function () {

            fi.fileupload({
                url: 'CriarConta.aspx/upload',
                type: 'POST',
                maxFileSize: 2147483647,
                dropZone: $('#dropzone'),
                add: function (e, data) {
                    jqXHRData = data
                },
                fail: function (event, data) {
                    alert("Oops...");
                },
                error: function (result) {
                    alert(JSON.stringify(result));
                    //alert('erro');
                }

            }).on('fileuploadprogressall', function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('.progress .progress-bar').css('width', progress + '%');
            });

            fi.on('fileuploadadd', function (e, data) {
                $.each(data.files, function (index, file) {  //TODO: Substituir esse loop
                    $('#dvArquivoSelecionado').text(file.name);// + ' (' + file.size + ')')
                    $('#dvPainelArquivoSelecionado').show();
                    $('#dvPainelSelecionarArquivo').hide();
                });
            });
        });

        //Monta a funcionalidade do botão de upload
        $("#btnAdicionarArquivo").on('click', function () {
            $("#fu-my-simple-upload").click();
        });

        $('#btnCancelarUpload').on('click', function (e, data) {
            $('#dvPainelArquivoSelecionado').hide();
            $('#dvPainelSelecionarArquivo').show();
        });

        //CarregaDados
        function CarregarDados(cvIdPessoa) {

            var objJSONEnvio = { idPessoa: cvIdPessoa }
            $.ajax({
                type: "POST",
                url: 'CriarConta.aspx/CarregarDados',
                data: JSON.stringify(objJSONEnvio),
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: CarregarCampos,
                failure: function (response) {
                    alert("Falha");
                },
                error: function (result) {
                    alert(JSON.stringify(result));
                }

            });
        }

        function Excluir() {


            var idexcluir = $("#idPessoa").val();

            var objJSONEnvio = { cvIdPessoa: idexcluir }

            //Verifica se te algum item cadastrado
            if (idexcluir != 0 && idexcluir != "") {
                $.ajax({
                    type: "POST",
                    url: "CriarConta.aspx/Excluir",
                    data: JSON.stringify(objJSONEnvio),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("Excluído Com Sucesso!");
                    },
                    failure: function (response) {
                        alert("Falha");
                    },
                    error: function (result) {
                        alert(JSON.stringify(result));
                        //alert('erro');
                    }
                });
            } else {
                alert('Não existem cadastrados para excluir');
            }
        }

        function Salvar(sender, e) {

            if ($("#form")[0].checkValidity()) {
                var Pessoa = {};
                Pessoa.ccNome = $("#txtNomeCompleto").val();
                Pessoa.ccEndereco = $("#txtEndereco").val();
                Pessoa.ccCidade = $("#txtCidade").val();
                Pessoa.ccCEP = $("#txtCEP").val();
                Pessoa.ccTelefoneCelular = $("#txtCelular").val();
                Pessoa.ccTelefoneComercial = $("#txtComercial").val();
                Pessoa.ccTelefoneResidencial = $("#txtResidencial").val();
                Pessoa.ccCPF = $("#txtCPF").val();
                Pessoa.ccRG = $("#txtRG").val();
                Pessoa.ccUF = $("#txtUF").val();
                Pessoa.ccEmail = $("#txtEmail").val();
                Pessoa.ccNascimento = $("#txtDataNascimento").val();
                Pessoa.imgComprovResid = $("#imgComprovResid").val();

                if ($("#idPessoa").val() != "") {
                    Pessoa.cvIdPessoa = $("#idPessoa").val();
                }

                var Objeto = { 'Pessoa': Pessoa };

                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "CriarConta.aspx/Salvar",
                    data: JSON.stringify(Objeto),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        alert("Falha");
                    },
                    error: function (result) {
                        alert(JSON.stringify(result));
                        //alert('erro');
                    }
                });

                return false;
            }
        }


        function OnSuccess(response) {

            var idpessoa = "";
            idpessoa = JSON.stringify(response.d);

            //Carregando o dados conforme o id cadastrado
            CarregarDados(idpessoa);

            swal("Salvo Com Sucesso!");
        }

        function CarregarCampos(response) {
            var objdata = $.parseJSON(response.d);
            objdata = objdata[0];

            $("#txtNomeCompleto").val(objdata.ccNome);
            $("#txtEndereco").val(objdata.ccEndereco);
            $("#txtCidade").val(objdata.ccCidade);
            $("#txtCEP").val(objdata.ccCEP);
            $("#txtCelular").val(objdata.ccTelefoneCelular);
            $("#txtComercial").val(objdata.ccTelefoneComercial);
            $("#txtResidencial").val(objdata.ccTelefoneResidencial);
            $("#txtCPF").val(objdata.ccCPF);
            $("#txtRG").val(objdata.ccRG);
            $("#txtUF").val(objdata.ccUF);
            $("#txtEmail").val(objdata.ccEmail);
            $("#txtDataNascimento").val(objdata.cdNascimento);

            $("#idPessoa").val(objdata.cvIdPessoa);

        }

        function MM_formtCep(e, src, mask) {
            if (window.event) { _TXT = e.keyCode; }
            else if (e.which) { _TXT = e.which; }
            if (_TXT > 47 && _TXT < 58) {
                var i = src.value.length; var saida = mask.substring(0, 1); var texto = mask.substring(i)
                if (texto.substring(0, 1) != saida) { src.value += texto.substring(0, 1); }
                return true;
            } else {
                if (_TXT != 8) { return false; }
                else { return true; }
            }
        }

        function mascara(o, f) {
            v_obj = o
            v_fun = f
            setTimeout("execmascara()", 1)
        }
        function execmascara() {
            v_obj.value = v_fun(v_obj.value)
        }
        function mtel(v) {
            v = v.replace(/\D/g, "");             //Remove tudo o que não é dígito
            v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
            v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
            return v;
        }
        function id(el) {
            return document.getElementById(el);
        }
        window.onload = function () {
            id('txtCelular').onkeypress = function () {
                mascara(this, mtel);
            }
            id('txtComercial').onkeypress = function () {
                mascara(this, mtel);
            }
            id('txtResidencial').onkeypress = function () {
                mascara(this, mtel);
            }
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
                            <input type="text" id="txtNomeCompleto" class="form-control" placeholder="Preencha seu nome ">
                        </div>
                        <label for="txtEmail" class="col-sm-1 col-md-2 control-label">Email:</label>
                        <div class="col-sm-4 col-md-3">
                            <input type="email" class="form-control" id="txtEmail" placeholder="Preencha seu email">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3 col-md-2 col-sm-4 col-md-3 col-lg-3">
                        <label for="txtEndereco">Endereco</label>
                        <input type="text" class="form-control" id="txtEndereco" placeholder="Preencha o Endereco">
                    </div>
                    <div class="form-group col-xs-6 col-sm-4 col-md-3 col-lg-3">
                        <label for="txtCidade">Cidade</label>
                        <input type="text" class="form-control" id="txtCidade" placeholder="Preencha a Cidade">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2">
                        <label for="txtUF">UF</label>
                        <input type="text" class="form-control" id="txtUF" maxlength="2" placeholder="Preencha o Estrado">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2">
                        <label for="txtCep">CEP</label>
                        <input type="text" class="form-control" id="txtCEP" placeholder="Preencha o CEP Sem Tracos" onkeypress="return MM_formtCep(event,this,'#####-###');" size="10" maxlength="9">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2 ">
                        <label for="txtCelular">Tel. Celular</label>
                        <input type="text" class="form-control" id="txtCelular" placeholder="(00)00000-0000" maxlength="15">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2">
                        <label for="txtComercial">Tel. Comercial</label>
                        <input type="text" class="form-control" id="txtComercial" placeholder="(00)0000-0000" maxlength="15">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-lg-2">
                        <label for="txtResidencial">Tel. Residencial</label>
                        <input type="text" class="form-control" id="txtResidencial" placeholder="(00)0000-0000" maxlength="15">
                    </div>
                    <div class="form-group col-xs-6 col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-0">
                        <label for="txtDataNascimento">Data Nascimento</label>
                        <div class="input-append date">
                            <input type="date" class="form-control datepicker" id="txtDataNascimento" placeholder="00/00/0000" required>
                        </div>
                    </div>
                    <%--                    <div class="form-group col-xs-6 col-sm-3 col-md-2">
                        <label for="txtEstadoCivil">Estado Civil</label>
                        <select class="form-control" name="txtEstadoCivil" id="txtEstadoCivil">
                            <option value="1">Solteiro(a)</option>
                            <option value="2">Casado(a)</option>
                            <option value="3">Divorciado(a)</option>
                            <option value="4">Viúvo(a)</option>
                        </select>
                    </div>--%>
                </div>
                <div class="row">


                    <div class="form-group">
                        <label for="txtNomeCompleto" class="col-sm-3 col-md-3 control-label">Enviar Comprovante de Residencia:</label>
                        <div class="col-sm-4 col-md-4">
                            <input id="imgComprovResid" name="Imagens do Imóvel" class="input-file" type="file">

                            <div id="dvPainelArquivoSelecionado" style="display: none">
                                <label>Arquivo selecionado:</label>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group" id="dvArquivoSelecionado"></div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <button id="btnCancelarUpload" type="reset" class="btn btn-warning cancel"><i class="glyphicon glyphicon-ban-circle"></i><span>Remover</span></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="dvBarraProgresso" style="display: none">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="0" aria-valuemin="0"
                                            aria-valuemax="100">
                                            <span class="sr-only" id="spnProcentagemConcluida">0%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="dvPainelSelecionarArquivo">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <span class="btn btn-success fileinput-button" id="btnAdicionarArquivo">
                                                <i class="glyphicon glyphicon-plus"></i>
                                                <span>Adicionar Arquivo</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- file drop zone -->
                                            <div id="dropzone" class="upload-drop-zone">
                                                <i>Arraste o arquivo aqui ou clique no botão "Adicionar Arquivo"</i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


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
                            <h2><span class="glyphicon glyphicon-check" aria-hidden="true"></span>Documentos</h2>
                            <span>Nessa seção, preencha os dados sobre seus documentos</span>
                        </header>
                    </div>
                </div>
                <div class="form-inline ">
                    <%--                    <div class="row form-inline-space">
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

                    </div>--%>
                    <div class="row">
                        <div class="form-group col-sm-3 col-md-2 col-sm-4 col-md-3 col-lg-3">
                            <label for="txtEndereco">CPF</label>
                            <input type="text" class="form-control" id="txtCPF" placeholder="Preencha o Endereco" onkeypress="return MM_formtCep(event,this,'###.###.###-##');" maxlength="14">
                        </div>
                        <div class="form-group col-xs-6 col-sm-4 col-md-3 col-lg-3">
                            <label for="txtCidade">RG</label>
                            <input type="text" class="form-control" id="txtRG" placeholder="Preencha a Cidade" onkeypress="return MM_formtCep(event,this,'##.###.###-#');" maxlength="14">
                        </div>
                    </div>
            </section>
            <br />
            <br />
            <div class="row">
                <div class="form-group">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-8">
                        <button id="btnSalvar" class="btn btn-success" type="submit" onclick="return Salvar(this, event);">Salvar</button>
                        <button id="Limpar" name="Limpar" class="btn btn-danger" onclick="Excluir()" formnovalidate>Excluir Conta</button>
                    </div>
                </div>
            </div>
            <!-- fim da segunda seção -->
            <div id="CamposOculto">
                <input class="form-control" id="idPessoa" style="margin-left: 100px; display: none" placeholder="Preencha seu email">
                <input class="form-control" id="cbExclusao" style="margin-left: 100px; display: none" placeholder="Preencha seu email">
            </div>

        </div>
    </form>
</body>



</html>

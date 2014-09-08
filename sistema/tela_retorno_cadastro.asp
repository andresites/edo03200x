


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="content-type" content="text/html; charset=windows-1251" />
<link rel="stylesheet" type="text/css" href="/Content/css/styles.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/Content/Site.css" media="screen" />
<!--script type="text/javascript" src="https://getfirebug.com/firebug-lite.js"></script-->
<!--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>-->
<script type="text/javascript" src="/Scripts/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery.visualize.js"></script>
<script type="text/javascript" src="/scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="/scripts/jquery.util.validateExp.js"></script>
<script type="text/javascript" src="/scripts/jquery.price_format.1.5.js"></script>



<!--[if lte IE 7]>
<link rel="stylesheet" type="text/css" href="css/ie7.css" media="screen" />
<![endif]-->
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="css/ie8.css" media="screen" />
<![endif]-->
<!--[if IE]>
<script language="javascript" type="text/javascript" src="/Scripts/excanvas.js"></script>
<![endif]-->
<script type="text/javascript" src="/Scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery.wysiwyg.js"></script>

<script type="text/javascript" src="/Scripts/jquery.ui.mask.js"></script>
<script type="text/javascript" src="/scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="/scripts/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/scripts/jquery.ui.datepicker-pt-BR.js"></script>
<script type="text/javascript" src="/Scripts/custom.js"></script>

    
    <link rel="stylesheet" href="/content/css/datepicker.css" type="text/css" media="screen"  />
    <script type="text/javascript">
        $(document).ready(function () {
            Validate();
            $("#EmpregadorEndereco")

            $('.isPrincipal').click(function () {
                $("#hdnIsPrincipal").val(true);

                $("#Endereco_Logradouro").attr("disabled", true);
                $("#Endereco_Numero").attr("disabled", true);
                $("#Endereco_Bairro").attr("disabled", true);
                $("#Endereco_CEP").attr("disabled", true);
                $("#Endereco_Complemento").attr("disabled", true);
                $("#Endereco_Cidade_EstadoID").attr("disabled", true);
                $("#Endereco_CidadeID").attr("disabled", true);
                Endereco_CidadeID
            });
            $('.notIsPrincipal').click(function () {
                $("#hdnIsPrincipal").val(false);

                $("#Endereco_Logradouro").attr("disabled", false);
                $("#Endereco_Numero").attr("disabled", false);
                $("#Endereco_Bairro").attr("disabled", false);
                $("#Endereco_CEP").attr("disabled", false);
                $("#Endereco_Complemento").attr("disabled", false);
                $("#Endereco_Cidade_EstadoID").attr("disabled", false);
                $("#Endereco_CidadeID").attr("disabled", false);
            });


            var cidadeCep = null;
            $('#Endereco_CEP').blur(function () {
                $.post('/Services/Localizacao/ConsultaCEP/', { sCep: $("#Endereco_CEP").val() }, function (data) {
                    cidadeCep = data.Cidade;
                    $("#Endereco_Logradouro").val(data.Endereco);
                    $("#Endereco_Bairro").val(data.Bairro);
                    switch (data.EstadoID) {
                        case 1:
                            $("#Endereco_Cidade_EstadoID").find("option[value='1']").attr("selected", "selected");
                            break;
                        case 2:
                            $("#Endereco_Cidade_EstadoID").find("option[value='2']").attr("selected", "selected");
                            break;
                        case 3:
                            $("#Endereco_Cidade_EstadoID").find("option[value='3']").attr("selected", "selected");
                            break;
                        case 4:
                            $("#Endereco_Cidade_EstadoID").find("option[value='4']").attr("selected", "selected");
                            break;
                        case 5:
                            $("#Endereco_Cidade_EstadoID").find("option[value='5']").attr("selected", "selected");
                            break;
                        case 6:
                            $("#Endereco_Cidade_EstadoID").find("option[value='6']").attr("selected", "selected");
                            break;
                        case 7:
                            $("#Endereco_Cidade_EstadoID").find("option[value='7']").attr("selected", "selected");
                            break;
                        case 8:
                            $("#Endereco_Cidade_EstadoID").find("option[value='8']").attr("selected", "selected");
                            break;
                        case 9:
                            $("#Endereco_Cidade_EstadoID").find("option[value='9']").attr("selected", "selected");
                            break;
                        case 10:
                            $("#Endereco_Cidade_EstadoID").find("option[value='10']").attr("selected", "selected");
                            break;
                        case 11:
                            $("#Endereco_Cidade_EstadoID").find("option[value='11']").attr("selected", "selected");
                            break;
                        case 12:
                            $("#Endereco_Cidade_EstadoID").find("option[value='12']").attr("selected", "selected");
                            break;
                        case 13:
                            $("#Endereco_Cidade_EstadoID").find("option[value='13']").attr("selected", "selected");
                            break;
                        case 14:
                            $("#Endereco_Cidade_EstadoID").find("option[value='14']").attr("selected", "selected");
                            break;
                        case 15:
                            $("#Endereco_Cidade_EstadoID").find("option[value='15']").attr("selected", "selected");
                            break;
                        case 16:
                            $("#Endereco_Cidade_EstadoID").find("option[value='16']").attr("selected", "selected");
                            break;
                        case 17:
                            $("#Endereco_Cidade_EstadoID").find("option[value='17']").attr("selected", "selected");
                            break;
                        case 18:
                            $("#Endereco_Cidade_EstadoID").find("option[value='18']").attr("selected", "selected");
                            break;
                        case 19:
                            $("#Endereco_Cidade_EstadoID").find("option[value='19']").attr("selected", "selected");
                            break;
                        case 20:
                            $("#Endereco_Cidade_EstadoID").find("option[value='20']").attr("selected", "selected");
                            break;
                        case 21:
                            $("#Endereco_Cidade_EstadoID").find("option[value='21']").attr("selected", "selected");
                            break;
                        case 22:
                            $("#Endereco_Cidade_EstadoID").find("option[value='22']").attr("selected", "selected");
                            break;
                        case 23:
                            $("#Endereco_Cidade_EstadoID").find("option[value='23']").attr("selected", "selected");
                            break;
                        case 24:
                            $("#Endereco_Cidade_EstadoID").find("option[value='24']").attr("selected", "selected");
                            break;
                        case 25:
                            $("#Endereco_Cidade_EstadoID").find("option[value='25']").attr("selected", "selected");
                            break;
                        case 26:
                            $("#Endereco_Cidade_EstadoID").find("option[value='26']").attr("selected", "selected");
                            break;
                        case 27:
                            $("#Endereco_Cidade_EstadoID").find("option[value='27']").attr("selected", "selected");
                            break;
                    }
                    $("#Endereco_Cidade_EstadoID").change();
                });
            });

            $("#Endereco").hide();
            $("#notIsPrincipal").click(function () {
                $("#Endereco").slideDown("slow");
                $("#Endereco_Logradouro").val("");
                $("#Endereco_Numero").val("");
                $("#Endereco_Bairro").val("");
                $("#Endereco_CEP").val("");
                $("#Endereco_Complemento").val("");
                $("#Endereco_Cidade_EstadoID").val("");
                $("#Endereco_CidadeID").val("");
            });

            $("#IsPrincipal").click(function () {
                $("#Endereco").hide();
                $("#Endereco_Logradouro").val($("#EmpregadorEnderecoLogr").val());
                $("#Endereco_Numero").val($("#EmpregadorEnderecoNum").val());
                $("#Endereco_Bairro").val($("#EmpregadorEnderecoBairro").val());
                $("#Endereco_CEP").val($("#EmpregadorEnderecoCEP").val());
                $("#Endereco_Cidade_EstadoID").val($('#EmpregadorEnderecoEst').val());
                $('#Endereco_Cidade_EstadoID').change();
                $("#Endereco_CidadeID").val($('#EmpregadorEnderecoCid').val());
            });

            $.validator.addMethod(
                "salarioMinimo",
                function (value, element, params) {
                    $.ajaxSetup({ cache: false, async: false });
                    var result = 0;
                    var valor = value.replace(',', '.');
                    var idEstado = $("#Endereco_Cidade_EstadoID > option:selected").attr("value");

                    if (idEstado > 0) {
                        $.get("/Services/SalarioMinimo/get?idEstado=" + idEstado, function (data) {
                            result = data;
                        });
                    }
                    return valor >= result;
                },
                "O salário mínimo para este Estado é maior que o digitado."
            );

            $.validator.addMethod(
                "dataMaioridade",
                function (value, element, params) {
                    var idade_timestamp = new Date($("#DataAdmissao").val()) - new Date('12/12/1989');
                    var idade = idade_timestamp / (1000 * 60 * 60 * 24 * 365);
                    if (idade > 18) {
                        return true;
                    } else {

                        return false;
                    }
                }, "O funcionário é menor de idade");


            $.validator.addMethod(
                "dataLimite",
                function (value, element, params) {
                    if ($("#DataAdmissao").val().split("/")[2] > 1989) {
                        return true;
                    } else {
                        return false;
                    }
                }, $.format("A data deve ser maior que a data de nascimento."));

            $('#Salario').live('keypress', function (e) {
                var keyPressed;
                if ((e.charCode) && (e.keyCode == 0))
                    keyPressed = e.charCode
                else
                    keyPressed = e.keyCode;
                if ((keyPressed < 48 || keyPressed > 57) && keyPressed != 8 && keyPressed != 44) {
                    return false;
                }
                return true;
            });

            if ($("#Endereco_Cidade_EstadoID > option:selected").attr("value") == "")
                $("#Endereco_CidadeID").attr("disabled", "disabled");

            $("#erro").hide();
            $(".note.loading").hide();

            $("#DataAdmissao").datepicker({
                showOn: 'button',
                buttonImage: '/content/images/calendar.gif',
                buttonImageOnly: true
            });


            $("#DataEmissaoContrato").datepicker({
                showOn: 'button',
                buttonImage: '/content/images/calendar.gif',
                buttonImageOnly: true
            });

            $("#DataAdmissao").mask({ mask: "##/##/####" });
            $("#DataEmissaoContrato").mask({ mask: "##/##/####" });

            //$("#Salario").mask({ mask: "###,**", type: 'reverse'});
            //$("#DataEmissaoContrato").mask({ mask: "##/##/#### ##:##", allowPartials: false });


            $("#Endereco_CEP").mask("99999-999");
            $("#cei").hide();

            $("#form").validate({
                meta: "validate",
                invalidHandler: function (form, validator) {
                    $("#erro").show();
                    $("#erro").focus();
                },

                submitHandler: function (form) {
                    $("#erro").hide();
                    $("#cancelar").hide();
                    $("#enviar").hide();
                    $("#processando").show();
                    form.submit();
                },
                rules: {
                    TipoOcupacaoID: { required: true },
                    PeriodoExperienciaID: { required: true },
                    //DataAdmissao: {required:true, dataLimite: true, dataMaioridade: true},
                    DataAdmissao: { required: true, dataLimite: true },
                    DataEmissaoContrato: "required",
                    DiasDaSemanaTrabalhados: "required",
                    RecebeFGTS: "required",
                    Salario: { required: true, salarioMinimo: true },
                    SalarioPorExtenso: "required",
                    "Endereco.Logradouro": "required",
                    "Endereco.Bairro": "required",
                    "Endereco.CidadeID": { noneSelected: true },
                    "Endereco.Numero": "required"
                },
                messages: {
                    TipoOcupacaoID: {
                        required: "Este campo é obrigatório."
                    },
                    PeriodoExperienciaID: {
                        required: "Este campo é obrigatório."
                    },
                    DataAdmissao: {
                        required: "Este campo é obrigatório.",
                        dataLimite: "A data deve ser maior que a data de nascimento.",
                        dataMaioridade: "O funcionário é menor de idade"
                    },
                    DataEmissaoContrato: "Este campo é obrigatório.",
                    DiasDaSemanaTrabalhados: "Este campo é obrigatório.",
                    RecebeFGTS: "Este campo é obrigatório.",
                    Salario: {
                        required: "Este campo é obrigatório.",
                        salarioMinimo: "O salário mínimo para este Estado é maior que o digitado."
                    },
                    SalarioPorExtenso: "Este campo é obrigatório.",
                    "Endereco.Logradouro": "Este campo é obrigatório.",
                    "Endereco.Bairro": "Este campo é obrigatório.",
                    "Endereco.CidadeID": "Este campo é obrigatório.",
                    "Endereco.Numero": "Este campo é obrigatório."
                }
            });

            $('#simfgts').click(function () {
                $.post("/Services/Localizacao/VerificaCEIEmpregador/", function (data) {
                    if (data == true)
                        $("#cei").slideDown("slow");
                });
            });

            $('#naofgts').click(function () {
                $("#cei").slideUp("slow");
            });

            $('#Endereco_Cidade_EstadoID').change(function () {
                $.ajaxSetup({ cache: false, async: false });
                var selectedItem = $(this).val();
                if (selectedItem == "" || selectedItem == 0) {
                    //Do nothing or hide...?
                } else {
                    $.post("/Services/Localizacao/GetCidades/" + $("#Endereco_Cidade_EstadoID > option:selected").attr("value"), function (data) {
                        var items = "";

                        items += "<option>Selecione</option>";
                        $.each(data, function (i, data) {
                            items += "<option value='" + data.ID + "'>" + data.Nome + "</option>";
                        });

                        $("#Endereco_CidadeID").removeAttr('disabled');
                        $("#Endereco_CidadeID").html(items);
                    });
                }
            });

            $("#IsPrincipal").ready(function () {
                $("#Endereco").hide();
                $("#Endereco_Logradouro").val($("#EmpregadorEnderecoLogr").val());
                $("#Endereco_Numero").val($("#EmpregadorEnderecoNum").val());
                $("#Endereco_Bairro").val($("#EmpregadorEnderecoBairro").val());
                $("#Endereco_CEP").val($("#EmpregadorEnderecoCEP").val());

                $("#Endereco_Cidade_EstadoID").val($('#EmpregadorEnderecoEst').val());
                $('#Endereco_Cidade_EstadoID').change();
                $("#Endereco_CidadeID").val($('#EmpregadorEnderecoCid').val());
            });

            var data_atual = new Date();
            $("#DataEmissaoContrato").val(data_atual.getDate() + "/" + (data_atual.getMonth() + 1) + "/" + data_atual.getFullYear());

        });
    </script>
    <script type="text/javascript" src="/Scripts/woow.validateextensions.js"></script>
<title>
	
    Cadastro de Contrato

</title></head>
<body>

	<div id="page-body">
		<!-- #wrapper [begin] -->
		<div id="wrapper">
			
			<!-- Header [begin] -->
			<div id="header">
				

<!-- Logo [begin] -->
<div id="logo"><a href="/Sistema">Home</a></div>
<!-- Logo [end] -->



<div id="adminbar">Bem-vindo, <strong> <a href="/Sistema/Cadastro/Edit">ANDRE L DA SILVEIRA</a></strong>,
Sua Conta Expira em: 23/04/2014
	<a class="logout" href="/Sistema/Home/LogOut">Sair</a>
    <a class="logout" href="/">Voltar ao site</a>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        var selectedValue = 2;

        $.post("/Services/Empregados/List/", function (data) {
            var items = "";
            items += "<option value='0'>Selecione</option>";
            $.each(data, function (i, data) {
                if (data.ID == selectedValue) {
                    items += "<option value='" + data.ID + "' selected>" + data.Nome + "</option>";
                } else {
                    items += "<option value='" + data.ID + "'>" + data.Nome + "</option>";
                }

            });

            $("#CurrentEmpregado").html(items);
        });

        $('#CurrentEmpregado').change(function () {
            $.ajaxSetup({ cache: false });

            var selectedItem = $(this).val();
            if (selectedItem == "" || selectedItem == 0) {
                //Do nothing or hide...?
            } else {
                $.get("/Services/Empregados/Select/" + $("#CurrentEmpregado > option:selected").attr("value"));
            }
        });
    });


</script>




<div id="Div1">

        <b>Empregado Selecionado</b>: <b style="color:Red;font-size:20px;">Teste da Silva Prado</b><img src = "/Content/images/user.jpg" alt="Teste da Silva Prado" style="width: 25px; top: -3px;" />


</div>
				
			</div>
		
			<!-- Header [end] -->
			

<!-- centered tabs [begin] -->
<div id="menu-tabs" class="center">
	<ul>
		<li class="active"><a>MENU PRINCIPAL</a></li>
		
	</ul>
</div>
<!-- centered tabs [end] -->
<!-- scroll menu [begin] -->
<div class="scroll-menu">
	<div class="smc-1">
		<div class="smc-2">
			<div class="smc-3">
				<!-- menu scroll content [begin] -->
				<div id="content-scroll">
					<div id="content-holder">
						<!-- tabs content here [begin] -->
						<!-- tab 1 [begin] -->
						<div class="pane">
							<ul class="menu-items">
								
								
								<li><a href="/Sistema"> <!-- /Sistema/Empregados -->
									<img src="/content/images/function-icons/users_two_48.png" alt="" /><span>Empregados</span></a><div
										class="tooltip">
										Gerencia seus Empregados Dom&#233;sticos</div>
								</li>
								

                                
							</ul>
						</div>
						<!-- tab 1 [end] -->
						<!-- tab 2 [begin] -->
						<div class="pane">
							<ul class="menu-items">
								<li><a href="#">
									<img src="/content/images/function-icons/paper_48.png" alt="" /><span>Contrato</span></a><div
										class="tooltip">
										Gere ou Reveja o Contrato de Trabalho</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/paper_pencil_48.png" alt="" /><span>Declara&#231;&#245;es</span></a><div
										class="tooltip">
										Gere Declara&#231;&#245;es em Geral</div>
								</li>
							</ul>
						</div>
						<!-- tab 2 [end] -->
						<!-- tab 3 [begin] -->
						<div class="pane">
							<ul class="menu-items">
								<li><a href="#">
									<img src="/content/images/function-icons/book_48.png" alt="" /><span>Contrato</span></a><div
										class="tooltip">
										Como preencher o Contrato de Trabalho na Carteira</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/paper_pencil_48.png" alt="" /><span>Altera&#231;&#245;es</span></a><div
										class="tooltip">
										Lance altera&#231;&#245;es de cargos e sal&#225;rios</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/smile_sad_48.png" alt="" /><span>Afastamento</span></a><div
										class="tooltip">
										Lance Afastamentos na Carteira</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/vacation.png" alt="" /><span>F&#233;rias</span></a><div
										class="tooltip">
										Gerencia as F&#233;rias</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/box_download_48.png" alt="" /><span>FGTS</span></a><div
										class="tooltip">
										Oriente-se para preencher o FGTS na Carteira</div>
								</li>
							</ul>
						</div>
						<!-- tab 3 [end] -->
						<!-- tab 4 [begin] -->
						<div class="pane">
							<ul class="menu-items">
								<li><a href="#">
									<img src="/content/images/function-icons/bus.png" alt="" /><span>Transporte</span></a><div
										class="tooltip">
										Vale Transporte</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/adianta.png" alt="" /><span>Adiantamento</span></a><div
										class="tooltip">
										Adiantamentos e Vales</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/money.png" alt="" /><span>Sal&#225;rio</span></a><div
										class="tooltip">
										Sal&#225;rio</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/ferias1.png" alt="" /><span>F&#233;rias</span></a><div
										class="tooltip">
										F&#233;rias</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/13sal.png" alt="" /><span>13o. Sal&#225;rio</span></a><div
										class="tooltip">
										13o. Sal&#225;rio</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/clock_48.png" alt="" /><span>Outros</span></a><div
										class="tooltip">
										Outros Pagamentos</div>
								</li>
							</ul>
						</div>
						<!-- tab 4 [end] -->
						<!-- tab 5 [begin] -->
						<div class="pane">
							<ul class="menu-items">
								<li><a href="#">
									<img src="/content/images/function-icons/circle_orange.png" alt="" /><span>Advert&#234;ncias</span></a><div
										class="tooltip">
										Advert&#234;ncias</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/circle_red.png" alt="" /><span>Suspens&#227;o</span></a><div
										class="tooltip">
										Suspens&#227;o</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/cancel_48.png" alt="" /><span>Rescis&#227;o</span></a><div
										class="tooltip">
										Rescis&#227;o</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/warning_48.png" alt="" /><span>Abandono</span></a><div
										class="tooltip">
										Abandono</div>
								</li>
								<li><a href="#">
									<img src="/content/images/function-icons/mail_delete_48.png" alt="" /><span>Cartas</span></a><div
										class="tooltip">
										Cartas</div>
								</li>
							</ul>
						</div>
						<!-- tab 5 [end] -->
						<!-- tabs content here [end] -->
					</div>
				</div>

				<!-- menu scroll content [end] -->
				<!-- scrollbar [begin] -->
				
				<!-- scrollbar [end] -->
				<div class="clearingfix">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- scroll menu [end] -->

			<!-- grid layout [begin] -->

			
    
    <div class="container_12">
        <div class="grid_12">
            
            <div id="sucesso" class="message success">
                <span class="strong">SUCESSO!</span> Registro salvo com sucesso!
            </div>
            
            <div id="Div2" class="message AttentionExpAcima">
                <span class="strong">Empregador:</span> Você pode gerar varios contratos, mas <b>não poderá edita-los após SALVAR.</b> Preencha as informações corretamente.
            </div>
            <div class="sb-box">
                <div class="sb-box-inner content">
                    <div class="header">
                        <h3>Cria&#231;&#227;o do Contrato Inicial</h3>
                        <ul class="tabs">
                            <li class="active">
                                <a href="/Sistema/Contratos/List">Voltar</a></li>
                        </ul>
                    </div>

                    <div class="bcont">
                        <form action="/Sistema/Contratos/Edit" id="form" method="post" name="form"><input id="hdnIsPrincipal" name="hdnIsPrincipal" type="hidden" value="False" />
                        <div id="erro" class="message error">
                            <span class="strong">ERRO!</span> Verifique todos os campos abaixo.
                        </div>

                        <input id="EmpregadorEnderecoLogr" name="EmpregadorEnderecoLogr" type="hidden" value="R. Artur Prado, 369 apto 141" />
                        <input id="EmpregadorEnderecoNum" name="EmpregadorEnderecoNum" type="hidden" value="123" />
                        <input id="EmpregadorEnderecoBairro" name="EmpregadorEnderecoBairro" type="hidden" value="BELA VISTA" />
                        <input id="EmpregadorEnderecoCEP" name="EmpregadorEnderecoCEP" type="hidden" value="01322-000" />
                        <input id="EmpregadorEnderecoCompl" name="EmpregadorEnderecoCompl" type="hidden" value="" />
                        <input id="EmpregadorEnderecoEst" name="EmpregadorEnderecoEst" type="hidden" value="26" />
                        <input id="EmpregadorEnderecoCid" name="EmpregadorEnderecoCid" type="hidden" value="8570" />

                        <div class="esquerda">
                            <p>
                                <b>Empregado:</b><br />
                                <span style="color:Red; font-size:20px;">Teste da Silva Prado</span>
                            </p>
                        </div>
                        
                              
                               
                                
                           
                        <div class="esquerda">
                            <p>
                                <b>Tipo de Ocupação <span>*</span></b><br />
                                <select id="TipoOcupacaoID" name="TipoOcupacaoID"><option value="">Selecione</option>
<option value="1">Empregado Dom&#233;stico(a)</option>
<option value="2">Acompanhante de Idosos</option>
<option value="3">Arrumadeiro(a)</option>
<option value="4">Bab&#225;</option>
<option value="5">Caseiro(a)</option>
<option value="6">Cozinheiro(a)</option>
<option value="7">Cuidador de Crian&#231;a</option>
<option value="8">Dama de companhia</option>
<option value="9">Enfermeiro(a)</option>
<option value="10">Faxineiro(a)</option>
<option value="11">Gar&#231;om</option>
<option value="12">Governanta</option>
<option value="13">Jardineiro</option>
<option value="14">Lavadeira</option>
<option value="15">Marinheiro(a)</option>
<option value="16">Mordomo</option>
<option value="17">Motorista</option>
<option value="18">Passadeira</option>
<option value="19">Vigia</option>
</select>
                                
                            </p>
                        </div>
                        <div class="direita">
                            <p>
                                <b>Período de Experiência <span>*</span></b><br />
                                <select id="PeriodoExperienciaID" name="PeriodoExperienciaID"><option value="">Selecione</option>
<option value="1">30 dias</option>
<option value="2">60 dias</option>
<option value="3">90 dias</option>
<option value="4">Nenhum</option>
</select>
                                
                            </p>
                        </div>
                        <div class="esquerda">
                            <p>
                                <b>Data de Admissão <span>*</span></b><br />
                                <input class="inputtext medium" id="DataAdmissao" maxlength="128" name="DataAdmissao" type="text" value="" />
                                
                            </p>
                        </div>
                        <div class="direita">
                            <p>
                                <b>Data de Emissão do Contrato <span>*</span></b><br />
                                <input class="inputtext medium" id="DataEmissaoContrato" maxlength="128" name="DataEmissaoContrato" type="text" value="" />
                                
                            </p>
                        </div>
                        <div class="esquerda">
                            <p>
                                <b>Salário <span>*</span></b><br />
                                R$
                                <input class="inputtext medium" id="Salario" maxlength="128" name="Salario" type="text" value="" />
                                
                            </p>
                        </div>
                        <div class="direita">
                            <p>
                                <b>Salário por Extenso <span>*</span></b><br />
                                <input Style="text-transform:uppercase" class="inputtext medium" id="SalarioPorExtenso" maxlength="128" name="SalarioPorExtenso" type="text" value="" />
                                <br />
                                (<b>Por exemplo:</b> Mil Duzentos e Trinta e Quatro Reais e Cinquenta e Seis Centavos)<br />
                                
                            </p>
                        </div>
                        <div class="esquerda">
                            <p>
                                <b>Receberá FGTS</b>
                                <input id="simfgts" name="RecebeFGTS" type="radio" value="True" />
                                Sim
                                <input checked="checked" id="naofgts" name="RecebeFGTS" type="radio" value="False" />
                                Não
                                <br />
                                (Incide <b>8% sobre o salario bruto)</b><br />
                                
                                <br />
                            </p>
                            <p id="cei">
                                <b>CEI (Cadastro Específico do INSS)</b><br />
                                <input name="ctl00$MainContent$txtcei" type="text" id="MainContent_txtcei" maxlength="40" class="inputtext medium" /><br />
                                Para que seu empregado receba o FGTS você precisa do <a href="http://www.receita.fazenda.gov.br/previdencia/defaultcei.htm"
                                    target="_blank">CEI</a>.<br />
                                Para efetuar o cadastro, <a href="http://www2.dataprev.gov.br/ceiweb/index.view"
                                    target="_blank">clique aqui</a>.
                            </p>
                        </div>
                        <p>
                            
                            <b>Dias da Semana Trabalhados</b>
                            <br />
                            
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="1"
                                        class="checkbox" />
                                    <label for="cbdemo1">
                                        Domingo</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="2"
                                        class="checkbox" />
                                    <label for="cbdemo1">
                                        Segunda-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="3"
                                        class="checkbox" />
                                    <label for="cbdemo1">
                                        Ter&#231;a-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="4"
                                        class="checkbox" />
                                    <label for="cbdemo1">
                                        Quarta-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="5"
                                        class="checkbox" />
                                    <label for="cbdemo1">
                                        Quinta-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="6"
                                        class="checkbox" />
                                    <label for="cbdemo1">
                                        Sexta-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="7"
                                        class="checkbox" />
                                    <label for="cbdemo1">
                                        S&#225;bado</label>
                                
                        </p>
                         <div>
                            <div class="divEntrega">
                                <span>Endereço do contrato é o mesmo do <b>Empregador</b>?</span><br />
                                <input checked="checked" id="IsPrincipal" name="isPrincipal" type="radio" value="True" />
                                Sim
                                <input id="notIsPrincipal" name="isPrincipal" type="radio" value="False" />
                                Não
                            </div>
                            <br />
                            <div id="Endereco" class="duvidas">
                            <hr />
                            <h3 class="head2">
                                Endereço</h3>
                                <div class="esquerda">
                                    
                                    <p>
                                        <b>CEP </b>
                                        <br />
                                        <input class="inputtext medium" id="Endereco_CEP" maxlength="128" name="Endereco.CEP" type="text" value="" />
                                        
                                    </p>
                                </div>
                                <div class="direita">
                                    <p>
                                        <b>Número <span>*</span></b><br />
                                        <input class="inputtext medium" id="Endereco_Numero" maxlength="6" name="Endereco.Numero" type="text" value="" />
                                        
                                    </p>
                                </div>
                                <div class="esquerda">
                                    <p>
                                        <b>Complemento</b><br />
                                        <input class="inputtext medium" id="Endereco_Complemento" maxlength="128" name="Endereco.Complemento" type="text" value="" />
                                        
                                    </p>
                                </div>
                                <div class="direita">
                                    <p>
                                        <b>Endereço <span>*</span></b><br />
                                        <input class="inputtext medium" id="Endereco_Logradouro" maxlength="128" name="Endereco.Logradouro" type="text" value="" />
                                        
                                    </p>
                                </div>
                                <div class="esquerda">
                                     <p>
                                        <b>Bairro <span>*</span></b><br />
                                        <input class="inputtext medium" id="Endereco_Bairro" maxlength="128" name="Endereco.Bairro" type="text" value="" />
                                        
                                    </p>
                                </div>
                                <div class="direita">
                                    <p>
                                        <br />
                                        <br />
                                        <br />
                                    </p>
                                </div>
                                <div class="esquerda">
                                    <p>
                                        <b>Estado <span>*</span></b><br />
                                        <select id="Endereco_Cidade_EstadoID" name="Endereco.Cidade.EstadoID"><option value="">Selecione</option>
<option value="1">Acre</option>
<option value="2">Alagoas</option>
<option value="3">Amazonas</option>
<option value="4">Amap&#225;</option>
<option value="5">Bahia</option>
<option value="6">Cear&#225;</option>
<option value="7">Distrito Federal</option>
<option value="8">Esp&#237;rito Santo</option>
<option value="9">Goi&#225;s</option>
<option value="10">Maranh&#227;o</option>
<option value="11">Minas Gerais</option>
<option value="12">Mato Grosso do Sul</option>
<option value="13">Mato Grosso</option>
<option value="14">Par&#225;</option>
<option value="15">Para&#237;ba</option>
<option value="16">Pernambuco</option>
<option value="17">Piau&#237;</option>
<option value="18">Paran&#225;</option>
<option value="19">Rio de Janeiro</option>
<option value="20">Rio Grande do Norte</option>
<option value="21">Rond&#244;nia</option>
<option value="22">Roraima</option>
<option value="23">Rio Grande do Sul</option>
<option value="24">Santa Catarina</option>
<option value="25">Sergipe</option>
<option value="26">S&#227;o Paulo</option>
<option value="27">Tocantins</option>
</select>
                                    </p>
                                </div>
                                <div class="direita">
                                    <p>
                                        <b>Cidade <span>*</span></b><br />
                                        <select id="Endereco_CidadeID" name="Endereco.CidadeID"><option value="">Selecione</option>
</select>
                                    </p>
                                </div>
                            </div>
                            <div>
                                <hr />
                                <p>
                                    <button id="cancelar" class="button blue" type="reset" onclick="location.href='/Sistema/Empregados';">
                                        <span>Cancelar</span>
                                    </button>
                                    <button id="enviar" class="button green" type="submit" value="Save">
                                        <span>Salvar</span>
                                    </button>
                                    <span id="processando" class="note loading">Processando...</span>
                                </p>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Div3" class="message informationExp" style="margin:27px; width:490px; height:60px;">
                            <span class="strong">Informativo:</span> 
                                 Você pode selecionar uma <b>Data de Admissão</b> antiga!(empregado antigo)
                                 <br />O sistema gerará os holerites dos meses anteriores e suas respectivas guias GPS.
            </div>
            <div class="clearingfix">
            </div>
        </div>
    </div>

			

			
			<!-- Footer [begin] -->
			

<div class="container_12">
	<div class="grid_12" id="footer">
		<p>© Copyright 2010 by <a href="/">EDomestico</a></p>
	</div>
	<div class="clearingfix"></div>
</div>
			<!-- Footer [end] -->
			<!-- grid layout [end] -->
		</div>
		<!-- end div #wrapper -->

		
	</div>
	<!-- end div #page-body -->
</body>
</html>

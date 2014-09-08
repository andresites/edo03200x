<!--#include file="conecta_bd.asp"--><%

function comparaSelected(parametro, valor)
    if cstr(parametro)= cstr(valor) then comparaSelected= " selected" else comparaSelected=""
end function


dim fulano, eleexiste, funcID, essecontrato, bolTemErro, modoAlterar, vtID,PREfuncID
modoAlterar=false
vtID = limpaquerystring("vtID")
PREfuncID=limpaquerystring("funcID")
DIM Quantidade, QuantidadePorExtenso, PeriodoInicio, PeriodoFim, MesReferencia, AnoReferencia, Valor, dtCriacao, TipoTransporte, ValorPorExtenso, EmpregadoID
dim  bolShowForm
bolShowForm=true    
bolTemErro=false
erroClass=""
eleexiste=false
set fulano = new empregado
   
'busca via objeto os dados do cara
if len(PREfuncID)>0 then    
    fulano.ID=PREfuncID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
    'Ver se é para editar...
        funcID=fulano.ID
        if request.QueryString("modo")="alterar" AND isnumeric (request.QueryString("vtID")) then     
            modoAlterar=true
            if fulano.carregaValeTransporte(vtID, 0,0,false) then
                Quantidade = fulano.Quantidade
                QuantidadePorExtenso = fulano.QuantidadePorExtenso
                PeriodoInicio = fulano.PeriodoInicio
                PeriodoFim = fulano.PeriodoFim
                MesReferencia = fulano.MesReferencia
                AnoReferencia = fulano.AnoReferencia
                Valor = fulano.Valor
                dtCriacao = fulano.dtCriacao
                TipoTransporte = fulano.TipoTransporte
                ValorPorExtenso = fulano.ValorPorExtenso
            else
                modoAlterar=false
            end if
        end if

        nome=fulano.Nome
        set essecontrato=new contrato 
        essecontrato.getFkrtContrato funcID, true, 0 
        novoContratoID = essecontrato.contrato_ID
        if request.form("grava")="Salvar" then
            Quantidade= limparequestform("Quantidade")
            QuantidadePorExtenso= limparequestform("QuantidadePorExtenso")
            PeriodoInicio= limparequestform("PeriodoInicio")
            PeriodoFim= limparequestform("PeriodoFim")
            MesReferencia= limparequestform("MesReferencia")
            AnoReferencia= limparequestform("AnoReferencia")
            Valor= limparequestform("Valor")
            dtCriacao= limparequestform("dtCriacao")
            TipoTransporte= limparequestform("TipoTransporte")
            ValorPorExtenso= limparequestform("ValorPorExtenso")
            EmpregadoID=funcID

            ' quando for validado, deletar antigo e inserir novo
            if modoAlterar then fulano.deleteValeTransporte vtID
            'não validei
             vtID= fulano.addValeTransporte (Quantidade, QuantidadePorExtenso, PeriodoInicio, PeriodoFim, MesReferencia, AnoReferencia, Valor, dtCriacao, TipoTransporte, ValorPorExtenso, EmpregadoID)
             bolShowForm =false
        end if
    end if
end if
    
    
    
    
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
<script type="text/javascript" src="/scripts/extenso.js"></script>
    
<link rel="stylesheet" href="/content/css/datepicker.css" type="text/css" media="screen"  />



<script type="text/javascript">

    $(document).ready(function () {

        $('#Quantidade').live('keypress', function (e) {
            var keyPressed;
            if ((e.charCode) && (e.keyCode == 0))
                keyPressed = e.charCode
            else
                keyPressed = e.keyCode;
            if ((keyPressed < 48 || keyPressed > 57) && keyPressed != 8) {
                return false;
            }
            return true;
        });
        $('#Quantidade').keyup(function () {
            var prodText = $(this).val();
            //console.log(prodText);
            $('#QuantidadePorExtenso').val(prodText.extenso(false));
        });
        $('#Valor').live('keypress', function (e) {
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
        $('#Valor').keyup(function () {
            var prodText = $(this).val();
            //console.log(prodText);
            $('#ValorPorExtenso').val(prodText.extenso(true));
        });
        $("#PeriodoInicio").datepicker({
            showOn: 'button',
            buttonImage: '/content/images/calendar.gif',
            buttonImageOnly: true
        });

        $("#PeriodoFim").datepicker({
            showOn: 'button',
            buttonImage: '/content/images/calendar.gif',
            buttonImageOnly: true
        });


        Validate();

        $("#erro").hide();
        $(".note.loading").hide();


        // Verificação do modo documento simulado no ie
        if (document.documentMode == 5 || document.documentMode == 6 || document.documentMode == 7 || document.documentMode == 8) {
            mascaraData($("#PeriodoInicio"));
            mascaraData($("#PeriodoFim"));
            mascaraData($("#DataEmissao"));

            $('#enviar').click(function () {
                var validator = $('#form').validate();
                var erro = 0;
                if ($('#PeriodoInicio').val() == "") {
                    validator.showErrors({ "PeriodoInicio": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#PeriodoFim').val() == "") {
                    validator.showErrors({ "PeriodoFim": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#DataEmissao').val() == "") {
                    validator.showErrors({ "DataEmissao": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#Quantidade').val() == "") {
                    validator.showErrors({ "Quantidade": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#QuantidadePorExtenso').val() == "") {
                    validator.showErrors({ "QuantidadePorExtenso": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#Valor').val() == "") {
                    validator.showErrors({ "Valor": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#ValorPorExtenso').val() == "") {
                    validator.showErrors({ "ValorPorExtenso": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#MesReferencia').val() == "") {
                    validator.showErrors({ "MesReferencia": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#AnoReferencia').val() == "") {
                    validator.showErrors({ "AnoReferencia": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#TipoTransporte').val() == "") {
                    validator.showErrors({ "TipoTransporte": "Este campo é obrigatório." });
                    erro = 1;
                }
                if (erro == 1) {
                    $("#erro").show();
                    $("#erro").focus();
                    return false;
                }

                return true;
            });

        } else {
            $("#PeriodoInicio").mask("99/99/9999");
            $("#PeriodoFim").mask("99/99/9999");
            $("#DataEmissao").mask("99/99/9999");
            $("#AnoReferencia").mask("9999");

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
                    PeriodoInicio: {
                        required: true
                    },
                    PeriodoFim: {
                        required: true,
                        greaterThan: "#PeriodoInicio"
                    },
                    DataEmissao: "required",
                    Quantidade: {
                        required: true
                    },
                    QuantidadePorExtenso: "required",
                    Valor: "required",
                    ValorPorExtenso: "required",
                    MesReferencia: {
                        required: true,
                        noneSelected: true
                    },
                    AnoReferencia: "required"
                },
                messages: {
                    PeriodoInicio: {
                        required: "Este campo é obrigatório.",
                        date: "Digite uma data válida"
                    },
                    PeriodoFim: {
                        required: "Este campo é obrigatório.",
                        greaterThan: "A Data de Fim deve ser maior que a Data de Início"
                    },
                    DataEmissao: "Este campo é obrigatório.",
                    Quantidade: {
                        required: "Este campo é obrigatório."
                    },
                    QuantidadePorExtenso: "Este campo é obrigatório.",
                    Valor: "Este campo é obrigatório.",
                    ValorPorExtenso: "Este campo é obrigatório.",
                    MesReferencia: "Este campo é obrigatório.",
                    AnoReferencia: "Este campo é obrigatório."
                }
            });
        }
    });

    function mascaraData(objeto) {
        objeto.keypress(function (e) {
            if (objeto.val().length == 2 || objeto.val().length == 5) {
                objeto.val(objeto.val() + "/");
            }
            if (objeto.val().length >= 10) {
                objeto.val(objeto.val().substr(0, objeto.val().length - 1));
            }
        });
    }
</script>

<script type="text/javascript" src="/Scripts/woow.validateextensions.js"></script>


    
    <link rel="stylesheet" href="/content/css/datepicker.css" type="text/css" media="screen"  />
<link rel="stylesheet" href="css/jquery.ui.tabs.css" type="text/css" media="screen"  />
<link rel="stylesheet" href="css/jquery.ui.theme.css" type="text/css" media="screen"  />

<title>
	
	Empregados

</title>
    <style type="text/css">

        #tabs > ul > li {
            text-align: center;
           font-size:10px;
           height:70px;
           overflow:hidden;
        }
        #tabsy table tr td {
        border: 1px solid black;
        padding:2px;
        }

        .enunciado {
            font-size:8px;
            font-family:'Times New Roman';
            font-style:italic;
            color:GrayText;
        }
        #opcoes {
            float:left;
        }
        #ficha{
            width:50%;
            font: bold 11px arial;
        }
        #opcoes{
            width:50%;
        }
       .sb-box-inner content li .listaNormal {
            height:auto;
            list-style:circle;
            
        }
    </style>

</head>
<body>

	<div id="page-body">
		<!-- #wrapper [begin] -->
		<div id="wrapper">	
			<!-- Header [begin] -->
            <div id="header">
				

<!-- Logo [begin] -->
                <div id="logo"><a href="main.asp">Home</a></div>
<!-- Logo [end] -->

<!--#include file="inc_header_pagina.asp"-->

                <script type="text/javascript">

                    $(document).ready(function () {

                    });


                </script>
            </div>
		
			<!-- Header [end] -->

			<!-- grid layout [begin] -->

			

    <div class="container_12">  
		<div class="grid_12">
            <div class="sb-box">
                <div class="sb-box-inner content">
                    <div class="header">
                        <h3><a href="empregado_ficha.asp?ID=<%=funcID %>"><%=ucase(fulano.nome) %></a> - NOVO VALE TRANSPORTE</h3>
                        <ul class="tabs">
                            <li class="active">
                                <a href="empregado_ficha.asp?ID=<%=funcID %>&tabs=3" hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>
                    </div>
					<div class="bcont">
<% if bolShowForm then %>
<div id="Div3" class="message informationExp" style="margin:27px; width:500px;">
                    <span class="strong">Informativo:</span>Você está registrando o vale transporte do mês atual. Ele será usado no calculo do salário.<br /><br />
                    <b>Tipo de transporte</b> exemplo:<br />
                    "2 Onibus/dia - passagem: R$ 1,00"<br />
                    "2 Onibus/Metro/dia - passagem:R$ 1,00/R$1,20"
            </div>


                        <b>Os Campos marcados com <span>*</span> são obrigatórios.</b><br /><br /><br />
                     
						<form action="empregado_novoVT.asp?ID=<%=funcID %>&vtID=<%=vtID %>&funcID=<%=funcID %>&modo=<%=request.querystring("modo") %>" id="form" method="post" name="form">
						
						<div id="erro" class="message error">
							<span class="strong">ERRO!</span> Verifique todos os campos abaixo.
						</div>

						<input id="ID" name="ID" type="hidden" value="" />

                        <div class="esquerda">
                            <p>
                                <b>Qtd vale-transporte em dia <span>*</span></b> (ex: 21)<br />
                                <input class="inputtext medium" id="Quantidade" maxlength="128" name="Quantidade" type="text" value="<%=quantidade %>" />
							    
                            </p>
                        </div>
						<div class="direita">
                            <p>
                                <b>Quantidade de dias por Extenso <span>*</span></b> (ex: vinte e um dias)<br />
                                <input class="inputtext medium" id="QuantidadePorExtenso" maxlength="128" name="QuantidadePorExtenso" type="text" value="<%=QuantidadePorExtenso %>" />
							    
                            </p>
                        </div>
                        <div class="esquerda">
						<p>
							<b>Período Início <span>*</span></b><br />
							<input class="inputtext medium" id="PeriodoInicio" maxlength="128" name="PeriodoInicio" type="text" value="<%if len(PeriodoInicio)>0 then response.write day(PeriodoInicio) & "/" & month(periodoInicio) & "/" & year(PeriodoInicio) %>" />
							
						</p>
                        </div>
						<div class="direita">
                        <p>
							<b>Período Fim <span>*</span></b><br />
							<input class="inputtext medium" id="PeriodoFim" maxlength="128" name="PeriodoFim" type="text" value="<%if len(PeriodoFim)>0 then response.write day(PeriodoFim) & "/" & month(PeriodoFim) & "/" & year(PeriodoFim) %>" />
							
						</p>
                        </div>
                        <div class="esquerda">
                        <p>
						    <b>Valor <span>*</span></b><br />
							R$ <input class="inputtext medium" id="Valor" maxlength="128" name="Valor" style="width:280px" type="text" value="<%=Valor %>" />
							
						</p>
                        </div>
						<div class="direita">
                        <p>
							<b>Valor por Extenso <span>*</span></b><br />
							<input class="inputtext medium" id="ValorPorExtenso" maxlength="128" name="ValorPorExtenso" type="text" value="<%=ValorPorExtenso %>" />
							
						</p>
                        </div>
                        <div class="esquerda">
                        <p>
                        <b>Mês Referência <span>*</span></b><br />
                            <select id="MesReferencia" name="MesReferencia"><option value="">Selecione</option>
                                <option value="1" <%=comparaSelected(1, MesReferencia ) %>>janeiro</option>
                                <option value="2" <%=comparaSelected(2, MesReferencia ) %>>fevereiro</option>
                                <option value="3" <%=comparaSelected(3, MesReferencia ) %>>mar&#231;o</option>
                                <option value="4" <%=comparaSelected(4, MesReferencia ) %>>abril</option>
                                <option value="5" <%=comparaSelected(5, MesReferencia ) %>>maio</option>
                                <option value="6" <%=comparaSelected(6, MesReferencia ) %>>junho</option>
                                <option value="7" <%=comparaSelected(7, MesReferencia ) %>>julho</option>
                                <option value="8" <%=comparaSelected(8, MesReferencia ) %>>agosto</option>
                                <option value="9" <%=comparaSelected(9, MesReferencia ) %>>setembro</option>
                                <option value="10" <%=comparaSelected(10, MesReferencia ) %>>outubro</option>
                                <option value="11" <%=comparaSelected(11, MesReferencia ) %>>novembro</option>
                                <option value="12" <%=comparaSelected(12, MesReferencia ) %>>dezembro</option>
                            </select>
							
                        </p>
                        </div>
						<div class="direita">
                        <p>
							<b>Ano de Referência <span>*</span></b><br />
							<input class="inputtext medium" id="AnoReferencia" maxlength="128" name="AnoReferencia" type="text" value="<%=AnoReferencia %>" />
							
						</p>
                        </div>
                        <div class="esquerda">
                            <p>
                            <b>Tipo de transporte e valor da passagem<span>*</span></b><br />
                                <textarea cols="20" id="TipoTransporte" name="TipoTransporte" rows="2" style="width:300px; height:40px"><%=TipoTransporte %></textarea>
							    
                            </p>
						</div>
						<hr />
						<p>
							<button id="cancelar" class="button blue" type="reset" onclick="location.href='empregado_ficha.asp?ID=<%=funcID %>&tabs=3';">
								<span>Cancelar</span>
							</button>
							<button id="enviar" class="button green" type="submit" value="Salvar" name="grava">
								<span>Salvar</span>
							</button>
							<span id="processando" class="note loading">Processando...</span>
						</p>
						</div>
						</form>
<%Else %>
                <h1>Vale transporte <%if modoAlterar then response.Write " alterado " else response.Write "inserido" %> com sucesso.</h1>
                    <p><a href="prtRecValeTransporte.asp?vtID=<%=vtid %>&funcID=<%=funcID %>" target="_blank"> Clique aqui para imprimir o recibo</a></p>
                  
<%end if %>
                </div>
            </div>
            <br />     
		</div>
		<div class="clearingfix">
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
<%    
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing %>
<!--#include file="conecta_bd.asp"--><%

dim fulano, eleexiste, funcID, essecontrato, contratoExiste, TipoFaltaID, DataFalta, Comentarios, erroClass, bolTemErro, PREfuncID
dim  bolShowForm
    bolShowForm=true    
    bolTemErro=false
    erroClass=""
   
eleexiste=false
set fulano = new empregado
PREfuncID=limpaquerystring("ID")
'busca via objeto os dados do cara
if len(PREfuncID)>0 then    
    fulano.ID=PREfuncID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        nome=fulano.Nome
        funcID= fulano.ID
        set essecontrato=new contrato 
        contratoExiste=essecontrato.getFkrtContrato (funcID, true, 0 )
        novoContratoID = essecontrato.contrato_ID

        if len(request.form("enviar"))>0 then  

            dataAfastamento=limpaRequestForm("dataAfastamento")
            dataRetorno=limpaRequestForm("dataRetorno")
            texto=limpaRequestForm("texto") & ""
            MotivoID=limpaRequestForm("MotivoID")
            if funcID="" then  bolTemErro=true
            'valida
            if bolTemErro=false then                
                vtID= fulano.salvaAfastamento (dataAfastamento, dataRetorno, texto, MotivoID)
                bolShowForm=false
            else
               response.Write "Erro no envio"
            end if
       else
            response.Write "wrong submission"
        end if



    else
        fulano.nome="Não Encontrado"
    end if
else
      response.Write "NOID"
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

    
<link rel="stylesheet" href="/content/css/datepicker.css" type="text/css" media="screen"  />
<script type="text/javascript">

    $(document).ready(function () {

        Validate();

        $("#erro").hide();
        $(".note.loading").hide();

        // Verificação do modo documento simulado no ie
        if (document.documentMode == 5 || document.documentMode == 6 || document.documentMode == 7 || document.documentMode == 8) {
            mascaraData($("#DataAfastamento"));
            mascaraData($("#DataRetorno"));
        } else {
            $("#DataAfastamento").mask({ mask: "##/##/####" });
            $("#DataRetorno").mask({ mask: "##/##/####" });
        }



        $("#DataAfastamento").datepicker({
            showOn: 'button',
            buttonImage: '/content/images/calendar.gif',
            buttonImageOnly: true
        });

        $("#DataRetorno").datepicker({
            showOn: 'button',
            buttonImage: '/content/images/calendar.gif',
            buttonImageOnly: true
        });


        // Verificação do modo documento simulado no ie
        if (document.documentMode == 5 || document.documentMode == 6 || document.documentMode == 7 || document.documentMode == 8) {
            $('#enviar').click(function () {
                var validator = $('#form').validate();
                var erro = 0;

                if ($('#DataAfastamento').val() == "") {
                    validator.showErrors({ "DataAfastamento": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#MotivoID').val() == "") {
                    validator.showErrors({ "MotivoID": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#DataRetorno').val() == "") {
                    validator.showErrors({ "DataRetorno": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#Texto').val() == "") {
                    validator.showErrors({ "Texto": "Este campo é obrigatório." });
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
                    DataAfastamento: "required",
                    MotivoID: "required",
                    DataRetorno: {
                        greaterThan: "#DataAfastamento",
                        required: true
                    }
                },
                messages: {
                    MotivoID: "Este campo é obrigatório.",
                    DataAfastamento: "Este campo é obrigatório.",
                    DataRetorno:
                {
                    greaterThan: "A Data de Afastamento deve ser menor que a Data de Retorno",
                    required: "Este campo é obrigatório"
                }
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

<title>
	
	

</title></head>

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
              
            </div>
		
			<!-- Header [end] -->

			<!-- grid layout [begin] -->

			

    <div class="container_12">  
		<div class="grid_12">


            <div class="sb-box">
                
                <div class="sb-box-inner content">
                    <div class="header">
                        <h3><a href="empregado_ficha.asp?ID=<%=funcID %>"><%=ucase(fulano.nome) %></a> - CRIAR CARTA DE AFASTAMENTO</h3>
                    </div>
                    <%  ' conteúdo vai aqui
                        if eleexiste then %>






                        <b>Os Campos marcados com <span>*</span> são obrigatórios.</b><br /><br /><br />
                    <%  if bolShowForm then %>
                                <form action="empregado_lanca_afastamento.asp?ID=<%=funcID %>" id="form" method="post" name="form">
						
					                                <div id="erro" class="message error">
						                                <span class="strong">ERRO!</span> Verifique todos os campos abaixo.
					                                </div>

					                                <input id="ID" name="ID" type="hidden" value="" />

                                                    <div class="esquerda">
						                                <p>
							                                <b>Data do Afastamento <span>*</span></b><br />
							                                <input class="inputtext medium" id="DataAfastamento" maxlength="128" name="DataAfastamento" type="text" value="" />
							    
						                                </p>
                                                    </div>
                                                    <div class="direita">
						                                <p>
							                                <b>Motivo <span>*</span></b><br />
                            
						                                    <select id="MotivoID" name="MotivoID"><option value="">Selecione</option>
                                <option value="4"> se alistar como eleitor at&#233; 2 dias</option>
                                <option value="12">acidente de trabalho atestado INSS at&#233; 180 dias</option>
                                <option value="5">alistamento servi&#231;o militar at&#233; 1 dia</option>
                                <option value="2">casamento at&#233; 3 dias</option>
                                <option value="13">chamado para servir de Jurado</option>
                                <option value="14">comparecer como parte Justi&#231;a do Trabalho at&#233; 1 dia</option>
                                <option value="3">doa&#231;&#227;o de sangue at&#233; 1 dia por ano</option>
                                <option value="9">doen&#231;a atestado INSS exceto se superior a 6 meses</option>
                                <option value="6">exame vestibular para ensino superior at&#233; 1 dia</option>
                                <option value="1">falecimento do c&#244;njuge at&#233; 2 dias</option>
                                <option value="7">faltas abonadas pelo empregador</option>
                                <option value="11">licen&#231;a maternidade ou aborto at&#233; 120 dias</option>
                                <option value="10">licen&#231;a paternidade at&#233; 5 dias</option>
                                <option value="8">paralisa&#231;&#227;o do servi&#231;o pelo empregador</option>
                                </select>
							    
						                                </p>
                                                    </div>
                                                    <div class="esquerda">
						                                <p>
							                                <b>Data de Retorno <span>*</span></b><br />
							                                <input class="inputtext medium" id="DataRetorno" maxlength="128" name="DataRetorno" type="text" value="" />
						                                </p>
                                                    </div>
                                                
					                                <p>
						                                <b>Descrição <span>*</span></b><br />
						                                <input class="inputtext medium" id="Texto" maxlength="128" name="Texto" type="text" value="" />
							
					                                </p>

					                                <div>
					                                <hr />
					                                <p>
						                                <button id="cancelar" class="button blue" type="reset" onclick="location.href='main.asp';">
							                                <span>Cancelar</span>
						                                </button>
						                                <button id="enviar" name="enviar" class="button green" type="submit" value="Salvar">
							                                <span>Enviar</span>
						                                </button>
						                                <span id="processando" class="note loading">Processando...</span>
					                                </p>
					                                </div>

						</form>
                    <%  Else %>
                    <h1>Afastamento cadastrado com sucesso</h1>
                    <div>

                        <b><a  href="prtRecAfastamento.asp?ID=<%=funcID %>">IMPRIMIR COMPROVANTE</a></b>
                        <a  href="empregado_ficha.asp?funcID=<%=funcID %>&vtID=<%=vtID %>">Voltar</a>
                    </div>
                    <%  end if %>


                    <%else %>
                    <h1>Funcionário não encontrado</h1>
                    <%end if %>
                    <!--qui-->
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
     'destroy stuff hahahahah (mean laugh)
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing 

    
    %>
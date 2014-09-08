<!--#include file="conecta_bd.asp"--><%
    'ano referencia não inserido...
    'abono pecuniario
dim fulano, eleexiste, funcID, essecontrato, contratoExiste, dataInicio, dataFim, dataInicioPeriodo, dataFimPeriodo
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
    'criar aqui as regras para validação
            DataInicio=limpaRequestForm("DataInicio")
            DataInicioPeriodo=limpaRequestForm("DataInicioPeriodo")
          

            if DataInicio="" then  bolTemErro=true
            if DataInicioPeriodo="" then  bolTemErro=true



            'valida
            if bolTemErro=false then                
                fulano.salvaFerias  DataInicio, DataInicioPeriodo
                bolShowForm=false
            else
                erroClass=" style='border-color:red' "
            end if

        end if

    else
        fulano.nome="Não Encontrado"
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

    
<link rel="stylesheet" href="/content/css/datepicker.css" type="text/css" media="screen"  />


<script type="text/javascript" src="/Scripts/woow.validateextensions.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            Validate();

            $("#erro").hide();
            $(".note.loading").hide();

            $.validator.addMethod(
                "dataLimite",
                function (value, element, params) {
                    return Date.parse($("#DataInicio").val()) > (Date.parse($("#DataInicioPeriodo").val()) + 31536000000);
                }, "A data tem que ser maior que 1 ano de trabalho"
            );

            $("#DataInicio").mask("99/99/9999");
            $("#AnoReferencia").mask("9999");
            
            $("#DataInicio").datepicker({
                showOn: 'button',
                buttonImage: '/content/images/calendar.gif',
                buttonImageOnly: true
            });
            $("#DataInicioPeriodo").datepicker({
                showOn: 'button',
                buttonImage: '/content/images/calendar.gif',
                buttonImageOnly: true
            });
           /* $("#form").validate({
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
                    DataInicioPeriodo: { required: true },
                    DataInicio: {
                        greaterThan: "#DataInicioPeriodo",
                        required: true,
                        dataLimite: true
                    }

                },
                messages: {
                    DataInicioPeriodo: {
                        required: "Este campo é obrigatório."
                    },
                    DataInicio:
                    {
                        greaterThan: "A Data de saida deve ser maior que o periodo de referencia",
                        required: "Este campo é obrigatório",
                        dataLimite: "Data não permitida. Deve ter 1 ano após contratação"
                    }
                }
            });*/
        });
</script>

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
                        <h3><%=fulano.nome %></h3>
                    </div>
                    <%  ' conteúdo vai aqui
                        if eleexiste then %>






                        <b>Os Campos marcados com <span>*</span> são obrigatórios.</b><br /><br /><br />
                    <%  if bolShowForm then %>
						<form action="empregado_lanca_ferias.asp?ID=<%=funcID %>" id="form" method="post" name="form">	
                            <input type="hidden" name="ID" value="<%=funcID %>" />
						    <div id="erro" class="message error">
							    <span class="strong">ERRO!</span> Verifique todos os campos abaixo.
						    </div>
                            <div class="esquerda">
                                <p>
                                    <b>Dia de início do periodo aquisitivo <span>*</span></b><br />
                                    <input Value="" class="inputtext medium" <%=erroClass %> id="DataInicioPeriodo" maxlength="128" name="DataInicioPeriodo" type="text" value="<%=DataInicioPeriodo %>" />                                
                                </p>
                            </div>
                            <div class="direita">
                                <p>
                                    <b>Data saida efetiva das férias <span>*</span></b><br />
                                    <input Value="" class="inputtext medium" <%=erroClass %> id="DataInicio" maxlength="128" name="DataInicio" type="text" value="<%=DataInicio %>" />                                
                                </p>
                            </div>

						    <div>
						        <hr />
						        <p>
							        <button id="cancelar" class="button blue" type="reset" onclick="location.href='empregado_ficha.asp?ID=<%=funcID %>';">
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
                    <h1>Férias marcadas com sucesso.</h1>
                    <div>
                        <a  href="empregado_ficha.asp?ID=<%=funcID %>">Voltar</a>
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
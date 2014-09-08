<!--#include file="conecta_bd.asp"--><%
    'ano referencia não inserido...
    'abono pecuniario
dim fulano, eleexiste, funcID, essecontrato, contratoExiste, dataInicio, dataFim, dataInicioPeriodo, dataFimPeriodo, strResposta, bolTemErro
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

        if len(limparequestform("anoReferencia"))>0 AND isnumeric(limparequestform("anoReferencia")) then  
            bolShowForm=false
            ano=request.form("anoReferencia")
            strResposta = fulano.calcular13Salario(limparequestform("anoReferencia"),2 )
            if isnumeric(strResposta) then


            else

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
                        <h3><%=fulano.nome %> - Lançar Salário</h3>
                                                <ul class="tabs">
                            <li class="active">
                                <a href="empregado_ficha.asp?ID=<%=funcID %>&tabs=6" hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>
                    </div>
                    <%  ' conteúdo vai aqui
                        if eleexiste then %>






                        <b>Os Campos marcados com <span>*</span> são obrigatórios.</b><br /><br /><br />
                    <%  if bolShowForm then %>
						<form action="empregado_lanca_13salario.asp?ID=<%=funcID %>" id="form" method="post" name="form">	
                            <input type="hidden" name="ID" value="<%=funcID %>" />
						    <div id="erro" class="message error">
							    <span class="strong">ERRO!</span> Verifique todos os campos abaixo.
						    </div>

                            <div class="esquerda">
                                <p>
                                    <b>Ano Referência:<span>*</span></b><br />
                                                                     <select name="anoReferencia" id="anoReferencia">
                                    
                                    <%'calculaSalarioDoMes
                                        anoContrato = year(essecontrato.DataAdmissao)
                                         if len(request.form("anoReferencia"))>0 then anoToCheck = cint(request.form("anoReferencia")) else anoToCheck = year(now) 

                                       for leAno = anoContrato to year(now)
                                       %>
                                       <option value="<%=leAno %>"<%IF leAno=anoToCheck then response.write " selected" %>><%=leAno %></option>
                                       <%
                                       next
                                        %>                                
                                    </select>
                                </p>
                            </div>

						    <div>
						        <hr />
						        <p>
							        <button id="cancelar" class="button blue" type="reset" onclick="location.href='empregado_ficha.asp?ID=<%=funcID %>&tabs=6';">
								        <span>Cancelar</span>
							        </button>
						            <button id="enviar" name="enviar" class="button green" type="submit" value="Salvar">
							            <span>Enviar</span>
						            </button>
						            <span id="processando" class="note loading">Processando...</span>
						        </p>
						    </div>
                             
						</form>
                    <%  Else
                        
                        if bolTemErro then
                        %>
                            <h1>Erro no lançamento</h1>
                            <h2><%=strResposta %></h2>
                    <%
                        else
                         %>
                    <h1>Salário lançado com sucesso</h1>
                    <div>

                        <h2>13° Salário de <%=ano %> lançado com sucesso. </h2>
                        <p><a href="prtHolerite13.asp?mes=12&ano=<%=ano %>&funcID=<%=funcID %>&ID=<%=strResposta %>" target="_blank"> Clique aqui para imprimir o recibo de salário (holerite)</a></p>
                        <p><a href="prtGps13.asp?mes=<%=mes %>&ano=<%=ano %>&funcID=<%=funcID %>" target="_blank"> Clique aqui para imprimir a Guia de Recolhimento da GPS (Guia da previdência social - INSS)</a></p>
                        <p><a href="prtDARF13.asp?mes=<%=mes %>&ano=<%=ano %>&funcID=<%=funcID %>" target="_blank"> Clique aqui para imprimir o DARF</a></p>
                        <a  href="empregado_ficha.asp?ID=<%=funcID %>&tabs=6">Voltar</a>
                    </div>
                    <%  
                        end if   
                     end if %>


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
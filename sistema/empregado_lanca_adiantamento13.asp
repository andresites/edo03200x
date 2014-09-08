﻿<!--#include file="conecta_bd.asp"--><%

dim fulano, eleexiste
    function primeira_parcela_decimoterceiro(dtContratacao, mesAtual, anoAtual, ultimoSalario)
        dim dataAtual
        dataAtual = month(now) & "/1/" & year(now)
        diferenca = datediff("d",dataAtual, dtContratacao )
        if diferenca<0  then diferenca=diferenca*-1
        if diferenca<365 then
            'o lance dos 15 dias
            meses =   cint( datediff("d",dataAtual, dtContratacao )/30 )   
        else
            meses=12
        end if
        if meses<0 then meses=meses*-1
        'salario dividido 12 x meses
        primeira_parcela_decimoterceiro = cdbl(ultimoSalario) /12 * meses' cdbl(ultimoSalario) /12 
    end function

if limpaquerystring("decimoterceiro")="sim" then
' calcular parcela a ser paga.

end if
DIM ID, Valor, ValorPorExtenso, Descricao, MesReferencia, AnoReferencia, isPrimeiraParcela13, EmpregadoID
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
    set esseContrato= new contrato
    bolEsseContrato = essecontrato.getFkrtContrato (funcID, true, 0 )
     stAdmiss=   essecontrato.DataAdmissao
     

    mesReferencia =  dateadd("m", -1,now)

        set salarioMesPassado = fulano.getRecordsetOfSalarioDoMes( month(mesReferencia), year(mesReferencia) )
        if not(SalarioMesPassado.bof and salariomesPassado.eof) then
            valorAdiantamento =  primeira_parcela_decimoterceiro (stAdmiss, 7,2014, salarioMesPassado("salarioBruto"))
            ValorPorExtenso = ucase(Extenso(valorAdiantamento))
        else
            valorAdiantamento=""
            'bolShowForm = false
        end if
        set salarioMesPassado = nothing



        if len(request.form("enviar"))>0 then     

            Valor= limparequestform("Valor")
            ValorPorExtenso= limparequestform("ValorPorExtenso")
            Descricao= limparequestform("Descricao")
            MesReferencia= limparequestform("MesReferencia")
            AnoReferencia= limparequestform("AnoReferencia")

            if valor="" then
                 bolTemErro=true
                 strOutErro  = strOutErro & "Favor preencher valor do adiantamento<br>"
            else
                if not(isnumeric(valor)) then
                 bolTemErro=true
                 strOutErro  = strOutErro & "Valor de adiantamento inválido<br>"                
                end if
            end if
            if ValorPorExtenso="" then
                 strOutErro  = strOutErro & "Valor de por extenso obrigatório inválido<br>" 
            end if
            if MesReferencia="" then
                 bolTemErro=true
                 strOutErro  = strOutErro & "Favor preencher o mês de referência<br>"
            else
                if not(isnumeric(MesReferencia)) then
                 bolTemErro=true
                 strOutErro  = strOutErro & "Valor de mês de referência inválido<br>"                
                end if
            end if
            if AnoReferencia="" then
                 bolTemErro=true
                 strOutErro  = strOutErro & "Favor preencher  o ano de referência<br>"
            else
                if not(isnumeric(AnoReferencia)) then
                 bolTemErro=true
                 strOutErro  = strOutErro & "Valor de ano de referência inválido<br>"                
                end if
            end if
            
            if limpaquerystring("decimoterceiro")="sim" then
                 isPrimeiraParcela13= 1
            else
                isPrimeiraParcela13=0
            end if
            dim objCon,  objRS, strMsg,  obCmd
            set objCon = Server.CreateObject ("ADODB.Connection")
            Set objRS = Server.CreateObject ("ADODB.Recordset")
            objCon.open strConn
            sqlQ="select * from Empregado.Adiantamento WHERE isPrimeiraParcela13='true' AND empregadoID=" & funcID  & " AND AnoReferencia=" & AnoReferencia

            objRS.open sqlQ, objCon,,,adcmdText 
            if objRS.bof and objRS.eof then
                
            else
                bolTemErro=true
                strOutErro  = strOutErro & "Já foi lançado adiantamento de décimo terceiro para esse ano"
            end if
            objRS.close
            objCon.close
            set objRS=nothing
            set objCon=nothing
    
                       
            'valida
            if bolTemErro=false then 
                               
                
                vtID = fulano.lancaAdiantamento(valor, valorPorExtenso, descricao, mesReferencia, anoReferencia, true) 
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
<script type="text/javascript" src="/scripts/extenso.js"></script>
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

        $("#DataFalta").mask("99/99/9999");
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
        $("#DataFalta").datepicker({
            showOn: 'button',
            buttonImage: '/content/images/calendar.gif',
            buttonImageOnly: true,
            maxDate: " +0D"
        });

        // Verificação do modo documento simulado no ie
        if (document.documentMode == 5 || document.documentMode == 6 || document.documentMode == 7 || document.documentMode == 8) {
            $('#enviar').click(function () {
                var validator = $('#form').validate();
                var erro = 0;

                if ($('#DataFalta').val() == "") {
                    validator.showErrors({ "DataFalta": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#TipoFalta').val() == "") {
                    validator.showErrors({ "TipoFalta": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#Comentarios').val() == "") {
                    validator.showErrors({ "Comentarios": "Este campo é obrigatório." });
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
            // implementar teste para ver se é menor que hoje
            $("#form").validate
            ({
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
                rules:
                {
                    DataFalta: { required: true },
                    TipoFalta:
                    {
                        required: true,
                        noneSelected: false
                    },
                    Comentarios: { required: true }
                },
                messages:
                {
                    DataFalta: "Este campo é obrigatório.",
                    TipoFalta: "Este campo é obrigatório.",
                    Comentarios: "Este campo é obrigatório."
                }
            });
        }
    });



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
                        <h3><%=fulano.nome %> - LANÇAR ADIANTAMENTO</h3>
                                                <ul class="tabs">
                            <li class="active">
                                <a href="empregado_ficha.asp?ID=<%=funcID %>&tabs=4" hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>

                    </div>
                    <%  ' conteúdo vai aqui
                        if eleexiste then 
                            %>
                        
                    <%      if bolShowForm then
                                    'if valorAdiantamento>0 then %>
                        <b>Os Campos marcados com <span>*</span> são obrigatórios.</b><br /><br /><br />
						<form action="empregado_lanca_adiantamento13.asp?ID=<%=funcID %>" id="form" method="post" name="form">
						
						<div id="erro" class="message error">
							<span class="strong">ERRO!</span> Verifique todos os campos abaixo.
						</div>
<%if bolTemErro then  %>

						<div id="erro" class="message error">
							<span class="strong">ERRO!</span><%=strOutErro %>
						</div>
<%end if %>
						<input id="ID" name="ID" type="hidden" value="" />

                        <input id="AdiantamentoMaximo" name="AdiantamentoMaximo" type="hidden" value="60000,00" />

                        <div class="esquerda">
						<p>
							<b>Valor do adiantamento<span>*</span></b><br />
							R$ <input class="inputtext medium" id="Valor" maxlength="128" name="Valor" type="text" value="<%=valorAdiantamento %>" />

							
						</p>
						</div>
						<div class="direita">
                        <p>
							<b>Valor Por Extenso <span>*</span></b><br />
							<input class="inputtext medium" id="ValorPorExtenso" maxlength="128" name="ValorPorExtenso" type="text" value="<%=ValorPorExtenso %>" />
							
						</p>
						</div>


						<div class="esquerda">
                        <p>
                            <b>Mês Referência <span>*</span></b><br />
                            <select id="MesReferencia" name="MesReferencia"><option value="">Selecione</option>
<%
    function selecionaMesAdiantamento(mes)

        mesRequisitado  = limpaRequestForm("mesReferencia")
        if mesRequisitado="" or not(isnumeric(mesRequisitado)) then mesRequisitado="0"
        if isnumeric(mes) then
            mesAgora = month(now)
            if mesAgora = mes then 
                selecionaMesAdiantamento= " selected "
            else
                if cint(mes)=cint(mesRequisitado) then
                    selecionaMesAdiantamento= " selected "
                else
                    selecionaMesAdiantamento=""
                end if
            end if            
        end if
    end function
    
     %>
<option value="1" <%=selecionaMesAdiantamento(1) %>>janeiro</option>
<option value="2" <%=selecionaMesAdiantamento(2) %>>fevereiro</option>
<option value="3" <%=selecionaMesAdiantamento(3) %>>mar&#231;o</option>
<option value="4" <%=selecionaMesAdiantamento(4) %>>abril</option>
<option value="5" <%=selecionaMesAdiantamento(5) %>>maio</option>
<option value="6" <%=selecionaMesAdiantamento(6) %>>junho</option>
<option value="7" <%=selecionaMesAdiantamento(7) %>>julho</option>
<option value="8" <%=selecionaMesAdiantamento(8) %>>agosto</option>
<option value="9" <%=selecionaMesAdiantamento(9) %>>setembro</option>
<option value="10" <%=selecionaMesAdiantamento(10) %>>outubro</option>
<option value="11" <%=selecionaMesAdiantamento(11) %>>novembro</option>
<option value="12" <%=selecionaMesAdiantamento(12) %>>dezembro</option>
</select>
							
                        </p>
						</div>
                         <div class="direita">  
                            <p>
							    <b>Ano de Referência <span>*</span></b><br />
							    <input class="inputtext medium" id="AnoReferencia" maxlength="128" name="AnoReferencia" type="text" value="<%=year(now) %>" />
							
						    </p>
						
						</div>
                        <div class="esquerda">
						<p>
							<b>Descrição</b><br />
							<input class="inputtext medium" id="Descricao" maxlength="128" name="Descricao" type="text" value="Primeira Parcela Decimo Terceiro Salário" />
							
						</p>
						</div>
                       
						<div class="esquerda">
						
						<p>
                            <hr />
							<button id="cancelar" class="button blue" type="reset" onclick="location.href='empregado_ficha.asp?ID=<%=funcID %>&tabs=4';">
								<span>Cancelar</span>
							</button>
							<button id="enviar" class="button green" type="submit" name="enviar" value="Salvar">
								<span>Salvar</span>
							</button>
							<span id="processando" class="note loading">Processando...</span>
						</p>
						</div>

						</form>


					
                    <%  
                            'else'adiantamento = 0
                        Else 
                        %>
                    <h1>Adiantamento cadastrado com sucesso</h1>
                    <div>
                        <p><a href="prtReciboAdiantamento.asp?vtID=<%=vtid %>&funcID=<%=funcID %>"</p>

                        <a  href="empregado_ficha.asp?ID=<%=funcID %>&tabs=4">Voltar</a>
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

    <script type="text/javascript">

        $('#Valor').keyup(function () {
            var prodText = $(this).val();
            //console.log(prodText);
            $('#ValorPorExtenso').val(prodText.extenso(true).toUpperCase());

        });

    </script>
	<!-- end div #page-body -->
</body>
</html>
<%    
     'destroy stuff hahahahah (mean laugh)
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing 

    
    %>
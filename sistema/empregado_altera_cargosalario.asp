<!--#include file="conecta_bd.asp"--><%


dim fulano, eleexiste, funcID, essecontrato, contratoExiste, TipoFaltaID, DataFalta, Comentarios, erroClass, bolTemErro, PREfuncID
dim  bolShowForm, bolPassou
    bolPassou=true
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
        funcID=fulano.ID 
        set essecontrato=new contrato 
        bolEsseContrato = essecontrato.getFkrtContrato (funcID, true, 0 )
        novoContratoID = essecontrato.contrato_ID
    else
        response.Redirect "main.asp"
    end if 
end if

if request.form("envio")="sim" then
    'serverside validation
    dim  mensagemDeErro
    bolPassou=true
    dim contrato_ID 
    
    dim Salario 
    dim SalarioPorExtenso 
    dim isAtivo 
    dim EnderecoComplemento, bolVeioDeAgenciaDeTrabalho
   ' dim TipoEstabelecimentoID 
    dim TipoOcupacaoID 
    dim EmpregadoID 
    dim EmpregadorID 
    dim PeriodoExperienciaID 
    dim EnderecoID 
    dim ValeTransporte 
    TipoOcupacaoID = limparequestform("TipoOcupacaoID")
    Salario = limparequestform("Salario")
    SalarioPorExtenso = limparequestform("SalarioPorExtenso")
    descricao = limparequestform("descricao")
    DataAlteracao = limparequestform("DataAlteracao")
    motivo=limparequestform("motivo")
    dim EnderecoCEP, EnderecoNumero, EnderecoLogradouro, EnderecoBairro, EnderecoCidade, EnderecoEstado
    if Salario="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar Salário</li>"
    end if
    if SalarioPorExtenso="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar salário por extenso</li>"
    end if
    if TipoOcupacaoID="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar ocupação</li>"
    end if
    if DataAlteracao="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar data de alteração do contrato</li>"
    else
        if not(isdate(DataAlteracao)) then
            bolPassou=false
            mensagemDeErro=mensagemDeErro & "<li>Favor informar data de alteração do contrato</li>"
         else
            if datediff("d", essecontrato.DataAdmissao, DataAlteracao  )<=0 then
                bolPassou=false
                mensagemDeErro=mensagemDeErro & "<li>A data de alteração não pode ser menor que a data de admissão.</li>"
            end if

        end if
    end if

    if DataAlteracao < DataAdmissao  then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar data de alteração do contrato</li>"
    end if

    if motivo="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar motivo da alteração contratual</li>"
    end if
    if bolPassou=true then
     altID= essecontrato.alteraCargoSalario(funcID, TipoOcupacaoID, motivo, Salario, DataAlteracao)
        bolShowForm=False
       ' response.End
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
<script type="text/javascript" src="/scripts/extenso.js"></script>

    
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
            //extenso $("#DataAlteracao").mask("99/99/9999");
           
            $("#DataAlteracao").datepicker({
                showOn: 'button',
                buttonImage: '/content/images/calendar.gif',
                buttonImageOnly: true
            }).mask("99/99/9999");




            //Validate();






           



     
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
            $('#Salario').keyup(function () {
                var prodText = $(this).val();
                //console.log(prodText);
                $('#SalarioPorExtenso').val(prodText.extenso(true));
            });
            if ($("#Endereco_Cidade_EstadoID > option:selected").attr("value") == "")
                $("#Endereco_CidadeID").attr("disabled", "disabled");

            $("#erro").hide();
            $(".note.loading").hide();


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
                  
                    motivo: { required: true },
                   
                    Salario: { required: true, salarioMinimo: true },

                },
                messages: {
                    TipoOcupacaoID: {
                        required: "Este campo é obrigatório."
                    },

   
                    SalarioPorExtenso: "Este campo é obrigatório.",
                    "Endereco.Logradouro": "Este campo é obrigatório.",
                    "Endereco.Bairro": "Este campo é obrigatório.",
                    "Endereco.CidadeID": "Este campo é obrigatório.",
                    "Endereco.Numero": "Este campo é obrigatório."
                }
            });






            var data_atual = new Date();
        //    $("#DataEmissaoContrato").val(data_atual.getDate() + "/" + (data_atual.getMonth()+1) + "/" + data_atual.getFullYear());

        });
</script>


<title>
	
	Empregados

</title>
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





<div id="adminbar">

        <b>Empregado Selecionado</b>: <b style="color:Red;font-size:20px;"><%=nome %></b><img src = "/Content/images/user.jpg" alt="<%=nome %>" style="width: 25px; top: -3px;" />


</div>
				
			</div>
		
			<!-- Header [end] -->

			<!-- grid layout [begin] -->

			

    <div class="container_12">
         <%if eleexiste then %>
		<div class="grid_12">
            

					<%if bolPassou=false then %>	
                <div id="sucesso" class="message error"><span class="strong">Erro!</span>
                    <br />
                    <ul>
                        <%=mensagemDeErro %>
                    </ul>


                </div>
			        <%end if %>
            <%if avisoSucesso then %>	

                                <div id="erroSS" class="message error" >
                            <span class="strong">ERRO!</span>Funcionário não localizado!</span>
                        </div>
			 <%end if %>
            <div class="sb-box">

              

                <div class="sb-box-inner content">
                    <div class="header">
                        <h3>Alteração de cargo/salário</h3>
                        <ul class="tabs">
                            <li class="active">
                                <a href="empregado_ficha.asp?ID=<%=funcID %>"  hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>
                    </div>

                    <div class="bcont">

                        <%if bolShowForm then %>

                        <form action="empregado_altera_cargosalario.asp?ID=<%=funcID %>" id="form" method="post" name="form">
                         <input type="hidden"   name="funcID" value="<%=funcID %>" />
                        <div id="erro" class="message error" style="display: none;">
                            <span class="strong">ERRO!</span> Verifique todos os campos abaixo.
                        </div>



                        <div class="esquerda">
                            <p>
                                <b>Empregado:</b><br>
                                <span style="color:Red; font-size:20px;"><%=nome %></span>
                            </p>
                        </div>
                        
<%    
dim objCon,  objRS, strMsg, strICQ, obCmd
set objCon = Server.CreateObject ("ADODB.Connection")
Set objRS = Server.CreateObject ("ADODB.Recordset")
objCon.Open strConn 
       
     %>                              
                               
                                
                           
                        <div class="esquerda">
                            <p>
                                <b>Tipo de Ocupação <span>*</span></b><br>
                                <select id="TipoOcupacaoID" name="TipoOcupacaoID"><option value="">Selecione</option>
                                    <%objRS.open "select * from  contrato.TipoOcupacao", objCon,,,adcmdText
                                        if not (objRS.bof and objRS.eof) then
                                            while not objRS.eof%>
                                    <option value="<%=objRS("ID") %>"<%If essecontrato.TipoOcupacaoID = objRS("Nome") then response.write " selected" %>><%=objRS("Nome") %></option>
                                    <%          objRS.movenext
                                            wend
                                        end if 
                                        objRS.close%>

                                </select>
                                
                            </p>
                        </div>
                        <div class="direita">
                       <p>
                                <b>Salário <span>*</span></b><br>
                                R$
                                <input class="inputtext medium" id="Salario" maxlength="128" name="Salario" type="text" value="<%=essecontrato.Salario %>">
                                
                            </p>
                        </div>
                        <div class="esquerda">
                            <p>
                                <b>Salário por Extenso <span>*</span></b><br>
                                <input style="text-transform:uppercase" class="inputtext medium" id="SalarioPorExtenso" maxlength="128" name="SalarioPorExtenso" type="text" value="<%=essecontrato.SalarioPorExtenso %>">
                                <br>
                                (<b>Por exemplo:</b> Mil Duzentos e Trinta e Quatro Reais e Cinquenta e Seis Centavos)<br>
                                
                            </p>
                        </div>
                        <div class="direita">
                            <p>
                                <b>Data da alteração<span>*</span> <br />
                                    (obs: o salário será alterado a partir do dia primeiro do mês subsequente à data inserida, a menos que ela seja o primeiro dia do mês):</b><br />
                                
                                   <input Value="" class="inputtext medium"  id="DataAlteracao" maxlength="128" name="DataAlteracao" type="text" value="<%=day(now) & "/" & month(now) & "/" & year(now) %>" /> 

                            </p>
                        </div>

                        <div class="esquerda">
                            <p>
                                <b>Motivo<span>*</span>:</b><br />
                                
                                   <textarea name="motivo" id="motivo" rows="5" cols="60"></textarea>

                            </p>
                        </div>



     
                         <div>

                            <br>
   
                            <div>
                                <hr>
                                <p><input type="hidden" name="envio" value="sim" />
                                    <button id="cancelar" class="button blue" type="reset" onclick="location.href='empregado_ficha.asp?ID=<%=funcID %>';">
                                        <span>Cancelar</span>
                                    </button>
                                    <button id="enviar" class="button green" type="submit" value="Save">
                                        <span>Salvar</span>
                                    </button>
                                    <span id="processando" class="note loading" style="display: none;">Processando...</span>
                                </p>
                            </div>
                            
                        </div>


                        </form>
                        <%else
                            
                             %>
                      <h3>  Alteração registrada com sucesso!</h3>
                        <p><a href="empregado_ficha.asp?ID=<%=funcID %>"><b>Voltar</b></a></p>
                        <%end if %>
                    </div>
                </div>
            </div>

            <br />
            
            <!--
            
                <div class="sb-box" style="clear:both;">
				    <div class="sb-box-inner content">
					    <div class="header">
						    <h3>Dados do Funcionário</h3>
					    </div>
					    <div class="bcont">
                            
                                <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							        <thead>
								        <tr>
                                            <th>Nome</th>
									        <th style="text-align:center;">Admissão</th>
                                            <th style="text-align:center;">Experiência</th>
                                            <th style="text-align:center;">Dias da semana</th>
                                            <th style="text-align:center;">Ocupação</th>
                                            <th>Salário</th>
                                            <th style="width:95px;text-align:center;">Data alteracao cargo/salario</th>
                                            <th>Ativo</th>
								        </tr>
							        </thead>
                                    <tbody>
                                    
                                        <tr>
                                            <td>Teste da Silva Prado</td>
                                            <td style="text-align:center">05/03/2014</td>
                                            <td style="text-align:center">30 dias</td>
                                            <td style="text-align:center">
                                            Segunda-feira<br />
                                            Ter&#231;a-feira<br />
                                            Quarta-feira<br />
                                            Quinta-feira<br />
                                            
                                            </td>
                                            <td style="text-align:center;">Empregado Dom&#233;stico(a)</td>                                           
                                            <td>120000,00</td>

                                            
                                            <th style="text-align:center;">-</th>
                                            <td> Sim </td>
                                        </tr>
                                        
                                    </tbody>
						        </table>
                            
					    </div>
				    </div>
			    </div>
            -->
            
		</div>
		<div class="clearingfix">
		</div>
	</div>

    

                    
			
			<%else %>
                    <div id="Div1" class="message error" >
                            <span class="strong">ERRO!</span>Funcionário não localizado!
                        </div>
            <%end if %>
			
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
<%set fulano=nothing %>
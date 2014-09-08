<!--#include file="conecta_bd.asp"-->
<!--#include file="inc_logincheck.asp"-->

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

    
    
    <style type="text/css">
    h3 {font-size:2.25em; line-height:1.111em; text-transform:uppercase; margin:0px 0 20px; font-weight:normal; color:#000;}
    .head2 {padding-bottom:6px; width:100%; text-transform:none; background:url(Content/images/tail-head.gif) 0 bottom repeat-x; margin-bottom:25px; margin-top:10px;}
    
    label
    {
        background-color:White;
        color:#f24c4c;
        font-size:18px;
        font-weight:bold;
    }
    
	.ui-dialog { font-size: 11px; }
	body {
		font-family: Tahoma;
		font-size: 12px;
	}
	#question {
		width: 300px!important;
		height: 60px!important;
		padding: 10px 0 0 10px;
	}
	#question img {
		float: left;
	}
	#question span {
		float: left;
		margin: 20px 0 0 10px;
	}
    </style>

	<title>
		E-Doméstico - Home Sistema
	</title>

    <script type="text/javascript">
        function desativarfunc(id) {
            decisao = confirm("Voce esta prestes a desligar este funcionario. Uma vez desligado não poderá \nrealizar mais nenhuma ação referente a este funcionário, apenas consulta e ficará no final da fila.\n\nDeseja Continuar?");
            if (decisao) {
                alert("Confirmado! ");
                $("#idEmpregado").val(id);
                $("#formAlterar").submit();
            } else {
                alert("Ação Cancelada!\n");
            }
        };
        function ativarfunc(id) {
            $("#idEmpregado").val(id);
            $("#formAlterar").submit();
        };
    </script>

</head>
<body>

	<div id="page-body">
		<div id="wrapper">
			<div id="header">
                <div id="logo"><a href="/Sistema">Home</a></div>            			
<!--#include file="inc_header_pagina.asp"-->
                </div>
			</div>
            <div class="container_12">
                <%
                        'sistema de notificações - refazer. Tá uma merda... difícil de visualizar.
                     %>
                <div style="background: url('..Content/images/onebit-icons/warning.png') no-repeat scroll 10px 50% #F9F9E5;border: 1px solid #E8E3AA;color: #828400;border-radius: 5px 5px 5px 5px;margin: 0 0 15px;padding: 6px 10px 10px 45px;position: relative;height:33px;" >
		            <div style="float:left;padding-top: 8px;"><span class="strong">Atenção!</span> Sua conta expira em 23/04/2014. Contrate crédito de atendimento.</div>
                    <div id="addcred" class="paddingAdicionar" style="float:right;">
                        <table border="0">
                            <tr>
                                <td><a href="/Sistema/Venda/List"><img src="/Content/images/Plus_48.png" alt="Adicionar Créditos" /></a></td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td><a href="/Sistema/Venda/List" style="color: #000000;text-decoration: none;font-size: 14px;"><b>Contratar Créditos</b></a></td>
                            </tr>
                        </table>
                    </div>
	            </div>
<%'
public class contratoFuncionario

    private prv_salario
    private prvDataAdmissao
    private prvTipoOcupacao
    private prvContratoID
    private prvBolThereIsAContrato
	Private Sub Class_Initialize() 'iniciando objetos na classe
            prv_salario="-"
            prvDataAdmissao="-"
            prvTipoOcupacao="-"
            prvContratoID="-"
            prvBolThereIsAContrato=false
	end sub

	Private Sub Class_Terminate() 'finalizando objetos na classe
            prv_salario=""
            prvDataAdmissao=""
            prvTipoOcupacao=""
            prvContratoID=""
            prvBolThereIsAContrato=false
	end sub

	Public property get salario()
		salario=prv_salario
	end property	
	Public property get DataAdmissao()
		DataAdmissao=prvDataAdmissao
	end property
	Public property get TipoOcupacao()
		TipoOcupacao=prvTipoOcupacao
	end property
	Public property get contratoID()
		contratoID=prvContratoID
	end property

	Public property get bolThereIsAContrato()
		bolThereIsAContrato=prvBolThereIsAContrato
	end property


    public sub getFkrLastContrato(idFunc)
        dim fnSQL
        dim objRS2, objCon2
        fnSQL = "select top 1 * from Contrato.Contrato INNER JOIN Contrato.TipoOcupacao on Contrato.Contrato.TipoOcupacaoID=Contrato.TipoOcupacao.ID "
        fnSQL=fnSQL & " where Contrato.Contrato.EmpregadoID=" & idFunc & " order by Contrato.Contrato.ID DESC"
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.open strConn
        objRS2.open leSQL, objRS2,,,adCmdText
        if objRS2.bof AND objRS2.EOF then
            prv_salario="-"
            prvDataAdmissao="-"
            prvTipoOcupacao="-"
            prvContratoID="-"
            prvBolThereIsAContrato=false
        else
            prv_salario=objRS2("Contrato.Contrato.Salario")
            prvDataAdmissao=objRS2("Contrato.Contrato.DataAdmissao")
            prvTipoOcupacao=objRS2("Contrato.TipoOcupacao.Nome") 
            prvContratoID=objRS2("Contrato.Contrato.ID") 
            prvBolThereIsAContrato=True             
        end if
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end sub




end class

    'Máquininha de buscar funcionários
    dim objRS, objCon, leSQL, strMenuGrande, empregadoNome, sexo, strMnuPeq, objContrato
    dim sSalario, sTipoOcupacao, sContratoID, sDataAdmissao
    set objCon = Server.CreateObject ("ADODB.Connection")
    Set objRS = Server.CreateObject ("ADODB.Recordset")
    objCon.open strConn
    leSQL="Select Empregado.Empregado.Nome as nomeEmpregado, Empregado.Empregado.Sexo as LeXXX, Empregado.Empregado.ID as IDEmpregado, Contrato.Contrato.DataAdmissao AS dataDeAdmissao, Contrato.TipoOcupacao.Nome as tipoOcupacao, Contrato.Contrato.Salario as Salario, Empregado.Empregado.RegistroAtivo as Ativo from"
    leSQL = leSQL & " Empregado.Empregado LEFT JOIN Contrato.Contrato on Empregado.ID = Contrato.EmpregadoID LEFT JOIN Contrato.TipoOcupacao on Contrato.Contrato.TipoOcupacaoID=Contrato.TipoOcupacao.ID "
    leSQL = leSQL & "WHERE  Empregado.EmpregadorID=" & Session("ID") & " order by empregado.empregado.ID"
    leSQL="Select Empregado.Empregado.Nome as nomeEmpregado, Empregado.Empregado.Sexo as LeXXX, Empregado.Empregado.ID as IDEmpregado, Empregado.Empregado.RegistroAtivo as Ativo from"
    leSQL = leSQL & " Empregado.Empregado  "
    leSQL = leSQL & "WHERE  Empregado.EmpregadorID=" & Session("ID") & " order by empregado.empregado.ID"

 
    objRS.open leSQL, objCon,,,adCmdText
    if not(objRS.bof and objRS.eof) then
        while not objRS.eof
            empregadoID = objRS("IDEmpregado")
            empregadoNome = objRS("nomeEmpregado") 

            set objContrato = new  contratoFuncionario
            objContrato.getFkrLastContrato(empregadoID)
            sSalario=objContrato.salario
            sTipoOcupacao=objContrato.TipoOcupacao
            sContratoID=objContrato.contratoID
            sDataAdmissao=objContrato.DataAdmissao
             set objContrato = nothing
             strMenuGrande =    strMenuGrande & vbCrLf
            strMenuGrande =    strMenuGrande & "<td id='funcionario_" & empregadoID &  "' style='padding-right: 25px; text-align:center;' class='small'> "
            strMenuGrande =    strMenuGrande & "                        <a href='empregado_ficha.asp?ID=" &  empregadoID & "' style=""background:url('/Content/images/ico_empMas.png'); background-attachment: scroll; background-color: transparent; width: 98px; height: 98px; margin-bottom: -15px; outline: none; background-position: 50% 50%; background-repeat: no-repeat no-repeat; display: block;""></a>"
            strMenuGrande =    strMenuGrande & "                                    <div class='opmenuindex'>"                                                                        
            strMenuGrande =    strMenuGrande & "<ul><li><a href='empregado_ficha.asp?ID=" &  empregadoID & "'>Selecionar</a></li></ul><div class='clear'></div><div class='foot'></div>"    
			strMenuGrande =    strMenuGrande & "</div><br />"
            strMenuGrande =    strMenuGrande & empregadoNome  & "(" & objRS("LeXXX") & ") </td>"

    'MENU PEQUENO - LISTA
           strMnuPeq = strMnuPeq & vbCrLf
            strMnuPeq = strMnuPeq & "<tr><td>" & empregadoNome &  "</td>"
            strMnuPeq = strMnuPeq & "<td>"& objRS("dataDeAdmissao")  & "</td>"
            strMnuPeq = strMnuPeq & "<td> - </td>" 'não há campo para data de desligamento
            strMnuPeq = strMnuPeq & "<td>"& objRS("tipoOcupacao") & "</td>"
            strMnuPeq = strMnuPeq & "<td>"   
                if not isnull(objRS("Salario")) then 
                    strMnuPeq = strMnuPeq &  formatcurrency(objRS("Salario"),2) 
                else 
                        strMnuPeq = strMnuPeq &  " --- "
                end if
            strMnuPeq = strMnuPeq & "</td>"
            strMnuPeq = strMnuPeq & "<td>"
            if objRS("Ativo")=1 then  strMnuPeq = strMnuPeq & "Sim" else  strMnuPeq = strMnuPeq & "Não"
            strMnuPeq = strMnuPeq & "</td>"
			strMnuPeq = strMnuPeq & "<td class=""small"">"
			strMnuPeq = strMnuPeq & "  <a class=""action"" href=""#""></a>"
			strMnuPeq = strMnuPeq & "	<div class=""opmenu"">"
			strMnuPeq = strMnuPeq & "	<ul>"
            strMnuPeq = strMnuPeq & "<li><a href=""empregado_ficha.asp?id=" & empregadoID & chr(34) & ">Alterar Cadastro do Empregado</a></li>"
			strMnuPeq = strMnuPeq & "<li><a href=""empregado_altera_contrato.asp?id=" & empregadoID & chr(34) &">Alterar Cargo ou Sal&#225;rio</a></li>"
            strMnuPeq = strMnuPeq & "<li><a id=""alert"" style = ""color:red;"" href=""javascript:void(0);"" onclick=""desativarfunc(" & empregadoID  & ");"">Desligar funcionário</a></li>"												    
			strMnuPeq = strMnuPeq & "</ul><div class=""clear""></div><div class=""foot""></div></div></td></tr>  "
            objRS.movenext
        wend
        
    else
            'response.Write "bummer"

    end if
    objRS.close
    set objRS=nothing
    objCon.close
    set objCon=nothing
    
     %>
                <h3 class="head2" style="margin-bottom: -51px">Olá, <%=session("nome") %> <a href="cadastro_edit.asp" style="font-size:12px;">(Meus dados)</a></h3><br /><br /><br />
                <div class="content">
                    <div class="bcont">
                        <div id="Div1" class="message informationExp" style="margin:27px; width:380px;">
                            <span class="strong">Informativo:</span> Para cadastrar um <b>novo empregado</b> tenha em mãos:<br /> <b>RG, CPF,PIS, Endereço e a Carteira de Trabalho!</b>
                        </div>  
                        <table>
                            <tr>                          
                                <td>                                                                                    
                                    <div style="padding-right: 25px; text-align:center"><a href="form_cadastrar_empregado.asp" title="Novo Empregado"><img src = "/Content/images/Anonimo.png" alt="Novo Empregado" style="margin-bottom: 5px; margin-top: 1px;"  /></a><br /><b style="color:Red;">Novo Empregado</b></div>
                                </td>    
                                <%=strMenuGrande %>
                                                                                                    
                            </tr>         
                        </table>
                <div style="width: 134px;"></div>
                </div>
                </div>

                <!-- Aqui entra a lista dos créditos disponíveis -->
                
            </div>	

            
                    <!-- Retirado por não aparecer mais o menu. Ele foi repassado para a coluna acoes-->
                    <!--<div id="sucesso" class="message AttentionExp" style="margin:27px; width:460px;">
                        <span class="strong">Proximo Passo:</span> <b>Clique</b> em um empregado e escolha <b>selecionar</b> para utilizar o sistema.
                    </div>-->
            

            
            <div class="sb-box" style="clear:both;">
				<div class="sb-box-inner content">
					<div class="header">
						<h3 style="text-transform:none;">Dados dos Funcionários</h3>
					</div>
					<div class="bcont" style="font-size:small;">
                            <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							    <thead>
								    <tr>
                                        <th>Nome</th>
									    <th>Data de Admissão</th>
                                        <th>Data de Demissão</th>
                                        <th>Ocupação</th>
                                        <th>Salário</th>
                                        <th>Ativo</th>
                                        <th></th>
								    </tr>
							    </thead>
                                <tbody>
                                

<%=strMnuPeq %>


                                    
                                </tbody>
						    </table>
					</div>
				</div>
			</div>
            </div>
            </div>
            
	<!-- end div #page-body -->
    

<div class="container_12">
	<div class="grid_12" id="footer">
		<p>© Copyright 2010 by <a href="/">EDomestico</a></p>
	</div>
	<div class="clearingfix"></div>
</div>
</body>
</html>



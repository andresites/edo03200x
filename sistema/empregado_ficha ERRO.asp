<!--#include file="conecta_bd.asp"--><%

dim fulano, eleexiste, funcID, essecontrato, funcPRE
    eleexiste=false
    
set fulano = new empregado
    funcPRE=limpaquerystring("ID")
'busca via objeto os dados do cara
if len(funcPRE)>0 then    
    'as duas linhas abaixo são as unicas que unem as faltas, advertencias e várias outras coisas do empregado ao empregador.
    'eu vejo isso como um erro de projeto do carinha que fez o sistema, mas se eu alterar agora, o sistema original vai deixar de
    'funcionar pq eu precisaria colocar uma FOREIGN KEY referenciando o ID do patrão. Como o sistema dele não prevê isso, iria travar na hora de inserir dados
    
    'aqui eu vou usar o que veio do querystring apenas como parâmetro para pegar o funcionário.
    fulano.ID=funcPRE
    fulano.EmpregadorID=session("ID")

    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        nome=fulano.Nome
        funcID=fulano.ID ' me assegurar que sempre o funcionario é o do cara
        set essecontrato=new contrato 
        essecontrato.getFkrtContrato funcID, true, 0 
        novoContratoID = essecontrato.contrato_ID
    else
        'response.Write "N.E."
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
<script type="text/javascript" src="/Scripts/jquery-1.8.3.js"></script>
<script type="text/javascript" src="/Scripts/jquery-ui-1.9.2.custom.min.js"></script>
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
       
.menuLocal{margin:5px; padding:5px;  display:block; }
.menuLocal > ul > li {padding:5px; margin:5px; list-style:none; display:inline; 

              -webkit-border-radius: 8px;
-moz-border-radius: 8px;
border-radius: 8px;
text-align:center;


}
.menuLocal li a{float:left; padding-left:15px; display:block; color:black; text-decoration:none; font:12px Verdana, Arial, Helvetica, sans-serif; cursor:pointer;
                background:rgb(204, 235, 245);
                              -webkit-border-radius: 8px;
-moz-border-radius: 8px;
border-radius: 8px;
border: 1px solid black;
margin:5px; padding:5px;
}
.menuLocal li a span{ float:left; display:block;
                                   -webkit-border-radius: 8px;
-moz-border-radius: 8px;
border-radius: 8px;
}
.menuLocal li a:hover{ background-color:rgb(146, 221, 221);
                                     -webkit-border-radius: 8px;
-moz-border-radius: 8px;
border-radius: 8px;
}
/*.menuLocal li a:hover span{background-position:100% -60px;}*/
.menuLocal li a.active, .menuLocal li a.active:hover{ font:12px Verdana, Arial, Helvetica, sans-serif; color:rgb(255,255,255);}
.menuLocal li a.active span, .menuLocal li a.active:hover span{}


    </style>
	<script type="text/javascript">
	$(function() {
		$( "#tabs" ).tabs();
	});


	    $("#tabsAdv").tabs();

	
	</script>
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
            <%if eleexiste=true then %>
            <div class="sb-box">
                <div class="sb-box-inner content">
                    <div class="header">
                        <h3><%=fulano.nome %></h3>
                        <ul class="tabs">
                            <li class="active">
                                <a href="main.asp" hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>
                    </div>

                </div>



                    <div id="tabs">
                    <ul>
                        <li>
                           <a href="#tabs1">     
                               <img src="/Content/images/ico_empMas.png" style="width: 20px;height:20px" alt="" /> <br />                        
                            Dados do <br />funcionário</a> 
                        </li>
                        <li>
                           <a href="#tabs2">     
                               <img src="/content/images/function-icons/paper_48.png" style="width: 20px;height:20px" alt="" /> <br />                        
                            Impressos</a> 
                        </li>



                        <li><a href="#tabs3"> <img src="/content/images/function-icons/bus.png"  alt="Vale Transporte" style="width: 20px;height:20px" /> <br />                                                 
                            Vale <br />Transporte
                            </a>
                        </li>

                        <li><a href="#tabs4"> <img src="/content/images/function-icons/adianta.png"  alt="Vale Transporte" style="width: 20px;height:20px" /> <br />                                                 
                           Adiantamentos





                            </a>
                        </li>

                        <li><a href="#tabs5"> <img src="/content/images/function-icons/money.png"  alt="Vale Transporte" style="width: 20px;height:20px" /> <br />                                                 
                           Salário
                            </a>
                        </li>
                        <li><a href="#tabs6"> <img src="/content/images/function-icons/13sal.png"  alt="Vale Transporte" style="width: 20px;height:20px" /> <br />                                                 
                          13° Salário
                            </a>
                        </li>
                        <li><a href="#tabs7"> <img src="/content/images/function-icons/warning_48.png"  alt="férias" style="width: 20px;height:20px" /> <br />                                                 
                          faltas
                            </a>
                        </li>

                        <li><a href="#tabs8"> <img src="/content/images/function-icons/ferias2.png"  alt="férias" style="width: 20px;height:20px" /> <br />                                                 
                          Férias
                            </a>
                        </li>

                        <li><a href="#tabs9"> <img src="/content/images/function-icons/circle_orange.png"  alt="Vale Transporte" style="width: 20px;height:20px" /> <br />                                                 
                          Advertências
                            </a>
                        </li>
                        <li><a href="#tabs10"> <img src="/content/images/function-icons/circle_orange.png"  alt="Vale Transporte" style="width: 20px;height:20px" /> <br />                                                 
                         Suspensão
                            </a>
                        </li>
                        <li><a href="#tabs11"> <img src="/content/images/function-icons/cancel_48.png"  alt="Vale Transporte" style="width: 20px;height:20px" /> <br />                                                 
                          Afastamento
                            </a>
                        </li>
                    </ul>

                        <!-- TAB Principal-->

                        <div id="tabs1">  
                            <ul class="menuLocal">
                                <li><a href="empregado_lanca_falta.asp?ID=<%=funcID %>"><span>Lançar falta</span></a></li>
                                <li><a href="empregado_ficha_edit.asp?ID=<%=funcID %>"><span>Editar dados do funcionário</span></a></li>
                                <li><a href="contrato_edit.asp?ID=<%=funcID %>"><span>Alterar dados do contrato</span></a></li>
                                <li><a href="contrato_edit.asp?ID=<%=funcID %>"><span>Alterar Cargo / salário</span></a></li>    
                                <li><a href="contrato_edit.asp?ID=<%=funcID %>" style="outline: none; background-color:#E6B8B8"><span>Demitir funcionário</span></a></li>                                                               
                            </ul>

                        
                            <br clear="all" />
                            
                            <div id="ficha"  class="sb-box-inner content" style="width:49%; float:left">
                                <div class="header">
                                    <h3 > Dados cadastrais</h3>
                                    <ul class="tabs">
                                        <li class="active" >
                                                <a href="empregado_ficha_edit.asp?ID=<%=funcID %>" hidefocus="true" style="outline: none; background-color:#E6B8B8">alterar dados</a>
                                        </li>
                                    </ul>
                                </div>
                                 
                                <table width="100%" class="infotable" >
                                    <tr>
                                        <td colspan="2"><span class="enunciado">Nome:</span><br />
                                            <%=fulano.nome %>
                                            <%
                                                dataExperiencia = FormatDateTime(essecontrato.PeriodoExperienciaID,2)
                                                dataExperiencia = day(essecontrato.PeriodoExperienciaID) & "/" &  month(essecontrato.PeriodoExperienciaID) & "/" & year(essecontrato.PeriodoExperienciaID)
                                                
                                                diferenca = datediff("d",  dataExperiencia, now )
                                                if diferenca <0 then 
                                                    response.Write " (em experiencia até " & dataExperiencia  & ")" & FormatDateTime(data2,2) & " ...  " & diferenca
                                                else
                                                         response.Write " (fim experiencia em:  " & dataExperiencia & ")" & " ...  " & data2
                                                end if 
                                                
                                                  %>
                                        </td>
                                        <td><span class="enunciado">Status:</span><br />
                                            <%if fulano.RegistroAtivo then response.Write "Ativo" else response.Write "Inativo"%>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span class="enunciado">Admissão:</span><br />
                                            <%=FormatDateTime(essecontrato.DataAdmissao,2) %>
                                        </td>
                                        <td><span class="enunciado">Função:</span><br />
                                            <%=essecontrato.TipoOcupacaoID%>
                                        </td>
                                        <td><span class="enunciado">Salário:</span><br />
                                            <%=formatcurrency(essecontrato.Salario,2)%>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span class="enunciado">RG:</span><br />
                                            <%=fulano.RG %><%=fulano.OrgaoEmissorRG  %>
                                        </td>
                                        <td><span class="enunciado">CPF:</span><br />
                                            <%=fulano.cpf%>
                                        </td>
                                        <td><span class="enunciado">Carteira de Trabalho:</span><br />
                                            <%=fulano.CarteiraTrabalho%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span class="enunciado">PIS:</span><br />
                                            <%=fulano.PIS %>
                                        </td>
                                        <td><span class="enunciado">Data Cad. PIS:</span><br />
                                            <%=fulano.DataCadPIS%>
                                        </td>
                                        <td><span class="enunciado">Celular:</span><br />
                                            <%=fulano.TelefoneCelular%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><span class="enunciado">endereço:</span><br />
                                            <%=fulano.Logradouro %>, <%=fulano.Numero  %>  <%=fulano.Complemento  %> 
                                        </td>
                                        <td><span class="enunciado">Bairro:</span><br />
                                            <%=fulano.Bairro%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span class="enunciado">Cidade / UF:</span><br />
                                            <%=fulano.cidade %>
                                        </td>
                                        <td><span class="enunciado">Estado:</span><br />
                                            <%=fulano.Estado %>
                                        </td>
                                        <td><span class="enunciado">CEP:</span><br />
                                            <%=fulano.CEP%>
                                        </td>
                                    </tr>
                                    

                                </table>
                            </div>
                            <div id="opcoes"  class="sb-box-inner content"  style="width:49%;">
                                <div class="header">
                                    <h3> Notificações</h3>
                                    <ul>
                                        <li class="active" >
                                                <a href="empregado_notificacoes.asp?ID=<%=funcID %>" hidefocus="true" style="outline: none; background-color:#E6B8B8">configurações</a>
                                        </li>
                                    </ul>
                                    </div>
                                   <ul class="listaNormal">
                                       <li class="listaNormal">Essa lista se destina a mostrar ações que o empregador deve tomar com relação ao funcionário selecionado.</li> 
                                       <li class="listaNormal">MAS para efeitos de depuração do sistema,</li> 
                                        <li class="listaNormal">estou usando-a para retornar os valores referentes ao holerite do presente mês, quais sejam:</li> 
                                       <li class="listaNormal">

                                           
                                           
                                           
                                           <%'essemes=month(now)
                                             '  esseano=year(now)
                                               
                                             ' response.Write fulano.calculaSalarioDoMes(essemes,esseano) %>
                                       </li>
                                    </ul>
                                
                            <span style="color:aquamarine"
                            </div>
                            <br clear="all" />
                            <hr />
                            <div  class="sb-box-inner content"  style="width:100%;">
                                <div class="header">
                                    <h3> Histórico contratual</h3>
                                    </div>

                                <table width="100%">
                                    <tr>
                                        <td>Coisa</td>
                                    </tr>
                                </table>
                            
                            </div>
                        </div>

<!--  fim principal-->
                        <!--  impressos -->
                        <div id="tabs2">                            

				            <div class="sb-box-inner content">
					            <div class="header">
						            <h3>DUCUMENTOS PARA IMPRESSÃO</h3>
					            </div>
                                <div id="Div4" class="message AttentionExp" style="margin:27px; width:360px;">
                                         <b>Atenção!<br /></b> <b>IMPRIMA</b> os documentos listados abaixo, peça para seu empregado assinar e os guarde com muito cuidado!<br />
                                        Eles serão de suma importância em caso de eventual processo trabalhista do funcionário contra você.
                                </div>
                                <div class="bcont">
						            <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							            <tbody>
                                            <%
                                            '<!--
                                            '    DEVEM SER ADICIONADAS AO OBJETO CONTRATO:
                                            '        1- bolImrimiuReciboCT
                                            '        2- bolImprimiuModeloCT
                                            '        3- bolImrpimiuContrato
                                             '       4- bolImprimiuSolicitacaoVT
                                             '       5- bolImprimiuAbreMaoVT
                                             '       6- bolVeioDeAgenciaDeTrabalho (e coletar dados da agencia de trabalho...)
                                             '     
                                             '   ELES DEVEM SER FALSE POR DEFAULT E VIRAM TRUE QUANDO É IMPRESSO O RESPECTIVO ITEM
                                             '   
                                             '   --> %>
								            <tr>
									            <th>
										            <a href="prtFolhaFaltas.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" target="_blank">IMPRIMIR FOLHA DE PONTO</a>
									            </th>
                                            </tr>

								            <tr>
									            <th>
										            <a href="prtRecCT.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" target="_blank">IMPRIMIR RECIBO DA CARTEIRA DE TRABALHO </a>
									            </th>
                                            </tr>

								            <tr>
									            <th>
										            <a href="prtModCartTrab.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" target="_blank">IMPRIMIR MODELO PARA PREENCHIMENTO DA CARTEIRA DE TRABALHO </a>
									            </th>
                                            </tr>

                                            <tr>
                                                <th>
										            <a href="prtCT.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" target="_blank">IMPRIMIR CONTRATO DE TRABALHO</a>
									            </th>
                                            </tr>

                                            <tr>
                                                <th>
										            <a href="prtSolVT.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" target="_blank">IMPRIMIR SOLICITAÇÃO DE VALE TRANSPORTE (CASO FOR UTILIZAR)</a>
									            </th>
                                            </tr>

                                            <tr>
                                                <th>
										            <a href="prtDecNVT.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" target="_blank">DECLARAÇÃO DE NÃO BENEFICIÁRIO DO VALE-TRANSPORTE (deverá ser assinada pelo empregado caso ele abra mão de receber o vale transporte ou durma no emprego)</a>
									            </th>
								            </tr>
                                            <%if esseContrato.bolVeioDeAgenciaDeTrabalho = true then %>
                                            <tr>
                                                <th>
										            <a href="ptrCompAg.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" target="_blank">DECLARAÇÃO DE COMPROMISSO DA AGÊNCIA</a>
									            </th>
								            </tr>
                                            <%end if %>
							            </tbody>
						            </table>
					            </div>
                            </div>

                        </div>
                        <!--  fim impressos -->
                        <!--   vale transporte -->
                        <div id="tabs3">   
				            <div class="sb-box-inner content">
                                <div class="header">
						            <h3>VALE TRANSPORTE</h3>
					            
                                    <ul class="tabs">
                                        <li class="active" >
                                                <a href="prtDecNVT.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" hidefocus="true" style="outline: none; background-color:#E6B8B8"  target="_blank">DECLARAÇÃO DE NÃO BENEFICIÁRIO </a>
                                        </li>
                                        <li class="active" >
                                                <a href="prtSolVT.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" hidefocus="true" style="outline: none; background-color:#E6B8B8"  target="_blank">DECLARAÇÃO DE CONCESSÃO</a>
                                        </li>
                                        <li class="active" >
                                                <a href="empregado_novoVT.asp?novoContratoID=<%=novoContratoID %>&funcID=<%=funcID %>" hidefocus="true" style="outline: none; background-color:#E6B8B8">NOVO VALE TRANSPORTE</a>
                                        </li>

                                    </ul>
                                 </div>
                                <div class="bcont">  
                                  <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
                                     

                            <%
                                set myVales = fulano.listaValeTransporte(2014)
                                if (myVales.bof and myVales.eof) then
                                    response.Write "sem vales"
                                else
                                    response.Write "<thead><tr><th>Mês Referência</th><th>Período Início</th><th>Período Fim</th><th>Valor</th><th class=""small""></th></tr></thead><tbody>"

                                    while not myVales.eof
%>
                                      <tr>
                                          <td><%=myVales("MesReferencia") %>/<%=myVales("anoReferencia") %></td>
                                          <td><%=myVales("periodoInicio") %></td>
                                          <td><%=myVales("periodofim") %></td>
                                          <td><%= formatcurrency(myVales("Valor"),2) %></td>
                                          <td class="small">
                                              
                                               <ul>
                                                        <li><a href="empregado_novoVT.asp?vtID=<%=myVales("ID") %>&funcID=<%=funcID %>&modo=alterar">EDITAR</a><br /></li>
                                                        <li><a href="prtRecValeTransporte.asp?vtID=<%=myVales("ID") %>&funcID=<%=funcID %>" target="_blank">EMITIR RECIBO</a><br /></li>
                                                   </ul>
                                             
                                            
                                      
                                            </td>

                                      </tr>
                                      <%       
                                        myVales.movenext
                                    wend
                                end if
                                myVales.close
                                set myVales=nothing
                                
                                 %>  </tbody>
                                      </table>
                                </div>
				            </div>                  
                        </div>
                         <!--  fim vale transporte -->
                             <!--  Adiantamentos e Vales -->
                        <div id="tabs4">     
                                                
                                                <div id="Adiantamentos"  class="sb-box-inner content">
                                                    <div class="header">
                                                        <h3>Registro de Adiantamentos</h3>
                                                        <ul>
                                                            <li class="active" >
                                                                    <a href="empregado_lanca_adiantamento.asp?ID=<%=funcID %>" hidefocus="true" style="outline: none; background-color:#E6B8B8">LANÇAR ADIANTAMENTO</a>
                                                            </li>
                                                        </ul>
                                                        </div>
                    <%
                        

                                            set meusAdiantamentos = fulano.getRecordsetOfAdiantamentos()
                                            if not (meusAdiantamentos.BOF and meusAdiantamentos.EOF) then
                        %>
                                                    <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							                    <thead>
								                    <tr>
                                                        <th>
										                   Valor
									                    </th>
                                                        <th>
										                    Mês Referência
									                    </th>
                                                        <th>
										                    Ano Referência
									                    </th>
									                    <th class="small">
									                    </th>
								                    </tr>
							                    </thead>
							                    <tbody>

                                                    <%
    
                                                while not meusAdiantamentos.EOF
                               
                                                        %>
                                                    <tr>

                                                        <td><%= formatCurrency( meusAdiantamentos("valor"),2 ) %></td>
                                                        <td><%
                                                            mesSelecionado=meusAdiantamentos("mesReferencia")
                                                            Select case mesSelecionado
                                                                        case 1
                                                                            response.Write " janeiro de "
                                                                        case 2
                                                                                response.Write  " fevereiro de "
                                                                        case 3
                                                                            response.Write  " mar&ccedil;o de "
                                                                        case 4
                                                                            response.Write  " abril de "
                                                                        case 5
                                                                            response.Write  " maio de "
                                                                        case 6
                                                                            response.Write  " junho de "
                                                                        case 7
                                                                            response.Write " julho de "
                                                                        case 8
                                                                            response.Write  " agosto de "
                                                                        case 9
                                                                            response.Write  " setembro de "
                                                                        case 10
                                                                             response.Write " outubro de "
                                                                        case 11
                                                                            response.Write " novembro de "
                                                                        case 12
                                                                             response.Write  " dezembro de "
                                                            end select

                                                            %></td>
                                                        <td><%=meusAdiantamentos("anoReferencia")%></td>
                                                        <td class="small"></td>
                                                    </tr>
                                                    <%

                                                    meusAdiantamentos.movenext
                                                wend
                                            else
                                                response.Write "Não há adiantamentos"
                                            end if
                                              meusAdiantamentos.close
                                              set meusAdiantamentos =nothing
                                             %>            
                                               </tbody>
                                            </table>
                                                </div>    


                            
                            
                                                
                        </div>
                        <!--  fim Adiantamentos e Vales -->

                         <!--  Salário°-->
                        <div id="tabs5">     
                                      Salário             
                        </div>
                        <!-- fim Salário°-->
                        <!--  13°-->
                        <div id="tabs6">     
                               13° Salário                    
                        </div>

                         <!-- fim 13°-->
                         <!-- faltas-->
                        <div id="tabs7">  
                            <div id="faltas"  class="sb-box-inner content">
                                <div class="header">
                                    <h3>Registro de Faltas</h3>
                                    <ul>
                                        <li class="active" >
                                                <a href="empregado_lanca_falta.asp?ID=<%=funcID %>" hidefocus="true" style="outline: none; background-color:#E6B8B8">LANÇAR FALTA</a>
                                        </li>
                                    </ul>
                                    </div>
<%
                        

                        set minhasFaltas = fulano.getRecordsetOfFaltas()
                        if not (minhasFaltas.BOF and minhasFaltas.EOF) then
    %>
                                <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							<thead>
								<tr>
                                    <th>
										Data da Falta
									</th>
                                    <th>
										Tipo
									</th>
                                    <th>
										Comentários
									</th>
									<th class="small">
									</th>
								</tr>
							</thead>
							<tbody>

                                <%
    
                            while not minhasFaltas.EOF
                               
                                    %>
                                <tr>

                                    <td><%= formataDatas( minhasFaltas("DataFalta") ) %></td>
                                    <td><%if minhasFaltas("tipofaltaID")=2 then response.Write "Falta Justificada" else response.Write "Falta Não Justificada"  %></td>
                                    <td><%if len(minhasFaltas("Comentarios"))>0  then response.Write server.HTMLEncode(minhasFaltas("Comentarios"))  else response.Write "-"  %></td>
                                    <td class="small"></td>
                                </tr>
                                <%

                                minhasFaltas.movenext
                            wend
                        else
                            response.Write "Não há faltas"
                        end if
                          minhasFaltas.close
                          set minhasFaltas =nothing
                         %>            
                           </tbody>
                        </table>
                            </div>    



                                                                 
                        </div>

                         <!-- fim faltas-->
                         <!-- ferias-->
                        <div id="tabs8">  
                            Férias                          
                        </div>
                        <!--fim ferias-->
                        <!--advertencias-->
                        <div id="tabs9">                               
                              <div id="advertencias"  class="sb-box-inner content">
                                <div class="header">
                                    <h3>Registro de Advertências</h3>
                                    <ul>
                                        <li class="active" >
                                                <a href="empregado_lanca_advertencia.asp?ID=<%=funcID %>" hidefocus="true" style="outline: none; background-color:#E6B8B8">NOVA ADVERTÊNCIA</a>
                                        </li>
                                    </ul>
                                    </div>                          
                            
                                                      
<%
                        set minhasAdvertencias = fulano.getRecordsetOfAdvertencia()
                        if not (minhasAdvertencias.BOF and minhasAdvertencias.EOF) then
    %>
                                <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							<thead>
								<tr>
                                    <th>
										Titulo
									</th>
                                    <th>
										Data Cadastro
									</th>
                                    <th>
										Mês / Ano Referência
									</th>
                                    <th>
										Testemunha
									</th>
                                    <th>
										RG
									</th>
									<th class="small">
									</th>
								</tr>
							</thead>
							<tbody>

                                <%
    
                            while not minhasAdvertencias.EOF
                               
                                    %>
                                <tr>
                                    <td><%=  minhasAdvertencias("titulo") %></td>
                                    <td><%= formataDatas( minhasAdvertencias("data") ) %></td>
                                    <td><%=  minhasAdvertencias("mesReferencia") %> / <%=  minhasAdvertencias("anoReferencia") %> </td>
                                    <td><%=  minhasAdvertencias("testemunha") %></td>
                                    <td><%=  minhasAdvertencias("rgtestemunha") %></td>
                                    <td class="small">
										<a href="prtAdvertencia.asp?funcID=<%=funcID %>&vtID=<%=  minhasAdvertencias("ID") %>" target="_blank" title="imprimir"><img src="/Content/images/function-icons/printer-icon.png" style="border-width:0px;height:50%" alt="Imprimir" title="imprimir"/></a>
										<div class="opmenu">

											<div class="clear">
											</div>
											<div class="foot">
											</div>
										</div>
									</td>

                                </tr>
                                <%

                                minhasAdvertencias.movenext
                            wend
                        else
                            response.Write "Não há advertências"
                        end if
                        minhasAdvertencias.close
                        set minhasAdvertencias =nothing
                         %>            
                           </tbody>
                        </table>
                                                              
                          </div>  
                            
            <div id="DivminhasAdvertencias2" class="message informationExp" style="margin:27px; width:785px;">
                                <span class="strong">Informativo:</span> A declaração serve para chamar a atenção do funcionário, a fim de que se cumpra uma exigência.
                                Clique em <b>NOVA ADVERTÊNCIA</b> para gerar uma declaração.
                        </div>                               
                            
                            
                             
                        </div>
                        <!--fim advertencias-->
                        <!--suspensoes-->
                         <div id="tabs10">

                                          <div id="suspensoes"  class="sb-box-inner content">
                                            <div class="header">
                                                <h3>Registro de Suspensões</h3>
                                                <ul>
                                                    <li class="active" >
                                                            <a href="empregado_lanca_suspensao.asp?ID=<%=funcID %>" hidefocus="true" style="outline: none; background-color:#E6B8B8">Criar carta de suspensão</a>
                                                    </li>
                                                </ul>
                                                </div>                          
                            
                                                      
            <%
                                    set suspensao = fulano.getRecordsetOfSuspensao()
                                    if not (suspensao.BOF and suspensao.EOF) then
                %>
                                            <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							            <thead>
								            <tr>
                                                <th>
										            Titulo
									            </th>
                                                <th>
										            Data Cadastro
									            </th>
                                                <th>
										           Início - Fim
									            </th>
                                                <th>
										            Testemunha
									            </th>
                                                <th>
										            RG
									            </th>
									            <th class="small">
									            </th>
								            </tr>
							            </thead>
							            <tbody>

                                            <%
    
                                        while not suspensao.EOF
                               
                                                %>
                                            <tr>
                                                <td><%=  suspensao("titulo") %></td>
                                                <td><%= formataDatas( suspensao("data") ) %></td>
                                                <td><%= formataDatas( suspensao("dataInicio") )%> / <%= formataDatas( suspensao("dataFim") )%> </td>
                                                <td><%=  suspensao("testemunha") %></td>
                                                <td><%=  suspensao("rgtestemunha") %></td>
                                                <td class="small">

                                                    <a href="prtSuspensao.asp?ID=<%=funcID %>&vtID=<%=suspensao("ID")%>" target="_blank" title="Imprimir carta de suspensão"><img src="/Content/images/function-icons/printer-icon.png" style="border-width:0px;height:30%; margin:3px;" alt="Imprimir" title="imprimir"/></a>
                                                    <img src="/Content/images/function-icons/close-icon.png" style="border-width:0px; margin:3px;height:30%; " alt="Fechar" title="Fechar" />

                                                </td>
                                            </tr>
                                            <%

                                            suspensao.movenext
                                        wend
                                    else
                                        response.Write "Não há suspensões"
                                    end if
                                    suspensao.close
                                    set suspensao =nothing
                                     %>            
                                       </tbody>
                                    </table>
                                                              
                                      </div>  



           <div id="Divsuspensao2" class="message informationExp" style="margin:27px; width:790px;">
                                <span class="strong">Informativo:</span> A suspensão evita que o empregado persista no procedimento incorreto. Será suspenso do trabalho para que o empregado mude a postura.<span></span>
                                <span class="vazio" style="color:red; margin-top: 12px;">Cuidado:</span> O sistema fará o desconto dos dias suspensos automaticamente.
                        </div>     









                         </div>
                        <!--fim suspensoes-->
                        <!--afastamento-->
                        <div id="tabs11">    
                             

                        <!--fim afastamento-->
                    </div>


            </div>
            <%
                
                else
                    response.Write "<h1>FUNCIONÁRIO NÃO LOCALIZADO</H1>"
                end if %>
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
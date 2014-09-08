<!--#include file="conecta_bd.asp"--><%
    dim  funcID, novoContratoID

    funcID= request.QueryString("funcID")'limpaRequestForm("funcID")
    novoContratoID = request.QueryString("novoContratoID")'limpaRequestForm("novoContratoID")
    'response.Write "1-" & limpaRequestForm("funcID") & " 2-" &limpaRequestForm("novoContratoID")
   ' if request.form("funcID")="" then response.Redirect "main.asp"
  '  if request.form("novoContratoID")="" then response.Redirect "main.asp"

    if request.QueryString("funcID")="" then response.Redirect "main.asp"
    if request.QueryString("novoContratoID")="" then response.Redirect "main.asp"

dim fulano, eleexiste
eleexiste=false
set fulano = new empregado
if len(funcID)>0 then    
    fulano.ID=funcID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        nome=fulano.Nome
    end if
end if

    'Fazer página de retorno com opções vem visíveis para Imprimir o contrato de trabalho, e preencher o vale transporte
    'aliás, remodelar totalmente a página para fazer  uma "dash board" do funcionário.


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

<script type="text/javascript">

    $(document).ready(function () {

    });


</script>




<div id="adminbar">

        <b>Empregado Selecionado</b>: <b style="color:Red;font-size:20px;"><%=nome %></b><img src = "/Content/images/user.jpg" alt="<%=nome %>" style="width: 25px; top: -3px;" />


</div>
				
			</div>
		
			<!-- Header [end] -->
			




			<!-- grid layout [begin] -->

			

    <div class="container_12">
         <%eleexiste=true
             avisoSucesso=true
             if eleexiste then %>
		<div class="grid_12">
            

					<%if avisoSucesso then %>	
                <div id="sucesso" class="message success"><span class="strong">SUCESSO!</span> Registro salvo com sucesso!<br /> Veja abaixo os próximos passos.</div>
			        <%end if %>


            <br />
            
            
            
                <div class="sb-box" style="clear:both;">
				    <div class="sb-box-inner content">
					    <div class="header">
						    <h3>Contrato</h3>
					    </div>
					    <div class="bcont">
                            <%dim thereisAContrato
                                set esseContrato=new contrato
                                thereisAContrato = esseContrato.getFkrtContrato(funcID, "true", novoContratoID)
                                if thereisAContrato then
                                 %>
                                <table class="infotable" cellspacing="0" cellpadding="0" width="100%">

                                    <tbody>
                                    
                                        <tr>
                                            <td><%=nome %></td>
      
                                            <td style="text-align:center;"><%=esseContrato.TipoOcupacao %></td>                                           
                                        </tr>
                                        
                                    </tbody>
						        </table>
<div class="sb-box" style="clear:both">
				<div class="sb-box-inner content">
					<div class="header">
						<h3>PRÓXIMOS PASSOS</h3>
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
<%
    else
        response.Write "<h1  class=""message AttentionExp"">Não foi encontrado nenhum contrato</h1>"
    
    end if %>



                            
					    </div>
				    </div>
			    </div>
            
            
		</div>
		<div class="clearingfix">
		</div>
	</div>

    

                            <div id="Div3" class="message AttentionExp" style="margin:27px; width:360px;">
                                     <b>Proximo passo:<br /></b> Clique no icone <b>"Declarações"</b> no menu principal para gerar a declaração de VT.
                            </div>

                            <div id="Div2" class="message informationExp" style="margin:27px; width:360px; height:73px;">
                            <span class="strong">Informativo:</span>
                                 Clique no icone <img src="/Content/images/action.png" alt="acao"  /> no lado direito desta página para:
                                 <ul class="expUL" style="margin-top:3px;">
	                                    <li class="expLI" style="margin-left:-22px">Visualizar o Contrato de trabalho.</li>
	                                    <li class="expLI" style="margin-left:-22px">Ver o Modelo da Carteira de trabalho.</li>
                                </ul>
                                <br />
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
<%set fulano=nothing
    set esseContrato=nothing
     %>
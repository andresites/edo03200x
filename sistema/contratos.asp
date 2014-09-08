<%
 dim arDadosFunc, nome, funcID,arDadosFunc2 
if len(session("temp_func"))>0 then
    if instr(1, session("temp_func"),"\")>1 then
        arDadosFunc=split(session("temp_func"),"|")   
        funcID=arDadosFunc(0)
        nome=arDadosFunc(1)
    end if
    session("temp_func")=""
end if
if len(request.QueryString("funcID"))>0 then funcID = request.QueryString("funcID")
if len(request.QueryString("nome"))>0 then nome = request.QueryString("nome")
if not((funcID="") OR (nome="")) then
    'se precisar pegar os dados do cadastro, usar esse espaço
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

    
<title>
	
	Empregados

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

<!--#include file="inc_header_pagina.asp"-->

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




<div id="adminbar">

        <b>Empregado Selecionado</b>: <b style="color:Red;font-size:20px;"><%=nome %></b><img src = "/Content/images/user.jpg" alt="Teste da Silva Prado" style="width: 25px; top: -3px;" />


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
									<img src="/content/images/function-icons/paper_pencil_48.png" alt="" /><span>Declarações</span></a><div
										class="tooltip">
										Gere Declarações em Geral</div>
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
										Lance alterações de cargos e salários</div>
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
            <div>
                <a href="/Sistema" style="float:right; margin-right:10px; margin-bottom:10px">Voltar a pagina anterior</a>
            </div>
						
                <div id="sucesso" class="message success"><span class="strong">SUCESSO!</span> Registro salvo com sucesso!</div>
			

			
            
			<div class="sb-box" style="clear:both;">
				<div class="sb-box-inner content">
					<div class="header">
						<h3>Contratos</h3>
						<ul class="tabs">
                        
                            <li class="active"><a href="/Sistema/Contratos/Edit" style="background:#E0D9D9">Emitir Novo Contrato</a></li>
							<li class="active"><a href="/Sistema/FolhasPagamento/Edit" style="background:#E0D9D9">Folha de Pagamento</a></li>
							<li class="active"><a href="/Sistema/Empregados/Edit" style="background:#E0D9D9">Novo Empregado</a></li>
                        
						</ul>
					</div>
					<div class="bcont">
                        
                                <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							    <thead>
								    <tr>
									    <th>Data de Admissão</th>
									    <th>Contrato Ativo</th>
                                        <th>Ocupação</th>
									    <th class="small"></th>
								    </tr>
							    </thead>
							    <tbody>
								    
								    <tr>
									    <td>05/03/2014</td>
									    <td> Sim </td>
                                        <td>Empregado Dom&#233;stico(a)</td>                           
									    <td class="small">
										    <a class="action" href="#"></a>
										    <div class="opmenu">
											    <ul>
											        <li><a href="/Sistema/Contratos/Print/2">Visualizar Contrato</a></li>
											        <li><a href="/Sistema/Contratos/Model/2">Modelo de Carteira de Trabalho</a></li>
											    </ul>
											    <div class="clear">
											    </div>
											    <div class="foot">
											    </div>
										    </div>
									    </td>
								    </tr>
								    
							    </tbody>
						    </table>
                        
						<!-- table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							<thead>
								<tr>
									<th>
										Nome
									</th>
									<th>
										CPF
									</th>
                                    <th>
                                        Há contrato ativo?
                                    </th>
									<th class="small">
									</th>
								</tr>
							</thead>
							<tbody>
								
								<tr>
									<td>
										<a href="/Sistema/Empregados/Select/1">jos&#233; da silva</a>
									</td>
									<td>
										093.141.566-72      
									</td>
                                    <td>
                                        
                                            <span class="bold">SIM</span> 
                                        
                                    </td>
                           
                                    
									<td class="small">
										<a class="action" href="#"></a>
										<div class="opmenu">
											<ul>
												<li><a href="/Sistema/Empregados/1/AlteracoesCargoSalario/List">Altera&#231;&#245;es de Cargo ou Sal&#225;rio</a>
												<li><a href="/Sistema/Empregados/Edit/1">Editar</a></li -->
												<!-- TODO: Alterar para Soft delete -->
												
												<!-- li><a href="/Sistema/Empregados/Select/1">Selecionar</a></li>
											</ul>
											<div class="clear">
											</div>
											<div class="foot">
											</div>
										</div>
									</td>
                                    
								</tr>
								
								<tr>
									<td>
										<a href="/Sistema/Empregados/Select/2">Teste da Silva Prado</a>
									</td>
									<td>
										125.518.068-44      
									</td>
                                    <td>
                                        
                                            <span class="bold">SIM</span> 
                                        
                                    </td>
                           
                                    
									<td class="small">
										<a class="action" href="#"></a>
										<div class="opmenu">
											<ul>
												<li><a href="/Sistema/Empregados/2/AlteracoesCargoSalario/List">Altera&#231;&#245;es de Cargo ou Sal&#225;rio</a>
												<li><a href="/Sistema/Empregados/Edit/2">Editar</a></li -->
												<!-- TODO: Alterar para Soft delete -->
												
												<!-- li><a href="/Sistema/Empregados/Select/2">Selecionar</a></li>
											</ul>
											<div class="clear">
											</div>
											<div class="foot">
											</div>
										</div>
									</td>
                                    
								</tr>
								
							</tbody>
						</table -->
					</div>
				</div>
			</div>
            <br />
            
            
            
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

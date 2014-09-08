


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	

<meta http-equiv="content-type" content="text/html; charset=windows-1251" />
<link rel="stylesheet" type="text/css" href="Content/css/styles.css" media="screen" />
<link rel="stylesheet" type="text/css" href="Content/Site.css" media="screen" />
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
				

<!-- Logo [begin] -->
<div id="logo"><a href="/Sistema">Home</a></div>
<!-- Logo [end] -->



<div id="adminbar">Bem-vindo, <strong> <a href="/Sistema/Cadastro/Edit">ANDRE L DA SILVEIRA</a></strong>,
Sua Conta Expira em: 23/04/2014
	<a class="logout" href="/Sistema/Home/LogOut">Sair</a>
    <a class="logout" href="/">Voltar ao site</a>
</div>
			</div>

            

            <div class="container_12">
                

                <div style="background: url('..Content/images/onebit-icons/warning.png') no-repeat scroll 10px 50% #F9F9E5;border: 1px solid #E8E3AA;color: #828400;border-radius: 5px 5px 5px 5px;margin: 0 0 15px;padding: 6px 10px 10px 45px;position: relative;height:33px;" >
		            <div style="float:left;padding-top: 8px;"><span class="strong">Atenção!</span> Sua conta expira em 23/04/2014. Contrate crédito de atendimento.</div>
                    <div id="addcred" class="paddingAdicionar" style="float:right;">
                        <table border="0">
                            <tr>
                                <td><a href="/Sistema/Venda/List"><img src="Content/images/Plus_48.png" alt="Adicionar Créditos" /></a></td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td><a href="/Sistema/Venda/List" style="color: #000000;text-decoration: none;font-size: 14px;"><b>Contratar Créditos</b></a></td>
                            </tr>
                        </table>
                    </div>
	            </div>

                <h3 class="head2" style="margin-bottom: -51px">Olá, ANDRE L DA SILVEIRA <a href="/Sistema/Cadastro/Edit" style="font-size:12px;">(Meus dados)</a></h3><br /><br /><br />
                <div class="content">
                    <div class="bcont">

                        <table>

                                        <tr>
                                    
                                        <div id="Div1" class="message informationExp" style="margin:27px; width:380px;">
                                            <span class="strong">Informativo:</span> Para cadastrar um <b>novo empregado</b> tenha em mãos:<br /> <b>RG, CPF,PIS, Endereço e a Carteira de Trabalho!</b>
                                        </div>                                    
                                        <td><div style="padding-right: 25px; text-align:center"><a href="/Sistema/Empregados/Edit" title="Novo Empregado"><img src = "Content/images/Anonimo.png" alt="Novo Empregado" style="margin-bottom: 5px; margin-top: 1px;"  /></a><br /><b style="color:Red;">Novo Empregado</b></div></td>
                                    
                                    
                                    <td id="funcionario_1" style="padding-right: 25px; text-align:center; class="small">
                                    
                                               
                                            <!-- <a class="action" href="#" style="background:url('Content/images/ico_empMas.png') no-repeat scroll 50% 50% transparent;width:98px;height:98px; margin-bottom: -15px;"></a> -->
                                            <a href="/Sistema/Empregados/Select/1" style="background:url(&#39;Content/images/ico_empMas.png&#39;); background-attachment: scroll; background-color: transparent; width: 98px; height: 98px; margin-bottom: -15px; outline: none; background-position: 50% 50%; background-repeat: no-repeat no-repeat; display: block;"> </a>
                                                                                    
                                        <div class="opmenuindex">
                                                                        
                                        <ul>
                                            
                                                <li><a href="/Sistema/Empregados/Select/1">Selecionar</a></li>
                                                                                    
                                            
							                <!-- TODO: Alterar para Soft delete -->
							                
						                </ul>                            
						                <div class="clear"></div>
						                <div class="foot"></div>
    					            </div>

                                <!-- a href="/Sistema/Empregados/Select/1" title="jos&#233; da silva"><img src = "Content/images/user.jpg" alt="jos&#233; da silva"  /></a --><br />
                                

                                jos&#233; da silva
                                
                               </td>

                                
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
                                
                                    <tr>                                    
                                        <td>jos&#233; da silva</td>
                                        

                                        <td>12/03/2014</td>                                        
                                        <td> - </td>
                                        <td>Jardineiro</td>
                                        <td>1200,00</td>
                                        <td> Sim </td>
									    <td class="small">
										    <a class="action" href="#"></a>
										    <div class="opmenu">
											    <ul>
                                                    <li><a href="/Sistema/Empregados/Edit/1">Alterar Cadastro do Empregado</a></li>
							                        <li><a href="/Sistema/Empregados/1/AlteracoesCargoSalario/List">Alterar Cargo ou Sal&#225;rio</a></li>
                                                    <li><a id="alert" style = "color:red;" href="javascript:void(0);" onclick="desativarfunc(1);">Desligar funcionário</a></li>
												    <!-- TODO: Alterar para Soft delete -->
												    
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



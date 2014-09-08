


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1"><title>
	
	E-Doméstico - Sistema

</title><meta content="text/html; charset=utf-8" http-equiv="Content-Type" /><meta content="text/css" http-equiv="Content-Style-Type" /><link type="text/css" rel="stylesheet" href="Content/css/Site/style.css" /><link type="text/css" rel="stylesheet" href="Content/css/Site/layout.css" />
    <link type="text/css" rel="stylesheet" href="Content/css/jquery-ui-1.8.16.custom.css" />
    <style type="text/css">
        .ui-widget-content {height:300px; }
    </style>


        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>        

        





	    
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function () {

                $("#fecharGratis").mouseover(function () {
                    $("#cadastre_se").hide();
                });

                $("#cadastre_se").click(function () {
                    location.href = href = "cadastro.asp";

                });

            });
	    </script>

	    <!--[if lt IE 7]>
		    <link href="Content/css/Site/ie_style.css" rel="stylesheet" type="text/css" />
	       <script type="text/javascript" src="Content/js/ie_png.js"></script>
	       <script type="text/javascript">
		       ie_png.fix('.png, #header .row-3 .bg-header, #header .row-3 .tail-bot, .content-tail-left, .content-tail-right');
	       </script>
	    <![endif]-->

	    
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
<script type="text/javascript" src="Content/js/jquery.ui.accordion.js"></script>
<script type="text/javascript" src="Content/js/jquery.ui.widget.js"></script>


	<script type="text/javascript" charset="utf-8">
	    $(document).ready(function () {

	        $(function () {
	            $("#accordion").accordion({
	                clearStyle: true
	            });
	        });

	    });
	</script>


</head>
    <body>
            <div class="divTopo">
                <div class="topoHead">
                    <div class="logoFlash" style="margin-right:20px">
			            <a href="/"><img src="Content/images/logo.png" alt="Home" /></a>
                    </div>
                    
    <div id="loggin">
<!--#include file="inc_loginform.asp"-->
            
    </div>

                     <div class="message tip" id="cadastre_se" style="margin-top: 10px;float:left;margin-left:20px">
                        <a  href="javascript:void(0)" style="float:right; width:20px; height:20px" id="fecharGratis"> <img src="Content/images/close.png" alt="fechar"/></a>
                        <span id="gratis" >Grátis! <b>Clique aqui</b></span> Cadastre-se e teste a <b>Solução</b> por 30 dias.
                    </div>
                </div>
                    

                        

                    <!-- div id="divErro" class="message error divErroLogin" >
	                    <span class="strong" >ERRO!</span> 	    
			                    Verifique todos os campos abaixo.
                    </div>
                
                    
                    <form action="/Sistema/Home/LogOn" class="formLogin" id="form-Login" name="form-Login"  method="post">
                        <input id="Email" name="Email" type="text"  value="Login" onblur="if(this.value=='') this.value='Login'" onfocus="if(this.value =='Login' ) this.value=''" class="txtLogin" style="width: 210px;"  />
                        <input id="Senha" name="Senha" type="password"  value="Senha" onblur="if(this.value=='') this.value='Senha'" onfocus="if(this.value =='Senha' ) this.value=''" class="txtLogin" style="width: 110px;"  />
                        <input type="submit" value="Entrar" id="btnEntrar" onclick="Troca();" name="btnEntrar" class="btnLogin"  />
                        <br />
                        <a id="Cadastro" class="lnkLogin" href="../Cadastro/Edit" >Cadastre-se</a> <a id="esqueci" style="padding:0 10px" class="lnkLogin" href="../../Esqueci/Index" >Esqueci minha senha</a>
                    </form -->
            </div>

	    

<body id="page3">
	    <div class="bg">
            <div class="main" style="font-size:15px !important;">
                <div class="contentImgs">
		            <div id="flash">
                        <div class="menuFlash">
<!--#include file="incMenu.asp"-->
                        </div>
		            </div>
                </div>
            </div>
        </div>
		<div class="main" style="font-size:15px;">
			<div id="content">
				<div class="content-tail-left">
					<div class="content-tail-right">
						<div class="content-tail-top" style="padding-top:5px;">
                        <div style="float:right;">
                            <a href="/">Voltar a pagina anterior</a>
                        </div>
                            <div class="padding">
									<br />
									<h3 class="head2">Sistema</h3>
									<p>
                                        Nosso sistema representa uma ferramenta completa para o gerenciamento de seus empregados domésticos, proporcionando facilidade de uso e aderência à legislação trabalhista vigente. 
                                        A partir de uma interface amigável, administre completamente seus empregados, gerenciando contratos, pagamentos e emissão de boletos para recolhimento de impostos. 
                                        Entre as muitas funcionalidades do sistema, temos:
                                    </p>
							        <div id="accordion" >
                                        <h3><a href="#">1) - Gerenciamento de empregados.</a></h3>
                                        <div>
                                            <p>Gerenciamento de informações cadastrais, aquisição de pacotes, notificações e acesso à lista de empregados a partir de uma tela inicial limpa e intuitiva.</p>
                                            <img src="Content/images/inicio.jpg" alt="Inicio"  />
                                        </div>

                                        <h3><a href="#">2) - Contrato detalhado de empregados.</a></h3>
                                        <div >
                                            <p>Cadastre empregados e tenha assim um histórico detalhado das atividades de cada um a partir das funcionalidades do sistema.</p>
                                            <img src="Content/images/ContratodeTrabalho.jpg" alt="Edição do Contrato"  />
                                            <br />
                                            <br />
                                            Caso o EMPREGADOR deseje pagar o FGTS para seu Empregado, deve primeiramente se inscrever no CEI (Cadastro Específico do INSS) como empregador. O sistema o auxiliará a faze-lo conforme abaixo:
                                            <br /><br />
                                            <img src="Content/images/CEI_Contrato.jpg" alt="Edição do Contrato"  />
                                            <br />
                                        </div>

                                        <h3><a href="#">3) - O sistema gera o contrato de trabalho.</a></h3>
                                        <div >
                                            <p>O sistema gera contratos de trabalho a partir de seus dados e dos dados do empregado. Também conte com a visualização de modelos de preenchimento da carteira de trabalho.</p>
                                            <img src="Content/images/contrato.jpg" alt="Edição do Contrato" />
                                        </div>

                                        <h3><a href="#">4) - Menu de fácil manipulação.</a></h3>
                                        <div >
                                            <p>Gerencie seus empregados de maneira rápida e fácil pelo menu: Registre adiantamentos, emita recibos de vale-transporte, controle faltas e suspensões, gere declarações e muito mais! Lembre-se: Só terá acesso ao menu personalizado o empregado que possuir contrato Ativo!</p>
                                            <img src="Content/images/menu.jpg" alt="Menu" />
                                        </div>

                                        <h3><a href="#">5) - Histórico de faltas.</a></h3>
                                        <div >
                                            <p>Controle de faltas e afastamentos, bem como emissão advertências e suspensões! Mantenha o histórico dos casos já registrados e gere relatórios!</p>
                                            <img src="Content/images/faltas.jpg" alt="Faltas e Advertências" />
                                        </div>
                                        <h3><a href="#">6) - Gere holerites de maneira simples.</a></h3>
                                        <div >
                                            <p>Gerar holerites de maneira simples! O sistema calcula o salário a ser pago para o seu empregado, a partir dos registros efetuados no sistema.
		                                       Deixe de lado a complicação de cálculo de impostos, INSS, férias e décimo-terceiro! Conte com o histórico detalhado dos pagamentos feitos aos seus empregados e a emissão de folhas de pagamento detalhadas, para maior controle.
                                            </p>
                                            <img src="Content/images/salario.jpg" alt="Salário e Férias" />
                                            <img src="Content/images/recibodeSalario.jpg" alt="Salário e Férias"  />
                                        </div>
                                    </div>
									<hr /><br />
									É muito mais para sua rapidez, segurança e simplicidade no gerenciamento de seus empregados. Aproveite já todas as vantagens que o eDomestico proporciona a você! 
                                    <br /><br />
                                    <div style="text-align: center;">
                                        <h2>Conheça já nossos <a href="/Planos">planos</a> e faça seu <a href="/Cadastro">cadastro</a>.</h2>
                                    </div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>


    

	    <div class="bottom">
		    <div class="main">
			    <!--==============================footer=================================-->
			    <div id="footer">
				    <div class="padding">
					    <div class="wrapper">
						    <div class="fleft">
							    <!-- a href="#" class="link-bot1">Feed</a> <a href="#" class="link-bot2">Twitter</a -->
						    </div>
						    <div class="fright">
							    <div class="wrapper">
<!--#include file="inc_menubottom.asp"-->
							    </div>
							    <div class="alignright">
								    <span class="reg color-1">Edoméstico</span> &copy; 2011
                                </div>
						    </div>
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>
	    
	    <span style="display: block; position: absolute; font-size: 1em; top: -1000px; left: -1000px;">
		    A
        </span>
    </body>
</html>

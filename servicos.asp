

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1"><title>
	
	E-Doméstico - Soluções

</title><meta content="text/html; charset=utf-8" http-equiv="Content-Type" /><meta content="text/css" http-equiv="Content-Style-Type" /><link type="text/css" rel="stylesheet" href="Content/css/Site/style.css" /><link type="text/css" rel="stylesheet" href="Content/css/Site/layout.css" />
    <link type="text/css" rel="stylesheet" href="Content/css/jquery-ui-1.8.16.custom.css" />
    <style>
        .ui-accordion .ui-accordion-content-active
        {
            max-height:300px;
        }
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
	                autoHeight: false
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

	    
    <body id="page5" onload="new ElementMaxHeight();">
        <div class="bg">
            <div class="main">
                <div class="contentImgs">
		            <div id="flash">
                        <div class="menuFlash">
<!--#include file="incMenu.asp"-->
                            </div>
                        </div>
		            </div>
                </div>
            </div>
        </div>
        <div class="main">
            <!--==============================content================================-->
            <div id="content">
                <div class="content-tail-left">
                    <div class="content-tail-right">
                        <div class="content-tail-top">
                            <div class="row-1">
                                <div class="padding">
                                    <div class="wrapper">
                                    <a style="float:right;" href="/"> Voltar para a pagina anterior</a>
                                        <h3 class="head2">Soluções</h3>
                                            Como cliente de nosso escritório, o <strong>Empregador</strong> poderá fazer e usufruir
                                            de nossa assessoria de duas formas, <strong>Individuamente</strong> e <strong>usando
                                            nossa ajuda</strong>:
                                        <br />
                                        <br />
                                        <strong>Individualmente</strong>
                                        <br />
                                        Poderá emitir de forma automática através da ferramenta online, os seguintes itens
                                        <br />
                                        <br />
                                        <div id="accordion" >
                                            <h3><a href="#">1 - Contrato de Trabalho e Ficha de Registro;</a></h3>
                                            <div>
                                                <img src="Content/images/ContratodeTrabalho.jpg" alt="Edição do Contrato"  />
                                            </div>
                                            <h3><a href="#">2 - Declaração de Compromisso da AGÊNCIA de Empregos;</a></h3>
                                            <div>
                                                 <img src="Content/images/agencia_trabalho.jpg" alt="Modelo de declaração de compromisso da Agência de empregos"  />                                                
                                            </div>
                                            <h3><a href="#">3 - Preenchimentos na Carteira de Trabalho (CTPS) do Empregado;</a></h3>
                                            <div>
                                                <p><img src="Content/images/modeloCarteira.jpg" alt="Edição do Contrato"  /></p>                                                
                                            </div>
                                            <h3><a href="#">4 - Recibos de Entrega de Vale Transporte (Mensal);</a></h3>
                                            <div>
                                                <p><img src="Content/images/reciboValeTransporte.jpg" alt="Edição do Contrato"  /></p>                                                
                                            </div>
                                            <h3><a href="#">5 - Recibos de Pagamento de Salários (Mensal);</a></h3>
                                            <div>
                                                <p><img src="Content/images/recibodeSalario.jpg" alt="Edição do Contrato"  /></p>
                                            </div>
                                            <h3><a href="#">6 - Guias de Recolhimento ao INSS (GPS) (Mensal);</a></h3>
                                            <div>
                                                <p><img src="Content/images/reciboGPS.jpg" alt="Edição do Contrato"  /></p>
                                            </div>
                                            <h3><a href="#">7 - Folha de Pagamento a partir de três empregados (Mensal);</a></h3>
                                            <div>
                                                <p><img src="Content/images/reciboFolhaPagto.jpg" alt="Edição do Contrato"  /></p>                                          
                                            </div>
                                            <h3><a href="#">8 - Recibo de Adiantamento e Recibo de Décimo Terceiro Salário; </a></h3>
                                            <div>
                                                <p><img src="Content/images/recibo13.jpg" alt="Edição do Contrato"  /></p>
                                            </div>
                                            <h3><a href="#">9 - Aviso de Férias e Recibo de Pagamento de Férias;</a></h3>
                                            <div>
                                                <p><img src="Content/images/reciboFerias.jpg" alt="Edição do Contrato"  /></p>                                          
                                            </div>
                                            <h3><a href="#">10 - Recibos de Recolhimento de Imposto de Renda - DARF (Mensal);</a></h3>
                                            <div>
                                                <p><img src="Content/images/reciboDarf.jpg" alt="Edição do Contrato"  /></p>                                                                                   
                                            </div>
                                            <h3><a href="#">11 - Quadro de Freqüência ao Serviço;</a></h3>
                                            <div>
                                                <p><img src="Content/images/faltasQuadro.jpg" alt="Edição do Contrato"  /></p>                                  
                                            </div>
                                            <h3><a href="#">12 - Termo de Rescisão de Contrato de Trabalho.</a></h3>
                                            <div>
                                                 <p><img src="Content/images/recisao.jpg" alt="Recisão do Contrato"  /></p>                                                        
                                            </div>
                                            <h3><a href="#">13 - Contrato de Experiência</b></a></h3>
                                            <div>
                                                <p>Quando o Empregador desejar que o empregado se submeta a uma experiência, o contrato será elaborado com o empregado incluindo esse detalhe no Contrato de Trabalho na oportunidade da elaboração da Ficha de Registro do Empregado.</p>
                                                <p>

                                                    <img src="Content/images/contrato-experiencia.jpg" alt="Modelo longdesc contrato de experiência"  /></p>                                 
                                            </div>
                                            <h3><a href="#">14 - Contrato de trabalho</b></a></h3>
                                            <div>
                                                <p><img src="Content/images/contrato-trabalho.jpg"  alt="Modelo longdesc contrato de trabalho"  /></p>                                 
                                            </div>
                                            <h3><a href="#">15 - F. G. T. S. Guia de Recolhimento</b></a></h3>
                                            <div>
                                                <p><img src="Content/images/reciboxp.jpg" alt="Edição do Contrato"  /></p>                                 
                                            </div>

                                        </div>
                                        
                                        <br />
                                        <strong>Usando nossa ajuda:</strong>
                                        <br />
                                        <br />
                                        Serviço direto 100% para obter respostas na hora que surgir a necessidade em horário
                                        comercial via telefone, via internet, ou pessoalmente, seis (6) dias por semana;
                                        <br />
                                        Serviço via INTERNET por intermédio de Identificação Pessoal e Senha Individual
                                        para emissão de documentação referente ao empregado;
                                        <br />
                                        Assessoria e consultoria jurídica permanente em horário comercial de Segunda-feira
                                        até Sexta na residência ou domicílio do empregador, com a presença de advogado
                                        especializado. (*)
                                        <br />
                                        Serviços jurídicos de apoio visando à tranqüilidade do empregador doméstico, quando
                                        demandar ou for demandado, tais como:
                                        <br />
                                        <br />
                                        a.-) Propositura de Ação Trabalhista pelo Empregador. <b>(*)</b>
                                            <br />
                                            b.-) Defesa de Ação Trabalhista proposta pelo Empregado. <b>(*)</b>
                                            <br />
                                            c.-) Defesa em Acordos perante a Justiça do Trabalho ou Extrajudiciais. <b>(*)</b>
                                            
                                        <br /><br />
                                        <b>(*) – Serviços de apoio cobrados sob consulta.</b>
                                        <br /><br />
                                    </div>
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

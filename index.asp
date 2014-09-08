


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1"><title>
	
    E-Domestico - Home

</title><meta content="text/html; charset=utf-8" http-equiv="Content-Type" /><meta content="text/css" http-equiv="Content-Style-Type" /><link type="text/css" rel="stylesheet" href="Content/css/Site/style.css" /><link type="text/css" rel="stylesheet" href="Content/css/Site/layout.css" />

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
		    <link href="/Content/css/Site/ie_style.css" rel="stylesheet" type="text/css" />
	       <script type="text/javascript" src="Content/js/ie_png.js"></script>
	       <script type="text/javascript">
		       ie_png.fix('.png, #header .row-3 .bg-header, #header .row-3 .tail-bot, .content-tail-left, .content-tail-right');
	       </script>
	    <![endif]-->

	    
    <script type="text/javascript" src="Content/js/s3Slider.js"></script>
    <script type="text/javascript" src="scripts/jquery.validate.min.js"></script>
        <script type="text/javascript">
            function Troca() {
                if ($("#Email").val() == "Email") {
                    $("#Email").val("");
                }

                if ($("#Senha").val() == "Senha") {
                    $("#Senha").val("");
                }
            }

            $(document).ready(function () {
                $("Page1").css = "MinhaClasse";

                $('#slider1').s3Slider({
                    timeOut: 7000
                });

                $("#processando").hide();
                $("#divErro").hide();

                $("#form-Login").validate({
                    meta: "validate",
                    invalidHandler: function (form, validator) {
                        $("#divErro").html("O campo e-mail e senha devem estar preenchidos e o e-mail deve ser válido!");
                        $("#divErro").show();
                        $("#div1").hide();
                    },

                    submitHandler: function (form) {
                        $("#divErro").hide();
                        $("#div1").hide();
                        $("#login").hide();
                        $("#processando").show();
                        form.submit();
                    },

                    rules: {
                        Email: {
                            required: true,
                            email: true
                        },
                        Senha: "required"
                    },
                    messages: {
                        Email: {
                            required: "",
                            email: ""
                        },
                        Senha: ""
                    }
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
        <form action="/novosistema/login.asp" id="form-Login" name="form-Login"  method="post" style="width:218px; margin-right:7px;">
            <input id="Email" name="Email" type="text"  value="Email" onblur="if(this.value=='') this.value='Email'" onfocus="if(this.value =='Email' ) this.value=''" class="txtLogin" style="width: 197px;border-bottom-width: 1px; margin: 0 0 10px 0; float:left;" />
            <input id="Senha" name="Senha" type="password"  value="Senha" onblur="if(this.value=='') this.value='Senha'" onfocus="if(this.value =='Senha' ) this.value=''" class="txtLogin" style="width: 110px;float:left; margin-top:-2px; margin-left:0"  />
            <input type="submit" value="Entrar" id="btnEntrar" onclick="Troca();" name="btnEntrar" class="btnLogin" style="float:left; margin-top:-2px" />
        </form>
        <a id="Cadastro" class="lnkLogin" style="color:#ffffff; margin-left:8px;" href="cadastro.asp" ><b>Cadastre-se</b></a>
        <a id="esqueci" style="padding:0 10px;color:#ffffff;" class="lnkLogin" href="sendsenha.asp" ><b>Esqueci minha senha</b></a>
        <div id="divErro" class="message error divErroLogin" >
	        <span class="strong" >ERRO!</span> 	    
			        Verifique todos os campos abaixo.
        </div>
            
    </div>
                    <!--
                     <div class="message tip" id="cadastre_se" style="margin-top: 10px;float:left;margin-left:20px">
                        <a  href="javascript:void(0)" style="float:right; width:20px; height:20px" id="fecharGratis"> <img src="Content/images/close.png" alt="fechar"/></a>
                        <span id="gratis" >Grátis! <b>Clique aqui</b></span> Cadastre-se e teste a <b>Solução</b> por 30 dias.
                    </div>-->
                </div>
                    

                        

            </div>

	    
<body id="page1">
	<div class="bg">
        <div class="main">
            <div class="contentImgs">
		        <div id="flash">
                    <div class="menuFlash">

                                                <div class="botoesFlash">
                            <span class="homeMenu selected"></span>
                            <a href="empresa.asp" class="empresaMenu"></a>
                            <a href="OSistema.asp" class="sistemaMenu"></a>
                            <a href="Planos.asp" class="planosMenu"></a>
                            <a href="Direitos.asp" class="direitosMenu"></a>
                            <a href="Deveres.asp" class="deveresMenu"></a>
                            <a href="Servicos.asp" class="servicosMenu"></a>
                            <a href="Contato.asp" class="cadastroMenu"></a>
                        </div>

                    </div>
		        </div>
            </div>
        </div>
    </div>
    <div class="main">
        <div class="contentImgs">
            <!-- div id="slider1">
                <ul id="slider1Content">
                    <li class="slider1Image">
                        <a href="/OSistema"><img src="../../Content/images/empregadorotator.jpg" alt="1" /></a>
                        <span class="bottomBox"><strong>Menu e Cadastro</strong><br /><p>Gerenciamento de informações cadastrais, aquisição de pacotes, notificações e acesso a lista de empregados a partir de uma tela inicial limpa e intuitiva. Cadastre empregados e tenha assim um histórico detalhado das atividades de cada um a partir das funcionalidades do sistema.</p></span></li>
                    <li class="slider1Image">
                        <a href="/OSistema"><img src="../../Content/images/contratorotator.jpg" alt="2" /></a>
                        <span class="bottomBox"><strong>Contratos</strong><br /><p>O sistema gera contratos de trabalho a partir de seus dados e dos dados do empregado. Também conte com a visualização de modelos de preenchimento da carteira de trabalho. </p></span></li>
                    <li class="slider1Image">
                        <a href="/OSistema"><img src="../../Content/images/holeriterotator.jpg" alt="3" /></a>
                        <span class="bottomBox"><strong>Holerites</strong><br /><p>Gere holerites de maneira simples! O sistema calcula o salário a ser pago para o seu empregado, a partir dos registros efetuados no sistema. Deixe de lado a complicação de cálculo de impostos, INSS, férias e décimo-terceiro! Conte com o histórico detalhado dos pagamentos feitos aos seus empregados e a emissão de folhas de pagamento detalhadas, para maior controle. </p></span></li>
                    <li class="slider1Image">
                        <a href="/OSistema"><img src="../../Content/images/faltasrotator.jpg" alt="4" /></a>
                        <span class="bottomBox"><strong>Faltas</strong><br /><p>Controle de faltas e afastamentos, bem como emissão advertências e suspensões! Mantenha o histórico dos casos já registrados e gere relatórios!</p></span></li>
                    <div class="clear slider1Image"></div>
                </ul>
            </div -->
            <div id="slider1">
                <ul id="slider1Content">
                    <li class="slider1Image">
                    <a href="/Cadastro.asp"><img src="Content/images/Banner.jpg" alt="E-Doméstico" /></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main">
        <!--==============================content================================-->
        <div id="content">
            <div class="content-tail-left">
                <div class="content-tail-right">
                    <div class="content-tail-top">
                        <div class="boxes">
                            <div style="padding-bottom: 15px;" class="padding">
                                <div style="height: 350px;" class="wrapper">
                                    <div class="col-1 maxheight" style="height: 350px;">
                                        <div class="box1 maxheight" style="height: 350px;">
                                            <div class="tail-top maxheight" style="height: 350px;">
                                                <div class="tail-right maxheight" style="height: 350px;">
                                                    <div class="tail-bot maxheight" style="height: 350px;">
                                                        <div class="tail-left maxheight" style="height: 350px;">
                                                            <div class="corner-top-left maxheight" style="height: 350px;">
                                                                <div class="corner-top-right maxheight" style="height: 350px;">
                                                                    <div class="corner-bot-right maxheight" style="height: 350px;">
                                                                        <div class="corner-bot-left maxheight" style="height: 350px;">
                                                                            <div class="padding-box">                                                               
                                                                                <h3 class="head" style="font-size:22px;">
                                                                                    Vantagens ao Empregador Doméstico</h3>
                                                                                <ul class="list-1 indent-bot">
                                                                                    <li style="font-size: 11px;">
                                                                                        Cadastro e Edição de Empregados
                                                                                    </li>
                                                                                    <li style="font-size: 11px;">
                                                                                        Declarações de Recebimento de Vales, Salário, Contratos, entre outros
                                                                                    </li>
                                                                                    <li style="font-size: 11px;">
                                                                                        Cadastro de Vale-Transporte
                                                                                    </li>
                                                                                    <li style="font-size: 11px;">
                                                                                        Controle de Salários e Adiantamentos
                                                                                    </li>
                                                                                    <li style="font-size: 11px;">
                                                                                        Controle e Pagamento de Férias
                                                                                    </li>
                                                                                    <li style="font-size: 11px;">
                                                                                        Controle de Faltas, Advertências, Suspensão e Afastamentos
                                                                                    </li>
                                                                                    <center>
                                                                                        <a href="/OSistema.asp">Veja Mais</a>
                                                                                    </center>
                                                                                </ul>
                                                                                <!--ul class="list-1">
                                        	                                        <li><a href="#">Aenean nonummy hendrerit maur </a></li>
                                                                                    <li><a href="#">Phasellus portausce suscipit var </a></li>
                                                                                    <li><a href="#">Cum sociis natoque penatibus et </a></li>
                                                                                    <li><a href="#">Wagnis dis parturient montes na </a></li>
                                                                                    <li><a href="#">Scetur ridiculus musulla </a></li>
                                                                                </ul-->
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-2 maxheight" style="height: 350px;">
                                        <div class="box maxheight" style="height: 350px;">
                                            <div class="tail-top maxheight" style="height: 350px;">
                                                <div class="tail-right maxheight" style="height: 350px;">
                                                    <div class="tail-bot maxheight" style="height: 350px;">
                                                        <div class="tail-left maxheight" style="height: 350px;">
                                                            <div class="corner-top-left maxheight" style="height: 350px;">
                                                                <div class="corner-top-right maxheight" style="height: 350px;">
                                                                    <div class="corner-bot-right maxheight" style="height: 350px;">
                                                                        <div class="corner-bot-left maxheight" style="height: 350px;">
                                                                            <div class="padding-box">
                                                                                <h3 class="title-1">
                                                                                    Direitos</h3>
                                                                                <p>
                                                                                    <strong class="color-2">A DOMESTICO SOLUÇÕES ONLINE LTDA</strong> tem como objetivo garantir
                                                                                    todos os <strong class="color-2">direitos dos empregadores domésticos</strong> trazendo
                                                                                    facilidade e agilidade no dia-a-dia no controle dos empregados.
                                                                                </p>
                                                                                <center>
                                                                                    <a href="/Direitos.asp">Veja Mais</a>
                                                                                </center>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 maxheight" style="height: 350px;">
                                        <div class="box maxheight" style="height: 350px;">
                                            <div class="tail-top maxheight" style="height: 350px;">
                                                <div class="tail-right maxheight" style="height: 350px;">
                                                    <div class="tail-bot maxheight" style="height: 350px;">
                                                        <div class="tail-left maxheight" style="height: 350px;">
                                                            <div class="corner-top-left maxheight" style="height: 350px;">
                                                                <div class="corner-top-right maxheight" style="height: 350px;">
                                                                    <div class="corner-bot-right maxheight" style="height: 350px;">
                                                                        <div class="corner-bot-left maxheight" style="height: 350px;">
                                                                            <div class="padding-box">
                                                                                <h3 class="title-2 letter">
                                                                                    Deveres</h3>
                                                                                <p>
                                                                                    <strong class="color-2">Conheça de maneira rápida e simples</strong> todos os seus
                                                                                    deveres como empregador doméstico
                                                                                </p>
                                                                                <center>
                                                                                    <a href="/Deveres.asp">Veja Mais</a></center>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4 maxheight" style="height: 350px;">
                                        <div class="box maxheight" style="height: 350px;">
                                            <div class="tail-top maxheight" style="height: 350px;">
                                                <div class="tail-right maxheight" style="height: 350px;">
                                                    <div class="tail-bot maxheight" style="height: 350px;">
                                                        <div class="tail-left maxheight" style="height: 350px;">
                                                            <div class="corner-top-left maxheight" style="height: 350px;">
                                                                <div class="corner-top-right maxheight" style="height: 350px;">
                                                                    <div class="corner-bot-right maxheight" style="height: 350px;">
                                                                        <div class="corner-bot-left maxheight" style="height: 350px;">
                                                                            <div class="padding-box">
                                                                                <h3 class="title-3">
                                                                                    Soluções</h3>
                                                                                <p>
                                                                                    <strong class="color-2">Como cliente de nosso escritório,</strong> o EMPREGADOR
                                                                                    poderá fazer e usufruir de nossa assessoria de duas formas, INDIVIDUALMENTE ou USANDO
                                                                                    NOSSA AJUDA...
                                                                                </p>
                                                                                <center>
                                                                                    <div class="">
                                                                                        <a href="/Servicos.asp">Veja Mais</a></div>
                                                                                </center>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="row-1">
                            
                            <div class="padding">
                                <div class="wrapper">
                                    <div class="col-2" style="width:100%">
                                        <h3 class="head2">
                                            Um pouco sobre nós</h3>
                                        <div class="wrapper">
                                            <img alt="" src="Content/images/page3-img3.jpg" class="img-indent" />
                                            O legislador nunca se preocupou em discorrer uma lei para cuidar e atender os direitos
                                            e deveres do <strong class="color-2">empregador doméstico</strong>, pelo contrario
                                            a legislação trata sempre de cuidar os direitos e deveres da parte contrária, ou
                                            seja, do empregado ou trabalhador, pois para o Estado a defesa deve ser daquele
                                            que não tem possibilidade de se defender sozinho, isto é, aquele que não possui
                                            recursos financeiros compatíveis para promover a sua defesa sem causar prejuízo
                                            a sua própria subsistência. Assim, a Consolidação da Lei do Trabalho - CLT defende
                                            o trabalhador em geral caracterizado como <strong class="color-2">urbano</strong>
                                            e <strong class="color-2">rural</strong> e de forma subsidiária defende também o
                                            empregado doméstico. De forma especial aqui esclareceremos matéria sobre o <strong
                                                class="color-2">empregador doméstico</strong>, ou seja, a <strong class="color-2">pessoa</strong>
                                            ou <strong class="color-2">família</strong> que não tem uma Lei específica para
                                            cuidar de seus direitos e obrigações quando em seu âmbito residencial contrata alguém
                                            para lhe prestar seus serviços. Alguns tópicos destas rotinas têm como fonte o Ministério
                                            da Previdência Social.
                                        </div>
                                    </div>
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

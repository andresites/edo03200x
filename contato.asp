<%
     
function SendTheEmail(email, nome, textoo, assuntooo)

	
		sch = "http://schemas.microsoft.com/cdo/configuration/"
		Set cdoConfig = Server.CreateObject("CDO.Configuration")
		Dim meuservidorsmtp
		Dim minhacontaautenticada
		Dim minhasenhaparaenvio
		Dim emailorigem

		    'meuservidorsmtp = "smtp.academiapamplona.com.br" ' Informacoes so seu servidor SMTP
        meuservidorsmtp = "localhost"
		minhacontaautenticada = "noreply@edomestico.com.br" ' conta de e-mail utilizada para enviar		
		minhasenhaparaenvio = "Ppp123" ' senha da conta de e-mail
 
		emailorigem = "noreply@edomestico.com.br" ' e-mail que indica de onde partiu a mensagem

		cdoConfig.Fields.Item(sch & "sendusing") = 2
		cdoConfig.Fields.Item(sch & "smtpauthenticate") = 1
		cdoConfig.Fields.Item(sch & "smtpserver") = "localhost"
		cdoConfig.Fields.Item(sch & "smtpserverport") = 25
		cdoConfig.Fields.Item(sch & "smtpconnectiontimeout") = 30
		cdoConfig.Fields.Item(sch & "sendusername") = minhacontaautenticada
		cdoConfig.Fields.Item(sch & "sendpassword") = minhasenhaparaenvio

		cdoConfig.fields.update
		Set cdoMessage = Server.CreateObject("CDO.Message")
		Set cdoMessage.Configuration = cdoConfig	

		cdoMessage.From = "noreply@edomestico.com.br"

		'emaildestino = email


        cdoMessage.To ="andresites.sp@gmail.com"
        'cdoMessage.CC "edson@paivaauditores.com.br"
        'cdoMessage.cc "egalarza@terra.com.br"

		cdoMessage.Subject = "Contato site e-domestico"
		



		cdoMessage.ReplyTo = email'"renato@academiapamplona.com.br"

	        strTxt = textoo 



		cdoMessage.TextBody = strTxt
    on error resume next
		cdoMessage.Send
		If Err <> 0 Then
	   SendTheEmail =  "Erro: " & Err.Description & " - " & email
	else
		SendTheEmail = "E-mail enviado com sucesso. Entraremos em contato o mais breve possível em seu e-mail " & email & "<br> Gratos, <br /> Equipe e-domestico"
	End If '
		Set cdoMessage = Nothing
		Set cdoConfig = Nothing	
end function

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1"><title>
	
    E-Domestico - Contato

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
		    <link href="Content/css/Site/ie_style.css" rel="stylesheet" type="text/css" />
	       <script type="text/javascript" src="Content/js/ie_png.js"></script>
	       <script type="text/javascript">
		       ie_png.fix('.png, #header .row-3 .bg-header, #header .row-3 .tail-bot, .content-tail-left, .content-tail-right');
	       </script>
	    <![endif]-->

	    

    <script type="text/javascript" src="Content/js/maxheight.js"></script>
    <script type="text/javascript" src="scripts/jquery.validate.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.wysiwyg.js"></script>
    
    <script type="text/javascript" src="Scripts/jquery.ui.mask.js"></script>

<script type="text/javascript">
    function Troca() {
        if ($("#Nome").val() == "Informe seu Nome:") {
            $("#Nome").val("");
        }

        if ($("#Email").val() == "Informe seu E-mail:") {
            $("#Email").val("");
        }

        if ($("#Telefone").val() == "Informe seu Telefone:") {
            $("#Telefone").val("");
        }

        if ($("#Mensagem").val() == "Digite sua Mensagem:") {
            $("#Mensagem").val("");
        }
    }


    </script>

    
    <script type="text/javascript">

        $(document).ready(function () {

            $("#sucesso").hide();
            $("#erro").hide();
            $(".note.loading").hide();



            $("#TelefoneComercial").mask({ mask: "(##) ####-####", allowPartials: true });


            $("#Telefone").mask("(99)9999-9999");
            $("#Telefone").val('Informe seu Telefone:');

            $("#Telefone").blur(function () {
                if (this.value == '') this.value = 'Informe seu Telefone:';
            });

            $("#Limpar").click(function () {
                $("#Nome").val('Informe seu Nome:');
                $("#Email").val('Informe seu E-mail:');
                $("#Telefone").val('Informe seu Telefone:');
                $("#Mensagem").val('Digite sua Mensagem:');
                $("#erro").hide();
            });

            $("#Telefone").click(function () {
                if (this.value == 'Informe seu Telefone:') $("#Telefone").mask("(99)9999-9999");
            });

            $("#form-main").validate({
                meta: "validate",
                invalidHandler: function (form, validator) {
                    $("#sucesso").hide();
                    $("#erro").show();
                    $("#erro").focus();
                    $("#Nome").val('Informe seu Nome:');
                    $("#Email").val('Informe seu E-mail:');
                    $("#Telefone").val('Informe seu Telefone:');
                    $("#Mensagem").val('Digite sua Mensagem:');

                },

                submitHandler: function (form) {
                    $("#sucesso").hide();
                    $("#erro").hide();
                    $("#cancelar").hide();
                    $("#processando").show();
                    form.submit();
                },

                rules: {
                    Nome: "required",
                    Email: {
                        required: true,
                        email: true
                    },
                    Telefone: "required",
                    Mensagem: "required"
                },
                errorElement: 'div',

                messages: {
                    Nome: "Este campo é obrigatório.",
                    Email: {
                        required: "Este campo é obrigatório.",
                        email: "Formato de e-mail inválido"
                    },
                    Telefone: "Este campo é obrigatório.",
                    Mensagem: "Este campo é obrigatório."
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
                    
                     <div class="message tip" id="cadastre_se" style="margin-top: 10px;float:left;margin-left:20px">
                        <a  href="javascript:void(0)" style="float:right; width:20px; height:20px" id="fecharGratis"> <img src="Content/images/close.png" alt="fechar"/></a>
                        <span id="gratis" >Grátis! <b>Clique aqui</b></span> Cadastre-se e teste a <b>Solução</b> por 30 dias.
                    </div>
                </div>
                    

       
            </div>

	    
    <body id="page6" onload="new ElementMaxHeight();">
	    <div class="bg">
            <div class="main">
                <div class="contentImgs">
		            <div id="flash">
                        <div class="menuFlash">
                        <!-- div class="logoFlash">
			                <a href="/"><img src="../..Content/images/logo.png" alt="Home" /></a>
                        </div -->
<!--#include file="incMenu.asp"-->
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
                                <div class="boxes">
                                    <div class="padding" style="height: 720px">
                                        <div class="wrapper" style="width: 250px; float: right; height: 650px">
                                            <div style="height: 345px; width: 250px">
                                                <div class="col-4 maxheight" style="height: 330px; width: 250px;">
                                                    <div class="box1 maxheight">
                                                        <div class="tail-top maxheight">
                                                            <div class="tail-right maxheight">
                                                                <div class="tail-bot maxheight">
                                                                    <div class="tail-left maxheight">
                                                                        <div class="corner-top-left maxheight">
                                                                            <div class="corner-top-right maxheight">
                                                                                <div class="corner-bot-right maxheight">
                                                                                    <div class="corner-bot-left maxheight">
                                                                                        <div class="padding-box">
                                                                                            <h3 class="head">
                                                                                                Links Públicos</h3>
                                                                                            <ul class="list-1 indent-bot">
                                                                                                <li>
                                                                                                    <a href="http://www2.oabsp.org.br/asp/consultaInscritos/consulta01.asp" target="_blank">Advogados Inscritos na OAB/SP</a></li>
                                                                                                <li>
                                                                                                    <a href="http://www.protesto.com.br/html/TabelionatosSP.php" target="_blank">Cartórios de Protestos em São Paulo</a></li>
                                                                                                <li>
                                                                                                    <a href="http://www.tj.sp.gov.br/" target="_blank">Processos Poder Judiciário Estadual - São Paulo</a></li>
                                                                                                <li>
                                                                                                    <a href="http://www.stj.jus.br/webstj/Processo/Justica/" target="_blank">Processos Poder Judiciário Federal – São Paulo.</a></li>
                                                                                                <li>
                                                                                                    <a href="http://www.dpf.gov.br/institucional/pf-pelo-brasil/sao-paulo" target="_blank">Departamento Policia Federal em São Paulo</a></li>
                                                                                            </ul>
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
                                            <div style="height: 340px; width: 250px">
                                                <div class="col-2 maxheight" style="height: 340px; width: 250px;">
                                                    <div class="box maxheight">
                                                        <div class="tail-top maxheight">
                                                            <div class="tail-right maxheight">
                                                                <div class="tail-bot maxheight">
                                                                    <div class="tail-left maxheight">
                                                                        <div class="corner-top-left maxheight">
                                                                            <div class="corner-top-right maxheight">
                                                                                <div class="corner-bot-right maxheight">
                                                                                    <div class="corner-bot-left maxheight">
                                                                                        <div class="padding-box">
                                                                                            <h3 class="title-2">
                                                                                                Contatos</h3>
                                                                                            <dl class="info">
                                                                                                <dt>Empregador Doméstico<br />
                                                                                                   Rua Maestro Cardim, 1191 – cjto 123 – Paraiso<br />
                                                                                                    CEP.01323-001 – São Paulo/SP.<br /></dt>
                                                                                                <dd>
                                                                                                    <span>Jurídico:</span> (11) 3228-0250</dd>
                                                                                                <dd>
                                                                                                    <span>Contábil:</span> (11)  (11) 3284.3355</dd>
                                                                                                <dd>
                                                                                                    
                                                                                                    <a href="mailto:contato@edomestico.com.br">contato@edomestico.com.br</a></dd>
                                                                                            </dl>
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
                                        <div class="row-1" style="float: left; width: 700px;">
                                            <div class="padding">
                                                <div class="wrapper">
                                                    <div class="col-1">
                                                        <br />
			                                            
                                                            <div id="erro" class="message error">
			                                                    <span class="strong">ERRO!</span> Verfique o preenchimento dos Campos!
			                                                </div>
                                                        <div class="row-2">
                                                            <h3 class="head2">
                                                                Contato</h3>
                                                            <div>
                                                                <img alt="Contato" src="Content/images/contato.jpg" style="width: 621px; height: 200px;" /></div>
                                                            <br />
                                                            <%If Request.ServerVariables("CONTENT_LENGTH")>0 then
                                                                    email=request.Form("email")
                                                                    nome=request.form("nome")
                                                                    telefone = request.form("telefone")
                                                                    mensagem=request.form("mensagem")
                                                                    
                                                                    strOut  = " Mensagem enviada pelo site www.edomestico.com.br" & vbCrLf
                                                                    strOut = strOut & "Nome: " & nome & vbCrLf
                                                                    strOut = strOut & "e-mail: " & email & vbCrLf
                                                                    strOut = strOut & "Telefone: " & telefone & vbCrLf
                                                                    strOut = strOut & "mensagem: " & vbCrLf & mensagem & vbCrLf
                                                                    response.Write SendTheEmail ( email, nome, strOut, "e-mail site")
                                                                else %>
                                                            <form action="" id="form-main" method="post" name="form-main">
                                                            <div class="wrapper">
                                                                <div class="column-1">
                                                                    <label>
                                                                        <input id="Nome" name="Nome" onblur="if(this.value==&#39;&#39;) this.value=&#39;Informe seu Nome&#39;" onfocus="if(this.value ==&#39;Informe seu Nome:&#39; ) this.value=&#39;&#39;" style="margin-top:6px;" type="text" value="Informe seu Nome:" />
                                                                        
                                                                        
                                                                    </label>
                                                                    <br />
                                                                    <label>
                                                                        <input id="Email" name="Email" onblur="if(this.value==&#39;&#39;) this.value=&#39;Informe seu E-mail&#39;" onfocus="if(this.value ==&#39;Informe seu E-mail:&#39; ) this.value=&#39;&#39;" type="text" value="Informe seu E-mail:" />
                                                                        
                                                                        
                                                                    </label>
                                                                    <br />
                                                                    <label>
                                                                    <input id="Telefone" name="Telefone" type="text" value="Informe seu Telefone:" />
                                                                    
                                                                        
                                                                    </label>
                                                                </div>
                                                                <div class="column-2">
                                                                    
                                                                    <textarea cols="" id="Mensagem" name="Mensagem" onblur="if(this.value==&#39;&#39;) this.value=&#39;Digite sua Mensagem&#39;" onfocus="if(this.value ==&#39;Digite sua Mensagem:&#39;) this.value=&#39;&#39;" rows="">
Digite sua Mensagem:</textarea>
                                                                    
                                                                    <div class="buttons">
                                                                        
                                                                        <button id="Limpar" class="button red" type="reset" style="margin-left:0;width: 75px;margin-right: 20px;" >
								                                            <span style="" >Limpar</span>
							                                            </button>
                                                                            
							                                            <button id="enviar" class="button green" type="submit" value="Save" style="margin-left:0;width: 75px;" onclick="Troca();" >
								                                            <span style="" >Enviar</span>
							                                            </button>
                                                                    </div>
                                                                </div>

                                                                </form>
                                                            <%end if %>
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

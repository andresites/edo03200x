<%
    dim strConn, strOut
strConn = "Provider=Sqloledb; User ID=edomestico_test; Password=Infosys; Initial Catalog=edomestico_test;Data Source=PALM.arvixe.com"

    function SendTheEmail(email, nome, senha)

	
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


        cdoMessage.To = email'"andresites.sp@gmail.com"
        'cdoMessage.CC "edson@paivaauditores.com.br"
        'cdoMessage.cc "egalarza@terra.com.br"

		cdoMessage.Subject = "Sua senha no site www.edomestico.com.br"
		



		cdoMessage.ReplyTo = email'"renato@academiapamplona.com.br"

	        strTxt = "Olá " & nome & ", " &  vbCrLf
             strTxt = strTxt & " sua senha para o site http://www.edomestico.com.br/ é " & senha  & "." & vbCrLf

            strTxt = strTxt & "Caso tenha algum problema em acessar nosso site, por favor entre em contato atrav&eacute;s de nosso telefone (11) 3284-3355." & vbCrLf & vbCrLf
            strTxt = strTxt & "Atenciosamente, " & vbCrLf & "Equipe E-Doméstico"

		cdoMessage.TextBody = strTxt
    on error resume next
		cdoMessage.Send
		If Err <> 0 Then
	   SendTheEmail =  "Erro: " & Err.Description & " - " & email
	else
		SendTheEmail = "senha enviada com sucesso para o e-mail " & email & "<br /> Caso tenha algum problema em acessar nosso site, por favor entre em contato através de nosso telefone (11) 3284-3355. <br />Gratos, <br /> Equipe e-domestico"
	End If '
		Set cdoMessage = Nothing
		Set cdoConfig = Nothing	
end function
     %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
	<title>E-Dom&eacute;stico - Esqueci minha Senha</title>
	<link rel="stylesheet" type="text/css" href="/Content/css/styles.css" media="screen" />
	<script type="text/javascript" src="/Scripts/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/Scripts/jquery-ui-1.8.2.custom.min.js"></script>
	<script type="text/javascript" src="/Scripts/jquery.validate.js"></script>
	<script type="text/javascript" src="/Scripts/jquery.visualize.js"></script>
	<script type="text/javascript" src="/Scripts/custom.auth.js"></script>
	<!--[if lte IE 7]>
	<link rel="stylesheet" type="text/css" href="/content/ie7.css" media="screen" />
	<![endif]-->
	<!--[if IE 8]>
	<link rel="stylesheet" type="text/css" href="/content/ie8.css" media="screen" />
	<![endif]-->
	<!--[if IE]>
	<script language="javascript" type="text/javascript" src="/scripts/excanvas.js"></script>
	<![endif]-->

	<script type="text/javascript">

		$(document).ready(function () {

			$("#processando").hide();
			$("#erro").hide();
            
			$("#form").validate({
				meta: "validate",
				invalidHandler: function (form, validator) {
					$("#erro").html("Verifique o campo abaixo");
					$("#erro").show();
					$("#sucesso").hide();
				},

				submitHandler: function (form) {
					$("#erro").hide();
					$("#sucesso").hide();
					$("#login").hide();
					$("#processando").show();
					form.submit();
				},

				rules: {
					Email: {
						required: true,
						email: true
					}
				},
				messages: {
					Email: {
						required: "Preencha o e-mail",
						email: "E-mail inválido"
					}
				}
			});
		});
	</script>
</head>
    <body>
        <div id="page-body">
	        <div id="wrapper">
		        <!-- Authorization [begin] -->
		        <div class="sb-box auth">
			        <div class="sb-box-inner content">
				        <!-- Authorization block header [begin] -->
				        <div class="header"><h3>Esqueci minha Senha</h3></div>
				        <!-- Authorization block header [end] -->
				        <div class="bcont">
					        <!-- Authorization content [begin] -->

					        <!-- form elements [start] -->
					        <form action="" method="post">

                               <%
if len(request.form("email"))>0 then
    dim objCon,  objRS, strMsg, strICQ, obCmd
    set objCon = Server.CreateObject ("ADODB.Connection")
    Set objRS = Server.CreateObject ("ADODB.Recordset")
    set obCmd = server.CreateObject("ADODB.Command")
    strEmail=request.form("email")
    objCon.open strConn
    obCmd.ActiveConnection = objCon
    obCmd.Prepared = true

    strTexto = "Select empregador.empregador.nome, empregador.empregador.email, empregador.empregador.senha From empregador.empregador WHERE (Email=?)"

    Set newParameter = obCmd.CreateParameter("@Email", 200, &H0001, 255, strEmail)
    obCmd.Parameters.Append newParameter
    obCmd.CommandText =strTexto 
    set objRS=obCmd.EXECUTE

    if (objRS.bof and objRS.eof) then
        strOut=false
    else
        strOut=true
        envia= SendTheEmail(objRS("email"), objRS("nome"), objRS("senha") )
    end if
    objRS.close
    objCon.close
    set objRS=nothing 
    set objCon=nothing
    set obCmd=nothing

%>
                                
                                
                                <p>
                                    
                                    Dados processados. </p><p>
                                    
                                    <%= envia%></p>
                                <p><a href="/">Voltar</a></p>
                                <%


else
                                   
                                   
                                   
                                   %>
			                
						        <div>
						        <p>
							        <label>Email</label>
							       <input type="text" name="email" id="email" value="<%=email %>" />
						        </p>
						        <p>
							        <button id="login" name="login" type="submit" class="button green floatright"><span>Enviar</span></button>
                                    <a href="http://www.edomestico.com.br/" >
                                        <button type="button" class="button blue floatright"><span>Voltar</span></button>
                                    </a>


							        <span id="processando" class="note loading">Processando...</span>
						        </p>
						        </div>
                                
                                <% 
                                    
end if
                                    
                                    
                                    %>
						        <div class="clearingfix"></div>
					            
					        <!-- form elements [end] -->
                            </form>
					        <!-- Authorization content [end] -->
				        </div>
			        </div>
		        </div>
		        <!-- Authorization [end] -->
	        </div>
        </div>
    </body>
</html>
<html>
<head>
	<title>Teste CDOSYS - Locaweb</title>
</head>
<body>
 
<!-- Repare que no campo Action, estamos preenchedo com "?envia=sim", esta ser� -->
<!-- a condi��o utilizada para realizar o envio dos e-mails -->
<form name="contato" action="?envia=sim" method="post">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
	<td width="86">Nome:</td>
	<td><input name="nome" type="text" size="50" value="Teste de envio CDOSYS"></td>
</tr>
<tr>
	<td width="86">E-mail:</td>
	<td><input name="emailVisitante" type="text" size="50" maxlength="60"></td>
</tr>
<tr>
	<td width="86">Assunto:</td>
	<td><input name="assunto" type="text" size="23" maxlength="60" value="Teste de envio CDOSYS">
 Telefone: <input name="telefone" type="text" size="12" maxlength="14" value="(xx) XXXX-XXXX"></td>
</tr>
<tr>
	<td width="86">Mensagem:</td>
	<td><textarea name="mensagem" rows="5" cols="42"></textarea></td>
</tr>
<tr><td width="86"></td><td><input type="submit" value="Enviar Mensagem"> | 
<input type="reset" value="Apagar Campos"></td></tr>
</table></form>
<a href="http://www.w3schools.com/asp/asp_send_email.asp">
Para mais informa��es sobre o funcionamento do CDOSYS, clique aqui</a><br />

<%
'Aqui estamos recebendo a condi��o passada pelo formul�rio, fazendo 
'com que o Script em ASP s� seja executado caso o formul�rio seja enviado
If Request.QueryString("envia") = "sim" Then
 
	'Aqui configuramos o e-mail que ser� o Remetente do formul�rio, lembrando que 
	'endere�o de e-mail deve ser uma conta v�lida do seu pr�prio dom�nio.
	emailFrom = "form@academiapamplona.com.br"
 
	'E aqui configuramos o Destinat�rio do formul�rio
	emailTo = "andresites.sp@gmail.com"
 
	'Neste ponto capturamos o e-mail digitado no formul�rio
	emailVisitante = request.form("emailVisitante")
 
	'Neste ponto capturamos o assunto para preencher no e-mail que ser� enviado
	assunto = Request.Form("assunto")
 
	REM Montando o corpo da mensagem com os dados preenchidos no formul�rio
	corpoMensagem = "Nome: " & Request.Form("nome") & "<br />"
	corpoMensagem = corpoMensagem & "E-mail: " & Request.Form("emailVisitante") & "<br />"
	corpoMensagem = corpoMensagem & "Assunto: " & Request.Form("assunto") & "<br />"
	corpoMensagem = corpoMensagem & "Telefone: " & Request.Form("telefone") & "<br />"
	corpoMensagem = corpoMensagem & "Mensagem: " & Request.Form("mensagem")
 
	'As quebra-linhas utilizadas no campo "textarea" n�o s�o convertidas para HTML automaticamente, 
	'fazendo com que tudo que o usu�rio digite neste campo fique alocado em uma �nica linha.
	'Neste ponto n�s convertemos essas quebra-linhas em HTML
	corpoMensagem = Replace(corpoMensagem, vbCrLf, "<br />")
 
	Set objCDOSYSMail = Server.CreateObject("CDO.Message")
 
	'Cria o objeto para configura��o do SMTP	
	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
 
	'SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
 
	'Porta do SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
 
	'Porta do CDO
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
 
	'Timeout
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
 
	objCDOSYSCon.Fields.update
 
	Set objCDOSYSMail.Configuration = objCDOSYSCon
	objCDOSYSMail.From = emailFrom & " <" & emailFrom & ">"
	objCDOSYSMail.To = emailTo
 
	'O campo ReplyTo pode ser preenchido com o e-mail do visitante do site evitando
	'assim a necessidade de preencher o campo From incorretamente com o e-mail do visitante
	objCDOSYSMail.ReplyTo = emailVisitante
 
	'objCDOSYSMail.Cc = "atendimento@tecmobile.net.br"
	'objCDOSYSMail.Bcc = "evandro@tecmobile.net.br"
 
	objCDOSYSMail.Subject = assunto
 
	'Configura e preeche o corpo da mensagem
	objCDOSYSMail.HtmlBody = corpoMensagem
 
	'Envia o e-mail
	objCDOSYSMail.Send
 
	'Destru�mos os objetos utilizados
	set objCDOSYSMail = nothing
	set objCDOSYSCon = nothing
 
	response.write "<h1>Mensagem enviada com sucesso!!</h1>"
	response.write "Mensagem enviada de:  "&emailFrom&"<br />"
	response.write "Mensagem enviada para:  "&emailTo&"<br />"
	response.write "Resposta do e-mail ser� enviada para:  "&emailVisitante&"<br />"
	response.write "<p>Conte�do do e-mail enviado: <br />"&corpoMensagem&"</p>"
	response.write "<a href=javascript:history.go(-1) target=_self>Voltar</a>"
End if
%>

</body>
</html>
<%@ Language=VBScript %>

<%
dim objCon,  objRS, strMsg, strICQ, obCmd
set objCon = Server.CreateObject ("ADODB.Connection")
Set objRS = Server.CreateObject ("ADODB.Recordset")
set obCmd = server.CreateObject("ADODB.Command")
%>
<!--#include file="conecta_bd.asp"-->


<%

dim strLogin, strSenha

strEmail = left(Replace(limpaRequestForm("email"),"'",""),255)


strSenha = left(Replace(limpaRequestForm("senha"),"'",""),15)
if strEmail = "" then
	Session("erro")="senhaerrada"
	Response.Redirect "index.asp"
end if
if strSenha = "" then
	Session("erro")="senhaerrada"
	Response.Redirect "index.asp"
end if
    response.Write len(strSenha)
'Fazer por query parametrizada
objCon.Open strConn
obCmd.ActiveConnection = objCon
obCmd.Prepared = true
     
'strTexto = "Select * From komidas.m_cadastro WHERE email='" & strEmail & "' AND senha='" & strSenha & "'"
strTexto = "Select * From empregador.empregador WHERE (Email=?) AND (Senha=?)"
strTexto=replace(strTexto,"--","")
Set newParameter = obCmd.CreateParameter("@Email", adVarchar, adParamInput, 255, strEmail)
obCmd.Parameters.Append newParameter
Set newParameter = obCmd.CreateParameter("@Senha", adVarchar, adParamInput, 255, strSenha)
obCmd.Parameters.Append newParameter 
obCmd.CommandText =strTexto 
set objRS=obCmd.EXECUTE
'objRS.Open strTexto, objCon,,,adCmdText


if objRS.BOF and objRS.EOF then
	Session("erro")="senhaerrada"
	objRS.Close
	set objRS=nothing
	objCon.Close
	set objCon=nothing
	Response.Redirect "index.asp"
Else
	Session("erro")=""			
	session("ID")=objRS("ID")
	session("email")=strEmail
	session("nome") = objRS("nome")
    session("expira")=objRS("dataExpiracaoAcesso")
	objRS.Close
	set objRS=nothing
	objCon.Close
	set objCon=nothing
    Response.Redirect "main.asp"
    
end if

%>


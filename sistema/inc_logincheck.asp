<%
if session("ID")="" then 
    session("erro")="Sessão expirada. Favor logar novamente"
    response.redirect "index.asp"
end if
%>
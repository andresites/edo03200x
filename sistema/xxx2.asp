<%  dim lacoisa
       response.Write"<h2>request querystring COISA 2</h2>"

    for each yhin in request.QueryString
        response.Write yhin &"=" & request.QueryString(yhin) & "<br>"
    next

   response.Write"<h2>request.forms  COISA 2</h2>"
response.Write request.form("texto1")
    response.Write"<h2>sessions coisas  COISA 2</h2>"
    for each coisa in session.Contents
        response.Write coisa &"=" & session(coisa) & "<br>"
    totalCoisas=totalCoisas & session(coisa) 
    next
    %>
variaveis de sessão ocupando <%=lenB(totalCoisas) %> bytes<br />
<%
    lacoisa = "Lacoisa 2"
    response.Write lacoisa
    response.Write strBassico
       server.Execute("xxx3.asp")
 %>
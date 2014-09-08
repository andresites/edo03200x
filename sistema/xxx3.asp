<%  dim lacoisa
       response.Write"<h2>request querystring COISA 3</h2>"

    for each yhin in request.QueryString
        response.Write yhin &"=" & request.QueryString(yhin) & "<br>"
    next

   response.Write"<h2>request.formsCOISA 3</h2>"
response.Write request.form("texto1")
    response.Write"<h2>sessions coisas COISA 3</h2>"
    for each coisa in session.Contents
        response.Write coisa &"=" & session(coisa) & "<br>"
        totalCoisas = totalCoisas &  session(coisa) 
    next
    
 %>
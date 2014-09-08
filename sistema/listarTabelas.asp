<!--#include file="conecta_bd.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    </head>
    <body>
<form action="" method="post">
    <p>Digite o nome da coluna</p>
    <input type="text" name="nome_coluna" /><br />
    
    <input type="submit" />



</form>

<%'

    if len(request.form("nome_coluna"))>0 then
    'Máquininha de buscar funcionários

    dim objRS, objCon, leSQL, strMenuGrande, empregadoNome, sexo, strMnuPeq
    set objCon = Server.CreateObject ("ADODB.Connection")
    Set objRS = Server.CreateObject ("ADODB.Recordset")
    objCon.open strConn
    'on error resume next
    

'leSQL = "ALTER TABLE contrato.contrato  ADD  numeroCEI varchar(255) NULL"
'objCon.execute leSQL
    if instr(1, request.form("nome_coluna"),".")>0 then splColumnPrefix = split(request.form("nome_coluna"),".")(1) & "_" else splColumnPrefix=""
        
leSQL = "select * from " & request.form("nome_coluna")

    objRS.open leSQL, objCon,,,adCmdText
    if err.number<>0 then
        response.Write "coluna não encontrada " & err.Description
    else    
        if not(objRS.bof and objRS.eof) then
            %>

        <table style="border: 1px solid black;" width="100%" border="1" cellpadding="5px;">
            <%    
            dim indexColumns, prvs
            indexColumns=0
            response.Write "<tr>"
            for each column in objRS.Fields
                response.Write "<th>"
                response.Write column.name
                response.Write "</th>"
                indexColumns=indexColumns+1
                prvs=prvs & "private prv_" & splColumnPrefix & column.name & " <br />"
                prvsInicialize =prvsInicialize &  "prv_" & splColumnPrefix & column.name & "=""-"" <br /> "
                prvsFinaliza =prvsFinaliza &  "prv_" & splColumnPrefix & column.name & "="""" <br /> "
                dims = dims &   column.name & ", "
                requestForms = requestForms & column.name & "= limparequestform(" & chr(34) & column.name & chr(34) & ")<br>"
                
                propertyGet = propertyGet & " Public property get " & splColumnPrefix & column.name  & "() <br>"
                propertyGet = propertyGet &   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"& splColumnPrefix &  column.name & " = prv_" & splColumnPrefix & column.name & "<br>"
                propertyGet = propertyGet & "end property<br><br>"

                propertyLet = propertyLet & " Public property let " & splColumnPrefix & column.name  & "(strIN_" & column.name  & ") <br>"
                propertyLet = propertyLet &   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prv_" & splColumnPrefix & column.name & "=strIN_" & column.name & "<br>"
                propertyLet = propertyLet & "end property<br><br>"
                obrrsCoisa = obrrsCoisa & "prv_" & splColumnPrefix & column.name & "=objRS(" &chr(34) &  column.name & chr(34) & ")<br>"
                gravaRecordSet = gravaRecordSet & "objRS(" &chr(34) &  column.name & chr(34) & ") =" & "prv_" & splColumnPrefix & column.name & "<br>"
            next
            response.Write "</tr>"
            while not objRS.eof
                response.Write "<tr>"    
                    for contist = 0 to indexColumns-1
                        response.Write "<td>"
                        response.Write objRS(contist)
                        response.Write "</td>"
                    next
                response.Write "</tr>"
                 objRS.movenext  
            wend
                objRS.close
                %>
            </table>
        <%
        end if
    end if
end if
   %>
<h1>'PRVS</h1>
<p><%=prvs %></p>
<h1>'inicializa</h1>
<p><%=prvsInicialize %></p>
<h1>'finaliza</h1>
<p><%=prvsFinaliza %></p>

<h1>'construtor GET</h1>
<p><%=propertyGet %></p>


<h1>'construtor LET</h1>
<p><%=propertyLet %></p>
obrrsCoisa
<h1>'recordset</h1>
<p><%=obrrsCoisa %></p>
<h1>'Gravar no recordset</h1>
<p><%=gravaRecordSet %></p>

<h1>
    Dims
</h1>
        <p>DIM <%= dims %></p>
        <h1>Request form</h1>
        <p>DIM <%= requestForms %></p>
</body>
    </html>
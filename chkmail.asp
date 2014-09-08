<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="JSON_2.0.4.asp"-->
<!-- #include file="novosistema/conecta_bd.asp"-->

<%
    strConn = "Provider=Sqloledb; User ID=edomestico_test; Password=Infosys; Initial Catalog=edomestico_test;Data Source=PALM.arvixe.com"

    
    'response.AddHeader "Content-Type", "application/json"
    ''response.ContentType = "application/json"
Function QueryToJSON(dbcomm, params)
        Dim rs, jsa
        Set rs = dbcomm.Execute(,params,1)
        Set jsa = jsArray()
        Do While Not (rs.EOF Or rs.BOF)
                Set jsa(Null) = jsObject()
                For Each col In rs.Fields
                        jsa(Null)(col.Name) = col.Value
                Next
        rs.MoveNext
        Loop
        Set QueryToJSON = jsa
        rs.Close
End Function
dim objCon,  objRS, strMsg, strICQ, obCmd
set objCon = Server.CreateObject ("ADODB.Connection")
Set objRS = Server.CreateObject ("ADODB.Recordset")
set obCmd = server.CreateObject("ADODB.Command")
    strEmail=request.QueryString("email")
objCon.open strConn
obCmd.ActiveConnection = objCon
obCmd.Prepared = true

strTexto = "Select * From empregador.empregador WHERE (Email=?)"

Set newParameter = obCmd.CreateParameter("@Email", adVarchar, adParamInput, 255, strEmail)
obCmd.Parameters.Append newParameter
obCmd.CommandText =strTexto 
set objRS=obCmd.EXECUTE

if (objRS.bof and objRS.eof) then
    'response.Write "false"
else
    response.Write "true"
end if
objRS.close
objCon.close
set objRS=nothing 
set objCon=nothing
set obCmd=nothing
%>
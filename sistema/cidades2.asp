<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="conecta_bd.asp"-->

<%'response.AddHeader "Content-Type", "application/json"
    response.ContentType = "application/json"
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


    cidadeID=limpaQuerystring("id")
    'response.ContentType = "application/json"
    dim objRS, objCon, leSQL, strMenuGrande, empregadoNome, sexo, strMnuPeq
    set objCon = Server.CreateObject ("ADODB.Connection")
    Set objRS = Server.CreateObject ("ADODB.Recordset")
    objCon.open strConn
    objRS.open "select * from dbo.cidade where estadoID=" & cidadeID, objCon,,, adCmdText
    dim jsonStr
    Set jsa = jsArray()
    if not(objRS.bof and objRS.eof) then

        while not objRS.eof
                Set jsa(Null) = jsObject()
                For Each col In objRS.Fields
                        jsa(Null)(col.Name) = col.Value
                Next 
            objRS.moveNext
        wend
        'Set QueryToJSON = jsa
       jsa.flush
    end if


%>
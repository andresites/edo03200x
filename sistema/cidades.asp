<!--#include file="conecta_bd.asp"-->

<script language="javascript" runat="server" src="JSON2.asp"></script>
<%'response.AddHeader "Content-Type", "text/html"

    response.ContentType = "application/json"
    dim objRS, objCon, leSQL, strMenuGrande, empregadoNome, sexo, strMnuPeq
    set objCon = Server.CreateObject ("ADODB.Connection")
    Set objRS = Server.CreateObject ("ADODB.Recordset")
    objCon.open strConn
    objRS.open "select * from dbo.cidade where estadoID=2", objCon,,, adCmdText
    dim jsonStr
    if not(objRS.bof and objRS.eof) then
    
           
            'Seta Objeto
            dim cidades  
            set cidades = JSON.parse
            jsonStr = "{"
        while not objRS.eof
            'cidades.set objRS("Nome"), objRS("ID")
    ''''["Nome": "adad",  "ID": "sdf"]
            'cidades(objRS("Nome"))=objRS("ID")
            'jsonStr = jsonStr & chr(34) & objRS("Nome") & chr(34) & ":" & chr(34) & objRS("ID") &   chr(34) & ","
            'set cidades = JSON.parse("{""Cidade"":""Fabio"", ""ID"":""??""}")
               jsonStr=jsonStr& "[""Nome"": ""adad"",""ID"": ""sdf""],"
            'cidades.set "ID: essa" 
            objRS.moveNext
        wend
        jsonStr=left(jsonStr,len(jsonStr)-1) 'tira a ultima virgula
        jsonStr=jsonStr & "}"
        'response.Write jsonStr
       ' set cidades = JSON.parse(jsonStr)

         response.Write JSON.stringify(jsonStr, null, 2)
        set cidades=nothing
    end if


%>
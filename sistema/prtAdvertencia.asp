<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->
<%
dim  funcID, advtID, preFuncID, bolAdvertencia
preFuncID=limpaquerystring("funcID")
dim fulano, eleexiste
eleexiste=false
set fulano = new empregado
bolAdvertencia=false
if len(preFuncID)>0 then    
    fulano.ID=preFuncID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        funcID=fulano.ID
        nome=fulano.Nome
        bolAdvertencia = fulano.getAdvertencia( limpaquerystring("vtID")    )
    else
        set fulano =  nothing
        response.Redirect "main.asp"
    end if
end if


     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head id="Head1"><title>
	Impressão da Advertência - <%=fulano.advertencia_Titulo %>
</title>
        <style type="text/css">
            .assinaturas
            {
                height:50px;
                width:900px;
            }
            
            .assEmpregadoTestemunha
            {
                float:left;
                width:450px;
            }
        </style>

<script language="javascript">



    function printDiv(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print();

        document.body.innerHTML = originalContents;
    }

</script>
    </head>
    <body>
        <%if bolAdvertencia then %>
<table border="0" width="300px" style="text-align:center">
<tr>
<td><a target="_self" href="javascript:printDiv('printableDiv')"><img src="/Content/images/function-icons/printer-icon.png" style="border-width:0px;" alt="Imprimit" /></a></td>
<td><a target="_self" href="javascript:window.close()"><img src="/Content/images/function-icons/close-icon.png" style="border-width:0px;" alt="Fechar" /></a></td>
</tr>
<tr>
    <td><a target="_self" href="javascript:printDiv('printableDiv')">Imprimir</a></td>
    <td><a target="_self" href="javascript:window.close()">Fechar</a></td>
</tr>
</table>
<hr />
<br />
<br />
            <div id="printableDiv">
        <fieldset>
            <center ><b>Carta de Advertência de Empregado</b> </center>

            <h2><%=fulano.advertencia_Titulo %></h2>
            <br />
                
            <div class="display-label"><%=fulano.Cidade %>, ______ de ___________________________ de _________ </div>

            <p > 
                Senhor(a) <%=fulano.nome %>
                <br />
                Pela presente, fica V. Sª advertido(a) pela(s) falta(s) discriminada(s) abaixo:
                <br />
                <br />
                <%=fulano.advertencia_Texto %>
                <br />
                <br />
                Referente(s) ao mês de <%=fulano.advertencia_MesReferencia %> e ao ano de <%=fulano.advertencia_AnoReferencia %>
                <br />
                <br />
                Esperamos que no futuro V. Sª procure não incorrer em novas faltas.
                <br />
                Atenciosamente,
                <br />
                _______________________________
                <br />
                <br />
                <br />
            </p>
                <div class="assinaturas">
                    <div class="assEmpregadoTestemunha">
                        Ciente do presente em &nbsp&nbsp&nbsp&nbsp ____/______________/________. 
                        <br /><br />
                        _______________________________
                    </div>
                    <br />
                    <br />
                    <div class="assEmpregadoTestemunha">
                        ______________________________________________________<br />
                        <center><b>Testemunha</b></center>
                    </div>
                </div>
        </fieldset>
            
    <br />
    <br />
    <br />
        <fieldset>
            <center ><b>Carta de Advertência de Empregado</b> </center>

            <h2>afanou coisas</h2>
            <br />
                
            <div class="display-label">_________________, ______ de ___________________________ de _________ </div>
            <p > 
                Senhor(a) <%=fulano.nome %>
                <br />
                Pela presente, fica V. Sª advertido(a) pela(s) falta(s) discriminada(s) abaixo:
                <br />
                <br />
                <%=fulano.advertencia_Texto %>
                <br />
                <br />
                Referente(s) ao mês de <%=fulano.advertencia_MesReferencia %> e ao ano de <%=fulano.advertencia_AnoReferencia %>
                <br />
                <br />
                Esperamos que no futuro V. Sª procure não incorrer em novas faltas.
                <br />
                Atenciosamente,
                <br />
                _______________________________
                <br />
                <br />
                <br />
            </p>
            <div class="assinaturas">
                    <div class="assEmpregadoTestemunha">
                        Ciente do presente em &nbsp&nbsp&nbsp&nbsp ____/______________/________. 
                        <br /><br />
                        _______________________________
                    </div>
                    <br />
                    <br />
                    <div class="assEmpregadoTestemunha">
                        ______________________________________________________<br />
                        <center><b>Testemunha</b></center>
                    </div>
                </div>         
        </fieldset>   
                </div> 
    </body>
</html>





<%
else
    response.Write "n/a"
end if         
    
set fulano=nothing
set patrao=nothing
set esseContrato=nothing %>
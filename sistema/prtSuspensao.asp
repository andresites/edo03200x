<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->

<% 
dim  funcID, advtID, preFuncID, bolSuspensao
preFuncID=limpaquerystring("ID")
    bolSuspensao=false
dim fulano, eleexiste
eleexiste=false
set fulano = new empregado

if len(preFuncID)>0 then    
    fulano.ID=preFuncID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        funcID=fulano.ID
        nome=fulano.Nome
        bolSuspensao = fulano.getSuspensao( limpaquerystring("vtID")    )
    else
        set fulano =  nothing
        response.Redirect "main.asp"
    end if
end if

Session.LCID = 1046
     %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head><title>
	Impress&atilde;o Carta de suspens&atilde;o
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
  <script  type="text/javascript">



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
          <%if bolSuspensao then %>
<table border="0" width="300px" style="text-align:center">
<tr>
<tr>
    <td><a target="_self" href="javascript:printDiv('printableDiv')"><img src="/Content/images/function-icons/printer-icon.png" style="border-width:0px;" alt="Imprimit" title="Imprimir" /></a></td>
    <td><a target="_self" href="javascript:window.history.back()"><img src="/Content/images/function-icons/close-icon.png" style="border-width:0px;" alt="Fechar" title="Fechar" /></a></td>
</tr></tr>
<tr>
    <td>Imprimir</td>
    <td>Voltar</a></td>
</tr>
</table>
<hr />
<br />
<br />
    <div id="printableDiv">
        <fieldset>
            <center ><b>Carta de Suspens&atilde;o de Empregado</b> </center>

            <h2><%=fulano.Suspensao_Titulo %></h2>
            <br />
                
            <p > 
                Senhor(a)
                <br />
                Pela presente, fica V. S<sup>a</sup>. suspenso(a) pela(s) falta(s) discriminada(s) abaixo:
                <br />
                <br />
                <%=fulano.Suspensao_Texto %>
                <br />
                <br />
                Desde  <%=formatadata(fulano.Suspensao_DataInicio) %> at&eacute;  <%=formatadata(fulano.Suspensao_DataFim) %>
                <br />
                <br />
                Esperamos que no futuro V. S<sup>a</sup>. procure n&atilde;o incorrer em novas faltas.
                <br />
                Atenciosamente,
                <br />
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
        processado por <b>eDom&eacute;stico</b>
    
    <br />
    <br />
    <br />
        <fieldset>
            <center ><b>Carta de Suspens&atilde;o de Empregado</b> </center>

           <h2><%=fulano.Suspensao_Titulo %></h2>
            <br />
                
            <p > 
                Senhor(a)
                <br />
                Pela presente, fica V. S<sup>a</sup>. suspenso(a) pela(s) falta(s) discriminada(s) abaixo:
                <br />
                <br />
                 <%=fulano.Suspensao_Texto %>
                <br />
                <br />
                Desde  <%=fulano.Suspensao_DataInicio %> at&eacute;  <%=fulano.Suspensao_DataFim %>
                <br />
                <br />
                Esperamos que no futuro V. S<sup>a</sup>. procure n&atilde;o incorrer em novas faltas.
                <br />
                Atenciosamente,
                <br />
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
<%
else
    response.Write "n/a" 
    response.Write getSuspensao
   ' response.Write fulano.Suspensao_Titulo
end if         
    
set fulano=nothing
set patrao=nothing
set esseContrato=nothing %>
    </body>
</html>






<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->

<% 
    dim  funcID, novoContratoID, patrao, esseContrato

    vtID = limpaquerystring("vtID")
    funcID=limpaquerystring("funcID")
dim fulano, eleexiste
eleexiste=false
set fulano = new empregado
if len(funcID)>0 then    
    fulano.ID=funcID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        funcID=fulano.ID
        nome=fulano.Nome
       bolThereIsAAfastamento = fulano.getAfastamento(vtID)
    else
        response.Redirect "main.asp"
    end if
end if
    'set patrao=new empregador
    'patrao.carregaDadosEmpregador session("ID")
'set esseContrato=new contrato
'thereisAContrato = esseContrato.getFkrtContrato(funcID, "true", novoContratoID)
    'if bolThereIsAAfastamento then
     %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	Print
</title>
    <style type="text/css">
        .geral
        {
            border: 1px solid #000000;
            width:500px;
            height:300px;
        }
        .tracejado
        {
            text-align:center;
        }
        .title
        {
            margin-left:70px;
        }
        p
        {
            margin:15px;
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
<table border="0" width="300px" style="text-align:center">
<tr>
    <td><a target="_self" href="javascript:printDiv('printableDiv')"><img src="/Content/images/function-icons/printer-icon.png" style="border-width:0px;" alt="Imprimit" title="Imprimir" /></a></td>
    <td><a target="_self" href="javascript:window.close()"><img src="/Content/images/function-icons/close-icon.png" style="border-width:0px;" alt="Fechar" title="Fechar" /></a></td>
</tr>
<tr>
    <td>Imprimir</td>
    <td>Voltar</a></td>
</tr>
</table>
<hr />
<br />
     <div id="printableDiv">
<div style="margin-left:50px; color:red; font-weight:bold">Empregador, anote as informações abaixo na carteira de trabalho.</div>
<br />

    <div class="geral">
        <center >
            <b>ANOTAÇÕES GERAIS</b> 
        </center>
        <br />
        <center>(Atestado médico, alteração de contrato de trabalho, registros profissionais e outras anotações autorizadas por lei )</center>
        <br />
        <p> 
            Afastado em:  <%=formatadatas(fulano.afastamento_DataAfastamento) %>
            <br />
Motivo: <b>            <%=fulano.afastamento_Motivo %></b>
            <br />

            Data de Retorno : <%=formatadatas(fulano.afastamento_DataRetorno) %>
            <br />
            <br />
            <div class="tracejado">________________________________________</div>
            <div class="tracejado">Assinatura do Empregador</div>
            <br />                
        </p>      
    </div>
         </div>
</body>
</html>

<%
    'else
    '    response.Write "não há afastamento"
    'end if
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing %>
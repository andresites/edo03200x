<!--#include file="conecta_bd.asp"--><%
Response.ContentType = "text/html"
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"

  
    dim  funcID, novoContratoID, patrao, esseContrato

    novoContratoID = limpaquerystring("novoContratoID")
    funcID=limpaquerystring("funcID")
dim fulano, eleexiste
eleexiste=false
set fulano = new empregado
if len(funcID)>0 then    
    fulano.ID=funcID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        nome=fulano.Nome
    else
        response.Redirect "main.asp"
    end if
end if
    set patrao=new empregador
    patrao.carregaDadosEmpregador session("ID")
set esseContrato=new contrato
thereisAContrato = esseContrato.getFkrtContrato(funcID, "true", novoContratoID)

     %>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	Modelo de Carteira de Trabalho
</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
    
    .linhaBorda
    {
        border: 1px solid #000000;
        height:600px;
        width:650px;
    }
    
    #contrato-trabalho
    {
        margin-left:125px;
        float:left;
        width:400px;
    }

    #contrato-trabalho table
    {
        margin-bottom:5px;
        width:100%;
    }

    #contrato-trabalho table td
    {
        line-height:20px;
    }

    #contrato-trabalho table td.pontilhado
    {
        /*border-bottom: 1px dotted #000000;*/
        background: url('/Content/images/dotted.jpg') repeat;
        text-align:justify;
    }

    #contrato-trabalho table td.label
    {
        vertical-align:text-bottom;
        width:1px;
        margin-bottom:5px;
    }

    #contrato-trabalho table td.admissao
    {
        width:106px;   
    }

    #contrato-trabalho table td.especif
    {
        width:167px;   
    }
    #contrato-trabalho table td p.remuneracao
    {
        margin-top: 3px;
        height: 17px;
        width:177px;
        background: #ffffff;
        font: 13.34px helvetica,arial,freesans,clean,sans-serif;
        padding: 0px;
        margin:0px;
    }

    #contrato-trabalho #titulo
    {
        text-align:center;
        margin:15px;
        font-size:16px;
    }

    #contrato-trabalho #ass
    {
        text-align:center;
        margin: 2px 0 15px 0;
        font-size:12px;
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
<table border="0" width="180px" style="text-align:center">
<tr>
    <td><a target="_self" href="javascript:printDiv('printableDiv')"><img src="/Content/images/function-icons/printer-icon.png" style="border-width:0px;" alt="Imprimit" title="Imprimir" /></a></td>
    <td><a target="_self" href="javascript:window.history.back()"><img src="/Content/images/function-icons/close-icon.png" style="border-width:0px;" alt="Fechar" title="Fechar" /></a></td>
</tr>
<tr>
    <td>Imprimir</td>
    <td>Voltar</td>
</tr>
</table>
<hr />
<br />
<br />  
    <div id="printableDiv">
<div class="linhaBorda">
<div id="contrato-trabalho">
    <div id="titulo"><b>Modelo de Carteira de Trabalho</b></div>
    <table>
        <tr>
            <td class="label"><strong>Empregador&nbsp;</strong></td>
            <td class="pontilhado"><%=patrao.empregador_Nome %></td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="label"><strong>CNPJ/MF&nbsp;</strong></td>
            <td class="pontilhado"><%=patrao.empregador_CPF %>     </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="label"><strong>Rua&nbsp;</strong></td>
            <td class="pontilhado"><%=patrao.empregador_Logradouro %> </td>
            <td class="label"><strong>Nº&nbsp;</strong></td>
            <td class="pontilhado"> <%=patrao.empregador_Numero %> <%=patrao.empregador_Complemento %></td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="label"><strong>Município&nbsp;</strong></td>
            <td class="pontilhado"> <%= esseContrato.CidadeID %></td>
            <td class="label"><strong>Estado&nbsp;</strong></td>
            <td class="pontilhado"><%= esseContrato.estado%></td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="label especif"><strong>Esp. do Estabelecimento&nbsp;</strong></td>
            <td class="pontilhado" style="vertical-align:top;">Residencial</td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="label"><strong>Cargo&nbsp;</strong></td>
            <td class="pontilhado"><%=esseContrato.TipoOcupacaoID %></td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="label admissao"><strong>Data Admissão&nbsp;</strong></td>
            <td class="pontilhado" style="vertical-align:top;"><%=esseContrato.DataAdmissao %></td>
            <td class="label"><strong>&nbsp;<strong>CBO</strong>&nbsp;</strong></td>
            <td class="pontilhado" style="vertical-align:top;"><%=esseContrato.cbo %></td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="label"><strong>Registro&nbsp;</strong></td>
            <td class="pontilhado"></td>
            <td class="label"><strong>Fls/Ficha&nbsp;</strong></td>
            <td class="pontilhado"></td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="label pontilhado"><p class="remuneracao"><strong>Remuneração especificada&nbsp;</strong></p><%=formatcurrency(esseContrato.Salario,2) %><br /><%=esseContrato.SalarioPorExtenso %><br /><br /><br /></td>
        </tr>
    </table>
    <div id="ass"><b>Ass. do empregador ou a rogo c/test.</b></div>
</div>
</div>
        </div>
</body>
</html>




<%
      if thereisAContrato then response.Write  "<!--" & esseContrato.baixaImpressao("bolImprimiuModeloCT") & esseContrato.contrato_ID & "-->"
    
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing %>
<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->

<% 
    dim  funcID, novoContratoID, patrao, esseContrato, bolHaVT
    vtID=limpaquerystring("vtID")
    novoContratoID = limpaquerystring("novoContratoID")
    preFuncID=limpaquerystring("funcID")
dim fulano, eleexiste
eleexiste=false
set fulano = new empregado
set esseContrato=new contrato

if not isnumeric(vtID) then response.Redirect "main.asp"
if not isnumeric(preFuncID) then response.Redirect "main.asp"



if len(preFuncID)>0 then    
    fulano.ID=preFuncID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        nome=fulano.Nome
        funcID=fulano.ID
        bolHaVT =  fulano.carregaValeTransporte(vtID,0,0,false)
        essecontrato.getFkrtContrato preFuncID, true, 0 
        novoContratoID = essecontrato.contrato_ID

    else
        set fulano =  nothing
        response.Redirect "main.asp"
    end if
end if
    set patrao=new empregador
    patrao.carregaDadosEmpregador session("ID")

    if bolHaVT then
        if len(fulano.valor)>0 then
            valor = CDBL(replace(FULANO.VALOR,",","."))
            valor=FormatCurrency(valor,2)
        else
            valor = fulano.valor
        end if

     %>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	Recibo de Entrega do Vale Transporte do Empregado: 1
</title>
    <style>
.recibo
{
    height: 390px;
    text-align:center;
    width: 800px;
    border:1px solid #000000;
}

.recibo .tituloRecibo
{
    margin: 35px 0 35px 0;
    text-align:center;    
}

.recibo .textoRecibo
{
    text-align:justify;   
    padding:8px;
}

.recibo .assinaturaRecibo
{
    margin: 55px 0 50px 0;  
    text-align: center;
}

.recibo .cabecalho
{
    margin: 35px 0 35px 15px;   
}

.texto {
	font-family: arial, Courier, "Times New Roman";
	font-size: 12px;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	color: #000000;
}

.relatorio {
	font-family: Verdana, Arial, Courier, "Times New Roman";
	font-size: 10px;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	color: #000000;
}

.linha
{
    height:20px;
    width:800px;
    padding-top:25px;
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
<table border="0" width="300px" style="text-align:center">
<tr>
<td><a target="_self" href="javascript:printDiv('printableDiv')"><img src="/Content/images/function-icons/printer-icon.png" style="border-width:0px;" alt="Imprimit" /></a></td>
<td><a target="_self" href="javascript:window.close()"><img src="/Content/images/function-icons/close-icon.png" style="border-width:0px;" alt="Fechar" /></a></td>
</tr>
<tr>
    <td>Imprimir</td>
    <td>Voltar</a></td>
</tr>
</table>
<hr />
    <div id="printableDiv">
<br />
<br />
<div class="recibo">
    <div class="tituloRecibo"><b>Recibo de Entrega do Vale Transporte</b></div>
    <div class="textoRecibo">
    Eu, <b><%=fulano.nome %></b>, portador do CTPS <%=fulano.carteiratrabalho %>, declaro ter recebido do(a) Sr.(a) <b><%=patrao.empregador_Nome %></b>, <b><%=fulano.Quantidade %></b> dias de vales-transporte no valor total de 
        <b>
            <%'if isnumeric(fulano.Valor) then 
                
                'response.Write formatcurrency(replace(fulano.Valor,".",","),2)
                response.Write formatcurrency(fulano.Valor,2) 
                Response.Write " (" & extenso (fulano.valor)& ") "
            'end if
                 %></b>, 
        referentes ao m&ecirc;s de <b><%= monthname(fulano.MesReferencia) %></b> de <b><%=fulano.AnoReferencia %></b>. 
   Carteira: <%=fulano.CarteiraTrabalho %>     </div> 
    
    <div class="cabecalho">
    <%=patrao.empregador_cidade %>, <%=formatadatas(now) %>
    
    </div>

    <div class="assinaturaRecibo">  
    <div style="float:right">
        <b>Data de admiss&atilde;o:</b><%=esseContrato.DataAdmissao %>
    </div>    
    
    _________________________________________________<br />
    <b class="assinaturaRecibo"><%=fulano.nome %></b> 
    </div>

</div>
<div class="linha">
    <hr />
</div>
<div class="recibo">
    <div class="tituloRecibo"><b>Recibo de Entrega do Vale Transporte</b></div>
    <div class="textoRecibo">
    Eu, <b><%=fulano.nome %></b>, portador do CTPS <%=fulano.carteiratrabalho %>, declaro ter recebido do(a) Sr.(a) <b><%=patrao.empregador_Nome %></b>, <b><%=fulano.Quantidade %></b> dias de vales-transporte no valor total de 
        <b>
            <%'if isnumeric(fulano.Valor) then 
                
                'response.Write formatcurrency(replace(fulano.Valor,".",","),2)
                response.Write formatcurrency(fulano.Valor,2) 
                Response.Write " (" & extenso (fulano.valor)& ") "
            'end if
                 %></b>, 
        referentes ao m&ecirc;s de <b><%=monthname( fulano.MesReferencia ) %></b> de <b><%=fulano.AnoReferencia %></b>. 
   Carteira: <%=fulano.CarteiraTrabalho %>     </div> 
    
    <div class="cabecalho">
    <%=patrao.empregador_cidade %>, <%=formatadatas(now) %>
    
    </div>

    <div class="assinaturaRecibo">  
    <div style="float:right">
        <b>Data de admiss&atilde;o:</b><%=esseContrato.DataAdmissao %>
    </div>    
    
    _________________________________________________<br />
    <b class="assinaturaRecibo"><%=fulano.nome %></b> 
    </div>

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
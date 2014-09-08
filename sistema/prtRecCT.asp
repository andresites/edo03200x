<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->

<% 
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
	Recebimento de Carteira do Empregado: 1
</title>
  <script  type="text/javascript">



      function printDiv(divName) {
          var printContents = document.getElementById(divName).innerHTML;
          var originalContents = document.body.innerHTML;

          document.body.innerHTML = printContents;

          window.print();

          document.body.innerHTML = originalContents;
      }

</script>  
<style>
.recibo
{
    height: 300px;
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
    height:50px;
    width:800px;
    padding-top:25px;
}
</style>
</head>
<body>
<table border="0" width="180px" style="text-align:center">
<tr>
    <td><a target="_self" href="javascript:printDiv('printableDiv')"><img src="/Content/images/function-icons/printer-icon.png" style="border-width:0px;" alt="Imprimit" title="Imprimir" /></a></td>
    <td><a target="_self" href="javascript:window.close()"><img src="/Content/images/function-icons/close-icon.png" style="border-width:0px;" alt="Fechar" title="Fechar" /></a></td>
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
<div class="recibo" style="padding:4px">
    <div class="tituloRecibo"><b>Declaração de Recebimento da Carteira de Trabalho</b></div>
    <div class="textoRecibo">
    Eu, <b><%=fulano.nome %></b>, declaro ter recebido do Sr.(a) <b>
        <%=patrao.empregador_Nome %></b>, minha Carteira de Trabalho devidamente atualizada.</div>
    
    <div class="cabecalho">
    __________________________, _________ de ____________________________ de _____________
    
    </div>
    <div class="assinaturaRecibo">    
    
    _________________________________________________<br />
    <b class="assinaturaRecibo"><%=fulano.nome %></b> 
    </div>
</div>
<div class="linha">
    <hr />
    </div>
<div class="recibo"  style="padding:4px">
    <div class="tituloRecibo"><b>Declaração de Recebimento da Carteira de Trabalho</b></div>
    <div class="textoRecibo">
     Eu, <b><%=fulano.nome %></b>, declaro ter recebido do Sr.(a) <b><%=patrao.empregador_Nome %></b>, minha Carteira de Trabalho devidamente atualizada.</div>
    
    <div class="cabecalho">
    __________________________, _________ de ____________________________ de _____________
    
    </div>
    <div class="assinaturaRecibo">    
    
    _________________________________________________<br />
    <b class="assinaturaRecibo"><%=fulano.nome %></b> 
    </div>
</div>
</div>
</body>
</html>
<%
     if thereisAContrato then response.Write  "<!--" & esseContrato.baixaImpressao("bolImrimiuReciboCT") & esseContrato.contrato_ID & "-->"
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing %>
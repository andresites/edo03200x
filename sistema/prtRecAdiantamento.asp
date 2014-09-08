<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->
<%
dim  funcID, advtID, preFuncID, bolHaAdiantamento
preFuncID=limpaquerystring("funcID")
dim bolErro
bolErro=false
preFuncID=limpaquerystring("ID")
frsID=limpaquerystring("frsID")
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
       
    else
        set fulano =  nothing
%>
<html4f>
    <head>
        <script>
            function saifora(){
                alert('Empregado inv\u00e1lido');
                window.close();
            }

        </script>
    </head>
    <body onload="javascript:saifora();">

    </body>
</html4f>


<%
    end if
end if

if eleexiste then 
    set esseContrato=new contrato
    bolErro = not(essecontrato.getFkrtContrato(funcID, true,0))

    if not isnumeric(mes) then bolErro=true
    if not isnumeric(ano) then bolErro=true
    if not isnumeric(id) then bolErro=true

    if not bolErro then
        set novoempregador = new empregador
        novoempregador.carregaDadosEmpregador session("ID")
        bolHaAdiantamento = fulano.getAdiantamento(frsID)
        if bolHaAdiantamento then


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Recibo de adiantamento</title>
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
<br />
   <div id="printableDiv">
<div class="recibo" style="padding:20px;">
    <div class="tituloRecibo"><b>Recibo de Entrega do Adiantamento <%if fulano.Adiantamento_isPrimeiraParcela13 then response.write " de d&eacute;cimo Terceiro Sal&aacute;rio" %></b></div>
    <div class="textoRecibo">
    Eu, <b><%=fulano.nome %></b>, portador do CPF N° <%=fulano.CPF %> e da carteira de trabalho número: <%=fulano.CarteiraTrabalho%>, declaro ter recebido do Sr.(a) <b><%=novoempregador.empregador_nome %></b>, <b><%= formatcurrency(fulano.Adiantamento_Valor,2)%> (<%=fulano.Adiantamento_ValorPorExtenso %>)</b> referentes ao adiantamento do mês de <b><%=MonthName( fulano.Adiantamento_MesReferencia) %></b> de <b><%=fulano.Adiantamento_AnoReferencia %></b>. 
    </div> 
    
    <div class="cabecalho">
    <%=novoempregador.empregador_cidade %>, <%=day(now)%> de <%=monthname(month(now))%> de <%=year(now) %>
    
    </div>

    <div class="assinaturaRecibo">  
    <div style="float:right">
        <b>Data de admissão:</b><%=essecontrato.DataAdmissao %>
    </div>    
    
    _________________________________________________<br />
    <b class="assinaturaRecibo"><%=fulano.nome%></b> 
    </div>

</div>
<div class="linha">
    <hr />
</div>
<div class="recibo" style="padding:20px;">
    <div class="tituloRecibo"><b>Recibo de Entrega do Adiantamento <%if fulano.Adiantamento_isPrimeiraParcela13 then response.write " de d&eacute;cimo Terceiro Sal&aacute;rio" %></b></div>
    <div class="textoRecibo">
    Eu, <b><%=fulano.nome %></b>,portador do CPF N° <%=fulano.CPF %> e da carteira de trabalho número: <%=fulano.CarteiraTrabalho%>, declaro ter recebido do Sr.(a) <b><%=novoempregador.empregador_nome %></b>, <b><%= formatcurrency(fulano.Adiantamento_Valor,2)%> (<%=fulano.Adiantamento_ValorPorExtenso %>)</b> referentes ao adiantamento do mês de <b><%=MonthName( fulano.Adiantamento_MesReferencia) %></b> de <b><%=fulano.Adiantamento_AnoReferencia %></b>. 
    
    </div> 
    
    <div class="cabecalho">
    <%=novoempregador.empregador_cidade %>, <%=day(now)%> de <%=monthname(month(now)) %> de <%=year(now) %>
    
    </div>

    <div class="assinaturaRecibo">  
    <div style="float:right">
        <b>Data de admissão:</b><%=essecontrato.DataAdmissao %>
    </div>    
    
    _________________________________________________<br />
    <b class="assinaturaRecibo"><%=fulano.nome%></b> 
    </div>

</div>

</div>

</body>
</html>
<%else %>
<html4f>
    <head>
        <script>
            function saifora(){
                alert('Recebimento inv\u00e1lido');
                window.location = 'empregado_ficha.asp&ID=<%=funcID %>&tabs=4';
            }

        </script>
    </head>
    <body onload="javascript:saifora();">

    </body>
</html4f>


<%          end if
        end if
    end if
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing 
     %>
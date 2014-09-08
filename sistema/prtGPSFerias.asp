<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->

<% 
dim  funcID, advtID, preFuncID
preFuncID=limpaquerystring("ID")
frsID=limpaquerystring("frsID")
id=request.QueryString("ID")
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
        response.Redirect "main.asp"
    end if
end if

if eleexiste then 
    dim bolErro
    bolErro=false
    if not isnumeric(mes) then bolErro=true
    if not isnumeric(ano) then bolErro=true
    if not isnumeric(id) then bolErro=true
    if not bolErro then
        set novoempregador = new empregador
        novoempregador.carregaDadosEmpregador session("ID")
        dim objCon,  objRS, strMsg,  obCmd
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.open strConn
        sqlQ="select * from Empregado.SalarioFerias WHERE empregadoID=" & funcID 
        sqlQ = sqlQ & "  AND ID=" & frsID
       
'    response.Write sqlQ
        objRS.open sqlQ, objCon,,,adcmdText
        if not (objRS.bof and objRS.eof) then 

    mes = month(objRS("data"))
    ano = year(objRS("data"))

            totalGPS = cdbl(objRS("INSSEmpregador")) + cdbl(objRS("DescontoINSSEmpregado"))
            totalGPS=formatcurrency(totalGPS,2)
    
                dataRef = "1/" & month(objRS("data")) & "/" & year(objRS("data"))
   ' response.Write objRS("data")
                dataVcto = dateadd("m",1,objRS("data"))
             '   response.Write FormatDateTime(dataRef,1)
    dataVcto= "15/" & right( "00" & month(dataVcto),2)  & "/" &year(dataVcto)



     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Guia da Previdência Social</title>
    <style>
        .previdencia
        {
            border-top: 1px solid #000000;
            border-left: 1px solid #000000;
            font-family:Arial, Verdana;
            font-size:11px;
            height:20px;
        }
        
        .previdenciaSemTop
        {
            border-left: 1px solid #000000;
            font-family:Arial, Verdana;
            font-size:11px;
            height:20px;
        }
        
        .previdenciaSemTop td
        {
            border-bottom: 1px solid #000000;
            border-right: 1px solid #000000;
        }
        
        .previdencia td
        {
            border-bottom: 1px solid #000000;
            border-right: 1px solid #000000;
        }
        
        .previdenciaFoto
        {
            width:375px;
            padding-top:10px;
        }
        
        .nome
        {
            height:100px;
            vertical-align:top;
            text-align:left;
            width:375px;
        }
        
        .titulo1
        {
            font-weight:bold;
            margin-left:10px;
            font-size:13px;
        }
                
        .titulo2
        {
            margin-left:10px;
        }
        
        .interna
        {
            width:140px;
        }
        
        .vencimento
        {
            width:120px;
        }
        
        .dataVencimento
        {
            width:252px;
            text-align:center;
        }
        .autenticacao
        {
            font-size:11px;
            text-align:right;
            padding: 0 55px 80px 0;
        }
        .linha
        {
            margin: 0 0 80px 0;
            width:650px;
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
<br />
<br /><div id="printableDiv">
    <table class="previdencia" width="650" cellspacing="0">
        <tr>
            <td class="previdenciaFoto" rowspan="3">
                <img src="/Content/images/img/previdencia.jpg" align="left" border="0" height="76"width="111" />
                <span class="titulo2">MINIST&Eacute;RIO DA PREVID&Ecirc;NCIA SOCIAL - MPS</span><br />
                <span class="titulo2">SECRETARIA DA RECEITA PREVIDENCIARIA - SRP</span><br />
                <span class="titulo2">INSTITUTO NACIONAL DO SEGURO SOCIAL - INSS</span><br /><br />
                <span class="titulo1">GUIA DA PREVID&Ecirc;NCIA SOCIAL - GPS</span>
            </td>
         <td class="interna">3- C&Oacute;DIGO DE PAGAMENTO</td>
            <td>1600</td>
        </tr>
        <tr>
            <td class="interna">4- COMPET&Ecirc;NCIA</td>
              <td><%=right("00" & mes,2) %>/<%=ano %>&nbsp;</td>
        </tr>
        <tr>
            <td class="interna">5- IDENTIFICADOR</td>
            <td><%=fulano.pis%>&nbsp;</td>
        </tr>
        <tr>
            <td rowspan="3" class="nome"> NOME OU RAZ&Atilde;O SOCIAL / ENDERE&Ccedil;O / TELEFONE<br />NOME<br /><strong><%=fulano.nome%></strong><br /><%=fulano.logradouro%>, <%=fulano.numero %> - <%=fulano.complemento %><br /><%=fulano.Bairro%> - <%=fulano.cidade%> - <%=fulano.CEP%><br /><%=fulano.TelefoneResidencial%></td>
            <td class="interna">6- VALOR INSS</td>
            <td><%=totalGPS%></td>
        </tr>
        <tr>
            <td class="interna">7-</td>
            <td></td>
        </tr>
        <tr>
            <td class="interna">8-</td>
            <td></td>
        </tr>
    </table>
    <table class="previdenciaSemTop" cellspacing="0" width="650">
        <tr>
            <td class="vencimento">2-Vencimento<br />(Uso exclusivo do INSS)</td>
            <td class="dataVencimento"><strong><%=dataVcto %></strong></td>
            <td class="interna">9- VALOR DE OUTRAS ENTIDADES</td>
            <td></td>
        </tr>
    </table>
    <table class="previdenciaSemTop" cellspacing="0" width="650">
        <tr>
            <td rowspan="2" class="previdenciaFoto"><strong>ATEN&Ccedil;&Atilde;O:</strong>&Eacute; vedada a utiliza&ccedil;&atilde;o de GPS para recolhimento de receita de valor inferior ao estipulado em Resolu&ccedil;&atilde;o publicada pela SRP. A receita que resultar valor inferior dever&aacute; ser adicionada &agrave; contribui&ccedil;&atilde;o ou import&acirc;ncia correspondente nos meses subsequentes, at&eacute; que o total seja igual ou superior ao valor m&iacute;nimo fixado.</td>
            <td class="interna">10- ATM / MULTA E JUROS</td>  
            <td></td>
        </tr>
        <tr>
            <td class="interna">11- TOTAL</td>
            <td><%=totalGPS%></td>
        </tr>
    </table>
    <table width="650">
        <tr>
            <td class="autenticacao">
                 12- AUTENTICA&Ccedil;&Atilde;O BANC&Aacute;RIA

            </td>
        </tr>
    </table>
    <div class="linha"><hr /></div>
    <table class="previdencia" width="650" cellspacing="0">
        <tr>
            <td class="previdenciaFoto" rowspan="3">
                <img src="/Content/images/img/previdencia.jpg" align="left" border="0" height="76"width="111" />
                <span class="titulo2">MINIST&Eacute;RIO DA PREVID&Ecirc;NCIA SOCIAL - MPS</span><br />
                <span class="titulo2">SECRETARIA DA RECEITA PREVIDENCIARIA - SRP</span><br />
                <span class="titulo2">INSTITUTO NACIONAL DO SEGURO SOCIAL - INSS</span><br /><br />
                <span class="titulo1">GUIA DA PREVID&Ecirc;NCIA SOCIAL - GPS</span>
            </td>
            <td class="interna">3-- C&Oacute;DIGO DE PAGAMENTO</td>
            <td>1600</td>
        </tr>
        <tr>
            <td class="interna">4- COMPET&Ecirc;NCIA</td>
              <td><%=mes %>/<%=ano %>&nbsp;</td>
        </tr>
        <tr>
            <td class="interna">5- IDENTIFICADOR</td>
            <td><%=fulano.pis%>&nbsp;</td>
        </tr>
        <tr>
            <td rowspan="3" class="nome">1- NOME OU RAZ&Atilde;O SOCIAL / ENDERE&Ccedil;O / TELEFONE<br />NOME<br /><strong><%=fulano.nome%></strong><br /><%=fulano.logradouro%>, <%=fulano.numero %> - <%=fulano.complemento %><br /><%=fulano.Bairro%> - <%=fulano.cidade%> - <%=fulano.CEP%><br /><%=fulano.TelefoneResidencial%></td>
            <td class="interna">6- VALOR INSS</td>
            <td><%=totalGPS%></td>
        </tr>
        <tr>
            <td class="interna">7-</td>
            <td></td>
        </tr>
        <tr>
            <td class="interna">8-</td>
            <td></td>
        </tr>
    </table>
    <table class="previdenciaSemTop" cellspacing="0" width="650">
        <tr>
            <td class="vencimento">2-Vencimento<br />(Uso exclusivo do INSS)</td>
            <td class="dataVencimento"><strong><%=dataVcto %></strong></td>
            <td class="interna">9- VALOR DE OUTRAS ENTIDADES</td>
            <td></td>
        </tr>
    </table>
    <table class="previdenciaSemTop" cellspacing="0" width="650">
        <tr>
            <td rowspan="2" class="previdenciaFoto"><strong>ATEN&Ccedil;&Atilde;O:</strong>&Eacute; vedada a utiliza&ccedil;&atilde;o de GPS para recolhimento de receita de valor inferior ao estipulado em Resolu&ccedil;&atilde;o publicada pela SRP. A receita que resultar valor inferior dever&aacute; ser adicionada &agrave; contribui&ccedil;&atilde;o ou import&acirc;ncia correspondente nos meses subsequentes, at&eacute; que o total seja igual ou superior ao valor m&iacute;nimo fixado.</td>
            <td class="interna">10- ATM / MULTA E JUROS</td>  
            <td></td>
        </tr>
        <tr>
            <td class="interna">11- TOTAL</td>
            <td><%=totalGPS%></td>
        </tr>
    </table>
    <table width="650">
        <tr>
            <td class="autenticacao">
                 12- AUTENTICA&Ccedil;&Atilde;O BANC&Aacute;RIA
            </td>
        </tr>
    </table>
</div>
</body>
</html>
<%      else
            response.Write "registro não encontrado"
        end if
    objRS.close
    objCon.close
    set objRS=nothing
    set objCon=nothing
    else
        response.Write "erro passando parametros"
    end if
else
    response.write "Empregado não encontrato " 
end if
    
    set fulano=nothing
    set novoEmpregador=nothing %>
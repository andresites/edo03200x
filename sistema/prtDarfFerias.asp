<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->

<% 

dim  funcID, advtID, preFuncID
preFuncID=limpaquerystring("funcID")
mes=request.QueryString("mes")
ano=request.QueryString("ano")
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
        sqlQ="select * from Empregado.Salario WHERE empregadoID=" & funcID 
        sqlQ = sqlQ & "  AND MesReferencia=" & mes
        sqlQ = sqlQ & " AND AnoReferencia=" & ano
        atual = "01/" & mes & "/" & ano
        mesVcto = dateadd("m",1,atual)
        dataVcto = "15/" & right("00" & month(mesVcto),2) & year(mesVcto)
        dataRef = getLastDay(atual) & "/" &  Right("00" & mes,2) & "/" & ano
       
        '    response.Write sqlQ
        objRS.open sqlQ, objCon,,,adcmdText
        if not (objRS.bof and objRS.eof) then 
             valor = formatCurrency(objRS("DescontoIRRF"),2)
     %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>DARF</title>
    <style>
        .tabela
        {
            border-left:1px solid #000;
            border-top:1px solid #000;
            font-family:Arial, Verdana;
            font-size:11px;
        }    
        .tabela td
        {
            border-bottom:1px solid #000;
            border-right:1px solid #000;
            height:30px;
            padding:5px;
        }    
        .tabela .autenticacao
        {
            height:70px;
        }
        .titulo1
        {
            font-size:15px;
            font-family:Verdana;
            color:#000;
            font-weight:bold;
            margin-left:80px;
        }
        .titulo2
        {
            font-size:13px;
            font-family:Verdana;
            color:#000;
            font-weight:bold;
            margin-left:26px;
        }
        .titulo3
        {
            font-size:13px;
            font-family:Verdana;
            color:#000;
            font-weight:bold;
            margin-left:10px;
        }
        .nome
        {
            text-align:left;
        }
        .texto
        {
            text-align:center;
            vertical-align:top;
        }
        .autenticacao
        {
            text-align:left;
            vertical-align:top;
        }
        p
        {
            font-size:13px;
            font-family:Verdana;
            color:#000;
            font-weight:bold;
            margin:0;
        }
        
        b
        {
            font-size:9px;
            font-family:Arial,Verdana;
            text-align:center;
        }
        .linha
        {
            width:650px;
            margin: 25px 0 25px 0;
        }
    </style>



    <script>


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
    <table class="tabela" width="650px" cellspacing="0">
        <tr>
            <td style="width:316px;" rowspan="3">
                <img src="/Content/images/img/imgMinisterio.jpg" align="left" border="0" height="77"width="71" />
                    <span class="titulo2">MINISTÉRIO DA FAZENDA</span><br />
                    <span class="titulo3">Secretaria da Receita Federal</span><br />
                    <span class="subtitulo">Documento de Arrecadação de Receitas Federais</span><br />
                    <span class="titulo1">DARF</span>
            </td>
            <td style="width:170px;">02 Período de Apuração:</td>
            <td><%response.write dataRef      ' ((DateTime)ViewData["DataApuracao"]).ToShortDateString() %></td>
        </tr>
        <tr>
            <td>
                03 Número do CPF ou CNPJ</td>
            <td>
                <%=fulano.cpf%></td>
        </tr>
        <tr>
            <td>
                04 Código da Receita</td>
            <td>
                0561</td>
        </tr>
        <tr>
            <td rowspan="2" class="nome">
                01 Nome/Telefone<br /><strong><%=fulano.nome%></strong><br /><strong><%=fulano.telefoneResidencial %></strong></td>
            <td>
                05 Número de Referência</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                06 Data de Vencimento</td>
            <td>
                <%response.write dataVcto': ((DateTime)ViewData["DataVencimento"]).ToShortDateString() %></td>
        </tr>
        <tr>
            <td rowspan="3" class="texto titulo2">
                Texto Livre</td>
            <td>
                07 Valor do Principal</td>
            <td>
                <%response.Write valor': Model.DescontoIRRF %></td>
        </tr>
        <tr>
            <td>
                08 Valor da Multa</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                09 Valor dos Juros e/ou Encargos DL - 1.025/69</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td rowspan="2">
                <p class="texto">Atenção</p><br /><b>É vedado o recolhimento de tributos e contribuições administrados pela Secretaria da Receita Federal cujo valor total seja inferior a R$ 10,00. Ocorrendo tal situação, adicione esse valor ao tributo/contribuição de mesmo código de períodos subseqüentes, até que o total seja igual ou superior a R$ 10,00.</b></td>
            <td>
                10 Valor Total</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="autenticacao">11 Autenticação</td>
        </tr>
    </table>
    <div class="linha"><hr /></div>
    <table class="tabela" width="650px" cellspacing="0">
        <tr>
            <td style="width:316px;" rowspan="3">
                <img src="/Content/images/img/imgMinisterio.jpg" align="left" border="0" height="77"width="71" />
                    <span class="titulo2">MINISTÉRIO DA FAZENDA</span><br />
                    <span class="titulo3">Secretaria da Receita Federal</span><br />
                    <span class="subtitulo">Documento de Arrecadação de Receitas Federais</span><br />
                    <span class="titulo1">DARF</span>
            </td>
            <td style="width:170px;">02 Período de Apuração:</td>
            <td><%=dataRef %></td>
        </tr>
        <tr>
            <td>
                03 Número do CPF ou CNPJ</td>
            <td>
                <%fulano.cpf': Model.Empregado.CPF %></td>
        </tr>
        <tr>
            <td>
                04 Código da Receita</td>
            <td>
                0561</td>
        </tr>
        <tr>
            <td rowspan="2" class="nome">
                01 Nome/Telefone<br /><strong><%=fulano.nome %></strong><br /><strong><%=fulano.telefoneResidencial %></strong></td>
            <td>
                05 Número de Referência</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                06 Data de Vencimento</td>
            <td>
                <%=dataVcto %></td>
        </tr>
        <tr>
            <td rowspan="3" class="texto titulo2">
                Texto Livre</td>
            <td>
                07 Valor do Principal</td>
            <td>
                <%response.Write valor ': Model.DescontoIRRF %></td>
        </tr>
        <tr>
            <td>
                08 Valor da Multa</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                09 Valor dos Juros e/ou Encargos DL - 1.025/69</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td rowspan="2">
                <p class="texto">Atenção</p><br /><b>É vedado o recolhimento de tributos e contribuições administrados pela Secretaria da Receita Federal cujo valor total seja inferior a R$ 10,00. Ocorrendo tal situação, adicione esse valor ao tributo/contribuição de mesmo código de períodos subseqüentes, até que o total seja igual ou superior a R$ 10,00.</b></td>
            <td>
                10 Valor Total</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="autenticacao">11 Autenticação</td>
        </tr>
    </table>
</div>
    <%
        end if
        objRS.close
        objCon.close
                set objCon =nothing
        Set objRS =nothing

    end if
end if         %>
</body>
</html>

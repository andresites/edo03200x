<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->
<%
dim  funcID, advtID, preFuncID
preFuncID=limpaquerystring("funcID")
mes=limpaquerystring("mes")
ano=limpaquerystring("ano")
id=limpaquerystring("ID")
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

    if not isnumeric(ano) then bolErro=true
    if not isnumeric(id) then bolErro=true
    if not bolErro then

    'meses
         set objContrato = new Contrato
        bolThereIsAContrato = objContrato.getFkrtContrato( funcID, true,0)
        if bolThereIsAContrato then  
            anoAdmissao = year(objContrato.dataAdmissao)
            salarioBase = cdbl(objContrato.salario)
            if anoAdmissao<ano then  
                'foi admitido ha mais de um ano
                ' calculo integral
                for x=1 to 12
                   set lasFaltas = fulano.getRecorsetOfFaltasDoMes(x, ano, justificadas)
                    if not (lasFaltas.BOF and lasFaltas.EOF) then 
                        while not lasFaltas.eof
                            totFaltas=totFaltas+1
                            if totFaltas>15 then
                                subMes = subMes - 1
                            end if
                            lasFaltas.movenext
                        wend
                    end if
                    totFaltas=0
                    set lasFaltas =nothing
                    
                NEXT
                totMes =12 - subMes
            periodoDE = "01/01/" & ano
            elseif anoAdmissao=ano then
                'calculo proporcional
                dataAtual = month(now) & "/1/" & year(now)
                diferenca = datediff("d",dataAtual, dtContratacao )
                 periodoDE = day(dtContratacao) & "/" & month(dtContratacao) & "/" & year(dtContratacao)
                if diferenca<0  then diferenca=diferenca*-1
                if diferenca<365 then
                    'o lance dos 15 dias
                    totMes =   cint( datediff("d",dataAtual, dtContratacao )/30 )   
                else
                    totMes=12
                end if
            else
                'erro
                totMes=0
            end if
        end if
'---------------------------------------------




        set novoempregador = new empregador
        novoempregador.carregaDadosEmpregador session("ID")
        dim objCon,  objRS, strMsg,  obCmd
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.open strConn
        sqlQ="select * from Empregado.Salario WHERE empregadoID=" & funcID 
        sqlQ = sqlQ & "  AND is13Salario='true'  " 
        sqlQ = sqlQ & " AND AnoReferencia=" & ano
'    response.Write sqlQ
        objRS.open sqlQ, objCon,,,adcmdText
        if not (objRS.bof and objRS.eof) then 

     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Recibo de 13° Salário</title>
<style>
    #salarios
    {
        width:500px;
        border:1px solid #000000;
    }

    #salarios .linha
    {
        width:100%;
    }

    #salarios .linhaBorda
    {
        width:100%;
        border-bottom-style:double;
    }

    #salarios .linhaBorda table .alignCenter
    {
        text-align:center;
        width:800px;
    }

    #salarios .linhaBorda td.titulos
    {
        height:30px;
        width:366px;
    }

    #salarios .linhaBorda table.rendimento
    {
        width:500px;
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
<% 'var faltas = ViewData["faltas"] == null ? new List<Domain.Entities.Falta>().AsEnumerable() : (IEnumerable<Domain.Entities.Falta>)ViewData["faltas"];  %>
<% 'var tipofalta = ViewData["tipoFaltas"] == null? new List<Domain.Entities.TipoFalta>().AsEnumerable() : (IEnumerable<Domain.Entities.TipoFalta>)ViewData["tipoFaltas"]; %>
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
<br />
<div id="printableDiv">
    <div id="salarios">
        <div class="linhaBorda">
            <table>
                <tr>
                    <td class="alignCenter">
                        <b>RECIBO DE  13&deg; SAL&Aacute;RIO</b>
                    </td>
                </tr>
            </table>
        </div>
        <div class="linhaBorda">
            <table>
                <tr>
                    <td>
                        Nome do Empregado: <strong><%=ucase(fulano.Nome)%></strong><br />
                        <span style="margin-left:50px; margin-top:3px;">PIS:</span><strong><%=fulano.pis %></strong><br /><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Nome do Empregador: <strong><%=ucase(novoempregador.Empregador_Nome)%></strong><br />
                        <span style="margin-left:50px; margin-top:3px;">CPF:</span><strong><%=novoempregador.empregador_cpf %></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        M&ecirc;s de Refer&ecirc;ncia: <strong>Dezembro de <%=ano%></strong>
                    </td>
                </tr>
            </table>
        </div>
        <div class="linhaBorda">


            <table class="rendimento">

                <tr>
                    <th>DESCIR&Ccedil;&Atilde;O</th>
                    <th>RENDIMENTOS</th>
                    <th>DESCONTOS</th>
                </tr>
                <tr>

                    <td>N&uacute;mero de meses devidos <%=totMes %> / 12 <br />
                        periodo de <%=periodoDE %> a 31/12/<%=ano %>
                    </td>
                    <td>
                        <%=formatcurrency(objRS("SalarioBaseContrato"),2) %>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>Adiantamento primeira parcela</td>
                    <td>&nbsp;</td>
                    <td><%=FormatCurrency(objRS("Adiantamento13"),2) %></td>
                </tr>
                <tr>
                    <td>Contribui&ccedil;&atilde;o INSS</td>
                    <td>&nbsp;</td>
                    <td><%=formatCurrency(objRS("DescontoINSSEmpregado"),2) %></td>
                </tr>
                <tr>
                    <td>Imposto de Renda Retido</td>
                    <td>&nbsp;</td>
                    <td><%=formatCurrency(objRS("DescontoIRRF"),2) %></td>
                </tr>
                <%if not isnull(objRS("pensao")) then
                        pensao=cdbl( objRS("pensao") )%>
                <tr>
                    <td>Pensão aliment&iacute;cia</td>
                    <td>&nbsp;</td>
                    <td><%=formatCurrency(objRS("pensao"),2) %></td>
                </tr>

                <%else 
                    pensao=0
                    
                    end if %>
                <tr><td colspan="3"><hr /></td></tr>
                <tr>
                    <td>
                        Totais parciais:  
                    </td>
                    <td><%=formatcurrency(objRS("SalarioBaseContrato"),2) %></td>
                    <td><%
                        parcial = cdbl(objRS("Adiantamento13")) + cdbl(objRS("DescontoINSSEmpregado")) + cdbl(objRS("DescontoIRRF"))  + pensao
                        response.Write formatcurrency(parcial,2)
                         %></td>
                </tr>



                <tr><td colspan="3"><hr /></td></tr>

                <tr><td colspan="2">
                    <p><strong>Saldo l&iacute;quido do  13&deg; sal&aacute;rio:</strong></p>

                    </td>
                    <td>
                        <%=formatCurrency(objRS("SalarioBruto"),2)%>
                    </td>
                </tr>
                <tr style="height:35px;">
                    <td colspan="3">

                        Recebi a import&acirc;ncia liquida de <%= formatCurrency(objRS("SalarioBruto"),2) %>. Dou geral, plena e irrevog&aacute;vel quita&ccedil;&atilde;o.
                        <br /><br />

                        <%=novoempregador.empregador_cidade %>, <%=day(now) %> / <%=month(now) %> / <%=year(now) %>


                        <br /><br />

                        <p align="center">

                            ___________________________________________________________<br />
                            <%=fulano.nome %>

                        </p>

                    </td></tr>

            </table>

            <hr />



        </div>
        </div>
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
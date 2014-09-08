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
'    response.Write sqlQ
        objRS.open sqlQ, objCon,,,adcmdText
        if not (objRS.bof and objRS.eof) then 

     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Recibo de Salário</title>
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
                        <b>RECIBO DE PAGAMENTO DE SAL&Aacute;RIO - <%=ucase(MonthName(mes)) %> / <%=ano %></b>
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
                        M&ecirc;s de Refer&ecirc;ncia: <strong><%=monthname( mes )%> de <%=ano%></strong>
                    </td>
                </tr>
            </table>
        </div>
        <div class="linhaBorda">
            <table class="rendimento">
                <tr>
                    <td class="titulos">
                        <b><u>RENDIMENTOS</u>:</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Sal&aacute;rio Bruto</b>
                    </td>
                    <td>
                        <b><%=formatcurrency(objRS("SalarioBaseContrato"),2)%></b>
                    </td>
                </tr>
                <% if len(objRS("Adiantamento13"))>0 then  
                    
                    strAdiantamento13 = cdbl(objRS("Adiantamento13"))
                    %>
                <tr>
                    <td>
                        02-Adiantamento 13&ordm;. Sal&aacute;rio
                    </td>
                    <td>
                        <%=FormatCurrency(objRS("Adiantamento13"),2) %>
                    </td>
                </tr>
                <% end if  %>
                <tr>
                    <td>
                        Faltas do m&ecirc;s 
                        <% dim strOutFaltas
                            strOutFaltas=""
                           set faltasDoMes = fulano.getRecorsetOfFaltasDoMes(mes, ano, 1)
                            if not (faltasDoMes.bof and faltasDoMes.EOF) then
                            totFaltas=0
                                while not faltasDoMes.EOF
                                    strOutFaltas = strOutFaltas & day(faltasDoMes("dataFalta")) & ","
                            totFaltas=totFaltas + 1
                                    faltasDoMes.movenext
                                wend
                             end if 
                             set faltasDoMes=nothing
                           
                            if len(strOutFaltas)>0 then
                                strOutFaltas=left(strOutFaltas,len(strOutFaltas)-1)
                                response.Write "<b>" & totFaltas  &"</b>"
                                response.Write " <span style='font-size:8px;'>dias (" &  strOutFaltas & " + DSR)</span>"
                            end if%>
                       
                        
                    </td>
                    <td>
                        <%if not isnull(objRS("DescontoFaltas")) then response.Write formatcurrency(objRS("DescontoFaltas"),2)%>
                    </td>
                </tr> 
                <%
                    
                set faltasDoMes = fulano.getRecorsetOfFaltasDoMes(mes, ano, 3)
                if not (faltasDoMes.bof and faltasDoMes.EOF) then
                    while notfaltasDoMes.EOF
                        suspensoes = strOutFaltas & day(faltasDoMes("dataFalta")) & ","
                        faltasDoMes.movenext
                    wend
                end if 
                set faltasDoMes=nothing
                if len(suspensoes)>0 then %>
                <tr>
                    <td colspan="2">
                        Faltas Suspens&otilde;es  (Dia(s) <%=suspensoes %>)
                    </td>
                    
                </tr>
                <%end if %>
                <tr>
                    <td>
                        <b>Sal&aacute;rio de Contribui&ccedil;&atilde;o...............................................</b>
                    </td>
                    <td>
                        <b><%=objRS("SalarioDeContribuicao")%></b>
                    </td>
                </tr> 
            </table>
        </div>
        <div class="linhaBorda">
            <table class="rendimento">
                <tr>
                    <td class="titulos">
                        <b><u>DEDU&Ccedil;&Otilde;ES</u>:</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contribuição ao INSS.
                    </td>
                    <td>
                        <%  response.Write formatCurrency(objRS("DescontoINSSEmpregado"),2)
                            totDeducoes = totDeducoes + cdbl(objRS("DescontoINSSEmpregado") )
                             %>
                    </td>
                </tr>

                <%if not isnull( objRS("DescontoIRRF") ) then %>
                 <tr>
                    <td>
                        I.R. Retido na fonte
                    </td>
                    <td>
                        <%  response.Write formatCurrency(objRS("DescontoIRRF"),2)
                            totDeducoes = totDeducoes + cdbl(objRS("DescontoIRRF") )
                             %>
                    </td>
                </tr>


                <%
                    end if
                    if not(isnull( objRS("Pensao"))) then %>
                <tr>
                    <td>Desconto Pensão </td>
                    <td><%response.Write formatCurrency(objRS("Pensao"),2)
                        totDeducoes = totDeducoes +  cdbl(objRS("Pensao"))
                        %></td>
                </tr>
                <%end if
                 if not(isnull( objRS("DescontoAdiantamento"))) then    
                     %>
                <tr>
                    <td>
                        Desconto Adiantamentos
                    </td>
                    <td>
                        <%response.Write formatCurrency( objRS("DescontoAdiantamento"),2)
                          totDeducoes = totDeducoes +  cdbl(objRS("DescontoAdiantamento")  )%>
                    </td>
                </tr> 
                <% 
                    end if
                    if not (isnull(objRS("DescontoFerias"))) then
                    'response.Write objRS("descontoFerias")
                         if cdbl(objRS("DescontoFerias"))>0 then %>
                <tr>
                    <td>
                        Desconto de f&eacute;rias:
                    </td>
                    <td>
                        <%
                            
                                response.Write formatCurrency(objRS("DescontoFerias"),2)
                                  totDeducoes = totDeducoes +  cdbl(objRS("DescontoFerias"))
                           
                            %>
                    </td>
                </tr>
                <% 
                         end if
                    end if %> 
                <tr>
                    <td>
                        Desconto de 6% Vale Transporte.
                    </td>
                    <td>
                        <% if not isnull(objRS("DescontoVT")) then
                                response.Write formatcurrency(objRS("DescontoVT"),2)
                                totDeducoes = totDeducoes +  cdbl(objRS("DescontoVT"))
                            else 
                                response.Write "0"
                            end if%>
                    </td>
                </tr>
                <!--
                <tr>
                    <td>
                        Imposto de Renda Retido.
                    </td>
                    <td>
                      
                    </td>
                </tr>-->
                <tr>
                    <td>
                        Soma das Dedu&ccedil;&otilde;es........................................................
                    </td>
                    <td>
                        <%
                          response.Write formatcurrency(totDeducoes,2)  
                            
                            
                            %>
                    </td>
                </tr>  
                <tr>
                    <td class="titulos">
                        <b>Saldo  l&iacute;quido do sal&aacute;rio do m&ecirc;s..................................</b>
                    </td>
                    <td>
                        <b><%=formatCurrency(objRS("SalarioBruto"),2)%></b>
                    </td>
                </tr>            
            </table>
            <table>
                <tr>
                    <td>
                        Recebi a import&acirc;ncia l&iacute;quida de <%=formatCurrency(objRS("SalarioBruto"),2)%>. Dou plena e irrevog&aacute;vel quita&ccedil;&atilde;o.<br /><br />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        <%=novoempregador.empregador_cidade %>,&nbsp&nbsp&nbsp<%= day(now) %>/<%= month(now) %>/<%= year(now) %><br /><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        ______________________________________________________________
                    </td>
                </tr>
                <tr>
                    <td class="alignCenter">
                        Assinatura do Empregado
                    </td>
                </tr>
            </table>
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
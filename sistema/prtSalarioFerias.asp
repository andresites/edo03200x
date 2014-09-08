<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->
<%
dim  funcID, advtID, preFuncID
preFuncID=limpaquerystring("funcID")

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
        sqlQ="select * from Empregado.SalarioFerias inner join empregado.Ferias on empregado.SalarioFerias.FeriasID = empregado.Ferias.ID WHERE Empregado.SalarioFerias.empregadoID=" & funcID 
        sqlQ = sqlQ & "  AND SalarioFerias.id=" & frsID
     
'    response.Write sqlQ
        objRS.open sqlQ, objCon,,,adcmdText
        if not (objRS.bof and objRS.eof) then 

     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Recibo de Salário</title>
<style>
    body {
    font-family:Arial;
    font-size:11px;
    }
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
                        <b>RECIBO DE SAL&Aacute;RIO DE FÉRIAS</b>
                    </td>
                </tr>
            </table>
        </div>
        <div class="linhaBorda">
            <table>
                <tr>
                    <td>A - )<br />
                        Nome do Empregado: <strong><%=ucase(fulano.Nome)%></strong><br />
                        <span style="margin-left:50px; margin-top:3px;">Carteira Trabalho:</span> <strong><%=fulano.carteiraTrabalho %></strong><br /><br />
                        <span style="margin-left:50px; margin-top:3px;">PIS:</span> <strong><%=fulano.pis %></strong> -<span style="margin-left:50px; margin-top:3px;">Data de Cadastro:</span> <strong><%=fulano.dataCadPis %></strong><br /><br />
                        <br /><br />
                        

                    </td>
                </tr>
                <tr>
                    <td>B- )<br />
                        Nome do Empregador: <strong><%=ucase(novoempregador.Empregador_Nome)%></strong><br />
                        <span style="margin-left:50px; margin-top:3px;">CPF:</span><strong><%=novoempregador.empregador_cpf %></strong>
                    </td>
                </tr>
                <tr>
                    <td>C- )
                        <br />
                        Período das férias devidas:<br />
                        <span style="margin-left:50px; margin-top:3px;">Período inicial de:</span> <strong><%=FormatDateTime(objRS("DataInicioPeriodo"),1) %></strong><br />
                        <span style="margin-left:50px; margin-top:3px;">Período final  de:</span> <strong><%=FormatDateTime(objRS("DataFimPeriodo"),1) %></strong><br />
                       <br /> Período de gozo de férias:<br />
                        <span style="margin-left:50px; margin-top:3px;">De:</span> <strong><%=FormatDateTime(objRS("DataInicio"),1) %></strong> a <strong><%=FormatDateTime(objRS("DataFim"),1) %></strong><br />
                        
                        
                        <br />
                     <!--   <span style="margin-left:50px; margin-top:3px;">Devendo retornar em:</span> <strong><%=FormatDateTime(objRS("DataFim"),1) %></strong><br />-->


                    </td>
                </tr>
                </table>
                <div class="linhaBorda">
                    <table>
                <tr>
                    <td>
                       
                        D- )
                        <br />
                        <strong>BASE DE C&Aacute;LCULO DA REMUNERA&Ccedil;&Atilde;O DE F&Eacute;RIAS</strong><br />
                        <span style="margin-left:50px; margin-top:3px;">Remuneração base: </span> <strong><%=formatCurrency(objRS("SalarioBaseContrato"),2) %></strong><br />
                        <span style="margin-left:50px; margin-top:3px;">Faltas não justificadas:</span> <strong><%=objRS("FaltasPeriodoAquisitivo") %></strong><br />
                         <span style="margin-left:50px; margin-top:3px;">Salário para cálculo das férias:</span> <strong><%=formatCurrency(objRS("SalarioBaseContrato"),2) %></strong><br />
                        <span style="margin-left:50px; margin-top:3px;">Adicional 1/3 de férias:</span> <strong><%=formatCurrency(objRS("AdicionalFerias"),2) %></strong><br />
                        <strong>TOTAL REMUNERA&Ccedil;&Atilde;O: <%=FORMATCURRENCY(OBJrs("SalarioDeContribuicao"),2) %></strong>
                        <br /><br />
                        <strong>DEDU&Ccedil;&Otilde;ES</strong><br />
                        <span style="margin-left:50px; margin-top:3px;">Encargos do INSS: </span> <strong><%=formatCurrency(objRS("DescontoINSSEmpregado"),2) %></strong><br />
                        <%totDescontos = cdbl(objRS("DescontoINSSEmpregado")) %>
                        <span style="margin-left:50px; margin-top:3px;">Imposto de renda Retido na fonte: </span> <strong><%=formatcurrency(objRS("DescontoIRRF"),2) %></strong><br />
                        <%if not isnull(objRS("DescontoIRRF") ) then totDescontos = totDescontos + cdbl(objRS("DescontoIRRF")) %>
                        <%if not isnull(objRS("pensao")) then %>
                         <span style="margin-left:50px; margin-top:3px;">Pensão: </span> <strong><%=formatcurrency(objRS("pensao"),2) %></strong><br />
                        <%
                              totDescontos = totDescontos + cdbl(objRS("pensao"))
                            end if %>
                        <strong>TOTAL DESCONTOS: <%=FORMATCURRENCY(totDescontos,2) %></strong><br /><br />
                        <strong>L&Iacute;QUIDO DE FÉRIAS: <%
                            
                            salarioBruto = FORMATCURRENCY(objRS("SalarioBruto"),2) 
                            response.write salarioBruto
                            extensoSalarioBruto = extenso(objRS("SalarioBruto")) 
                            %></strong>
                       


                    </td>
                </tr>
            </table>
        </div>


            <table>
                <tr>
                    <td>
                        <%
                           select case weekday(objRS("DataInicio"))
                            case 1'domingo
                                dataRecibo = dateadd("d",-3, objRS("DataInicio"))
                            case 2'segunda
                                dataRecibo = dateadd("d",-4, objRS("DataInicio")) 
                            case 3'terça
                                dataRecibo = dateadd("d",-4, objRS("DataInicio")) 
                            case else
                                dataRecibo = dateadd("d",-2, objRS("DataInicio")) 
                            end select
                            laActualData = right("00" & day(dataRecibo),2) & "/" & right("00" & month(dataRecibo),2) & "/" & year (dataRecibo)

                             %>
                        Importância líquida a sua disposição de conformidade com a lei, relativas às férias do período acima: <% response.write salarioBruto %> (<%=extensoSalarioBruto%>).<br />

	Recebi a importância paga em <%=laActualData %> por motivo de minhas férias, e para clareza firmo o presente recibo dando plena e geral quitação.


                        Recebi a importância líquida de <%=formatCurrency(objRS("SalarioBruto"),2)%> (<%=extensoSalarioBruto%>). Dou plena e irrevogável quitação.<br /><br />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                       &nbsp; <!--<%=novoempregador.Empregador_cidade %>,&nbsp&nbsp&nbsp<%= day(now) %>/<%= month(now) %>/<%= year(now) %><br /><br />-->
                    </td>
                </tr>
                <tr>
                    <td class="alignCenter">
                        <p style="text-align:center;">
                            ______________________________________________________________
                            <br />Assinatura <%=ucase(novoempregador.Empregador_Nome) %>
                            </p>
                    </td>
                </tr>
                <tr>
                    <td class="alignCenter">
                        <p style="text-align:center;">
                            ______________________________________________________________
                            <br />Assinatura <%=ucase(fulano.nome) %>
                            </p
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
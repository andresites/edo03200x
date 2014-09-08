<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->

<%    dim  funcID, novoContratoID, patrao

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
dim thereisAContrato
set esseContrato=new contrato
thereisAContrato = esseContrato.getFkrtContrato(funcID, "true", novoContratoID)

    'Fazer página de retorno com opções vem visíveis para Imprimir o contrato de trabalho, e preencher o vale transporte
    'aliás, remodelar totalmente a página para fazer  uma "dash board" do funcionário.


     %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	Contrato de Trabalho
</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
    
    table td
    {
        vertical-align:top;
    }
    
    .linhaBorda
    {
        border: 1px solid #000000;
        height:900px;
        width:650px;
    }

    .linhaBorda table.alignCenter
    {
        margin:10px 0;
        text-align: center;
        width: 600px;
    }

    .linhaBorda table td.coluna-ab-letra
    {
        padding-left:15px;
        height:110px;
        width:40px;
    }
    
    .linhaBorda table td.coluna-ab
    {
        height:110px;
        width:160px;
    }
    
    .linhaBorda table td.coluna-cde-letra
    {
        padding-left:15px;
        height:30px; 
        width:40px;
    }
    
    .linhaBorda table td.coluna-cde
    {
        height:30px;
        width:160px;
    }
    
    .linhaBorda table td.coluna-fgh-letra
    {
        padding-left:15px;
        height:60px;   
        width:40px;
    }
    
    .linhaBorda table td.coluna-fgh
    {
        height:60px;
        width:160px;
    }
    
    .linhaBorda table.cabecalho
    {
        height:50px;
        text-align:right;
        width:500px;
    }
    
    .linhaBorda table td b.padding
    {
        padding:15px;
    }
    
    .linhaBorda table.ass
    {
        padding-left:50px;
        height:80px;
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
    <div id="nonPrintable">
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
        </div>
<hr />
    <%if thereisAContrato then %>
<div class="linhaBorda" id="printableDiv">
   
    <table class="alignCenter">
        <tr>
            <td>
                <b>CONTRATO DE TRABALHO</b>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="coluna-ab-letra" style="padding-top: 7px; vertical-align:top">
                A- )
            </td>
            <td class="coluna-ab">
                <b>Empregador(a)</b><br />
                CPF/MF<br />
                Endereço:<br />
                Bairro:<br />
                Município:
            </td>
            <td>
                <%=patrao.empregador_Nome %><br />
                <%=patrao.empregador_CPF %>     <br />
                <%=patrao.empregador_Logradouro %>, <%=patrao.empregador_Numero %> <%=patrao.empregador_Complemento %>   <br />
                 <%=patrao.empregador_bairro %> <br />
               <%= patrao.empregador_CidadeID %> <%= patrao.empregador_CEP%>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="coluna-ab-letra" style="vertical-align:top">
                B- )
            </td>
            <td class="coluna-ab">
                <b>Empregada(o)</b><br />
                Filha(o) de (nome mãe)<br />
                Nascida(o):<br />
                Carteira Trabalho<br />
                RG. Nº.<br />
                CPF/MF.<br />
                PIS<br />
                Endereço:<br />
                Bairro:<br />
                Município            
            </td>
            <td>
                <%=fulano.Nome %><br />
               <%=fulano.NomeMae %><br />
               <%= fulano.DataNascimento%><br />
                <%= fulano.CarteiraTrabalho%> <br />
                <%= fulano.rg%>      <br />
                <%= fulano.cpf%>    <br />
               <%= fulano.PIS%>  &nbsp;&nbsp;&nbsp;Data do Cadastro PIS:<%= fulano.DataCadPIS%><br />
                <%=fulano.logradouro %> <br />
                <%=fulano.bairro %><br />
                <%=fulano.cidade %> - <%=fulano.estado %> - CEP: <%=fulano.cep %>
                
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="coluna-cde-letra">
                C- )
            </td>
            <td class="coluna-cde">
                <!-- PRECISA DISSO? -->
                <b>Estabelecimento:</b>
            </td>
            <td>
                Residencial
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="coluna-cde-letra">
                D- )
            </td>
            <td class="coluna-cde">
                <b>Data de Admissão:</b>
            </td>
            <td>
               <%=formataDatas(esseContrato.DataAdmissao) %>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="coluna-cde-letra">
                E- )
            </td>
            <td class="coluna-cde">
               <b>Ocupação:</b>
            </td>
            <td>
                <%=esseContrato.TipoOcupacao %>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="coluna-fgh-letra">
                F- )
            </td>
            <td class="coluna-fgh">
                <b>Salário:</b>
            </td>
            <td>
                <%=esseContrato.Salario %> (<%=esseContrato.SalarioPorExtenso %>) Mensais, sujeito aos descontos previdenciários, e de até 6% do salário de vale transporte.
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="coluna-fgh-letra">
                G- )
            </td>
            <td class="coluna-fgh">
                <b>Experiência:</b>
            </td>
            <td>
                <%if  esseContrato.PeriodoExperienciaID<>4 then 
                   select case esseContrato.PeriodoExperienciaID
                            case 1
                    periodo = "30"
                            case 2
                    periodo = "60"
                            case 3
                    periodo = "90"
                            case else
                        end select%>
                O empregado aceita trabalhar em experiência pelo prazo de <%=periodo %> dias. (Letra ”c”, 2º, do Art.443 da CLT).
                <%end if %>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="coluna-fgh-letra">
                H- )
            </td>
            <td class="coluna-fgh">
                <b>Dias de Trabalho:</b>    
            </td>
            <td>
                Os dias da semana trabalhados são:<br />
               
                <%
                    dim outDias
                    arrDiasDaSemana = esseContrato.DiasDaSemana
                   ' response.Write arrDiasDaSemana
                        for x=0 to ubound(arrDiasDaSemana)
                            outDias=outDias &   arrDiasDaSemana(x) & ", "                    
                        next 
                    response.Write left( outDias, len(outDias)-2)  %>
                
                    
                
            </td>
        </tr>
    </table>

    
        <table>
            <tr>
                <td class="coluna-fgh-letra">
                    I- )
                </td>
                <td class="coluna-fgh">
                FGTS:
                </td>
                <td>
                    <%if esseContrato.RecebeFGTS=true then %>
                Haverá incidência de FGTS.
                    <%else %>
                         Não naverá incidência de FGTS.
                    <%end if %>
                </td>
            </tr>
        </table>

       

    <table class="cabecalho" style="width:640px;">

        <tr>
            <td>
                <%=esseContrato.CidadeID %>, <%=formataDatas (esseContrato.DataEmissaoContrato) %>
            </td>
        </tr>
    </table>

    <table class="ass">
        <tr>
            <td>
                <b>____________________________</b><br /><b class="padding">Assinatura da Empregada(o)</b>
            </td>
            <td>
                <b>____________________________</b><br /><b class="padding">Assinatura do Empregador(a)</b>
            </td>
        </tr>
    </table>
</div>
    <%
        
 response.Write  "<!--" & esseContrato.baixaImpressao("bolImrpimiuContrato") & esseContrato.contrato_ID & "-->"        
        else %>
    Contrato não encontrado
    <%end if %>
</body>
</html>



<%set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing %>
<%Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8" %><!--#include file="conecta_bd.asp"-->

<% 
    dim  funcID, novoContratoID, patrao

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



     %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title> DECLARAÇÃO DE NÃO BENEFICIÁRIO DO VALE-TRANSPORTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript">



    function printDiv(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print();

        document.body.innerHTML = originalContents;
    }

</script>
 <style>
       @page { size: landscape; }
    a  {
	text-decoration: none;
    }

    a:link {
	    color: #030067;
    }

    a:visited {
	    color: #030067;
    }

    a:hover  {
	    color: #FF6600;
    }
    .td1 {
	    border-right: black 0px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid
    }
    .td2 {
	    border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid
    }
    .td3 {
	    border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 0px solid
    }
    .td4 {
	    border-right: black 0px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 0px solid
	    }
    .td5 {
	    border-right: black 0px solid; border-top: black 0px solid; border-left: black 1px solid; border-bottom: black 1px solid
	    }
    .td6 {
	    border-right: black 1px solid; border-top: black 0px solid; border-left: black 1px solid; border-bottom: black 1px solid
	    }
    .td7 {
	    border-right: black 0px solid; border-top: black 1px solid; border-left: black 0px solid; border-bottom: black 0px solid
	    }

    .td8 {
	    border-right: black 1px solid; border-top: black 1px solid; border-left: black 0px solid; border-bottom: black 0px solid
	    }
	
    .td9 {
	    border-right: black 1px solid; border-top: black 0px solid; border-left: black 1px solid; border-bottom: black 0px solid
	    }
	
    .td10 {
	    border-right: black 1px solid; border-top: black 0px solid; border-left: black 0px solid; border-bottom: black 0px solid
	    }
	
    .td11 {
	    border-right: black 1px solid; border-top: black 0px solid; border-left: black 0px solid; border-bottom: black 1px solid
	    }
	
    .td12 {
	    border-right: black 0px solid; border-top: black 0px solid; border-left: black 0px solid; border-bottom: black 1px solid
	    }
    .td13 {
	    border-right: black 1px solid; border-top: black 1px solid; border-left: black 0px solid; border-bottom: black 1px solid
	    }
    font {font-family:verdana, arial, sans serif;
    font-size:07px; font-weight:normal;}
	  
    .font {font-family:arial, sans serif;
    font-size:07px; font-weight:normal;}

    .titulo {font-family:arial, sans serif;
    font-size:10px; font-weight:normal;}

    .titulo2 {font-family:arial, sans serif;
    font-size:16px; font-weight:normal;}
 </style>
</head>                 	  
<body>
    <div id="nonprintalbe">
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
<br />
<br />
<div id="printableDiv">
<table width="100%" border="1" cellspacing="0" cellpadding="0" >
  <tr> 
    <td> <table width="97%" border="0" cellspacing="0" cellpadding="0"  align="center">
        <tr valign="top"> 
          <td height="25"colspan="3" align="center"   ><div class="texto"> 
              <br />
              <span class="bold">DECLARA&Ccedil;&Atilde;O DE N&Atilde;O BENEFICI&Aacute;RIO DO VALE-TRANSPORTE</span>              </div>
            <div ><br />
              <span class="normal">Para o empregado manifestar o desejo de n&atilde;o usufruir do benef&iacute;cio 
              do Vale-Transporte, na forma de legisla&ccedil;&atilde;o espec&iacute;fica.</span><br />
              <br />
          </div></td>
        </tr>
        <tr valign="top"> 
          <td height="28" colspan="3" > <table width="100%" border="1" cellspacing="0" cellpadding="0" >
              <tr> 
                <td width="75%" height="28" valign="top" ><span class="normal">Empregador:</span><br /> 
                  <span class="bold"><%=patrao.empregador_Nome %></span> </td>
                <td width="37%" valign="top" class="td13"><span class="normal">CPF ou CEI:</span><br />
                               
                
                    <span class="bold"><strong><%=patrao.empregador_CPF %>        </strong></span>
                

              </tr>
              <tr valign="top"> 
                <td><span class="normal">Endere&ccedil;o:</span><br />
                    <span><%=patrao.empregador_Logradouro  %>, <%=patrao.empregador_Numero  %>,<%=patrao.empregador_Complemento  %> </span>
                </td>
                <td  width="25%"class="td11"><span class="normal">Bairro:</span><br /><%=patrao.empregador_Bairro  %> <span class="bold"></span>
                </td>
            </tr>

      </table>
      </table>
      <br /> <div > 
        <table width="97%" border="0" cellspacing="0" cellpadding="0"  align="center">
          <tr valign="top"> 
            <td height="28" colspan="5" > <table width="100%" border="1" cellspacing="0" cellpadding="0" >
                <tr> 
                  <td height="28" valign="top" colspan="4" ><span class="normal">Empregado:</span><br /> 
                  <span class="bold"><%=fulano.nome  %></span></td>
                </tr>
 
          <tr valign="top"> 
            <td colspan="3"><span class="normal">Endere&ccedil;o:</span><br />
              <span class="bold"><%=fulano.logradouro  %>, <%=fulano.numero %> 
                  <%=fulano.Complemento %></span></td>
            <td  width="25%"class="td11"><span class="normal">Bairro:</span><br /><%=fulano.bairro  %> <span class="bold"></span></td>
          </tr>
          <tr valign="top"> 
            <td><span class="normal">CEP:</span><br />
              <span class="bold"><%=fulano.CEP  %></span></td>
            <td height="28"><span class="normal">Cidade:</span><br />
              <span class="bold"><%=fulano.cidade  %></span></td>
            <td height="28" class="td12"><span class="normal">Telefone:</span><br /> <span class="bold"><%=fulano.TelefoneResidencial %> </span></td>
            <td height="28" colspan="2"class="td6"><span class="normal">N&ordm; CTPS e S&eacute;rie:</span><br /> 
              <span class="bold"><%=fulano.CarteiraTrabalho %>     </span></td>
          </tr>
        </table>
        </table>
        <br />
        <table width="97%" border="0" cellspacing="0" cellpadding="0" align="center" >
          <tr> 
            <td class="normal"> <div align="justify">Declaro para os devidos fins, que n&atilde;o desejo usufruir 
              dos benef&iacute;cios do Vale-Transporte, instituido pela Lei n&ordm; 
              7.418/85 e altera&ccedil;&otilde;es da Lei nº 7.619/87, conforme 
              motivo(s) abaixo assinalado(s), comprometendo-me a comunicar ao 
              empregador se houver, no futuro qualquer modificação nas razões 
              que determinaram esta decisão.</div></td>
          </tr>
        </table>
        <br />
      </div>
      <table width="97%" border="1" cellspacing="0" cellpadding="0"  align="center">
        <tr> 
          <td width="50%" height="50" class="td1"><DIV align="center" class="bold">MOTIVO(S) 
              DESTA DECLARA&Ccedil;&Atilde;O</DIV>
            <br /> <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr> 
                <td width="19" height="18"><div align="center"><table border="1" bordercolor="#000000">
                <tr><td width="10" height="10"></td></tr></table></div></td>
                <td width="118">&nbsp;<span class="boldfooter">01-</span><span class="normalfooter"> Resid&ecirc;ncia pr&oacute;xima ao local 
                  de trabalho</span></td>
              </tr>
              <tr> 
                <td height="5">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td height="18" ><div align="center"><table border="1" bordercolor="#000000">
                <tr><td width="10" height="10"></td></tr></table></div></td>
                <td>&nbsp;<span class="boldfooter">02-</span> <span class="normalfooter">Meio de transporte pr&oacute;prio</span></td>
              </tr>
              <tr> 
                <td height="5">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td height="18" ><div align="center"><table border="1" bordercolor="#000000">
                <tr><td width="10" height="10"></td></tr></table></div></td>
                <td>&nbsp;<span class="boldfooter">03-</span><span class="normalfooter"> Custo do transporte inferior a 6% do sal&aacute;rio-base</span></td>
              </tr>
              <tr> 
                <td height="5">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td height="18"><div align="center"><table border="1" bordercolor="#000000">
                <tr><td width="10" height="10"></td></tr></table></div></td>
                <td><span class="bold">&nbsp;</span><span class="boldfooter">04-</span> <span class="normalfooter">Outros _________________________</span></td>
              </tr>
            </table>
            <br /></td>
		  
		  <td width="50%" ><p align="center"><br />
              <span class="bold">__________ , _____de________________________de________</span><br />
              <br />
              <br />
              <br />
              <span class="normal">________________________________________________<br />
              ASSINATURA DO EMPREGADO</span><br />
          </td>
		  
		  
        </tr>
      </table>
      <br />
      <div style="float:right">
          <%dim thereisAContrato
            set esseContrato=new contrato
            thereisAContrato = esseContrato.getFkrtContrato(funcID, "true", novoContratoID)
              'response.Write esseContrato.contrato_ID
            if thereisAContrato then response.Write  "<!--" & esseContrato.baixaImpressao("bolImprimiuAbreMaoVT") & esseContrato.contrato_ID & "-->"
              
              'depois pegar o bagulho e obrigar user a declarar que imprimiu, e não deixar apenas implícito
              
                %>
        Data de Admissão: <%=esseContrato.DataAdmissao %>
      </div>
    </td>
  </tr>  
</table> 
</div>
<br />
</body>
</html>
<%set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing %>
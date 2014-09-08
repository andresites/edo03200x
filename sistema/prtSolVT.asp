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
<head>
<title>PEDIDO PARA CONCESS&Atilde;O DO VALE-TRANSPORTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
    @page { size: landscape; }
.monospace {font-family:monospace;
font-size:11px; font-weight:bold;}
 
.small {font-size:10px; font-face:arial, sans serif;}
.rel {
	font-family: Verdana, Arial, Courier, "Times New Roman";
	font-size: 08px;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	color: #000000;
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
<table border="0" width="180px" style="text-align:center">
<tr>
    <td><a target="_self" href="javascript:printDiv('printableDiv')"><img src="/Content/images/function-icons/printer-icon.png" style="border-width:0px;" alt="Imprimit" title="Imprimir" /></a></td>
    <td><a target="_self" href="javascript:window.history.back()"><img src="/Content/images/function-icons/close-icon.png" style="border-width:0px;" alt="Fechar" title="Fechar" /></a></td>
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
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="td2" >
  <tr> 
    <td> <table width="97%" height="53" border="0" align="center" cellpadding="0" cellspacing="0" class="relatorio">
        <tr valign="top"> 
          <td width="112%" height="25" align="center"   ><div class="texto"><strong> 
              <br />
              PEDIDO PARA CONCESS&Atilde;O DO VALE-TRANSPORTE </strong></div>
            <div class="relatorio"><br />
            </div></td>
        </tr>
        <tr valign="top"> 
          <td height="28" > <table width="100%"  cellspacing="0" cellpadding="0" class="relatorio">
              <tr> 
                <td width="75%" height="28" valign="top" class="td1">Empregador:<br /> 
                  <strong><%=patrao.empregador_Nome %></strong> </td>
                <td width="37%" valign="top" class="td2">CPF ou CEI:<br />

                
                    <span class="bold"><strong><%=patrao.empregador_CPF%>        </strong></span>
                

                </td>
              </tr>
            </table></td>
        </tr>
      </table>
      <br />
      <table width="97%" border="0" cellspacing="0" cellpadding="0" align="center" class="relatorio">
        <tr> 
          <td> Interressado em receber, o Vale-Transporte ciente da minha participa&ccedil;&atilde;o 
            referente ao desconto que me cabe em meu contra-cheque ( 6% do meu 
            sal&aacute;ria-base), nos termos da lei n&ordm; 7.418 de 16 de dezembro 
            de 1985. forne&ccedil;o as informa&ccedil;&otilde;es necess&aacute;ria 
            para tanto. </td>
        </tr>
      </table>
      <br /> <div class="relatorio"> 
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class="relatorio" align="center">
          <tr valign="top"> 
            <td height="28" colspan="5" > <table width="100%"  cellspacing="0" cellpadding="0" class="relatorio">
                <tr> 
                  <td width="50%" height="28" valign="top" class="td2">Empregado:<br /> 
                    <strong><%=fulano.nome %></strong></td>
                </tr>
              </table></td>
          </tr>
          <tr valign="top"> 
            <td colspan="3"  class="td6">Endere&ccedil;o:<strong><br />
               <%=fulano.logradouro  %>, <%=fulano.numero %> <%=fulano.complemento %>  </strong></td>
            <td  width="16%"class="td11">Bairro:<br /> <%=fulano.bairro  %><strong></strong></td>
          </tr>
          <tr valign="top"> 
            <td class="td6" height="28">CEP:<br />
            <%=fulano.CEP  %>
            </td>
            <td height="28" class="td11">Cidade:<br /><%=fulano.cidade  %> <strong></strong></td>
            <td height="28" class="td12">Telefone:<br /> <strong><%=fulano.TelefoneResidencial  %>  </strong></td>
            <td height="28" colspan="2"class="td6">N&ordm; CTPS e S&eacute;rie:<br /> 
              <strong><%=fulano.CarteiraTrabalho  %>     </strong></td>
          </tr>
        </table>
        <br />
        <table width="97%" height="16" border="0" align="center" cellpadding="0" cellspacing="0" class="relatorio">
          <tr> 
            <td> <strong>TRANSPORTES UTILIZADOS</strong></td>
          </tr>
        </table>
      </div>
      <table width="97%" height="290" align="center" cellpadding="0"  cellspacing="0" class="relatorio">
        <tr> 
          <td width="50%" height="280" valign="top" class="td1"><DIV align="center" class="relatorio"><strong>DA 
              RESID&Ecirc;NCIA PARA O TRABALHO</strong></DIV>
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="relatorio">
              <tr> 
                <td  width="55%" class="td13" ><div align="center" class="rel">MEIO DE TRANSPORTE 
                  UTILIZADO</div></td>
                <td width="10%" class="td7"><div align="center" class="rel">C&Oacute;DIGO</div></td>
                <td width="35%" class="td1"><div align="center" class="rel">PRE&Ccedil;O 
                    DA PASSAGEM</div></td>
              </tr>
              <tr> 
                <td class="td12" >&nbsp;</td>
                <td class="td2"><br />
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10" height="2">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table> </td>
                <td class="td12"><br />
                </td>
              </tr>
              <tr> 
                <td height="15" class="td12" >&nbsp;</td>
                <td class="td6">&nbsp; <br />
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table> </td>
                <td class="td12"> <br />
                </td>
              </tr>
              <tr> 
                <td class="td12">&nbsp;</td>
                <td class="td6">&nbsp;<br />
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table> </td>
                <td class="td12">&nbsp;</td>
              </tr>
              <tr> 
                <td  class="td12">&nbsp;</td>
                <td class="td6"><br /> <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table></td>
                <td class="td12">&nbsp;</td>
              </tr>
              <tr> 
                <td class="td12">&nbsp;</td>
                <td class="td6">&nbsp;<br />
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table> </td>
                <td class="td12">&nbsp;</td>
              </tr>
            </table>
              <div align="left">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="relatorio">
                <tr>
                  <td class="td12"><div align="center" class="rel">C&Oacute;DIGO 
                      DOS MEIOS DE TRANSPORTES</div></td>
                </tr>
                <tr>
                  <td>01- &Ocirc;nibus de Empresa particular que opera no Munic&iacute;pio<br>
                    02- Micro&ocirc;nibus<br />
                    03- &Ocirc;nibus da Empresa encampada pelo Estado ( munic&iacute;pio 
                    ou intermunicipal)<br />
                    04- &Ocirc;nibus da Empresa particular que fazem linhas intemunicipais 
                    <br>
                      05- Barca<br />
                      06-Metr&ocirc;<br />
                      07-Trem<br />
                  </td>
                </tr>
              </table>
                 </div>

              
            </td>
          <td width="50%" valign="top" class="td2"><DIV align="center" ><strong> 
              DO TRABALHO PARA A RESID&Ecirc;NCIA</strong></DIV>
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="relatorio">
              <tr> 
                <td  width="55%" class="td13" ><div align="center" class="rel">MEIO DE TRANSPORTE 
                  UTILIZADO</div></td>
                <td width="10%" class="td7"><div align="center" class="rel">C&Oacute;DIGO</div></td>
                <td width="35%" class="td1">
<div align="center" class="rel">PRE&Ccedil;O 
                    DA PASSAGEM</div></td>
              </tr>
              <tr> 
                <td class="td12" >&nbsp;</td>
                <td class="td2"><br />
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table> </td>
                <td class="td12"><br />
                </td>
              </tr>
              <tr> 
                <td height="15" class="td12" >&nbsp;</td>
                <td class="td6">&nbsp; <br />
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table> </td>
                <td class="td12"> <br />
                </td>
              </tr>
              <tr> 
                <td class="td12">&nbsp;</td>
                <td class="td6">&nbsp;<br />
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table> </td>
                <td class="td12">&nbsp;</td>
              </tr>
              <tr> 
                <td height="15" class="td12">&nbsp;</td>
                <td class="td6"><br /> <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table></td>
                <td class="td12">&nbsp;</td>
              </tr>
              <tr> 
                <td class="td12">&nbsp;</td>
                <td class="td6">&nbsp;<br>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="2">
                    <tr> 
                      <td width="50%" class="td10">&nbsp;</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table> </td>
                <td class="td12">&nbsp;</td>
              </tr>
            </table> 
            <div align="justify"> Comprometo-me a utilizar o Vale-Transporte exclusivamente 
              para os deslocamentos resid&ecirc;ncia-trabalho-resid&ecirc;ncia,bem 
              como a manter atualizadas as informa&ccedil;&otilde;es acima prestadas. 
              Declaro, ainda, que as informa&ccedil;&otilde;es supra s&atilde;o 
              a express&atilde;o da verdade, ciente de que o erro nas mesmas, 
              ou o uso indevido do Vale, constituir&aacute; falta grave poss&iacute;vel 
              de demiss&atilde;o por justa causa e configura crime de falsidade 
              ideol&oacute;gica, de que trata o art.299 do C&oacute;digo Penal, 
              sujeitando o empregado &agrave;s penas de reclus&atilde;o de at&eacute; 
              tr&ecirc;s anos, al&eacute;m de multa. </div>

          </td>
        </tr>
      </table>
 
      <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="relatorio">
        <tr>
		  
	       <td width="14%" class="td1"><div align="center"><br />
              <br />
              <br />
              <strong><%=esseContrato.CidadeID %></strong><br />
              LOCALIDADE</div></td>
          <td width="10%" class="td1"><div align="center"><br />
              <br />
              <br />

              <strong><%=formataDatas(esseContrato.DataAdmissao) %></strong><br />
              DATA de ADMISS&Atilde;O</div></td>
			  			  
			  
          <td width="26%" class="td2"><div align="center"><br />
              <br />
              <br />
              ____________________________<br />
             ASSINATURA DO DECLARANTE</div></td>
          
          <td width="49%" class="td2"><div align="center"><br />
              <br /> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="relatorio">
                <tr>
                  <td width="41%" class="td10"><div align="center"><br />
                      ___/___/____<br />
                      DATA</div></td>
                  <td width="59%"><div align="center"><br />
                      __________________________<br />
                      ASSINATURA DO EMPREGADO</div></td>
                </tr>
              </table>
                 </div></td>
        </tr>
      </table>
      <br />
    </td>
  </tr>
</table> 
</div>
<br />
</body>
</html>

<%
     if thereisAContrato then response.Write  "<!--" & esseContrato.baixaImpressao("bolImprimiuSolicitacaoVT") & esseContrato.contrato_ID & "-->"
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing %>
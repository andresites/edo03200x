


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1"><title>
	
    E-Domestico - Deveres

</title><meta content="text/html; charset=utf-8" http-equiv="Content-Type" /><meta content="text/css" http-equiv="Content-Style-Type" /><link type="text/css" rel="stylesheet" href="Content/css/Site/style.css" /><link type="text/css" rel="stylesheet" href="Content/css/Site/layout.css" />

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>        

        





	    
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function () {

                $("#fecharGratis").mouseover(function () {
                    $("#cadastre_se").hide();
                });

                $("#cadastre_se").click(function () {
                    location.href = href = "cadastro.asp";

                });

            });
	    </script>

	    <!--[if lt IE 7]>
		    <link href="Content/css/Site/ie_style.css" rel="stylesheet" type="text/css" />
	       <script type="text/javascript" src="Content/js/ie_png.js"></script>
	       <script type="text/javascript">
		       ie_png.fix('.png, #header .row-3 .bg-header, #header .row-3 .tail-bot, .content-tail-left, .content-tail-right');
	       </script>
	    <![endif]-->

	    
    
    <script>

        $.extend({
            getUrlVars: function () {
                var vars = [], hash;
                var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for (var i = 0; i < hashes.length; i++) {
                    hash = hashes[i].split('=');
                    vars.push(hash[0]);
                    vars[hash[0]] = hash[1];
                }
                return vars;
            },
            getUrlVar: function (name) {
                return $.getUrlVars()[name];
            }
        });

        $(document).ready(function () {
            $("dd:not(:first)").hide();
            $("dt a").click(function () {
                $("dd:visible").slideUp("fast");
                $(this).parent().next().slideDown("slow");
                return false;
            });

            var paginaSelecionada = $.getUrlVar('pag');
            if (paginaSelecionada != undefined) {
                $("dt a#" + paginaSelecionada).parent().next().slideDown("fast", function () {
                    $(window).scrollTop($('#' + paginaSelecionada).position().top)
                });
            }
        });
    </script>
</head>
    <body>
            <div class="divTopo">
                <div class="topoHead">
                    <div class="logoFlash" style="margin-right:20px">
			            <a href="/"><img src="Content/images/logo.png" alt="Home" /></a>
                    </div>
                    
    <div id="loggin">
<!--#include file="inc_loginform.asp"-->
    </div>

                     <div class="message tip" id="cadastre_se" style="margin-top: 10px;float:left;margin-left:20px">
                        <a  href="javascript:void(0)" style="float:right; width:20px; height:20px" id="fecharGratis"> <img src="Content/images/close.png" alt="fechar"/></a>
                        <span id="gratis" >Grátis! <b>Clique aqui</b></span> Cadastre-se e teste a <b>Solução</b> por 30 dias.
                    </div>
                </div>
                    

                        

                    <!-- div id="divErro" class="message error divErroLogin" >
	                    <span class="strong" >ERRO!</span> 	    
			                    Verifique todos os campos abaixo.
                    </div>
                
                    
                    <form action="/Sistema/Home/LogOn" class="formLogin" id="form-Login" name="form-Login"  method="post">
                        <input id="Email" name="Email" type="text"  value="Login" onblur="if(this.value=='') this.value='Login'" onfocus="if(this.value =='Login' ) this.value=''" class="txtLogin" style="width: 210px;"  />
                        <input id="Senha" name="Senha" type="password"  value="Senha" onblur="if(this.value=='') this.value='Senha'" onfocus="if(this.value =='Senha' ) this.value=''" class="txtLogin" style="width: 110px;"  />
                        <input type="submit" value="Entrar" id="btnEntrar" onclick="Troca();" name="btnEntrar" class="btnLogin"  />
                        <br />
                        <a id="Cadastro" class="lnkLogin" href="../Cadastro/Edit" >Cadastre-se</a> <a id="esqueci" style="padding:0 10px" class="lnkLogin" href="../../Esqueci/Index" >Esqueci minha senha</a>
                    </form -->
            </div>

	    
    <body id="page4">
       <div class="bg">
            <div class="main">
                <div class="contentImgs">
		            <div id="flash">
                        <div class="menuFlash">

<!--#include file="incMenu.asp"-->

                        </div>
		            </div>
                </div>
            </div>
        </div>
        <div class="main">
            <!--==============================content================================-->
            <div id="content">
                <div class="content-tail-left">
                    <div class="content-tail-right">
                        <div class="content-tail-top">
                            <div class="row-1">
                                <div class="padding">
                                    <br />
                                    <h3 class="head2">
                                        Deveres do Empregador</h3>
                                    <div class="wrapper">
                                        <dl class="duvidas">
                                            <dt>
                                            </dt>
                                            <dd>
                                            </dd>
                                            <dt class="duvidas">
                                                <a href="javascript:" onclick="document.getElementById('1').style.display='none';location.href='#div1';" name="div1" id="div1" style="font-size: 16px;font-weight: bold;" >
                                                    1. PAGAR INDENIZAÇÃO POR DISPENSA SEM JUSTA CAUSA: 
                                                </a>
                                                <br />
O empregado despedido sem justa causa (quando não haja dado motivo) terá direito à indenização nos termos do disposto no art. 477 da CLT, mais: aviso prévio, décimo terceiro salário proporcional, férias vencidas e férias proporcionais acrescidas de 1/3, saldo de salário, horas extras se tiver, adicional noturno. Direito a sacar o valor do FGTS depositado em seu nome na CEF, e demais verbas rescisórias.  
                                                <a id="1" name="1" onclick="this.style.display='none';location.href='#div1';">Saiba + </a>
                                            </dt>
                                            <dd class="duvidas">
A indenização compensatória, atualmente corresponde ao pagamento de 40% (quarenta por cento) de todos os depósitos realizados pelo Empregador na conta vinculada do Fundo de Garantia por Tempo de Serviço – FGTS.

<br /><br />
Dessa forma, ocorrendo dispensa do empregado <u>sem justa causa</u>, o ato do Empregador é considerado danoso para o trabalhador. Por isso, a despedida sem justa causa prevê indenização compensatória que deverá ser suportada pelo Empregador.
                                                <br /><br />
Assim, igualmente, se o empregado se demitir deverá dar aviso prévio a seu empregador, caso não o faça e não cumpra o prazo do aviso prévio, deverá pagar a seu patrão o equivalente ao descumprimento do aviso prévio.
                                                <br /><br />

IMPORTANTE: Há proposta na Câmara dos Deputados para que o Empregador venha a depositar 3,2% por mês junto com os 8% do FGTS, para garantir a indenização pela dispensa sem junta causa.


                                            </dd>
                                               
                                            <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('2').style.display='none';location.href='#div2';" name="div2" id="div2" style="font-size: 16px;font-weight: bold;">
                                                    2. FUNDO DE GARANTIA POR TEMPO DE SERVIÇO (FGTS): 
                                                </a>
                                                <br />
Quanto ao FGTS, após a promulgação da Emenda Constitucional (EC) nº 72, de 2 de abril de 2013, o empregado doméstico foi benefíciado com a obrigatoriedade  de o Empregador ter de efetuar depósitos do Fundo de Garantia por Tempo de Serviço – FGTS, segundo e conforme o disposto no art 7º, III da Constituição Federal (CF), no valor equivalente a 8% (oito por cento) sobre a remuneração mensal paga ao empregado. 
                                                 <a id="2" name="2" onclick="this.style.display='none';location.href='#div2';">Saiba + </a>
                                            </dt>
                                            <dd class="duvidas">
<span style="color:red;">Até o presente momento o depósito corresponde a apenas 8%.</span>
  <br />  <br />
Acha-se em tramitação no Congresso Nacional proposta para acrescenar aos depósitos a importância de valor equivamente a 3,2%, como se fosse um fundo de reserva para eventual demissão sem justa causa. Assim posto, o valor a recolher pelo Empregador aos cofres da Caixa Econômica Federal (CEF) seria na importância de 11,2%, mensalmente.
  <br />  <br />
OBSERVAÇÃO:  1) Se o empregado for demitido sem justa causa poderá sacar o adicional de 3,2%. 2) Se o empregado for demtiido por Justa Causa ou PEDIR DEMISSÃO o Empregador poderá receber de volta o equivalente ao 3.2%.   
  <br />  <br />
Obrigatóriedade de pagamento: Segundo o Ministério do Trabalho e Emprego, a obrigatoriedade de pagamento do FGTS por parte do Empregador somente terá início após a regulamentação da Emenda Constituional (EC). Portanto, para empregados que já estejam prestando serviços não existe tal obrigatoriedade, além do que referida regulamentação não deverá retroagir.
  <br />  <br />
<strong>IMPORTANTE:</strong> Para efetuar os depósitos a favor do empregado doméstico, será necessário que o Empregador proceda como segue:   <br />
	a) efetuar a sua inscrição no Cadastro Específico do INSS – CEI como “empregador doméstico”;   <br />
	b) depositar mensalmente o valor de 11,2% calculado sobre o salário de contribuição do empregado doméstico (isto é, sobre o salário incluindo horas extras, adicional, descontadas as faltas); igual percentagem quando do pagamento de Férias a serem gozadas, sempre acrescidas de 1/3; e,  também, quando do pagamento do 13º. Salário;    <br />
	c) realizado o primeiro depósito para o empregado doméstico, haverá a obrigação do Empregador em continuar a realizar os depósitos mensalmente até o desligamento do empregado;    <br />
	d) de se ressaltar que, havendo demissão sem justa causa, o Empregador não terá de pagar ao trabalhador multa rescisória no valor de 40% (quarenta por cento) uma vez que já estará pagando mensalmente os 3,2% do Adicional da demissão Sem Justa Causa.  <br />
                                                  <br />
<strong>Recolhimento do FGTS: </strong>Deve ser depositado até o dia 7 (sete) do mês seguinte, conforme Guia preenchida em 2 (duas) vias: Uma via para o banco e outra para o Empregador. O recolhimento requer atenção: (Necessário que o empregador baixe o programa que é encontrado no site da Caixa Econômica Federal – CEF, denominado SEFIP). O empregador poderá preencher as informações relacionadas a seu empregado realizando o envio via Conectividade Social que permite a transmissão dos dados. Simultaneamente é gerada a guia para pagamento do FGTS do empregado.   <br />  <br />

<strong>IMPORTANTISSIMO:</strong> A partir da regulamentação da EC 72, este pagamento será realizado em uma Única Guia e Boleto (INSS, FGTS e Seguro Acidente do Trabalho) no site da Receita Federal, prévia inscrição de Empregador no cadastro do SUPER SIMPLES dos Patrões.





                                            </dd>
                                            <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('3').style.display='none';location.href='#div3';" name="div3" id="div3" style="font-size: 16px;font-weight: bold;">
                                                    3. PAGAR SALÁRIO NUNCA INFERIOR AO SALÁRIO MÍNIMO: 
                                                </a>
                                                <br />
                                               Com o advento da Constituição Federal de 1988, o empregado doméstico não deve perceber salário inferior a um salário mínimo, portanto, o Empregador não pode combinar com seu empregado salário menor.
                                                <a id="3" name="3" onclick="this.style.display='none';location.href='#div3';">Saiba + </a>
                                            </dt>
                                            <dd class="duvidas">
O trabalhador doméstico deve receber salário mínimo como base salarial, uma vez que é determinado pela própria Constituição que está a dizer “Art. 7º - São direitos dos trabalhadores urbanos e rurais, além de outros que visem à melhoria de sua condição social:  inciso IV - “salário mínimo, fixado em lei, nacionalmente unificado, capaz de atender a suas necessidades vitais básicas e às de sua família com moradia, alimentação, educação, saúde, lazer, vestuário, higiene, transporte e previdência social, com reajustes periódicos que lhe preservem o poder aquisitivo, sendo vedada sua vinculação para qualquer fim”.
<br /><br />

Entretanto, salientamos que há alguns Estados da Federação que, após a Lei Complementar nº 103, de 14 de junho de 2000, estão autorizados a instituir Piso Salarial Regional, quais sejam: São Paulo, Paraná, Rio Grande do Sul, Rio de Janeiro e Santa Catarina. Por terem uma economia mais forte, estabeleceram um Piso Salarial Regional mais elevado que o Salário Mínimo Nacional para remunerar o empregado domestico, denominado de Piso Mínimo Regional. Assim, nesses Estados, para os empregados domésticos deverá ser pago o Piso Mínimo Regional. Conforme a seguir:	<br />
                                                <br />
Estado de São Paulo 		R$ 810,00 a partir de 01-01-2014.<br />
Estado do Paraná 			R$ 914,82 a partir de 01-05-2013.<br />
Estado de Rio Grande do Sul 	R$ 868,00 a partir de 01-01-2014.<br />
Estado de Rio de Janeiro 		R$ 874,00 a partir de 01-01-2014.<br />
Estado de Santa Catarina 		R$ 835,00 a partir de 01-01-2014.<br />

                                                <br /><br />
O salário do empregado domestico poderá ser pago de forma mensal, quinzenal, semanal ou mesmo por dia. A Consolidação das Leis do Trabalho (CLT), em seu artigos 464 e 465 estabelece: 
<br />
<br />
	<div style="font-style:italic; margin-left:15px; width:600px;">“Art. 464 - O pagamento do salário deverá ser efetuado contra 			recibo, assinado pelo empregado; em se tratando de analfabeto, 			mediante sua impressão digital, ou, não sendo esta possível, a seu 		rogo” (outra pessoa assina por ele).
        <br />
	Parágrafo único. Terá força de recibo o comprovante de depósito em 		conta bancária, aberta para esse fim em nome de cada empregado, 		com o consentimento deste, em estabelecimento de crédito próximo 		ao local de trabalho. (Parágrafo incluído pela Lei nº 9.528,de 10.12.1997)”
        <br />
	“Art. 465 - O pagamento dos salários será efetuado em dia útil e no local do 	trabalho, dentro do horário do serviço ou imediatamente após o 	encerramento deste”.
        <br />
O salário mensal deverá estar à disposição do trabalhador até ao 5º dia útil do mês subseqüente ao vencido.
        <br />
	</div> <br />
O salário mensal deverá estar à disposição do trabalhador até ao 5º dia útil do mês subseqüente ao vencido.
                                            </dd>
                                            <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('4').style.display='none';location.href='#div4';" name="div4" id="div4" style="font-size: 16px;font-weight: bold;">
                                                    4. PAGAR DÉCIMO TERCEIRO (13º) SALÁRIO: 
                                                </a>
                                                <br />
                                                
                                                Com o advento da Constituição Federal de 1988, o empregado doméstico tem direito a receber o Décimo Terceiro Salário, ou seja, de forma idêntica aos demais trabalhadores. O pagamento deverá ser realizado em (2) duas parcelas. A primeira, no valor da metade do salário do mês de pagamento, deverá ser efetivada entre fevereiro (com as férias) a 30 de novembro de cada ano, caso o empregado deseje receber o décimo terceiro salário juntamente com as férias e antes de novembro, em tal hipótese, deverá fazer tal pedido ao Empregador quando solicitar suas férias). 
                                                 <a id="4" name="4" onclick="this.style.display='none';location.href='#div4';">Saiba + </a>
                                            </dt>
                                            <dd class="duvidas">
Não havendo tal solicitação, o pagamento da primeira parcela deverá ser realizado em 30 de novembro. É pago como se fosse um vale ou adiantamento. Os encargos incidentes serão computados somente quando do pagamento da segunda parcela que deverá ocorrer até ao dia 20 de dezembro.
<br /><br />
Para o empregado que tiver mais de um ano de prestação de serviços deverá ser pago o equivalente à 1/12 (um doze avos) por cada mês de serviço trabalhado, considerando-se como mês a fração igual ou superior a 15 (quinze) dias, corridos, trabalhados.<br /><br />
Se ocorrer a demissão do empregado doméstico o valor da primeira parcela do 13º salário deverá ser descontada na liquidação final junto com as verbas rescisórias.<br /><br />

                                            </dd>

                                            <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('5').style.display='none';location.href='#div5';" name="div5" id="div5" style="font-size: 16px;font-weight: bold;">
                                                    5. PAGAR TRABALHO NOTURNO EM VALOR SUPERIOR ÀO DIURNO: 
                                                </a>
                                                <br />
O empregado doméstico, diante da expressa previsão legal inserida na Emenda Constitucional (EC) nº 72, de 2 de abril de 2013 passou a ter acesso ao benefício do adicional noturno  conforme ditado pela Constituição Federal (CF), em seu art 7º, IX que está a dizer que:  “remuneração do trabalho noturno superior à do diurno”. 
                                                <a id="5" name="5" onclick="this.style.display='none';location.href='#div5';">Saiba + </a>
                                            </dt>
                                            <dd class="duvidas">
A consolidação das Leis do Trabalho – CLT, em seu art. 73, estabelece que: “Salvo nos casos de revezamento semanal ou quinzenal, o trabalho adicional noturno terá um acréscimo de 20% (vinte por cento), no mínimo, sobre a hora diurna”.
   <br />   <br />
Hora noturna: A hora noturna é computada como tendo apenas 52 minutos e 30 segundos, ou seja, há uma redução de 7 minutos e 30 segundos em relação à hora diurna normal, de 60 (sessenta) minutos.
   <br />   <br />
Horário noturno: É o trabalho realizado entre as 22 (Vinte e duas) horas de um dia até as 5 (cinco) horas do dia seguinte. Consequentemente, utilizando-se na hora noturna essa diminuição (de 7 minutos e 30 segundos), a jornada noturna de 8 (oito) horas, estará sendo reduzida para apenas 7 (sete) horas.
   <br />   <br />
Intervalo para repouso ou alimentação: No trabalho noturno os intervalos nas jornadas de trabalho estão assim disciplinadas:   <br />
- Até 4 horas: sem intervalo;   <br />
- Superior a 4 horas e não excedente de 6 horas: invervalo de 15 minutos:   <br />
- Superior a 6 horas: mínimo de 1 hora e no máximo de 2 horas.   <br />

                                            </dd>
                                            <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('6').style.display='none';location.href='#div6';" name="div6" id="div6" style="font-size: 16px;font-weight: bold;">
                                                    6. PAGAR SALARIO FAMÍLIA: 
                                                </a>
                                                <br />
                                               A partir da promulgação da Emenda Constitucional – EC. nº 72, de 2 de abril de 2013, os empregados domésticos, passaram a receber o benefício que é pago aos empregados segurados no INSS, como sustento dos filhos de até 14 anos de idade ou inválidos de qualquer idade. Equiparam-se aos filhos os enteados e os tutelados, estes últimos desde que não possuam bens suficientes para o próprio sustento, devendo a dependência econômica de ambos ser comprovada.
                                                 <a id="6" name="6" onclick="this.style.display='none';location.href='#div6';">Saiba + </a>
                                            </dt>
                                            <dd class="duvidas">
                                                De ressaltar-se que os empregados domésticos que estão desempregados não têm direito ao benefício do salário família. 
 <br /><br />
O benefício será encerrado quando o(a) filho(a) completar 14 anos, bem como quando o filho vier a falecer, por ocasião de desemprego do empregado segurado no INSS  e, no caso de filho inválido ao ocorrer a cessação da incapacidade.
<br /><br />
O salário-família é devido a partir da apresentação ao Empregador dos seguintes documentos:<br />
a) Carteira de Trabalho, <br />
b) Certidão de nascimento do filho; <br />
c) Caderneta de vacinação dos filhos com até 6 anos, <br />
d) Comprovante de frequência à escola a partir de 7 anos.<br />
                                                <br />
O valor da cota do salário-família por filho ou equiparado de qualquer condição, até 14 (quatorze) anos de idade, ou inválido de qualquer idade, a partir de 1º de janeiro de 2013, corresponde:
                                                <br /><br />
I - R$ 33,16 (trinta e três reais e dezesseis centavos) para o segurado com remuneração mensal não superior a R$ 646,55 (seiscentos e quarenta e seis reais e cinquenta e cinco centavos);
                                                <br /><br />
II - R$ 23,36 (vinte e três reais e trinta e seis centavos) para o segurado com remuneração mensal até R$ 971,78 (novecentos e setenta e uns reais e setenta e oito centavos).
                                                <br /><br />
 § 1º Para fins do disposto neste artigo, considera-se remuneração mensal do segurado o valor total do respectivo salário-de-contribuição, ainda que resultante da soma dos salários-de-contribuição correspondentes a atividades simultâneas.
                                                <br /><br />
§ 2º O direito à cota do salário-família é definido em razão da remuneração que seria devida ao empregado no mês, independentemente do número de dias efetivamente trabalhados.
                                                <br /><br />
§ 3º Todas as importâncias que integram o salário-de-contribuição serão consideradas como parte integrante da remuneração do mês, exceto o décimo terceiro salário e o adicional de férias previsto no inciso XVII do art. 7º da Constituição, para efeito de definição do direito à cota do salário-família.
                                                <br /><br />
§ 4º A cota do salário-família é devida proporcionalmente aos dias trabalhados nos meses de admissão e demissão do empregado.
<br /><br />
A partir de 1º de janeiro de 2.014, corresponde:
<br /><br />
I - R$ 35,00 (trinta e cinco reais) para o segurado com remuneração mensal não superior a R$ 682,51 (seiscentos oitenta e dois reais e cinquenta um centavos);
<br /><br />
II - R$ 24,66 (vinte e quatro reais e sessenta e seis centavos) para o segurado com remuneração mensal até R$ 1.025,81 (hum mil e vinte e cinco reais e oitenta e um centavos).
<br /><br />
                                            </dd>
                                            <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('7').style.display='none';location.href='#div7';" name="div7" id="div7" style="font-size: 16px;font-weight: bold;">
                                                    7. HORAS EXTRAS: 
                                                </a>
                                                <br />
                                                Quando uma das partes (Empregador ou Empregado) quiser rescindir o contrato de trabalho
                                                deverá comunicar à outra sua decisão, com antecedência mínima de 30 (trinta) dias. <a id="7" name="7" onclick="this.style.display='none';location.href='#div7';">Saiba + </a>
                                            </dt>
                                            <dd class="duvidas">
                                               O empregado doméstico tem direito à remuneração do serviço extraordinário (ou seja horas que excederem às 8 horas diárias). O serviço extra (isto é a hora extra) deverá ter seu pagamento acrescido em, no mínimo, cinquenta por cento à da hora normal. Ou seja, ao pagamento de horas extras, conforme o disposto na Emenda Constitucional (EC) nº 72, promulgada em 02/04/2013. O empregado doméstico tem direito à remuneração do serviço extraordinário superior a oito horas diárias e 44 semanais, com no mínimo de acréscimo de 50% (cinquenta por cento) à da hora normal, aplicando-se no caso da hora extra noturna o adicional noturno previsto no inciso IX do artigo 7º, da Constituição Federal equivalente a um acréscimo de no mínimo 20% (vinte por cento).(vide item 4.IX supra)
                                                  <br />  <br />
Portanto, se se tratar de hora extra noturna (trabalhada entre 22;oohs, e 5;00hs, do dia seguinte o percentual a ser aplicado será de 20% sobre a Hora Extra normal.
                                                  <br />  <br />
Incidências: As horas extras, bem como o adicional noturno, pagos com habitualidade integram: a) o salário para todos os efeitos legais, b) o descanso semanal remunerado DSR, c) férias e mais 1/3 de férias, d) décimo terceiro salário, e) aviso prévio indenizado. (Considera-se habitualidade: o trabalho de forma repetitiva no tempo; que se transformou em hábito; trabalho costumeiro; horas extras realizadas de forma constante; de forma frequente).
  <br />  <br />
A Consolidação das Leis do Trabalho – CLT, estabelece com clareza a forma prevista para a remuneração da hora extra em seu art. 59 e parágrafos, vejamos:   <br />
 Art. 59 - A duração normal do trabalho poderá ser acrescida de horas suplementares, em número não excedente de 2 (duas), mediante acordo escrito entre empregador e empregado, ou mediante contrato coletivo de trabalho.  <br />
        § 1º - Do acordo ou do contrato coletivo de trabalho deverá constar, obrigatoriamente, a importância da remuneração da hora suplementar, que será, pelo menos, 20% (vinte por cento) superior à da hora normal.   (Vide CF, art. 7º inciso XVI)  <br />
        § 2o  Poderá ser dispensado o pagamento do acréscimo de salário se, por força de acordo ou convenção coletiva de trabalho, o excesso de horas em um dia for compensado pela correspondente diminuição em outro dia, de maneira que não exceda, no período máximo de um ano, à soma das jornadas semanais de trabalho previstas, nem seja ultrapassado o limite máximo de dez horas diárias. (Redação dada pela Medida Provisória nº 2.164-41, de 2001)  <br />
       § 3º Na hipótese de rescisão do contrato de trabalho sem que tenha havido a compensação integral da jornada extraordinária, na forma do parágrafo anterior, o trabalhador fará jus ao pagamento das horas extras não compensadas, calculadas sobre o valor da remuneração na data da rescisão. (Incluído pela Lei nº 9.601, de 21.1.1998)  <br />
        § 4o  Os empregados sob o regime de tempo parcial, (ou seja, com jornada de trabalho inferior a 8,00hs, diárias) não poderão prestar horas extras. (Incluída pela Medida Provisória nº 2.164-41, de 2001)  <br />
<br /><br /><strong>BANCO DE HORAS:</strong><br />
- Pagamento de pelo menos 40 Horas Extras(HE) trabalhadas no mês;<br />
- Além deste limite mínimo (40 HE) ás HE, podem ser compensadas, com folgas em até um ano.<br />
- As HE trabalhadas em um dia permitem sua compensação com jornada menor em outro dia.<br />
- A remuneração da HE, dirá respeito apenas às que não tiverem sido compensadas.<br /><br />
<strong>Controle de horário:</strong> Recomenda-se ao Empregador estabelecer uma “Planilha Diária” ou “Livro de Ponto” onde seja indicado pelo empregado, diariamente os horários por ele trabalhados, fazendo constar os de entrada, de repouso e de saída com assinatura ou visto do empregado.


                                            </dd>
                                            <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('8').style.display='none';location.href='#div8';" name="div8" id="div8" style="font-size: 16px;font-weight: bold;">
                                                    8. PAGAR FÉRIAS DE 30 DIAS COM ACRESCIMO DE 1/3: 
                                                </a><br />
                                                Após cada período de 12 (doze) meses de trabalho prestados à mesma pessoa ou família, contados da data de sua admissão, o empregado doméstico a partir da edição da Lei nº. 11.324, de 19 de julho de 2006, tem direito a férias anuais remuneradas de 30 (trinta) dias corridos. Tal período de doze meses é chamado de período aquisitivo de férias. Estas deverão ser pagas com o acréscimo de 1/3 do valor do salário a título de Gratificação de Férias.
                                                
                                                <a id="8" name="8" onclick="this.style.display='none';location.href='#div8';">Saiba + </a>
                                                <br />

                                            </dt>
                                            <dd class="duvidas">
                                              O empregado poderá solicitar ao Empregador a conversão de 1/3 do valor das férias em abono pecuniário ou seja 10 (dez) dias, (é a troca do gozo de parte das férias, por dinheiro), desde que o solicite em até 15 dias antes do término do período aquisitivo. Este é um direito do empregado doméstico ao qual o Empregador não pode opor-se.
                                                <br /><br />
O período em que as férias serão gozadas é fixado a critério do Empregador e deverá ser concedido dentro dos 12 meses subseqüentes à data em que o empregado tiver adquirido o período aquisitivo de férias. O pagamento da remuneração das férias será efetuado até 2 (dois) dias antes do início do gozo.
<br /><br />
<strong>Férias por dias efetivamente trabalhados,</strong>  Para o computo das férias, o Empregador poderá observar a seu favor a proporcionalidade que a Consolidação das Leis do Trabalho CLT, estabelece para a concessão de férias em função das eventuais faltas (injustificadas, de suspensão, não abonadas pelo empregador) do empregado ao serviço. Assim poderá concedê-las dentro da proporcionalidade especificada pela lei do trabalho, ou seja, computando-se as faltas ocorridas durante o ano na seguinte forma: <br />
a) até 5 dias de faltas, conceder 30 dias corridos,<br />
b) de 06 a 14 dias de faltas, conceder 24 dias corridos, <br />
c) de 15 a 23 dias de faltas, conceder 18 dias corridos, <br />
d) de 24 a 32 dias de faltas, conceder 12 dias corridos, <br />
e) quando exceder a <strong>32 faltas não justificadas</strong> no ano, o empregado perde o direito às férias, mas mantém o direito ao recebimento do 1/3 (um terço) do valor das férias conforme previsto na Constituição Federal.<br />
<br />
<strong>Fim do contrato: Direito a férias proporcionais,</strong> O Decreto nº 3.197, de 5 de outubro de 1.999, assegurou ao empregado doméstico o direito às férias proporcionais no término do contrato de trabalho. Tal determinação, foi referendada pela Emenda Constitucional (EC) nº 72, de 2 de abril de 2013 e deve ser aplicada independentemente de como se deu a saída do emprego mesmo que incompleto o período aquisitivo de 12 meses. 
<br /><br />
Dessa forma o empregado doméstico que é dispensado ou pede demissão, antes de completar 12 meses de serviço, tem direito a férias proporcionais, equivalentes ao valor de 1/12 avos do salário por cada mês trabalhado, sempre contando-se o mês de no mínimo 15 dias corridos, trabalhados.
<br /><br />
As férias concedidas e gozadas pelo empregado deverão ser anotadas em sua Carteira de Trabalho (CTPS).

                                            </dd>

                                            <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('9').style.display='none';location.href='#div9';" name="div9" id="div9" style="font-size: 16px;font-weight: bold;">
                                                  9. PAGAR AVISO PRÉVIO QUANDO DEMITIR SEM JUSTA CAUSA: 
                                                </a><br />
                                                Após cada período de 12 (doze) meses de trabalho prestados à mesma pessoa ou família, contados da data de sua admissão, o empregado doméstico a partir da edição da Lei nº. 11.324, de 19 de julho de 2006, tem direito a férias anuais remuneradas de 30 (trinta) dias corridos. Tal período de doze meses é chamado de período aquisitivo de férias. Estas deverão ser pagas com o acréscimo de 1/3 do valor do salário a título de Gratificação de Férias.
                                                
                                                <a id="9" name="9" onclick="this.style.display='none';location.href='#div9';">Saiba + </a>
                                                <br />

                                            </dt>
                                            <dd class="duvidas">
O aviso prévio é uma comunicação escrita do Empregador para o empregado avisando-o de que pretende rescindir o contrato de trabalho e indicando o motivo ou causa da dispensa. (Caso nãoa queira expressar a motivação deste ato poderá por ele ser colocada na carta de dispensa: “por motivo de ordem particular” ou “por motivo de foro íntimo”.
<br /><br />
Tal comunicado deverá ser realizado com 30 (trinta) dias de antecedência, pois o empregado tem o direito a continuar trabalhando por 30 dias ou receber em dinheiro o equivalente ao referido período do aviso prévio.<br /><br />
Caso o próprio empregado queira se demitir deverá avisar ao Empregador, por escrito, também, com uma antecedência mínima de 30 (trinta) dias. A falta de tal aviso por parte do empregado ao Empregador dá último o direito de descontar, na liquidação de salários, o equivalente ao respectivo prazo de 30 dias (artigo 487 parágrafo 2º. CLT).<br /><br />
Quando o empregado for demitido poderá retirar-se do serviço mais cedo. Assim poderá escolher entre sair duas horas mais cedo diariamente ou, se preferir, poderá avisar a seu empregador que deseja deixar de trabalhar durante 7 (sete) dias corridos, sem qualquer prejuízo ou desconto desses dias em seu salario. Caso venha faltar ao trabalho, o empregador descontará os dias da ausência, assim como o descanso remunerado (DSR) relativo à semana em que a ausência tiver ocorrido, e eventual dia feriado, se houver.<br /><br />
Quando o empregado pedir demissão, e ficar trabalhando o período do aviso-prévio receberá seu salário normal a título de aviso-previo trabalhado, não tendo direito à redução de 2 (duas) horas diários ou 7 (sete) dias de trabalho. <br /><br />
A Lei nº 12.506/2011 trouxe um acréscimo de 3 (três) dias de aviso para cada ano trabalhado. Assim, a partir daquela, em até um ano de trabalho  o aviso é apenas de 30 dias e a cada ano completado, soma-se mais 3 dias para cada ano até o limite de 90 dias de aviso.<br /><br />

                                            </dd>

                                         <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('10').style.display='none';location.href='#div10';" name="div10" id="div10" style="font-size: 16px;font-weight: bold;">
                                                  10. PAGAR ADICIONAL DE INSALUBRIDADE:
                                                </a><br />
                                               A Emenda Constitucional (EC) nº 72, de 2 de abril de 2013, estendeu ao empregado domestico os ditames da Constituição Federal constante de seu art. 7º, inciso XXIII, que estabelece que as atividades penosas, insalubres ou perigosas terão adicional de remuneração, na forma da lei. 
                                                
                                                <a id="10" name="10" onclick="this.style.display='none';location.href='#div10';">Saiba + </a>
                                                <br />

                                            </dt>
                                            <dd class="duvidas">
O adicional de insalubridade é devido ao empregado que desempenha seu trabalho em atividades insalubres. No entanto, não será fácil, enquadrar o trabalho do empregado doméstico no pagamento deste adicional, pois, sendo a residência a própria moradia de empregador e de sua família, em tese restaria também para este último o comprometimento de sua própria saúde. Todo trabalhador que se enquadrar nos moldes do art. 189, da Consolidação das Leis do Trabalho (CLT), adiante transcrito, terá direito ao adicional de insalubridade respectivo:   <br />
<br />
<div style="font-style:italic; margin-left:15px; width:600px;">"Art. 189. Serão consideradas atividades ou operações insalubres 		aquelas que, por sua natureza, condições ou métodos de trabalho, 		exponham os empregados a agentes nocivos à saúde, acima dos 			limites de tolerância fixados em razão da natureza e da intensidade 		do agente e do tempo de exposição aos seus efeitos.”</div>
<br /><br />Os serviços em atividades insalubres, são calculados conforme os graus Mínimo (10%), Médio (20%) e Máximo (40%), nos moldes do disposto no art. 192 da Consolidação das Leis do Trabalho (CLT).
	<br />
<div style="font-style:italic; margin-left:15px; width:600px;">“Art. 192. O exercício de trabalho em condições insalubres, acima dos 		limites de tolerância estabelecidos pelo Ministério do Trabalho, assegura a 	percepção de adicional respectivamente de 40% (quarenta por cento), 20% 	(vinte por cento) e 10% (dez por cento) do salário mínimo da região, 	segundo se classifiquem nos graus máximo, médio e mínimo.” </div>

                                            </dd>
                                         <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('11').style.display='none';location.href='#div11';" name="div11" id="div11" style="font-size: 16px;font-weight: bold;">
                                                  11. PAGAR SEGURO CONTRA  ACIDENTES DE TRABALHO:
                                                </a><br />
                                               O acidente de trabalho é aquele que ocorre no exercício do trabalho a serviço do empregador, provocando lesão física ou transtorno funcional no trabalhador, com redução permanente ou temporária para o trabalho. 
                                                <a id="11" name="11" onclick="this.style.display='none';location.href='#div11';">Saiba + </a>
                                                <br />
                                            </dt>
                                            <dd class="duvidas">
O artigo 7º, inciso XXVIII, da Constituição Federal estabelece como direito dos trabalhadores urbanos e rurais o “seguro contra acidentes de trabalho, a cargo do empregador, sem excluir a indenização a que este está obrigado, quando incorrer em dolo ou culpa”
 <br /> <br />
São considerados como acidente de trabalho: a) O sinistro no itinerário do local da residência para o trabalho e vice-versa; b) o acidente que ocorre no exercício do trabalho; c) Doença profissional ou do exercício do trabalho peculiar à atividade exercida pelo empregado-domestico. 
 <br /> <br />
Referido seguro de acidente do trabalho acha-se regulamentado pela Lei nº 8.212, de 24 de julho de 1991, que “Dispõe sobre planos de Benefícios de Previdência Sociais e dão outras providências”, e a Lei nº 8.213, de 24 de julho de 1991, que “Dispõe sobre os planos de Beneficência da Previdência Social, institui Plano de Custeio, e dá outras previdências”.  
 <br /> <br />
Referidas leis cuidam da Organização da Seguridade Social e instituíram o Plano de Custeio e os Planos de Benefícios da Previdência Social.
 <br /> <br />
Com a Emenda Constitucional (EC) nº 72, de 2 de abril de 2013, os empregados domésticos devidamente registrados que são segurados obrigatórios do INSS, em caso de acidente do trabalho, cabe ao Instituto Nacional de Seguridade Social custear os benefícios. 
 <br /> <br />
O empregado poderá se beneficiar do seguro contra acidente de trabalho sem precisar demonstrar a culpa ou dolo no acidente, sendo devido mesmo no caso de culpa do próprio empregado-segurado. Entretanto, esclarecemos que, havendo dolo do empregado, o acidente fica descaracterizado, pois o dano sofrido pelo empregado não poderá ter sido por ele mesmo causado.
 <br /> <br />
                                            </dd>
 <dt class="duvidas">
                                                <hr /><br />
                                                <a href="javascript:" onclick="document.getElementById('12').style.display='none';location.href='#div12';" name="div12" id="div12" style="font-size: 16px;font-weight: bold;">
                                                  12. PAGAR VALE TRANSPORTE:
                                                </a><br />
                                             O empregador deve conceder respectivos valores relativos ao transporte do empregado doméstico quando da utilização de meios de transporte coletivo urbano ou intermunicipal, para deslocamento de sua residência ao trabalho e vice-versa. 
                                                <a id="12" name="12" onclick="this.style.display='none';location.href='#div12';">Saiba + </a>
                                                <br />
                                            </dt>
                                            <dd class="duvidas">
Para tanto, o empregado deverá apresentar a Solicitação de Vale-Transporte a seu empregador declarando a quantidade de idas e vindas necessárias para seu efetivo deslocamento.        <br />
Para tal finalidade, o Empregador poderá descontar parcela equivalente a 6% (seis por cento) do salário base contratual ou remuneração paga.       <br />       <br />
O empregado doméstico quando residente na residência do Empregador não tem direito ao Vale-Transporte.         <br />
<strong>Importante:</strong> Se for o Empregador quem custear o transporte mas nada descontar do empregado, o valor desse transporte se integrará ao salário para efeito do pagamento do 13º. Salário, Férias e Aviso prévio.

                                            </dd>

                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    

	    <div class="bottom">
		    <div class="main">
			    <!--==============================footer=================================-->
			    <div id="footer">
				    <div class="padding">
					    <div class="wrapper">
						    <div class="fleft">
							    <!-- a href="#" class="link-bot1">Feed</a> <a href="#" class="link-bot2">Twitter</a -->
						    </div>
						    <div class="fright">
							    <div class="wrapper">
<!--#include file="inc_menubottom.asp"-->
							    </div>
							    <div class="alignright">
								    <span class="reg color-1">Edoméstico</span> &copy; 2011
                                </div>
						    </div>
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>
	    
	    <span style="display: block; position: absolute; font-size: 1em; top: -1000px; left: -1000px;">
		    A
        </span>
    </body>
</html>

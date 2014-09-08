<!--#include file="conecta_bd.asp"--><%

function comparaSelected(parametro, valor)
    if cstr(parametro)= cstr(valor) then comparaSelected= " selected" else comparaSelected=""
end function


dim fulano, eleexiste, funcID, essecontrato, bolTemErro, modoAlterar, vtID, PREfuncID
DIM  Titulo, Texto, MesReferencia, AnoReferencia, Data, Testemunha, RGTestemunha
modoAlterar=false
vtID = limpaquerystring("vtID")
PREfuncID=limpaquerystring("ID")

dim  bolShowForm
bolShowForm=true    
bolTemErro=false
erroClass=""
eleexiste=false
set fulano = new empregado

'busca via objeto os dados do cara
if len(PREfuncID)>0 then
    
    fulano.ID=PREfuncID
    fulano.EmpregadorID=session("ID")
    
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then 'TUDO SÓ ACONTECE SE ELE EXISTE MESMO...
        funcID=fulano.ID ' eu chamo do objeto e não do querystring para não rolar injection e para vincular ao empregador
    'Ver se é para editar...
        nome=fulano.Nome

        if len(request.form("enviar"))>0 then  
    '
            Titulo= limparequestform("Titulo")
            Texto= limparequestform("Texto")
            MesReferencia= limparequestform("MesReferencia")
            AnoReferencia= limparequestform("AnoReferencia")
           
            testemunha= limparequestform("testemunha")
            RGTestemunha= limparequestform("RGTestemunha")

            ' quando for validado, deletar antigo e inserir novo
            
            'não validei
            'response.Write "Titulo: " & Titulo &" Texto: " & Texto & " RGTestemunha: " & RGTestemunha &" MesReferencia: " & MesReferencia &" AnoReferencia: " & AnoReferencia &" Testemunha: " & Testemunha 

             vtID= fulano.salvaAdvertencia( Titulo, Texto, mesReferencia, anoReferencia,  testemunha, RGTestemunha) 
             bolShowForm =false
        end if
    end if
end if
    
    
    
    
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="/Content/css/styles.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/Content/Site.css" media="screen" />
<!--script type="text/javascript" src="https://getfirebug.com/firebug-lite.js"></script-->
<!--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>-->
<script type="text/javascript" src="/Scripts/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery.visualize.js"></script>
<script type="text/javascript" src="/scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="/scripts/jquery.util.validateExp.js"></script>
<script type="text/javascript" src="/scripts/jquery.price_format.1.5.js"></script>



<!--[if lte IE 7]>
<link rel="stylesheet" type="text/css" href="css/ie7.css" media="screen" />
<![endif]-->
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="css/ie8.css" media="screen" />
<![endif]-->
<!--[if IE]>
<script language="javascript" type="text/javascript" src="/Scripts/excanvas.js"></script>
<![endif]-->
<script type="text/javascript" src="/Scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery.wysiwyg.js"></script>

<script type="text/javascript" src="/Scripts/jquery.ui.mask.js"></script>
<script type="text/javascript" src="/scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="/scripts/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/scripts/jquery.ui.datepicker-pt-BR.js"></script>
<script type="text/javascript" src="/Scripts/custom.js"></script>

    
<link rel="stylesheet" href="/content/css/datepicker.css" type="text/css" media="screen"  />



   

<script type="text/javascript">

    $(document).ready(function () {

        Validate();
        $("#erro").hide();
        $(".note.loading").hide();


        // Verificação do modo documento simulado no ie
        if (document.documentMode == 5 || document.documentMode == 6 || document.documentMode == 7 || document.documentMode == 8) {
            mascaraRG($("#RGTestemunha"));
            $('#enviar').click(function () {
                var validator = $('#form').validate();
                var erro = 0;

                if ($('#Titulo').val() == "") {
                    validator.showErrors({ "Titulo": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#Texto').val() == "") {
                    validator.showErrors({ "Texto": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#MesReferencia').val() == "") {
                    validator.showErrors({ "MesReferencia": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#AnoReferencia').val() == "") {
                    validator.showErrors({ "AnoReferencia": "Este campo é obrigatório." });
                    erro = 1;
                }

                if ($('#Testemunha').val() == "") {
                    validator.showErrors({ "Testemunha": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#RGTestemunha').val() == "") {
                    validator.showErrors({ "RGTestemunha": "Este campo é obrigatório." });
                    erro = 1;
                }

                if (erro == 1) {
                    $("#erro").show();
                    $("#erro").focus();
                    return false;
                }

                return true;
            });

        } else {
            $("#RGTestemunha").mask({ mask: "##.###.###-*" });

            $("#form").validate
        ({
            meta: "validate",
            invalidHandler: function (form, validator) {
                $("#erro").show();
                $("#erro").focus();
            },

            submitHandler: function (form) {
                $("#erro").hide();
                $("#cancelar").hide();
                $("#enviar").hide();
                $("#processando").show();
                form.submit();
            },
            rules:
            {
                Titulo: { required: true },
                MesReferencia: { required: true, noneSelected: true },
                AnoReferencia: { required: true },
                Texto: { required: true },
                Testemunha: { required: true },
                RGTestemunha: { required: true }
            },
            messages:
            {
                Titulo: "Este campo é obrigatório.",
                Texto: "Este campo é obrigatório.",
                MesReferencia: "Este campo é obrigatório.",
                AnoReferencia: "Este campo é obrigatório.",
                Testemunha: "Este campo é obrigatório",
                RGTestemunha: "Este campo é obrigatório"
            }
        });
        }





    });

    function mascaraRG(objeto) {
        objeto.keypress(function (e) {

            if (objeto.val().length == 2 || objeto.val().length == 6) {
                objeto.val(objeto.val() + ".");
            }
            if (objeto.val().length == 10) {
                objeto.val(objeto.val() + "-");
            }
            if (objeto.val().length >= 12) {
                objeto.val(objeto.val().substr(0, objeto.val().length - 1));
            }
        });
    }
</script>


<script type="text/javascript" src="/Scripts/woow.validateextensions.js"></script>


    
    <link rel="stylesheet" href="/content/css/datepicker.css" type="text/css" media="screen"  />
<link rel="stylesheet" href="css/jquery.ui.tabs.css" type="text/css" media="screen"  />
<link rel="stylesheet" href="css/jquery.ui.theme.css" type="text/css" media="screen"  />

<title>
	
	Empregados

</title>
    <style type="text/css">

        #tabs > ul > li {
            text-align: center;
           font-size:10px;
           height:70px;
           overflow:hidden;
        }
        #tabsy table tr td {
        border: 1px solid black;
        padding:2px;
        }

        .enunciado {
            font-size:8px;
            font-family:'Times New Roman';
            font-style:italic;
            color:GrayText;
        }
        #opcoes {
            float:left;
        }
        #ficha{
            width:50%;
            font: bold 11px arial;
        }
        #opcoes{
            width:50%;
        }
       .sb-box-inner content li .listaNormal {
            height:auto;
            list-style:circle;
            
        }
    </style>

</head>
<body>

	<div id="page-body">
		<!-- #wrapper [begin] -->
		<div id="wrapper">	
			<!-- Header [begin] -->
            <div id="header">
				

<!-- Logo [begin] -->
                <div id="logo"><a href="main.asp">Home</a></div>
<!-- Logo [end] -->

<!--#include file="inc_header_pagina.asp"-->

            </div>
		
			<!-- Header [end] -->

			<!-- grid layout [begin] -->

			

    <div class="container_12">  
		<div class="grid_12">
            <div class="sb-box">
                <div class="sb-box-inner content">
                    <div class="header">
                        <h3><a href="empregado_ficha.asp?ID=<%=funcID %>&tabs=09"><%=ucase(fulano.nome) %></a> - Dados para Advertência</h3>
                        <ul class="tabs">
                            <li class="active">
                                <a href="empregado_ficha.asp?ID=<%=funcID %>&tabs=09" hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>
                    </div>
					<div class="bcont">
<%dim doubledeck
  doubledeck= bolShowForm AND eleexiste  %>
<% if (doubledeck=true) then %>
                        <b>Os Campos marcados com <span>*</span> são obrigatórios.</b><br /><br /><br />
                     
						<form action="empregado_lanca_advertencia.asp?ID=<%=funcID %>" id="form" method="post" name="form">
                        <div class="esquerda">
                            <p>
                                <b>Título <span>*</span></b> (ex: falta e atrasos)<br />
                                <input class="inputtext medium" id="Titulo" maxlength="128" name="Titulo" type="text" value="" />
                                
                            </p>
                        </div>
                        <div class="direita">
                            <p>
                                <b>Mês Referência <span>*</span></b><br />
                                <select id="MesReferencia" name="MesReferencia"><option value="">Selecione</option>
<option value="1">janeiro</option>
<option value="2">fevereiro</option>
<option value="3">mar&#231;o</option>
<option value="4">abril</option>
<option value="5">maio</option>
<option value="6">junho</option>
<option value="7">julho</option>
<option value="8">agosto</option>
<option value="9">setembro</option>
<option value="10">outubro</option>
<option value="11">novembro</option>
<option value="12">dezembro</option>
</select>   
                                
                            </p>
                        </div>
                        <div class="esquerda">
						    <p>
							    <b>Ano Referência <span>*</span></b><br />
							    <input class="number inputtext micro" id="AnoReferencia" maxlength="4" name="AnoReferencia" type="text" value="" />
							    
						    </p>
                        </div>
                        <div class="esquerda">
						    <p>
							    <b>Testemunha <span>*</span></b><br />
                                <input class="inputtext medium" id="Testemunha" maxlength="128" name="Testemunha" type="text" value="" />
                                
						    </p>
                        </div>
                        <div class="direita">
						    <p>
							    <b>RG <span>*</span></b><br />
                                <input class="inputtext medium" id="RGTestemunha" maxlength="13" name="RGTestemunha" type="text" value="" />
                                
						    </p>
                        </div>
						<p>
							<b>Texto <span>*</span></b><br />
							<input class="inputtext medium" id="Texto" maxlength="128" name="Texto" type="text" value="" />
							
						</p>
						<div>
						<hr />
						<p>
							<button id="cancelar" class="button blue" type="reset" onclick="location.href='empregado_ficha.asp?ID=<%=funcID %>&tabs=9';">
								<span>Cancelar</span>
							</button>
							<button id="enviar" class="button green" type="submit" name="enviar" value="Salvar">
								<span>Enviar</span>
							</button>
							<span id="processando" class="note loading">Processando...</span>
						</p>
						</div>

						</form>

<%Else
        if eleexiste then %>
                <h1>Advertencia inserida com sucesso.</h1>
                    <p><a href="prtAdvertencia.asp?vtID=<%=vtid %>&funcID=<%=funcID %>" target="_blank"> Clique aqui para imprimir o recibo</a></p>
                 
<%      else
            response.Write "<h1>Empregado não encontrado</h1>"
        end if
    
    end if %>
                </div>
            </div>
            <br />  
     <div id="Div1" class="message informationExp" style="margin:27px; width:900px;">
                                <span class="strong">Informativo:</span> O empregador tem o poder de controlar e disciplinar o trabalho do empregado com limitações regidas pela Consolidação das Leis do Trabalho - CLT. A legislação preve aplicação de sanções justas, razoáveis e proporcionais à falta cometida pelo empregado.
                                    As penalidades previstas no âmbito trabalhista são:
                                    <ul class="expUL">   
                                        <li class="expLI">Advertência verbal.</li>
                                        <li class="expLI">Advertência escrita.</li>
                                        <li class="expLI">Suspensão.</li>
                                        <li class="expLI">Demissão.</li>
                                    </ul>
                        </div>    
           
                
                   
		</div>
		<div class="clearingfix">
		</div>
	</div>


			
			<!-- Footer [begin] -->
			

<div class="container_12">
	<div class="grid_12" id="footer">
		<p>© Copyright 2010 by <a href="/">EDomestico</a></p>
	</div>
	<div class="clearingfix"></div>
</div>
			<!-- Footer [end] -->
			<!-- grid layout [end] -->
		</div>
		<!-- end div #wrapper -->

		
	</div>


	<!-- end div #page-body -->
</body>
</html>
<%    
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing %>
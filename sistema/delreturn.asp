<!--#include file="conecta_bd.asp"-->

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

        $("#DataFalta").mask("99/99/9999");

        $("#DataFalta").datepicker({
            showOn: 'button',
            buttonImage: '/content/images/calendar.gif',
            buttonImageOnly: true,
            maxDate: " +0D"
        });

        // Verificação do modo documento simulado no ie
        if (document.documentMode == 5 || document.documentMode == 6 || document.documentMode == 7 || document.documentMode == 8) {
            $('#enviar').click(function () {
                var validator = $('#form').validate();
                var erro = 0;

                if ($('#DataFalta').val() == "") {
                    validator.showErrors({ "DataFalta": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#TipoFalta').val() == "") {
                    validator.showErrors({ "TipoFalta": "Este campo é obrigatório." });
                    erro = 1;
                }
                if ($('#Comentarios').val() == "") {
                    validator.showErrors({ "Comentarios": "Este campo é obrigatório." });
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
            // implementar teste para ver se é menor que hoje
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
                    DataFalta: { required: true },
                    TipoFalta:
                    {
                        required: true,
                        noneSelected: false
                    },
                    Comentarios: { required: true }
                },
                messages:
                {
                    DataFalta: "Este campo é obrigatório.",
                    TipoFalta: "Este campo é obrigatório.",
                    Comentarios: "Este campo é obrigatório."
                }
            });
        }
    });
</script>

<script type="text/javascript" src="/Scripts/woow.validateextensions.js"></script>

<title>
	
	

</title></head>

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
<% 
    
    if len(request.QueryString("ID"))>0 then
        if isnumeric(request.QueryString("ID")) then
            qs="?ID=" & request.QueryString("ID")
            if request.QueryString("erro")="" then 
                if request.QueryString("tab")<>"" then
                    qs=qs&"&tabs=" & request.QueryString("tab")
                end if

    %>
    <h3>REGISTRO EXCLUÍDO COM SUCESSO</h3>
                    
<%          else %>
     <h3>Houve um erro na exclusão do registro</h3>
                    <%=request.QueryString("erro") %>
                    <%if len(request.QueryString("msgAd"))>0 then response.Write "Mensagem: " & request.QueryString("msgAd") %>

 <%         end if
     
      %>
  <a href="empregado_ficha.asp<%=qs %>">Voltar</a>
<%
        else
            %>
                   <h3> <a href="main.asp">Voltar</a></h3>
                    <%
        end if
    ELSE
            %>
                   <h3> <a href="main.asp">Voltar</a></h3>
                    <%
    end if
    
     %>

                </div>
            </div>
            <br />     
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
     'destroy stuff hahahahah (mean laugh)
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing 

    
    %>
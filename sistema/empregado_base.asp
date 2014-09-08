<!--#include file="conecta_bd.asp"--><%

dim fulano, eleexiste, funcID, essecontrato
    eleexiste=false
set fulano = new empregado
    funcID=limpaquerystring("ID")
'busca via objeto os dados do cara
if len(funcID)>0 then    
    fulano.ID=funcID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        nome=fulano.Nome
        set essecontrato=new contrato 
        essecontrato.getFkrtContrato funcID, true, 0 
    novoContratoID = essecontrato.contrato_ID
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
<script type="text/javascript" src="/Scripts/jquery-1.8.3.js"></script>
<script type="text/javascript" src="/Scripts/jquery-ui-1.9.2.custom.min.js"></script>
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
	<script type="text/javascript">
	$(function() {
		$( "#tabs" ).tabs();
	});
	</script>
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

                <script type="text/javascript">

                    $(document).ready(function () {

                    });


                </script>
            </div>
		
			<!-- Header [end] -->

			<!-- grid layout [begin] -->

			

    <div class="container_12">  
		<div class="grid_12">
            <div class="sb-box">
                <div class="sb-box-inner content">
                    <div class="header">
                        <h3><%=fulano.nome %></h3>
                        <ul class="tabs">
                            <li class="active">
                                <a href="empregado_ficha.asp?ID=<%=funcID %>" hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>
                    </div>

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
    set fulano=nothing
    set patrao=nothing
    set esseContrato=nothing %>
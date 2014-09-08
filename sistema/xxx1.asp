


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	

<meta http-equiv="content-type" content="text/html; charset=windows-1251" />
<link rel="stylesheet" type="text/css" href="Content/css/styles.css" media="screen" />
<link rel="stylesheet" type="text/css" href="Content/Site.css" media="screen" />
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

    
    
    <style type="text/css">
    h3 {font-size:2.25em; line-height:1.111em; text-transform:uppercase; margin:0px 0 20px; font-weight:normal; color:#000;}
    .head2 {padding-bottom:6px; width:100%; text-transform:none; background:url(Content/images/tail-head.gif) 0 bottom repeat-x; margin-bottom:25px; margin-top:10px;}
    
    label
    {
        background-color:White;
        color:#f24c4c;
        font-size:18px;
        font-weight:bold;
    }
    
	.ui-dialog { font-size: 11px; }
	body {
		font-family: Tahoma;
		font-size: 12px;
	}
	#question {
		width: 300px!important;
		height: 60px!important;
		padding: 10px 0 0 10px;
	}
	#question img {
		float: left;
	}
	#question span {
		float: left;
		margin: 20px 0 0 10px;
	}
    </style>

	<title>
		E-Doméstico - Home Sistema
	</title>

    <script type="text/javascript">
        function desativarfunc(id) {
            decisao = confirm("Voce esta prestes a desligar este funcionario. Uma vez desligado não poderá \nrealizar mais nenhuma ação referente a este funcionário, apenas consulta e ficará no final da fila.\n\nDeseja Continuar?");
            if (decisao) {
                alert("Confirmado! ");
                $("#idEmpregado").val(id);
                $("#formAlterar").submit();
            } else {
                alert("Ação Cancelada!\n");
            }
        };
        function ativarfunc(id) {
            $("#idEmpregado").val(id);
            $("#formAlterar").submit();
        };
    </script>

</head>
<body>
    <h1>querystring daqui mesmo coisa 1</h1>
    <%


    for each yhin in request.QueryString
        response.Write yhin &"=" & request.QueryString(yhin) & "<br>"
    next
        response.Write lacoisa
         %>
<form action="" method="post">
    <h2>REQUEST.FOMR COISA 1</h2>
    <%if len(request.form)>0 then
        RESPONSE.Write REQUEST.FORM("texto1") & "<BR>"



        server.Execute("xxx2.asp")
     
        end if  %>
    <input type="text" name="texto1"/>
    <input type="submit" />

</form>



</body>
</html>



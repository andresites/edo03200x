<% 
        Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<meta http-equiv="content-type" content="text/html; charset=windows-1251" />
<head id="Head1"><title>
	E-Doméstico - Login
</title><link rel="stylesheet" type="text/css" href="/Content/css/styles.css" media="screen" />
	<script type="text/javascript" src="/Scripts/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/Scripts/jquery-ui-1.8.2.custom.min.js"></script>
	<script type="text/javascript" src="/Scripts/jquery.validate.js"></script>
	<script type="text/javascript" src="/Scripts/jquery.visualize.js"></script>
	<script type="text/javascript" src="/Scripts/custom.auth.js"></script>
	<!--[if lte IE 7]>
	<link rel="stylesheet" type="text/css" href="/content/ie7.css" media="screen" />
	<![endif]-->
	<!--[if IE 8]>
	<link rel="stylesheet" type="text/css" href="/content/ie8.css" media="screen" />
	<![endif]-->
	<!--[if IE]>
	<script language="javascript" type="text/javascript" src="/scripts/excanvas.js"></script>
	<![endif]-->

	<script type="text/javascript">

	    $(document).ready(function () {

	        $("#processando").hide();
	        $("#erro").hide();


	        $("#erro").show();


	        $("#form").validate({
	            meta: "validate",
	            invalidHandler: function (form, validator) {
	                $("#erro").html("Cheque os campos abaixo");
	                $("#erro").show();
	            },

	            submitHandler: function (form) {
	                $("#erro").hide();
	                $("#login").hide();
	                $("#processando").show();
	                form.submit();
	            },

	            rules: {
	                Email: {
	                    required: true,
	                    email: true
	                },
	                Senha: "required"
	            },
	            messages: {
	                Email: {
	                    required: "Preencha o e-mail",
	                    email: "E-mail inválido"
	                },
	                Senha: "Preencha a senha"
	            }
	        });
	    });
	</script>

</head>
<body>
<div id="page-body">
	<div id="wrapper">
		<!-- Authorization [begin] -->
		<div class="sb-box auth">
			<div class="sb-box-inner content">
				<!-- Authorization block header [begin] -->
				<div class="header"><h3>Por favor, faça o login</h3></div>
				<!-- Authorization block header [end] -->
				<div class="bcont">
					<!-- Authorization content [begin] -->

					<!-- form elements [start] -->
					<form action="login.asp" id="form" method="post" name="form">
<%if session("erro")<>"" then
    
    strErro=session("erro") 
    if instr(1,strErro,"expirada")>0 then strErro="Sessão expirada. Favor logar novamente."
    %>
						<div id="erro" class="message error" style="display:none;">
							<span class="strong">ERRO!</span> 
							<%=strErro %>
							
						</div>
<%end if 
session("erro")=""    %>
						<div>
						<p>
							<label>E-mail</label>
                            <input class = "inputtext small" style="margin:5px;" name="Email" id="Email" />
						</p>
						<p>
							<label>Senha</label>
                            <input class = "inputtext small" style="margin:5px;" name="Senha" id="Senha"  type="password"/>
						</p>
                        <p>
                        <a id="esqueci" style="padding:0 10px;color:#000000;" class="lnkLogin" href="../../Esqueci/Index" ><b>Esqueci minha senha</b></a><br />
                        <a class="logout" href="/" style="margin-left:10px;color: #000000;">Voltar ao site</a>
                        </p>
						<p>
							<button id="login" name="login" type="submit" class="button blue floatright"><span>Login</span></button>
							<span id="processando" class="note loading">Processando...</span>
						</p>
						</div>
						<div class="clearingfix"></div>
					</form>
					<!-- form elements [end] -->

					<!-- Authorization content [end] -->
				</div>
			</div>
		</div>
		<!-- Authorization [end] -->
	</div>
</div></body>
</html>
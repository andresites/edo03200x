<!-- #include file="novosistema/conecta_bd.asp"-->
<%
    
if request.ServerVariables("CONTENT_LENGTH")>0 then
    dim patrao
    set patrao=new empregador
    DIM Logradouro, Numero, Bairro, Complemento, CEP, CidadeID, empregadorID    
    DIM  Nome, Email, Senha, Sexo, DataNascimento, Nacionalidade, RG, OrgaoEmissorRG, CEI, CPF, RecebeNewsletter, TelefoneResidencial, TelefoneComercial, TelefoneCelular, DataCriacao, DataExpiracaoAcesso 
    patrao.empregador_Nome= limparequestform("Nome")
    patrao.empregador_Email= limparequestform("Email")
    patrao.empregador_Senha= limparequestform("Senha")
    patrao.empregador_Sexo= limparequestform("Sexo")
    patrao.empregador_DataNascimento= limparequestform("DataNascimento")
    patrao.empregador_Nacionalidade= limparequestform("Nacionalidade")
    patrao.empregador_RG= limparequestform("RG")
    patrao.empregador_OrgaoEmissorRG= limparequestform("OrgaoEmissorRG")
    if len(limparequestform("CEI"))>0 then patrao.empregador_CEI= limparequestform("CEI")
    patrao.empregador_CPF= limparequestform("CPF")
    if len(limparequestform("RecebeNewsletter"))>0 then patrao.empregador_RecebeNewsletter= 1 else patrao.empregador_RecebeNewsletter = 0
    patrao.empregador_TelefoneResidencial= limparequestform("TelefoneResidencial")
    patrao.empregador_TelefoneComercial= limparequestform("TelefoneComercial")
    patrao.empregador_TelefoneCelular= limparequestform("TelefoneCelular")
    patrao.empregador_Logradouro= limparequestform("endereco.Logradouro")
    patrao.empregador_Numero= limparequestform("endereco.Numero")
    patrao.empregador_Bairro= limparequestform("endereco.Bairro")
    patrao.empregador_Complemento= limparequestform("endereco.Complemento")
    patrao.empregador_CEP= limparequestform("endereco.CEP")
    patrao.empregador_CidadeID= limparequestform("endereco.CidadeID")

    'serverside validação para depois
    patraoID= patrao.novoEmpregador()
    session("ID")=""
    if isnumeric(patraoID) then
  %>

<html4f>
    <head>
        <title>Aguarde...</title>

    </head>
    <body>
    <form id="form1" method="post" action="/novosistema/login.asp">
        <input type="hidden" name="email" value="<%=limparequestform("Email") %>" />
        <input type="hidden" name="senha" value="<%=limparequestform("senha") %>" />
        <p>Redirecionando...</p>
    </form>
       <SCRIPT LANGUAGE=javascript type="text/javascript">
            
            document.forms[0].submit();
     </script>
    </body>
</html4f>

<%
    end if
end if        
    
    
    
    
    
    
     %>
<%=patraoID %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1"><title>
	
	E-Doméstico - Cadastro de Empregador

</title><meta content="text/html; charset=utf-8" http-equiv="Content-Type" /><meta content="text/css" http-equiv="Content-Style-Type" /><link type="text/css" rel="stylesheet" href="/Content/css/Site/style.css" /><link type="text/css" rel="stylesheet" href="/Content/css/Site/layout.css" />

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>        

        





	    
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function () {

                $("#fecharGratis").mouseover(function () {
                    $("#cadastre_se").hide();
                });

                $("#cadastre_se").click(function () {
                    location.href = href = "../Cadastro/Edit";

                });

            });
	    </script>

	    <!--[if lt IE 7]>
		    <link href="/Content/css/Site/ie_style.css" rel="stylesheet" type="text/css" />
	       <script type="text/javascript" src="/Content/js/ie_png.js"></script>
	       <script type="text/javascript">
		       ie_png.fix('.png, #header .row-3 .bg-header, #header .row-3 .tail-bot, .content-tail-left, .content-tail-right');
	       </script>
	    <![endif]-->

	    
	<title></title>
	<script type="text/javascript" src="/Content/js/maxheight.js"></script>
	    
        
        

        <script type="text/javascript" src="/Scripts/jquery-ui-1.8.2.custom.min.js"></script>
        <script type="text/javascript" src="/scripts/jquery.validate.min.js"></script>
        <script type="text/javascript" src="/Scripts/jquery.maskedinput-1.2.2.min.js"></script>
    </script>

	
	<script type="text/javascript">

	    $(document).ready(function () {

	        Validate();

	        $("#DataNascimento").val('');

	        $.validator.addMethod(
                "JaExisteCadastro",
                function (value, element) {
                    $.ajaxSetup({ cache: false, async: false });

                    var result = false;

                    $.get("chkmail.asp?email=" + value, function (data) {
                        result = !data;
                    });
                    return result;

                },
                "Cadastro já efetuado para este endereço de e-mail"
            );

	        if ($("#Endereco_Cidade_EstadoID > option:selected").attr("value") == "")
	            $("#Endereco_CidadeID").attr("disabled", "disabled");

	        $("#sucesso").hide();
	        $("#erro").hide();



	        $(".note.loading").hide();

	        $("#DataNascimento").mask("99/99/9999");
	        $("#CPF").mask("999.999.999-99");
	        $("#CEI").mask("99.999.99999-99");
	        $("#TelefoneResidencial").mask("(99)9999-9999");
	        $("#TelefoneComercial").mask("(99)9999-9999");
	        $("#TelefoneCelular").mask("(99)99999-9999");

	        $("#Endereco_CEP").mask("99999-999");

	        $("#form-main").validate({
	            meta: "validate",
	            invalidHandler: function (form, validator) {
	                $("#erro").show();
	                $("#erro").focus();
	            },

	            submitHandler: function (form) {
	                var ok = true;

	                $("#erro").hide();
	                $("#cancelar").hide();
	                $("#enviar").hide();
	                $("#processando").show();

	                $.post('validaCPF.asp', { cpf: $("#CPF").val() }, function (data) {
	                    if (data == 'ERRO') {
	                        alert('CPF inválido.');
	                        $("#processando").hide();
	                        $("#enviar").show();
	                        ok = false;
	                    }
	                });

	                $.post('/Cadastro/ValidarData', { nasc: $("#DataNascimento").val() }, function (data) {
	                    if (data == 'ERRO') {
	                        alert('Data de nascimento inválida.');
	                        $("#processando").hide();
	                        $("#enviar").show();
	                        ok = false;
	                    }
	                });

	                if (ok == true)
	                    form.submit();
	            },
	            invalidHandler: function (form, validator) {
	                var errors = validator.numberOfInvalids();
	                if (errors) {
	                    $("div.erro").html('Verifique os seguintes erros:');
	                    $("div.erro").show();
	                } else {
	                    $("div.erro").hide();
	                }
	            },
	            errorLabelContainer: "div.erro",
	            wrapper: "li",
	            rules: {
	                Nome: "required",
	                Email: {
	                    required: true,
	                    email: true,
	                    JaExisteCadastro: true
	                },
	                Senha: "required",
	                ConfirmaSenha: {
	                    equalTo: "#Senha"
	                },
	                Sexo: "required",
	                DataNascimento:
                    {
                        required: true
                    },
	                CPF: "required",
	                RG: "required",
	                OrgaoEmissorRG: "required",
	                "Endereco.Logradouro": "required",
	                "Endereco.Bairro": "required",
	                "Endereco.Cidade.EstadoID":
                    {
                        noneSelected: true
                    },
	                "Endereco.CidadeID": "required",
	                "Endereco.CEP": "required",
	                "Endereco.Numero": "required",
	                TelefoneResidencial: "required"
	            },
	            errorElement: 'div',

	            messages: {
	                Nome: "O campo Nome é obrigatório.",
	                Email: {
	                    required: "O campo E-mail é obrigatório.",
	                    email: "Formato de e-mail inválido",
	                    JaExisteCadastro: "Já existe cadastro para esse email"
	                },
	                Senha: "É necessário o preenchimento de uma senha.",
	                ConfirmaSenha: {
	                    equalTo: "As senhas devem ser iguais."
	                },
	                Sexo: "Seleção de um sexo é obrigatório.",
	                DataNascimento: {
	                    required: "O campo Data de Nascimento é obrigatório."
	                },
	                CPF: "O campo CPF é obrigatório.",
	                RG: "O campo RG é obrigatório.",
	                OrgaoEmissorRG: "O campo Órgão Emissor do RG é obrigatório.",
	                "Endereco.Logradouro": "O campo Logradouro é obrigatório.",
	                "Endereco.Bairro": "O campo Bairro é obrigatório.",
	                "Endereco.Cidade.EstadoID":
                    {
                        noneSelected: "O campo Estado é obrigatório."
                    },
	                "Endereco.CidadeID": "O campo Cidade é obrigatório.",
	                "Endereco.CEP": "O campo CEP é obrigatório.",
	                "Endereco.Numero": "O campo Número é obrigatório.",
	                TelefoneResidencial: "O campo Telefone Residencial é obrigatório."
	            }
	        });

	        var cidadeCep = null;
	        $('#Endereco_CEP').blur(function () {
	            $.post('/Services/Localizacao/ConsultaCEP/', { sCep: $("#Endereco_CEP").val() }, function (data) {
	                cidadeCep = data.Cidade;
	                $("#Endereco_Logradouro").val(data.Endereco);
	                $("#Endereco_Bairro").val(data.Bairro);
	                switch (data.EstadoID) {
	                    case 1:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='1']").attr("selected", "selected");
	                        break;
	                    case 2:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='2']").attr("selected", "selected");
	                        break;
	                    case 3:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='3']").attr("selected", "selected");
	                        break;
	                    case 4:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='4']").attr("selected", "selected");
	                        break;
	                    case 5:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='5']").attr("selected", "selected");
	                        break;
	                    case 6:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='6']").attr("selected", "selected");
	                        break;
	                    case 7:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='7']").attr("selected", "selected");
	                        break;
	                    case 8:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='8']").attr("selected", "selected");
	                        break;
	                    case 9:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='9']").attr("selected", "selected");
	                        break;
	                    case 10:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='10']").attr("selected", "selected");
	                        break;
	                    case 11:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='11']").attr("selected", "selected");
	                        break;
	                    case 12:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='12']").attr("selected", "selected");
	                        break;
	                    case 13:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='13']").attr("selected", "selected");
	                        break;
	                    case 14:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='14']").attr("selected", "selected");
	                        break;
	                    case 15:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='15']").attr("selected", "selected");
	                        break;
	                    case 16:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='16']").attr("selected", "selected");
	                        break;
	                    case 17:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='17']").attr("selected", "selected");
	                        break;
	                    case 18:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='18']").attr("selected", "selected");
	                        break;
	                    case 19:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='19']").attr("selected", "selected");
	                        break;
	                    case 20:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='20']").attr("selected", "selected");
	                        break;
	                    case 21:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='21']").attr("selected", "selected");
	                        break;
	                    case 22:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='22']").attr("selected", "selected");
	                        break;
	                    case 23:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='23']").attr("selected", "selected");
	                        break;
	                    case 24:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='24']").attr("selected", "selected");
	                        break;
	                    case 25:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='25']").attr("selected", "selected");
	                        break;
	                    case 26:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='26']").attr("selected", "selected");
	                        break;
	                    case 27:
	                        $("#Endereco_Cidade_EstadoID").find("option[value='27']").attr("selected", "selected");
	                        break;
	                }
	                //$("Endereco_Cidade_EstadoID").find("option[value='" + data.EstadoID + "']").attr("selected","selected");
	                $("#Endereco_Cidade_EstadoID").change();
	            });
	        });

	        $('#Endereco_Cidade_EstadoID').change(function () {

	            $.ajaxSetup({ cache: false });
	            var selectedItem = $(this).val();
	            var items = "";

	            if (selectedItem == "" || selectedItem == 0) {
	                //Do nothing or hide...?
	            } else {

	                if (cidadeCep != null) {
	                    $.post('/Services/Localizacao/RemoverAcentos/', { texto: cidadeCep }, function (data) {
	                        cidadeCep = data;
	                        cidadeCep = cidadeCep.toLowerCase();
	                    });
	                }


	                $.post("/novosistema/cidades2.asp?id=" + $("#Endereco_Cidade_EstadoID > option:selected").attr("value"), function (data) {


	                    items += "<option value=\"\">Selecione</option>";
	                    $.each(data, function (i, data) {
	                        /*var selected = false;
    
                            if(cidadeCep != null) {
                                $.post('/Services/Localizacao/RemoverAcentos/', { texto: data.Nome }, function (data1) {
                                    if (cidadeCep.localeCompare(data1) == 0)
                                    {
                                        items += "<option value='" + data.ID + "' selected='selected'>" + data.Nome + "</option>";
                                        }
                                    else
                                    {
                                        items += "<option value='" + data.ID + "'>" + data.Nome + "</option>";
                                        }
                                });
                            }
                            else
                            {*/
	                        items += "<option value='" + data.ID + "'>" + data.Nome + "</option>";
	                        //}

	                    });
	                    $("#Endereco_CidadeID").removeAttr('disabled');
	                    $("#Endereco_CidadeID").html(items);
	                });
	            }
	        });
	    });
	</script>
	<script type="text/javascript" src="/Scripts/woow.validateextensions.js"></script>
        <style>
a.tooltip {
    position: relative; 
    top: -2px; 
    left: 2px;
}

a.tooltip:hover span {
    opacity: 1; 
    visibility: visible;
}

a.tooltip span {
    padding: 10px;
    top: 5px;  
    left:5px;   
    min-width: 75px;
    max-width: 250px;
    background-color: #000000; 
    color: #FFFFFF;
    height: auto;
    border-radius: 5px; 
    opacity: 0; 
    position:absolute;
    visibility: hidden;
    word-wrap: break-word;
    -webkit-transition: all 0.5s; 
       -moz-transition: all 0.5s; 
        -ms-transition: all 0.5s; 
         -o-transition: all 0.5s; 
            transition: all 0.5s;    
}
        </style>
</head>
    <body>
            <div class="divTopo">
                <div class="topoHead">
                    <div class="logoFlash" style="margin-right:20px">
			            <a href="/"><img src="../../Content/images/logo.png" alt="Home" /></a>
                    </div>
                    
    <div id="loggin">
        <!--
     <form action="/Sistema/Home/LogOn" id="form-Login" name="form-Login"  method="post" style="width:218px; margin-right:7px;">
            <input id="Email" name="Email" type="text"  value="Login" onblur="if(this.value=='') this.value='Login'" onfocus="if(this.value =='Login' ) this.value=''" class="txtLogin" style="width: 197px;border-bottom-width: 1px; margin: 0 0 10px 0; float:left;" />
            <input id="senha" name="senha" type="password"  value="Senha" onblur="if(this.value=='') this.value='Senha'" onfocus="if(this.value =='Senha' ) this.value=''" class="txtLogin" style="width: 110px;float:left; margin-top:-2px; margin-left:0"  />
            <input type="submit" value="Entrar" id="btnEntrar" onclick="Troca();" name="btnEntrar" class="btnLogin" style="float:left; margin-top:-2px" />
        </form>
        
        <a id="Cadastro" class="lnkLogin" style="color:#ffffff; margin-left:8px;" href="../Cadastro/Edit" ><b>Cadastre-se</b></a>
        <a id="esqueci" style="padding:0 10px;color:#ffffff;" class="lnkLogin" href="../../Esqueci/Index" ><b>Esqueci minha senha</b></a>
        <div id="divErro" class="message error divErroLogin" >
	        <span class="strong" >ERRO!</span> 	    
			        Verifique todos os campos acima.
        </div>
            -->
    </div>
                    <!--
                     <div class="message tip" id="cadastre_se" style="margin-top: 10px;float:left;margin-left:20px">
                        <a  href="javascript:void(0)" style="float:right; width:20px; height:20px" id="fecharGratis"> <img src="/Content/images/close.png" alt="fechar"/></a>
                        <span id="gratis" >Grátis! <b>Clique aqui</b></span> Cadastre-se e teste a <b>Solução</b> por 30 dias.
                    </div>-->
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

	    
	<body>
		
        <div>
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
								<div class="padding-box" style="width: 918px;">
									<div class="bcont">
										<div class="titulo">
											<h3 class="head2" style="font-size: 40px;text-shadow: 1px 1px 3px #000000;">Cadastro</h3>
										</div>
                                        <br />
										<p style="color:#000000;">
											<b>
                                                Página para Cadastro de Novos Empregadores.<br />
												Os campos marcados com (<span>*</span>) são obrigatórios
                                            </b>
                                        </p>
                                        <div id="erro" class="message error">
											<span class="strong">ERRO!</span> Verifique todos os campos abaixo.
										</div>
										<div id="sucesso" class="message success">
											<span class="strong">SUCESSO!</span> Seu cadastro foi efetuado com sucesso.
										</div>
										<form action="/Cadastro.asp" id="form-main" method="post" name="form-main"><input id="ID" name="ID" type="hidden" value="0" />
										<input id="Endereco_ID" name="Endereco.ID" type="hidden" value="" />
                                        <h4 class="cad" style="color: green;font-size: 20px;">Informações de acesso</h4>

                                        <fieldset class="cadastro">
                                        
                                        <div class="erro"></div>

                                        <ul style="color:#000000;">
                                        <li class="even">
											<p>
												<b>Nome completo<span>*</span></b><br />
												<input id="Nome" maxlength="128" name="Nome" type="text" value="" />
											</p>                                        
                                        </li>
                                        <li class="odd">
											<p>
												<b>E-mail <span>*</span></b><br />
												<input id="Email" maxlength="128" name="Email" type="text" value="" />
											</p>                                        
                                        </li>
                                        <li class="even">
											<p>
												<b>Crie sua Senha <span>*</span></b><br />
												<input id="Senha" maxlength="32" name="Senha" style="z-index:15" type="password" value="" />
											</p>                                        
                                        </li>
                                        <li class="odd">
											<p>
												<b>Confirmação de Senha <span>*</span></b><br />
												<input id="ConfirmaSenha" maxlength="32" name="ConfirmaSenha" type="password" value="" />
											</p>                                        
                                        </li>
                                        </ul>
                                        
                                        </fieldset>
                                 
                                        
                                        <h4 class="cad" style="color: green;font-size: 20px;">Dados para Usufruir o Sistema</h4>

                                        <fieldset class="cadastro">
                                        <ul style="color:#000000;">
                                        <li class="even">
                                            <p>
												<b>Sexo <span>*</span></b><br />
                                                <b>Masculino</b>
												<input class="radio" id="Sexo" name="Sexo" type="radio" value="M" />
												<b>Feminino</b>
												<input class="radio" id="Sexo" name="Sexo" type="radio" value="F" />
											</p>                                        
                                        </li>
                                        <li class="odd">
                                            <p>
												<b>Data de Nascimento <span>*</span></b><br />
												<input id="DataNascimento" maxlength="128" name="DataNascimento" type="text" value="01/01/0001 00:00:00" />
											</p>                                         
                                        </li>
                                        <li class="even">
											<p>
												<b>RG <span>*</span></b><br />
												<input id="RG" maxlength="15" name="RG" type="text" value="" />
											</p>                                        
                                        </li>
                                        <li class="odd">
											<p>
												<b>Órgão Emissor <span>*</span></b><br />
												<input id="OrgaoEmissorRG" maxlength="10" name="OrgaoEmissorRG" type="text" value="" />
											</p>                                        
                                        </li>
                                        <li class="even">
											<p>
												<b>CEI (Cadastro Específico do INSS) <a href="#" class="tooltip">?<span>O CEI é um número de cadastro específico para preenchimento do INSS. Sem ele não é possível emitir a guia de recolhimento.</span></a></b><br />
												<input id="CEI" maxlength="15" name="CEI" type="text" value="" />
											</p>                                          
                                        </li>
                                        <li class="odd">
											<p>
												<b>CPF <span>*</span></b><br />
												<input id="CPF" maxlength="14" name="CPF" type="text" value="" />
											</p>                                        
                                        </li>
                                        <li class="even">
                                            <p>
												<b>Telefone Comercial</b><br />
												<input id="TelefoneComercial" maxlength="13" name="TelefoneComercial" type="text" value="" />
											</p>                                         
                                        </li>
                                        <li class="odd">
											<p>
												<b>Receber Newsletter (Informativo Eletrônico)</b><br />
												<input class="checkbox" id="RecebeNewsletter" name="RecebeNewsletter" type="checkbox" value="true" /><input name="RecebeNewsletter" type="hidden" value="false" />
											</p>                                        
                                        </li>
                                        <li class="even">
											<p>
												<b>Telefone Celular</b><br />
												<input id="TelefoneCelular" maxlength="14" name="TelefoneCelular" type="text" value="" />
											</p>                                        
                                        </li>
                                        <li class="odd">
											<p>
												<b>Telefone Residencial <span>*</span></b><br />
												<input id="TelefoneResidencial" maxlength="13" name="TelefoneResidencial" type="text" value="" />
											</p>                                        
                                        </li>
                                        </ul>
                                        </fieldset>

                                        <h4 class="cad" style="color: green;font-size: 20px;">Endereço</h4>
                                        <fieldset class="cadastro" title="Endereço">
                                        <ul style="color:#000000;">
                                        <li class="even">
											<p>
												<b>CEP <span>*</span></b><br />
												<input id="Endereco_CEP" maxlength="9" name="Endereco.CEP" type="text" value="" />
											</p>                                        
                                        </li>
                                        <li class="odd"></li>
                                        <li class="even">
											<p>
												<b>Endereço <span>*</span></b><br />
												<input id="Endereco_Logradouro" maxlength="128" name="Endereco.Logradouro" type="text" value="" />
											</p>                                        
                                        </li>
                                        <li class="odd">
											<p>
												<b>Número <span>*</span></b><br />
												<input id="Endereco_Numero" maxlength="6" name="Endereco.Numero" type="text" value="" />
											</p>                                        
                                        </li>
                                        <li class="even">
											<p>
												<b>Complemento</b><br />
												<input id="Endereco_Complemento" maxlength="128" name="Endereco.Complemento" type="text" value="" />
											</p>                                         
                                        </li>
                                        <li class="odd">
											<p>
												<b>Bairro <span>*</span></b><br />
												<input id="Endereco_Bairro" maxlength="128" name="Endereco.Bairro" type="text" value="" />
											</p>  
                                        </li>
                                        <li class="even">
											<p>
												<b>Estado <span>*</span></b><br />
												<select id="Endereco_Cidade_EstadoID" name="Endereco.Cidade.EstadoID"><option value="">Selecione</option>
<option value="1">Acre</option>
<option value="2">Alagoas</option>
<option value="4">Amap&#225;</option>
<option value="3">Amazonas</option>
<option value="5">Bahia</option>
<option value="6">Cear&#225;</option>
<option value="7">Distrito Federal</option>
<option value="8">Esp&#237;rito Santo</option>
<option value="9">Goi&#225;s</option>
<option value="10">Maranh&#227;o</option>
<option value="13">Mato Grosso</option>
<option value="12">Mato Grosso do Sul</option>
<option value="11">Minas Gerais</option>
<option value="14">Par&#225;</option>
<option value="15">Para&#237;ba</option>
<option value="18">Paran&#225;</option>
<option value="16">Pernambuco</option>
<option value="17">Piau&#237;</option>
<option value="19">Rio de Janeiro</option>
<option value="20">Rio Grande do Norte</option>
<option value="23">Rio Grande do Sul</option>
<option value="21">Rond&#244;nia</option>
<option value="22">Roraima</option>
<option value="24">Santa Catarina</option>
<option value="26">S&#227;o Paulo</option>
<option value="25">Sergipe</option>
<option value="27">Tocantins</option>
</select>
											</p>                                        
                                        </li>
                                        <li class="odd">
												<p>
													<b>Cidade <span>*</span></b><br />
													<select id="Endereco_CidadeID" name="Endereco.CidadeID"><option value="">Selecione</option>
</select>
												</p>                                        
                                        </li>
                                        </ul>
                                        
                                        </fieldset>

                                        <p class="alignleft">
											<button id="enviar" class="button green" type="submit">
						                        <span style="font-size:12px;font-weight:bold;font-family:Tahoma,Helvetica,sans-serif;" >Enviar</span>
					                        </button>
											
											<span id="processando" class="note loading">Processando...</span>
										</p>
                                    </div>
								</div>
								</form><script type="text/javascript">
								           //<![CDATA[
								           if (!window.mvcClientValidationMetadata) { window.mvcClientValidationMetadata = []; }
								           window.mvcClientValidationMetadata.push({ "Fields": [], "FormId": null, "ReplaceValidationSummary": false });
								           //]]>
</script>
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
								    <ul class="menu-bot">
									    <li>
										    <a href="/Empresa">Empresa</a></li>
									    <li>
										    <a href="/Direitos">Direitos</a></li>
									    <li>
										    <a href="/Deveres">Deveres</a></li>
									    <li>
										    <a href="/Solucoes">Solu&#231;&#245;es</a></li>
									    <li>
										    <a href="/Produtos">Produtos</a></li>
									    <li>
										    <a href="/Contato">Contato</a></li>
								    </ul>
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
<%session("ID")="" %>
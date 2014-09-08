<!-- #include file="conecta_bd.asp"-->
<%
dim patrao
    dim bolOk
    dim hideForm
    hideForm=false
    bolOK=true
set patrao=new empregador   
   patrao.carregaDadosEmpregador session("ID")  
    response.Write patrao.empregador_Nome & "AQUI"

if request.ServerVariables("CONTENT_LENGTH")>0 then

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
   
    resultado = patrao.mudaDadosEmpregador(session("ID"))
    if resultado="OK" then 
        bolOK=true 
        HIDEFORM = TRUE
     else 
        bolOK=false
        HIDEFORM = false
     END IF

end if        
    
 ' response.Write "sessionID=" & session("ID")   
'carregar dados dele aqui
    
  
    
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



    
    <style type="text/css">
    h3 {font-size:2.25em; line-height:1.111em; text-transform:uppercase; margin:0px 0 20px; font-weight:normal; color:#000;}
    .head2 {padding-bottom:6px; width:100%; text-transform:none; background:url(/Content/images/tail-head.gif) 0 bottom repeat-x; margin-bottom:25px; margin-top:10px;}
    
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
	<script type="text/javascript">

	    $(document).ready(function () {

	        Validate();

	        //$("#DataNascimento").val('');



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
                        <h3>Alteração cadastral</h3>
                        <ul class="tabs">
                            <li class="active">
                                <a href="main.asp" hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>
                    </div>
					<div class="bcont">
                        <%IF hideForm=FALSE THEN %>
										<p style="color:#000000;">
											<b>
                                               Alteração de dados.<br />
												Os campos marcados com (<span>*</span>) são obrigatórios
                                            </b>
                                        </p>
                        
                                        <div id="erro" class="message error">
											<span class="strong">ERRO!</span> Verifique todos os campos abaixo.
                                            <%'bolOK %>
										</div>

										<form action="cadastro_edit.asp" id="form-main" method="post" name="form-main"><input id="ID" name="ID" type="hidden" value="0" />
										<input id="Endereco_ID" name="Endereco.ID" type="hidden" value="" />
                                        <h4 class="cad" style="color: green;font-size: 20px;">Informações de acesso</h4>

                                        <fieldset class="cadastro">
                                        
                                        <div class="erro"></div>

                                       
                                        <div class="esquerda">
											<p>
												<b>Nome completo<span>*</span></b><br />
												<input id="Nome" maxlength="128" name="Nome" type="text" value="<%=patrao.empregador_Nome %>" />
											</p>                                        
                                        </div>
                                       <div class="direita">
											<p>
												<b>E-mail <span>*</span></b><br />
												<input id="Email" maxlength="128" name="Email" type="text" value="<%=patrao.empregador_Email %>" />
											</p>                                        
                                        </div>
                                        <div class="esquerda">
											<p>
												<b>Altere sua Senha <span>*</span></b><br />
												<input id="Senha" maxlength="32" name="Senha" style="z-index:15" type="password" value="<%=patrao.empregador_Senha %>" />
											</p>                                        
                                        </div>
                                        <div class="direita">
											<p>
												<b>Confirmação de Senha <span>*</span></b><br />
												<input id="ConfirmaSenha" maxlength="32" name="ConfirmaSenha" type="password" value="<%=patrao.empregador_Senha %>" />
											</p>                                        
                                        </div>
                                        
                                        
                                        </fieldset>
                                 
                                        
                                        <h4 class="cad" style="color: green;font-size: 20px;">Dados para Usufruir o Sistema</h4>

                                        <fieldset class="cadastro">
                                       
                                        <div class="esquerda">
                                            <p>
												<b>Sexo <span>*</span></b><br />
                                                <b>Masculino</b>
												<input class="radio" id="Sexo" name="Sexo" type="radio" <%if patrao.empregador_Sexo="M" then response.write " checked " %>value="M" />
												<b>Feminino</b>
												<input class="radio" id="Sexo" name="Sexo" type="radio" <%if patrao.empregador_Sexo="F" then response.write " checked " %> value="F" />
											</p>                                        
                                        </div>
                                        <div class="direita">
                                            <p>
												<b>Data de Nascimento <span>*</span></b><br />
												<input id="DataNascimento" maxlength="128" name="DataNascimento" type="text" value="<%
                                                    dtNas = patrao.empregador_DataNascimento 
                                                       if len(dtNas)>0 then
                                                            ssplit = split(dtNas,"-")
                                                            response.write right("00" & ssplit(2),2) 
                                                            response.write "/" & right("00" & ssplit(1),2)
                                                            response.write   "/" & ssplit(0)
                                                    else
                                                        response.write patrao.empregador_DataNascimento 
                                                    end if
                                                    %>" />
											</p>                                         
                                        </div>
                                        <div class="esquerda">
											<p>
												<b>RG <span>*</span></b><br />
												<input id="RG" maxlength="15" name="RG" type="text" value="<%=patrao.empregador_RG %>" />
											</p>                                        
                                        </div>
                                        <div class="direita">
											<p>
												<b>Órgão Emissor <span>*</span></b><br />
												<input id="OrgaoEmissorRG" maxlength="10" name="OrgaoEmissorRG" type="text" value="<%=patrao.empregador_OrgaoEmissorRG %>" />
											</p>                                        
                                        </div>
                                        <div class="esquerda">
											<p>
												<b>CEI (Cadastro Específico do INSS) <a href="#" class="tooltip">?<span>O CEI é um número de cadastro específico para preenchimento do FGTS. Sem ele não é possível emitir a guia de recolhimento.</span></a></b><br />
												<input id="CEI" maxlength="15" name="CEI" type="text" value="<%=patrao.empregador_CEI %>" />
											</p>                                          
                                        </div>
                                        <div class="direita">
											<p>
												<b>CPF <span>*</span></b><br />
												<input id="CPF" maxlength="14" name="CPF" type="text" value="<%=patrao.empregador_CPF %>" />
											</p>                                        
                                        </div>
                                        <div class="esquerda">
                                            <p>
												<b>Telefone Comercial</b><br />
												<input id="TelefoneComercial" maxlength="13" name="TelefoneComercial" type="text" value="<%=patrao.empregador_TelefoneComercial %>" />
											</p>                                         
                                        </div>
                                        <div class="direita">
											<p>
												<b>Receber Newsletter (Informativo Eletrônico)</b><br />
												<input class="checkbox" id="RecebeNewsletter" name="RecebeNewsletter" type="checkbox" <%if patrao.empregador_RecebeNewsletter=true then response.write " checked " %> value="true" /><input name="RecebeNewsletter" type="hidden" value="false" />
											</p>                                        
                                        </div>
                                        <div class="esquerda">
											<p>
												<b>Telefone Celular</b><br />
												<input id="TelefoneCelular" maxlength="14" name="TelefoneCelular" type="text" value="<%=patrao.empregador_TelefoneCelular %>" />
											</p>                                        
                                        </div>
                                        <div class="direita">
											<p>
												<b>Telefone Residencial <span>*</span></b><br />
												<input id="TelefoneResidencial" maxlength="13" name="TelefoneResidencial" type="text" value="<%=patrao.empregador_TelefoneResidencial %>" />
											</p>                                        
                                        </div>
                                      
                                        </fieldset>

                                        <h4 class="cad" style="color: green;font-size: 20px;">Endereço</h4>
                                        <fieldset class="cadastro" title="Endereço">
                                       
                                        <div class="esquerda">
											<p>
												<b>CEP <span>*</span></b><br />
												<input id="Endereco_CEP" maxlength="9" name="Endereco.CEP" type="text" value="<%=patrao.empregador_CEP %>" />
											</p>                                        
                                        </div>
                                        <div class="direita"></div>
                                        <div class="esquerda">
											<p>
												<b>Endereço <span>*</span></b><br />
												<input id="Endereco_Logradouro" maxlength="128" name="Endereco.Logradouro" type="text" value="<%=patrao.empregador_Logradouro %>" />
											</p>                                        
                                        </div>
                                        <div class="direita">
											<p>
												<b>Número <span>*</span></b><br />
												<input id="Endereco_Numero" maxlength="6" name="Endereco.Numero" type="text" value="<%=patrao.empregador_Numero %>" />
											</p>                                        
                                        </div>
                                        <div class="esquerda">
											<p>
												<b>Complemento</b><br />
												<input id="Endereco_Complemento" maxlength="128" name="Endereco.Complemento" type="text" value="<%=patrao.empregador_Complemento %>" />
											</p>                                         
                                        </div>
                                        <div class="direita">
											<p>
												<b>Bairro <span>*</span></b><br />
												<input id="Endereco_Bairro" maxlength="128" name="Endereco.Bairro" type="text" value="<%=patrao.empregador_Bairro %>" />
											</p>  
                                        </div>
                                        <div class="esquerda">
											<p>
												<b>Estado <span>*</span></b><br />
                                                <%dim objRS, objCon
                                                    
                                                    set objCon = Server.CreateObject ("ADODB.Connection")
                                                    Set objRS = Server.CreateObject ("ADODB.Recordset")
                                                    objCon.Open strConn 
                                                    if isnumeric(patrao.empregador_CidadeID) then
                                                        objRS.open "select estadoID from dbo.cidade where ID=" & patrao.empregador_CidadeID, objCon,,,adcmdtext
                                                        if not (objRS.bof and objRS.eof) then estadoID=objRS("estadoID")
                                                        objRS.close
                                                    end if

                                                    %>
												<select id="Endereco_Cidade_EstadoID" name="Endereco.Cidade.EstadoID"><option value="">Selecione</option>
                                                    <% objRS.open "Select * from dbo.estado order by ID", objCon,,,adcmdtext
                                                       if objRS.bof and objRS.eof then
                                                            response.Write "<option>Favor contatar o suporte</option>"
                                                        else
                                                            while not objRS.eof
                                                        %>
                                                    <option value="<%=objRS("ID") %>" <%
                                                        if objRS("ID")=estadoID then response.write " selected "
                                                         %> ><%=objRS("nome") %></option>
                                                    <%          objRS.movenext
                                                            wend 
                                                        end if
                                                        objRS.close%>
                                                    
                                                </select>

											</p>                                        
                                        </div>
                                        <div class="direita">
												<p>
													<b>Cidade <span>*</span></b><br />
													<select id="Endereco_CidadeID" name="Endereco.CidadeID"><option value="">Selecione</option>
                                                    <% objRS.open "Select * from dbo.cidade order by ID", objCon,,,adcmdtext
                                                       if objRS.bof and objRS.eof then
                                                            response.Write "<option>Favor contatar o suporte</option>"
                                                        else
                                                            while not objRS.eof

                                                        %>
                                                    <option value="<%=objRS("ID") %>" <%
                                                        if objRS("ID")=patrao.empregador_CidadeID then response.write " selected "
                                                         %> ><%=objRS("nome") %></option>
                                                    <%          objRS.movenext
                                                            wend 
                                                        end if
                                                        objRS.close%>

                                                    </select>
												</p>                                        
                                        </div>
                                    
                                        
                                        </fieldset>
                                                    <%objCon.close
                                                    set objCon =nothing
                                                    Set objRS =nothing
                                                     %>
						<hr />
						<p>
							<button id="cancelar" class="button blue" type="reset" onclick="location.href='main.asp';">
								<span>Cancelar</span>
							</button>
							<button id="enviar" class="button green" type="submit" name="grava" value="Salvar">
								<span>Enviar</span>
							</button>
							<span id="processando" class="note loading">Processando...</span>
						</p>
						</div>

						</form>
                    <%else%>
                      

                        										
											<span class="strong">SUCESSO!</span> Seu cadastro foi efetuado com sucesso.
									
                        
                        
                        <%end if %>

<script type="text/javascript">
								           //<![CDATA[
								           if (!window.mvcClientValidationMetadata) { window.mvcClientValidationMetadata = []; }
								           window.mvcClientValidationMetadata.push({ "Fields": [], "FormId": null, "ReplaceValidationSummary": false });
								           //]]>
</script>
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
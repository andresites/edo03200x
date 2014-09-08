<!--#include file="conecta_bd.asp"--><%
 dim arDadosFunc, nome, funcID,arDadosFunc2, avisoSucesso, aviso_erro
    avisoSucesso=false
if len(session("temp_func"))>0 then
    if instr(1, session("temp_func"),"\")>1 then
        arDadosFunc=split(session("temp_func"),"|")   
        funcID=arDadosFunc(0)
        nome=arDadosFunc(1)
    end if
    session("temp_func")=""
end if
if len(limpaQuerystring("func_ID"))>0 then funcID = limpaQuerystring("func_ID")
if len(limparequestform("funcID"))>0 then funcID = limparequestform("funcID")

if len(limpaQuerystring("nome"))>0 then nome = limpaQuerystring("nome")
dim fulano, eleexiste
    eleexiste=false
set fulano = new empregado
if len(funcID)>0 then    
    fulano.ID=funcID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        nome=fulano.Nome
    end if
end if
if len(request.ServerVariables("content_length"))>0 then
    'serverside validation
    dim bolPassou, mensagemDeErro
    bolPassou=true
    dim contrato_ID 
    dim RecebeFGTS 
    dim DataEmissaoContrato 
    dim DataAdmissao 
    dim Salario 
    dim SalarioPorExtenso 
    dim isAtivo 
   dim EnderecoComplemento, bolVeioDeAgenciaDeTrabalho
   ' dim TipoEstabelecimentoID 
    dim TipoOcupacaoID 
    dim EmpregadoID 
    dim EmpregadorID 
    dim PeriodoExperienciaID 
    dim EnderecoID 
    dim ValeTransporte 
    TipoOcupacaoID = limparequestform("TipoOcupacaoID")
    DataAdmissao = limparequestform("DataAdmissao")
    DataEmissaoContrato = limparequestform("DataEmissaoContrato")
    Salario = limparequestform("Salario")
    SalarioPorExtenso = limparequestform("SalarioPorExtenso")
    RecebeFGTS = limparequestform("RecebeFGTS")
    DiasDaSemanaTrabalhados = limparequestform("DiasDaSemanaTrabalhados") 'inserir na respectiva tabela via array
    isPrincipal = limparequestform("isPrincipal") 'endereço é o mesmo do empregador
    PeriodoExperienciaID = limparequestform("PeriodoExperienciaID")
   ValeTransporte = limparequestform("ValeTransporte")
    dim EnderecoCEP, EnderecoNumero, EnderecoLogradouro, EnderecoBairro, EnderecoCidade, EnderecoEstado
    EnderecoCEP = limparequestform("EnderecoCEP")
    EnderecoNumero = limparequestform("EnderecoNumero")
    EnderecoComplemento = limparequestform("EnderecoComplemento")
    EnderecoLogradouro = limparequestform("EnderecoLogradouro")
    EnderecoBairro = limparequestform("EnderecoBairro")
    EnderecoCidade = limparequestform("EnderecoCidade")
    EnderecoEstado = limparequestform("EnderecoEstado")
    numeroCEI = limparequestform("numeroCEI")
    bolVeioDeAgenciaDeTrabalho = limparequestform("bolVeioDeAgenciaDeTrabalho")
    if DiasDaSemanaTrabalhados="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Selecione ao menos um dia por semana</li>"
    end if
    if RecebeFGTS="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor avisar se recebe FGTS</li>"
    end if
    if DataEmissaoContrato="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar data de emissão do contrato</li>"
    end if
    if DataAdmissao="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar data de admissão</li>"
    end if
    'response.Write DataAdmissao


    if DataEmissaoContrato="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar data de admissão</li>"
    end if
    if Salario="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar Salário</li>"
    end if
    if SalarioPorExtenso="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar salário por extenso</li>"
    end if
    if DataEmissaoContrato="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar data de admissão</li>"
    end if
    if DataEmissaoContrato="" then
        bolPassou=false
        mensagemDeErro=mensagemDeErro & "<li>Favor informar data de admissão</li>"
    end if

    if bolPassou=true then
        dim arrDiasSemana
        arrDiasSemana = array()
        set novoContrato = new contrato
        set oEmpregador=new empregador 'depois, para efeito de performance, criar metodo só pra pegar o endereço do empregador
        oEmpregador.carregaDadosEmpregador(session("ID"))
    'response.Write "<h1>::::---" & oEmpregador.empregador_CidadeID  & "</h1>"
            if oEmpregador.empregador_CEI = ""   then
                if len(numeroCEI)>0 then
                    oEmpregador.setField "CEI", numeroCEI, "texto" 
                    novoContrato.numeroCEI = numeroCEI
                end if
            end if        

        novoContrato.EmpregadoID=funcID
        novoContrato.EmpregadorID=session("ID")
        novoContrato.RecebeFGTS = RecebeFGTS
        novoContrato.DataEmissaoContrato = month(DataEmissaoContrato) & "/" & day(DataEmissaoContrato) & "/" & year(DataEmissaoContrato) 
        novoContrato.DataAdmissao = month(DataAdmissao) & "/" & day(DataAdmissao) & "/" & year(DataAdmissao) 
        novoContrato.Salario = Salario
        novoContrato.SalarioPorExtenso = SalarioPorExtenso
        if bolVeioDeAgenciaDeTrabalho="true" then novoContrato.bolVeioDeAgenciaDeTrabalho = true
        novoContrato.isAtivo = true
        novoContrato.TipoOcupacaoID = TipoOcupacaoID
        novoContrato.PeriodoExperienciaID = PeriodoExperienciaID
    'response.Write DiasDaSemanaTrabalhados
        if instr(1,DiasDaSemanaTrabalhados,",")>0 then
            arrDiasSemana = split(DiasDaSemanaTrabalhados,",")
            novoContrato.DiasDaSemana = arrDiasSemana
        else
            arrDiasSemana(0) = DiasDaSemanaTrabalhados
            novoContrato.DiasDaSemana = arrDiasSemana(0)
        end if
        novoContrato.ValeTransporte = ValeTransporte
        'response.Write "<h1>" & isPrincipal & "</h1>"
        'manobras para criar endereço novo do contrato. FILHO DA PUTA DO PROGRAMADOR ANTIGO CAGOU FEIO AO CONCEBER ESSA PORRA
        set novoEndereco = new endereco


    

        if isPrincipal="True" then    
            novoEndereco.Logradouro = oEmpregador.empregador_Logradouro
            novoEndereco.Numero =  oEmpregador.empregador_Numero
            novoEndereco.Bairro =  oEmpregador.empregador_Bairro
            novoEndereco.Complemento =  oEmpregador.empregador_Complemento    
            novoEndereco.Cep =  oEmpregador.empregador_CEP
            novoEndereco.CidadeID= oEmpregador.empregador_CidadeID    
            novoEnderecoID=     novoEndereco.AddEndereco("contrato")   
            novoContrato.enderecoID=    novoEnderecoID                     
           ' response.Write novoEnderecoID                 
        else
            'response.Write "<h1>Executou errado</h1>"              
            novoEndereco.Logradouro = EnderecoLogradouro
            novoEndereco.Numero = EnderecoNumero
            novoEndereco.Bairro = EnderecoBairro
            novoEndereco.Complemento = EnderecoComplemento    
            novoEndereco.Cep = EnderecoCEP
            novoEndereco.CidadeID=EnderecoCidade    
            novoEnderecoID=     novoEndereco.AddEndereco("contrato")   
            novoContrato.enderecoID=    novoEnderecoID    
           ' response.Write novoEnderecoID
     
            
        end if
        set novoEndereco = nothing
        novoContratoID = novoContrato.gravaContrato()
        set oEmpregador=nothing
        set novoContrato=nothing
        set fulano=nothing
            
    ''
           %>
	<html>

<head>

<title>Aguarde...</title>
</head>

<body onLoad="submit()">

<div align="center">

<form method="POST" action="contrato_add2.asp" id=form1 name=form1>
    <input type="hidden"  name="funcID" value="<%=funcID %>"/>
    <input type="hidden"  name="novoContratoID" value="<%=novoContratoID %>"/>
  
  <SCRIPT LANGUAGE=javascript>
<!--
    function submit() {
        document.forms[0].submit();
    }
    //-->
</SCRIPT>
</form>

</body>

</html>
	


<%
                    'Response.Redirect "contrato_add2.asp"
        response.End
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
<script type="text/javascript" src="/scripts/extenso.js"></script>

    
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
    <script type="text/javascript" src="/scripts/jquery.meio.mask.js"></script>

<script type="text/javascript" src="/scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="/Scripts/jquery.ui.mask.js"></script>

<script type="text/javascript" src="/scripts/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/scripts/jquery.ui.datepicker-pt-BR.js"></script>
<script type="text/javascript" src="/Scripts/custom.js"></script>


    
    <link rel="stylesheet" href="/content/css/datepicker.css" type="text/css" media="screen"  />

    

    <script type="text/javascript">
        $(document).ready(function () {
            //extenso
          

            $.mask.masks.DataAdmissao = { mask: '99/99/9999' }
            $("#DataAdmissao").datepicker({
                showOn: 'button',
                buttonImage: '/content/images/calendar.gif',
                buttonImageOnly: true
            });

            
            $("#DataEmissaoContrato").datepicker({
                showOn: 'button',
                buttonImage: '/content/images/calendar.gif',
                buttonImageOnly: true
            });

            //Validate();

            $('.isPrincipal').click(function () {
                $("#hdnIsPrincipal").val(true);

                $("#Endereco_Logradouro").attr("disabled", true);
                $("#Endereco_Numero").attr("disabled", true);
                $("#Endereco_Bairro").attr("disabled", true);
                $("#Endereco_CEP").attr("disabled", true);
                $("#Endereco_Complemento").attr("disabled", true);
                $("#Endereco_Cidade_EstadoID").attr("disabled", true);
                $("#Endereco_CidadeID").attr("disabled", true);
                Endereco_CidadeID
            });
            $('.notIsPrincipal').click(function () {
                $("#hdnIsPrincipal").val(false);

                $("#Endereco_Logradouro").attr("disabled", false);
                $("#Endereco_Numero").attr("disabled", false);
                $("#Endereco_Bairro").attr("disabled", false);
                $("#Endereco_CEP").attr("disabled", false);
                $("#Endereco_Complemento").attr("disabled", false);
                $("#Endereco_Cidade_EstadoID").attr("disabled", false);
                $("#Endereco_CidadeID").attr("disabled", false);
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
                    $("#Endereco_Cidade_EstadoID").change();
                });
            });

            $("#Endereco").hide();
            $("#notIsPrincipal").click(function () {
                $("#Endereco").slideDown("slow");
                $("#Endereco_Logradouro").val("");
                $("#Endereco_Numero").val("");
                $("#Endereco_Bairro").val("");
                $("#Endereco_CEP").val("");
                $("#Endereco_Complemento").val("");
                $("#Endereco_Cidade_EstadoID").val("");
                $("#Endereco_CidadeID").val("");
            });

            $("#IsPrincipal").click(function () {
                $("#Endereco").hide();
                $("#Endereco_Logradouro").val($("#EmpregadorEnderecoLogr").val());
                $("#Endereco_Numero").val($("#EmpregadorEnderecoNum").val());
                $("#Endereco_Bairro").val($("#EmpregadorEnderecoBairro").val());
                $("#Endereco_CEP").val($("#EmpregadorEnderecoCEP").val());
                $("#Endereco_Cidade_EstadoID").val($('#EmpregadorEnderecoEst').val());
                $('#Endereco_Cidade_EstadoID').change();
                $("#Endereco_CidadeID").val($('#EmpregadorEnderecoCid').val());
            });

            $.validator.addMethod(
                "salarioMinimo",
                function (value, element, params) {
                    $.ajaxSetup({ cache: false, async: false });
                    var result = 0;
                    var valor = value.replace(',', '.');
                    var idEstado = $("#Endereco_Cidade_EstadoID > option:selected").attr("value");

                    if (idEstado > 0) {
                        $.get("/Services/SalarioMinimo/get?idEstado=" + idEstado, function (data) {
                            result = data;
                        });
                    }
                    return valor >= result;
                },
                "O salário mínimo para este Estado é maior que o digitado."
            );

     
            $('#Salario').live('keypress', function (e) {
                var keyPressed;
                if ((e.charCode) && (e.keyCode == 0))
                    keyPressed = e.charCode
                else
                    keyPressed = e.keyCode;
                if ((keyPressed < 48 || keyPressed > 57) && keyPressed != 8 && keyPressed != 44) {
                    return false;
                }
                return true;
            });
            $('#Salario').keyup(function () {
                var prodText = $(this).val();
                //console.log(prodText);
                $('#SalarioPorExtenso').val(prodText.extenso(true));
            });
            if ($("#Endereco_Cidade_EstadoID > option:selected").attr("value") == "")
                $("#Endereco_CidadeID").attr("disabled", "disabled");

            $("#erro").hide();
            $(".note.loading").hide();


            $("#DataAdmissao").mask({ mask: "##/##/####" });
            $("#DataEmissaoContrato").mask({ mask: "##/##/####" });


            $("#Endereco_CEP").mask("99999-999");
            $("#cei").hide();

            $("#form").validate({
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
                rules: {
                    TipoOcupacaoID: { required: true },
                    PeriodoExperienciaID: { required: true },
                    DiasDaSemanaTrabalhados: "required",
                    RecebeFGTS: "required",
                    Salario: { required: true, salarioMinimo: true },
                    SalarioPorExtenso: "required",
                    "Endereco.Logradouro": "required",
                    "Endereco.Bairro": "required",
                    "Endereco.CidadeID": { noneSelected: true },
                    "Endereco.Numero": "required"
                },
                messages: {
                    TipoOcupacaoID: {
                        required: "Este campo é obrigatório."
                    },
                    PeriodoExperienciaID: {
                        required: "Este campo é obrigatório."
                    },
   
                    SalarioPorExtenso: "Este campo é obrigatório.",
                    "Endereco.Logradouro": "Este campo é obrigatório.",
                    "Endereco.Bairro": "Este campo é obrigatório.",
                    "Endereco.CidadeID": "Este campo é obrigatório.",
                    "Endereco.Numero": "Este campo é obrigatório."
                }
            });

            $('#simfgts').click(function () {
                $.post("/Services/Localizacao/VerificaCEIEmpregador/", function (data) {
                    if (data == true)
                        $("#cei").slideDown("slow");
                });
            });

            $('#naofgts').click(function () {
                $("#cei").slideUp("slow");
            });

            $('#Endereco_Cidade_EstadoID').change(function () {
                $.ajaxSetup({ cache: false, async: false });
                var selectedItem = $(this).val();
                if (selectedItem == "" || selectedItem == 0) {
                    //Do nothing or hide...?
                } else {
                    $.post("cidades2.asp?id=" + $("#Endereco_Cidade_EstadoID > option:selected").attr("value"), function (data) {
                        var items = "";

                        items += "<option>Selecione</option>";
                        $.each(data, function (i, data) {
                            items += "<option value='" + data.ID + "'>" + data.Nome + "</option>";
                        });

                        $("#Endereco_CidadeID").removeAttr('disabled');
                        $("#Endereco_CidadeID").html(items);
                    });
                }
            });

            $("#IsPrincipal").ready(function () {
                $("#Endereco").hide();
                $("#Endereco_Logradouro").val($("#EmpregadorEnderecoLogr").val());
                $("#Endereco_Numero").val($("#EmpregadorEnderecoNum").val());
                $("#Endereco_Bairro").val($("#EmpregadorEnderecoBairro").val());
                $("#Endereco_CEP").val($("#EmpregadorEnderecoCEP").val());

                $("#Endereco_Cidade_EstadoID").val($('#EmpregadorEnderecoEst').val());
                $('#Endereco_Cidade_EstadoID').change();
                $("#Endereco_CidadeID").val($('#EmpregadorEnderecoCid').val());
            });

            var data_atual = new Date();
        //    $("#DataEmissaoContrato").val(data_atual.getDate() + "/" + (data_atual.getMonth()+1) + "/" + data_atual.getFullYear());

        });
</script>


<title>
	
	Empregados

</title>
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





<div id="adminbar">

        <b>Empregado Selecionado</b>: <b style="color:Red;font-size:20px;"><%=nome %></b><img src = "/Content/images/user.jpg" alt="<%=nome %>" style="width: 25px; top: -3px;" />


</div>
				
			</div>
		
			<!-- Header [end] -->

			<!-- grid layout [begin] -->

			

    <div class="container_12">
         <%if eleexiste then %>
		<div class="grid_12">
            

					<%if avisoSucesso then %>	
                <div id="sucesso" class="message success"><span class="strong">SUCESSO!</span> Registro salvo com sucesso!</div>
			        <%end if %>

			 
            <div class="sb-box">

              

                <div class="sb-box-inner content">
                    <div class="header">
                        <h3>Criação do Contrato Inicial</h3>
                        <ul class="tabs">
                            <li class="active">
                                <a href="main.asp" hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>
                    </div>

                    <div class="bcont">
                        <form action="contrato_add.asp" id="form" method="post" name="form">
                         <input type="hidden"   name="funcID" value="<%=funcID %>" />
                        <div id="erro" class="message error" style="display: none;">
                            <span class="strong">ERRO!</span> Verifique todos os campos abaixo.
                        </div>



                        <div class="esquerda">
                            <p>
                                <b>Empregado:</b><br>
                                <span style="color:Red; font-size:20px;"><%=nome %></span>
                            </p>
                        </div>
                        
<%    
dim objCon,  objRS, strMsg, strICQ, obCmd
set objCon = Server.CreateObject ("ADODB.Connection")
Set objRS = Server.CreateObject ("ADODB.Recordset")
objCon.Open strConn 
       
     %>                              
                               
                                
                           
                        <div class="esquerda">
                            <p>
                                <b>Tipo de Ocupação <span>*</span></b><br>
                                <select id="TipoOcupacaoID" name="TipoOcupacaoID"><option value="">Selecione</option>
                                    <%objRS.open "select * from  contrato.TipoOcupacao", objCon,,,adcmdText
                                        if not (objRS.bof and objRS.eof) then
                                            while not objRS.eof%>
                                    <option value="<%=objRS("ID") %>"><%=objRS("Nome") %></option>
                                    <%          objRS.movenext
                                            wend
                                        end if 
                                        objRS.close%>

                                </select>
                                
                            </p>
                        </div>
                        <div class="direita">
                            <p>
                                <b>Período de Experiência <span>*</span></b><br>
                                <select id="PeriodoExperienciaID" name="PeriodoExperienciaID"><option value="">Selecione</option>
<option value="1">30 dias</option>
<option value="2">60 dias</option>
<option value="3">90 dias</option>
<option value="4">Nenhum</option>
</select>
                                
                            </p>
                        </div>
                        <div class="esquerda">
                            <p>
                                <b>Data de Admissão <span>*</span></b><br>
                                <input class="inputtext medium" id="DataAdmissao" maxlength="128" name="DataAdmissao" type="text" value="">
                                
                            </p>
                        </div>
                        <div class="direita">
                            <p>
                                <b>Data de Emissão do Contrato <span>*</span></b><br>
                                <input class="inputtext medium" id="DataEmissaoContrato" maxlength="128" name="DataEmissaoContrato" type="text" value="">
                                
                            </p>
                        </div>
                        <div class="esquerda">
                            <p>
                                <b>Salário <span>*</span></b><br>
                                R$
                                <input class="inputtext medium" id="Salario" maxlength="128" name="Salario" type="text" value="">
                                
                            </p>
                        </div>
                        <div class="direita">
                            <p>
                                <b>Salário por Extenso <span>*</span></b><br>
                                <input style="text-transform:uppercase" class="inputtext medium" id="SalarioPorExtenso" maxlength="128" name="SalarioPorExtenso" type="text" value="">
                                <br>
                                (<b>Por exemplo:</b> Mil Duzentos e Trinta e Quatro Reais e Cinquenta e Seis Centavos)<br>
                                
                            </p>
                        </div>
                        <div class="esquerda">
                            <p>
                                <b>Receberá FGTS</b>
                                <input id="simfgts" name="RecebeFGTS" type="radio" value="True">
                                Sim
                                <input checked="checked" id="naofgts" name="RecebeFGTS" type="radio" value="False">
                                Não
                                <br>
                                (Incide <b>8% sobre o salario bruto)</b><br>
                                
                                <br>
                            </p>
                            <p id="cei" style="display: none;">
                                <b>CEI (Cadastro Específico do INSS)</b><br>
                                <input name="numeroCEI" type="text" id="MainContent_txtcei" maxlength="40" class="inputtext medium"><br>
                                Para que seu empregado receba o FGTS você precisa do <a href="http://www.receita.fazenda.gov.br/previdencia/defaultcei.htm" target="_blank" hidefocus="true" style="outline: none;">CEI</a>.<br>
                                Para efetuar o cadastro, <a href="http://www2.dataprev.gov.br/ceiweb/index.view" target="_blank" hidefocus="true" style="outline: none;">clique aqui</a>.
                            </p>
                        </div>
                        <div class="direita">
                            <p>
                                <b>Veio através de agência de empregos?</b><br>
                               <input type="radio" name="bolVeioDeAgenciaDeTrabalho" value="true" /> <b>Sim</b> |

                                <input type="radio" name="bolVeioDeAgenciaDeTrabalho" value="false" /> <b>Não</b>
                            </p>
                            <p><b>Receberá Vale Transporte?</b><br />
                                <input type="radio" name="ValeTransporte" value="1"  checked /> <b>Sim</b> | <input type="radio" name="ValeTransporte" value="0" /> <b>Não</b> 
                            </p>
                        </div>


                        <p>
                            
                            <b>Dias da Semana Trabalhados</b>
                            <br>
                            
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="1" class="checkbox">
                                    <label for="cbdemo1">
                                        Domingo</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="2" class="checkbox">
                                    <label for="cbdemo1">
                                        Segunda-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="3" class="checkbox">
                                    <label for="cbdemo1">
                                        Terça-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="4" class="checkbox">
                                    <label for="cbdemo1">
                                        Quarta-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="5" class="checkbox">
                                    <label for="cbdemo1">
                                        Quinta-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="6" class="checkbox">
                                    <label for="cbdemo1">
                                        Sexta-feira</label>
                                
                                    <input type="checkbox" name="DiasDaSemanaTrabalhados" value="7" class="checkbox">
                                    <label for="cbdemo1">
                                        Sábado</label>
                                
                        </p>
                         <div>
                            <div class="divEntrega">
                                <span>Endereço do contrato é o mesmo do <b>Empregador</b>?</span><br>
                                <input checked="checked" id="IsPrincipal" name="isPrincipal" type="radio" value="True">
                                Sim
                                <input id="notIsPrincipal" name="isPrincipal" type="radio" value="False">
                                Não
                            </div>
                            <br>
                            <div id="Endereco" class="duvidas" style="display: none;">
                            <hr>
                            <h3 class="head2">
                                Endereço</h3>
                                <div class="esquerda">
                                    
                                    <p>
                                        <b>CEP </b>
                                        <br>
                                        <input class="inputtext medium" id="Endereco_CEP" maxlength="128" name="EnderecoCEP" type="text" value="">
                                        
                                    </p>
                                </div>
                                <div class="direita">
                                    <p>
                                        <b>Número <span>*</span></b><br>
                                        <input class="inputtext medium" id="Endereco_Numero" maxlength="6" name="EnderecoNumero" type="text" value="">
                                        
                                    </p>
                                </div>
                                <div class="esquerda">
                                    <p>
                                        <b>Complemento</b><br>
                                        <input class="inputtext medium" id="Endereco_Complemento" maxlength="128" name="EnderecoComplemento" type="text" value="">
                                        
                                    </p>
                                </div>
                                <div class="direita">
                                    <p>
                                        <b>Endereço <span>*</span></b><br>
                                        <input class="inputtext medium" id="Endereco_Logradouro" maxlength="128" name="EnderecoLogradouro" type="text" value="">
                                        
                                    </p>
                                </div>
                                <div class="esquerda">
                                     <p>
                                        <b>Bairro <span>*</span></b><br>
                                        <input class="inputtext medium" id="Endereco_Bairro" maxlength="128" name="EnderecoBairro" type="text" value="">
                                        
                                    </p>
                                </div>
                                <div class="direita">
                                    <p>
                                        <br>
                                        <br>
                                        <br>
                                    </p>
                                </div>
                                <div class="esquerda">
                                    <p>
                                        <b>Estado <span>*</span></b><br>
                                        <select id="Endereco_Cidade_EstadoID" name="EnderecoEstado"><option value="">Selecione</option>
<option value="1">Acre</option>
<option value="2">Alagoas</option>
<option value="3">Amazonas</option>
<option value="4">Amapá</option>
<option value="5">Bahia</option>
<option value="6">Ceará</option>
<option value="7">Distrito Federal</option>
<option value="8">Espírito Santo</option>
<option value="9">Goiás</option>
<option value="10">Maranhão</option>
<option value="11">Minas Gerais</option>
<option value="12">Mato Grosso do Sul</option>
<option value="13">Mato Grosso</option>
<option value="14">Pará</option>
<option value="15">Paraíba</option>
<option value="16">Pernambuco</option>
<option value="17">Piauí</option>
<option value="18">Paraná</option>
<option value="19">Rio de Janeiro</option>
<option value="20">Rio Grande do Norte</option>
<option value="21">Rondônia</option>
<option value="22">Roraima</option>
<option value="23">Rio Grande do Sul</option>
<option value="24">Santa Catarina</option>
<option value="25">Sergipe</option>
<option value="26">São Paulo</option>
<option value="27">Tocantins</option>
</select>
                                    </p>
                                </div>
                                <div class="direita">
                                    <p>
                                        <b>Cidade <span>*</span></b><br>
                                        <select id="Endereco_CidadeID" name="EnderecoCidade"><option>Selecione</option><option value="7754">ADAMANTINA</option><option value="7755">ADOLFO</option><option value="7756">AGISSE</option><option value="7757">AGUA VERMELHA</option><option value="7758">AGUAI</option><option value="7759">AGUAS DA PRATA</option><option value="7760">AGUAS DE LINDOIA</option><option value="7761">AGUAS DE SANTA BARBARA</option><option value="7762">AGUAS DE SAO PEDRO</option><option value="7763">AGUDOS</option><option value="7764">AGULHA</option><option value="7765">AJAPI</option><option value="7766">ALAMBARI</option><option value="7767">ALBERTO MOREIRA</option><option value="7768">ALDEIA</option><option value="7769">ALDEIA DE CARAPICUIBA</option><option value="7770">ALFREDO GUEDES</option><option value="7771">ALFREDO GUEDES</option><option value="7772">ALFREDO MARCONDES</option><option value="7773">ALTAIR</option><option value="7774">ALTINOPOLIS</option><option value="7775">ALTO ALEGRE</option><option value="7776">ALTO PORA</option><option value="7777">ALUMINIO</option><option value="7778">ALVARES FLORENCE</option><option value="7779">ALVARES MACHADO</option><option value="7780">ALVARO DE CARVALHO</option><option value="7781">ALVINLANDIA</option><option value="7782">AMADEU AMARAL</option><option value="7783">AMANDABA</option><option value="7784">AMELIOPOLIS</option><option value="7785">AMERICANA</option><option value="7786">AMERICO BRASILIENSE</option><option value="7787">AMERICO DE CAMPOS</option><option value="7788">AMPARO</option><option value="7789">ANA DIAS</option><option value="7790">ANALANDIA</option><option value="7791">ANAPOLIS</option><option value="7792">ANDES</option><option value="7793">ANDRADINA</option><option value="7794">ANGATUBA</option><option value="7795">ANHEMBI</option><option value="7796">ANHUMAS</option><option value="7797">APARECIDA</option><option value="7798">APARECIDA D OESTE</option><option value="7799">APARECIDA DE MONTE ALTO</option><option value="7800">APARECIDA DE SAO MANUEL</option><option value="7801">APARECIDA DO BONITO</option><option value="7802">APIAI</option><option value="7803">APIAI-MIRIM</option><option value="7804">ARABELA</option><option value="7805">ARACACU</option><option value="7806">ARACAIBA</option><option value="7807">ARACARIGUAMA</option><option value="7808">ARACATUBA</option><option value="7809">ARACOIABA DA SERRA</option><option value="7810">ARAMINA</option><option value="7811">ARANDU</option><option value="7812">ARAPEI</option><option value="7813">ARARAQUARA</option><option value="7814">ARARAS</option><option value="7815">ARAXAS</option><option value="7816">ARCADAS</option><option value="7817">ARCO-IRIS</option><option value="7818">AREALVA</option><option value="7819">AREIAS</option><option value="7820">AREIOPOLIS</option><option value="7821">ARIRANHA</option><option value="7822">ARIRI</option><option value="7823">ARTEMIS</option><option value="7824">ARTUR NOGUEIRA</option><option value="7825">ARUJA</option><option value="7826">ASPASIA</option><option value="7827">ASSIS</option><option value="7828">ASSISTENCIA</option><option value="7829">ATIBAIA</option><option value="7830">ATLANTIDA</option><option value="7831">AURIFLAMA</option><option value="7832">AVAI</option><option value="7833">AVANHANDAVA</option><option value="7834">AVARE</option><option value="7835">AVENCAS</option><option value="7836">BACAETAVA</option><option value="7837">BACURITI</option><option value="7838">BADY BASSITT</option><option value="7839">BAGUACU</option><option value="7840">BAIRRO ALTO</option><option value="7841">BALBINOS</option><option value="7842">BALSAMO</option><option value="7843">BANANAL</option><option value="7844">BANDEIRANTES D OESTE</option><option value="7845">BARAO ATALIBA NOGUEIRA</option><option value="7846">BARAO DE ANTONINA</option><option value="7847">BARAO DE GERALDO</option><option value="7848">BARBOSA</option><option value="7849">BARIRI</option><option value="7850">BARRA BONITA</option><option value="7851">BARRA DO CHAPEU</option><option value="7852">BARRA DO TURVO</option><option value="7853">BARRA DOURADA</option><option value="7854">BARRANIA</option><option value="7855">BARRETOS</option><option value="7856">BARRINHA</option><option value="7857">BARUERI</option><option value="7858">BASTOS</option><option value="7859">BATATAIS</option><option value="7860">BATATUBA</option><option value="7861">BATISTA BOTELHO</option><option value="7862">BAURU</option><option value="7863">BEBEDOURO</option><option value="7864">BELA FLORESTA</option><option value="7865">BELA VISTA SAO-CARLENSE</option><option value="7866">BENTO DE ABREU</option><option value="7867">BERNARDINO DE CAMPOS</option><option value="7868">BERTIOGA</option><option value="7869">BILAC</option><option value="7870">BIRIGUI</option><option value="7871">BIRITIBA-MIRIM</option><option value="7872">BIRITIBA-USSU</option><option value="7873">BOA ESPERANCA DO SUL</option><option value="7874">BOA VISTA DOS ANDRADAS</option><option value="7875">BOA VISTA PAULISTA</option><option value="7876">BOCAINA</option><option value="7877">BOFETE</option><option value="7878">BOITUVA</option><option value="7879">BOM FIM DO BOM JESUS</option><option value="7880">BOM JESUS DOS PERDOES</option><option value="7881">BOM RETIRO DA ESPERANCA</option><option value="7882">BOM SUCESSO DE ITARARE</option><option value="7883">BONFIM PAULISTA</option><option value="7884">BORA</option><option value="7885">BORACEIA</option><option value="7886">BORBOREMA</option><option value="7887">BOREBI</option><option value="7888">BOTAFOGO</option><option value="7889">BOTELHO</option><option value="7890">BOTUCATU</option><option value="7891">BOTUJURU</option><option value="7892">BRACO</option><option value="7893">BRAGANCA PAULISTA</option><option value="7894">BRAS CUBAS</option><option value="7895">BRASITANIA</option><option value="7896">BRAUNA</option><option value="7897">BREJO ALEGRE</option><option value="7898">BRODOWSKI</option><option value="7899">BROTAS</option><option value="7900">BUENO DE ANDRADA</option><option value="7901">BURI</option><option value="7902">BURITAMA</option><option value="7903">BURITIZAL</option><option value="7904">CABRALIA PAULISTA</option><option value="7905">CABREUVA</option><option value="7906">CACAPAVA</option><option value="7907">CACHOEIRA DE EMAS</option><option value="7908">CACHOEIRA PAULISTA</option><option value="7909">CACONDE</option><option value="7910">CAFELANDIA</option><option value="7911">CAFESOPOLIS</option><option value="7912">CAIABU</option><option value="7913">CAIBURA</option><option value="7914">CAIEIRAS</option><option value="7915">CAIUA</option><option value="7916">CAJAMAR</option><option value="7917">CAJATI</option><option value="7918">CAJOBI</option><option value="7919">CAJURU</option><option value="7920">CAMBAQUARA</option><option value="7921">CAMBARATIBA</option><option value="7922">CAMPESTRINHO</option><option value="7923">CAMPINA DE FORA</option><option value="7924">CAMPINA DO MONTE ALEGRE</option><option value="7925">CAMPINAL</option><option value="7926">CAMPINAS</option><option value="7927">CAMPO LIMPO PAULISTA</option><option value="7928">CAMPOS DE CUNHA</option><option value="7929">CAMPOS DO JORDAO</option><option value="7930">CAMPOS NOVOS PAULISTA</option><option value="7931">CANANEIA</option><option value="7932">CANAS</option><option value="7933">CANDIA</option><option value="7934">CANDIDO MOTA</option><option value="7935">CANDIDO RODRIGUES</option><option value="7936">CANGUERA</option><option value="7937">CANITAR</option><option value="7938">CAPAO BONITO</option><option value="7939">CAPELA DO ALTO</option><option value="7940">CAPIVARI</option><option value="7941">CAPIVARI DA MATA</option><option value="7942">CAPIVARI DA MATA</option><option value="7943">CAPORANGA</option><option value="7944">CAPUAVA</option><option value="7945">CARAGUATATUBA</option><option value="7946">CARAPICUIBA</option><option value="7947">CARDEAL</option><option value="7948">CARDOSO</option><option value="7949">CARUARA</option><option value="7950">CASA BRANCA</option><option value="7951">CASSIA DOS COQUEIROS</option><option value="7952">CASTILHO</option><option value="7953">CATANDUVA</option><option value="7954">CATIGUA</option><option value="7955">CATUCABA</option><option value="7956">CAUCAIA DO ALTO</option><option value="7957">CEDRAL</option><option value="7958">CERQUEIRA CESAR</option><option value="7959">CERQUILHO</option><option value="7960">CESARIO LANGE</option><option value="7961">CEZAR DE SOUZA</option><option value="7962">CHARQUEADA</option><option value="7963">CHAVANTES</option><option value="7964">CIPO-GUACU</option><option value="7965">CLARINIA</option><option value="7966">CLEMENTINA</option><option value="7967">COCAES</option><option value="7968">COLINA</option><option value="7969">COLOMBIA</option><option value="7970">CONCEICAO DE MONTE ALEGRE</option><option value="7971">CONCHAL</option><option value="7972">CONCHAS</option><option value="7973">CORDEIROPOLIS</option><option value="7974">COROADOS</option><option value="7975">CORONEL GOULART</option><option value="7976">CORONEL MACEDO</option><option value="7977">CORONEL MACEDO</option><option value="7978">CORREDEIRA</option><option value="7979">CORREGO RICO</option><option value="7980">CORUMBATAI</option><option value="7981">COSMOPOLIS</option><option value="7982">COSMORAMA</option><option value="7983">COSTA MACHADO</option><option value="7984">COTIA</option><option value="7985">CRAVINHOS</option><option value="7986">CRISTAIS PAULISTA</option><option value="7987">CRUZ DAS POSSES</option><option value="7988">CRUZALIA</option><option value="7989">CRUZEIRO</option><option value="7990">CUBATAO</option><option value="7991">CUIABA PAULISTA</option><option value="7992">CUNHA</option><option value="7993">CURUPA</option><option value="7994">DALAS</option><option value="7995">DESCALVADO</option><option value="7996">DIADEMA</option><option value="7997">DIRCE REIS</option><option value="7998">DIRCEU</option><option value="7999">DIVINOLANDIA</option><option value="8000">DOBRADA</option><option value="8001">DOIS CORREGOS</option><option value="8002">DOLCINOPOLIS</option><option value="8003">DOMELIA</option><option value="8004">DOURADO</option><option value="8005">DRACENA</option><option value="8006">DUARTINA</option><option value="8007">DUMONT</option><option value="8008">DUPLO CEU</option><option value="8009">ECHAPORA</option><option value="8010">ELDORADO</option><option value="8011">ELEUTERIO</option><option value="8012">ELIAS FAUSTO</option><option value="8013">ELISIARIO</option><option value="8014">EMBAUBA</option><option value="8015">EMBU</option><option value="8016">EMBU-GUACU</option><option value="8017">EMILIANOPOLIS</option><option value="8018">ENEIDA</option><option value="8019">ENGENHEIRO BALDUINO</option><option value="8020">ENGENHEIRO COELHO</option><option value="8021">ENGENHEIRO MAIA</option><option value="8022">ENGENHEIRO SCHMIDT</option><option value="8023">ESMERALDA</option><option value="8024">ESPERANCA D OESTE</option><option value="8025">ESPIGAO</option><option value="8026">ESPIRITO SANTO DO PINHAL</option><option value="8027">ESPIRITO SANTO DO TURVO</option><option value="8028">ESTIVA GERBI</option><option value="8029">ESTRELA D OESTE</option><option value="8030">ESTRELA DO NORTE</option><option value="8031">EUCLIDES DA CUNHA PAULISTA</option><option value="8032">EUGENIO DE MELO</option><option value="8033">FARTURA</option><option value="8034">FATIMA</option><option value="8035">FATIMA PAULISTA</option><option value="8036">FAZENDA VELHA</option><option value="8037">FERNANDO PRESTES</option><option value="8038">FERNANDOPOLIS</option><option value="8039">FERNAO</option><option value="8040">FERRAZ DE VASCONCELOS</option><option value="8041">FLORA RICA</option><option value="8042">FLOREAL</option><option value="8043">FLORESTA DO SUL</option><option value="8044">FLORIDA PAULISTA</option><option value="8045">FLORINEA</option><option value="8046">FRANCA</option><option value="8047">FRANCISCO MORATO</option><option value="8048">FRANCO DA ROCHA</option><option value="8049">FRUTAL DO CAMPO</option><option value="8050">GABRIEL MONTEIRO</option><option value="8051">GALIA</option><option value="8052">GARCA</option><option value="8053">GARDENIA</option><option value="8054">GASTAO VIDIGAL</option><option value="8055">GAVIAO PEIXOTO</option><option value="8056">GENERAL SALGADO</option><option value="8057">GETULINA</option><option value="8058">GLICERIO</option><option value="8059">GRAMADINHO</option><option value="8060">GUACHOS</option><option value="8061">GUAIANAS</option><option value="8062">GUAICARA</option><option value="8063">GUAIMBE</option><option value="8064">GUAIRA</option><option value="8065">GUAMIUM</option><option value="8066">GUAPIACU</option><option value="8067">GUAPIARA</option><option value="8068">GUAPIRANGA</option><option value="8069">GUARA</option><option value="8070">GUARACAI</option><option value="8071">GUARACI</option><option value="8072">GUARACIABA D OESTE</option><option value="8073">GUARANI D OESTE</option><option value="8074">GUARANTA</option><option value="8075">GUARAPIRANGA</option><option value="8076">GUARAPUA</option><option value="8077">GUARARAPES</option><option value="8078">GUARAREMA</option><option value="8079">GUARATINGUETA</option><option value="8080">GUAREI</option><option value="8081">GUARIBA</option><option value="8082">GUARIROBA</option><option value="8083">GUARIZINHO</option><option value="8084">GUARUJA</option><option value="8085">GUARULHOS</option><option value="8086">GUATAPARA</option><option value="8087">GUZOLANDIA</option><option value="8088">HERCULANDIA</option><option value="8089">HOLAMBRA</option><option value="8090">HOLAMBRA II</option><option value="8091">HORTOLANDIA</option><option value="8092">IACANGA</option><option value="8093">IACRI</option><option value="8094">IARAS</option><option value="8095">IBATE</option><option value="8096">IBIPORANGA</option><option value="8097">IBIRA</option><option value="8098">IBIRAREMA</option><option value="8099">IBITINGA</option><option value="8100">IBITIRUNA</option><option value="8101">IBITIUVA</option><option value="8102">IBITU</option><option value="8103">IBIUNA</option><option value="8104">ICEM</option><option value="8105">IDA IOLANDA</option><option value="8106">IEPE</option><option value="8107">IGACABA</option><option value="8108">IGARACU DO TIETE</option><option value="8109">IGARAI</option><option value="8110">IGARAPAVA</option><option value="8111">IGARATA</option><option value="8112">IGUAPE</option><option value="8113">ILHA COMPRIDA</option><option value="8114">ILHA DIANA</option><option value="8115">ILHA SOLTEIRA</option><option value="8116">ILHABELA</option><option value="8117">INDAIA DO AGUAPEI</option><option value="8118">INDAIATUBA</option><option value="8119">INDIANA</option><option value="8120">INDIAPORA</option><option value="8121">INGAS</option><option value="8122">INUBIA PAULISTA</option><option value="8123">IPAUSSU</option><option value="8124">IPERO</option><option value="8125">IPEUNA</option><option value="8126">IPIGUA</option><option value="8127">IPORANGA</option><option value="8128">IPUA</option><option value="8129">IRACEMAPOLIS</option><option value="8130">IRAPE</option><option value="8131">IRAPUA</option><option value="8132">IRAPURU</option><option value="8133">ITABERA</option><option value="8134">ITABOA</option><option value="8135">ITAI</option><option value="8136">ITAIUBA</option><option value="8137">ITAJOBI</option><option value="8138">ITAJU</option><option value="8139">ITANHAEM</option><option value="8140">ITAOCA</option><option value="8141">ITAPECERICA DA SERRA</option><option value="8142">ITAPETININGA</option><option value="8143">ITAPEUNA</option><option value="8144">ITAPEVA</option><option value="8145">ITAPEVI</option><option value="8146">ITAPIRA</option><option value="8147">ITAPIRAPUA PAULISTA</option><option value="8148">ITAPOLIS</option><option value="8149">ITAPORANGA</option><option value="8150">ITAPUI</option><option value="8151">ITAPURA</option><option value="8152">ITAQUAQUECETUBA</option><option value="8153">ITAQUERI DA SERRA</option><option value="8154">ITARARE</option><option value="8155">ITARIRI</option><option value="8156">ITATIBA</option><option value="8157">ITATINGA</option><option value="8158">ITIRAPINA</option><option value="8159">ITIRAPUA</option><option value="8160">ITOBI</option><option value="8161">ITORORO DO PARANAPANEMA</option><option value="8162">ITU</option><option value="8163">ITUPEVA</option><option value="8164">ITUVERAVA</option><option value="8165">IUBATINGA</option><option value="8166">JABORANDI</option><option value="8167">JABOTICABAL</option><option value="8168">JACARE</option><option value="8169">JACAREI</option><option value="8170">JACI</option><option value="8171">JACIPORA</option><option value="8172">JACUBA</option><option value="8173">JACUPIRANGA</option><option value="8174">JAFA</option><option value="8175">JAGUARIUNA</option><option value="8176">JALES</option><option value="8177">JAMAICA</option><option value="8178">JAMBEIRO</option><option value="8179">JANDIRA</option><option value="8180">JARDIM BELVAL</option><option value="8181">JARDIM PRESIDENTE DUTRA</option><option value="8182">JARDIM SANTA LUZIA</option><option value="8183">JARDIM SILVEIRA</option><option value="8184">JARDINOPOLIS</option><option value="8185">JARINU</option><option value="8186">JATOBA</option><option value="8187">JAU</option><option value="8188">JERIQUARA</option><option value="8189">JOANOPOLIS</option><option value="8190">JOANOPOLISX</option><option value="8191">JOAQUIM EGIDIO</option><option value="8192">JORDANESIA</option><option value="8193">JOSE BONIFACIO</option><option value="8194">JULIANIA</option><option value="8195">JULIO MESQUITA</option><option value="8196">JUMIRIM</option><option value="8197">JUNDIAI</option><option value="8198">JUNDIAPEBA</option><option value="8199">JUNQUEIRA</option><option value="8200">JUNQUEIROPOLIS</option><option value="8201">JUQUIA</option><option value="8202">JUQUIRATIBA</option><option value="8203">JUQUITIBA</option><option value="8204">JURITIS</option><option value="8205">JURUCE</option><option value="8206">JURUPEBA</option><option value="8207">JURUPEMA</option><option value="8208">LACIO</option><option value="8209">LAGOA AZUL</option><option value="8210">LAGOA BRANCA</option><option value="8211">LAGOINHA</option><option value="8212">LARANJAL PAULISTA</option><option value="8213">LARAS</option><option value="8214">LAURO PENTEADO</option><option value="8215">LAVINIA</option><option value="8216">LAVRINHAS</option><option value="8217">LEME</option><option value="8218">LENCOIS PAULISTA</option><option value="8219">LIMEIRA</option><option value="8220">LINDOIA</option><option value="8221">LINS</option><option value="8222">LOBO</option><option value="8223">LORENA</option><option value="8224">LOURDES</option><option value="8225">LOUVEIRA</option><option value="8226">LUCELIA</option><option value="8227">LUCIANOPOLIS</option><option value="8228">LUIS ANTONIO</option><option value="8229">LUIZIANIA</option><option value="8230">LUPERCIO</option><option value="8231">LUSITANIA</option><option value="8232">LUTECIA</option><option value="8233">MACATUBA</option><option value="8234">MACAUBAL</option><option value="8235">MACEDONIA</option><option value="8236">MACUCOS</option><option value="8237">MAGDA</option><option value="8238">MAILASQUI</option><option value="8239">MAIRINQUE</option><option value="8240">MAIRIPORA</option><option value="8241">MAJOR PRADO</option><option value="8242">MANDURI</option><option value="8243">MANGARATU</option><option value="8244">MARABA PAULISTA</option><option value="8245">MARACAI</option><option value="8246">MARAPOAMA</option><option value="8247">MARCONDESIA</option><option value="8248">MARESIAS</option><option value="8249">MARIAPOLIS</option><option value="8250">MARILIA</option><option value="8251">MARINOPOLIS</option><option value="8252">MARISTELA</option><option value="8253">MARTIM FRANCISCO</option><option value="8254">MARTINHO PRADO JUNIOR</option><option value="8255">MARTINOPOLIS</option><option value="8256">MATAO</option><option value="8257">MAUA</option><option value="8258">MENDONCA</option><option value="8259">MERIDIANO</option><option value="8260">MESOPOLIS</option><option value="8261">MIGUELOPOLIS</option><option value="8262">MINEIROS DO TIETE</option><option value="8263">MIRA ESTRELA</option><option value="8264">MIRACATU</option><option value="8265">MIRALUZ</option><option value="8266">MIRANDOPOLIS</option><option value="8267">MIRANTE DO PARANAPANEMA</option><option value="8268">MIRASSOL</option><option value="8269">MIRASSOLANDIA</option><option value="8270">MOCOCA</option><option value="8271">MOGI DAS CRUZES</option><option value="8272">MOGI-GUACU</option><option value="8273">MOGI-MIRIM</option><option value="8274">MOMBUCA</option><option value="8275">MONCOES</option><option value="8276">MONGAGUA</option><option value="8277">MONTALVAO</option><option value="8278">MONTE ALEGRE DO SUL</option><option value="8279">MONTE ALTO</option><option value="8280">MONTE APRAZIVEL</option><option value="8281">MONTE AZUL PAULISTA</option><option value="8282">MONTE CABRAO</option><option value="8283">MONTE CASTELO</option><option value="8284">MONTE MOR</option><option value="8285">MONTE VERDE PAULISTA</option><option value="8286">MONTEIRO LOBATO</option><option value="8287">MOREIRA CESAR</option><option value="8288">MORRO AGUDO</option><option value="8289">MORRO DO ALTO</option><option value="8290">MORUNGABA</option><option value="8291">MOSTARDAS</option><option value="8292">MOTUCA</option><option value="8293">MOURAO</option><option value="8294">MURUTINGA DO SUL</option><option value="8295">NANTES</option><option value="8296">NARANDIBA</option><option value="8297">NATIVIDADE DA SERRA</option><option value="8298">NAZARE PAULISTA</option><option value="8299">NEVES PAULISTA</option><option value="8300">NHANDEARA</option><option value="8301">NIPOA</option><option value="8302">NOGUEIRA</option><option value="8303">NOSSA SENHORA DO REMEDIO</option><option value="8304">NOVA ALEXANDRIA</option><option value="8305">NOVA ALIANCA</option><option value="8306">NOVA AMERICA</option><option value="8307">NOVA APARECIDA</option><option value="8308">NOVA CAMPINA</option><option value="8309">NOVA CAMPINA</option><option value="8310">NOVA CANAA PAULISTA</option><option value="8311">NOVA CASTILHO</option><option value="8312">NOVA EUROPA</option><option value="8313">NOVA GRANADA</option><option value="8314">NOVA GUATAPORANGA</option><option value="8315">NOVA INDEPENDENCIA</option><option value="8316">NOVA ITAPIREMA</option><option value="8317">NOVA LUZITANIA</option><option value="8318">NOVA ODESSA</option><option value="8319">NOVA PATRIA</option><option value="8320">NOVA VENEZA</option><option value="8321">NOVAIS</option><option value="8322">NOVO CRAVINHOS</option><option value="8323">NOVO HORIZONTE</option><option value="8324">NUPORANGA</option><option value="8325">OASIS</option><option value="8326">OCAUCU</option><option value="8327">OLEO</option><option value="8328">OLIMPIA</option><option value="8329">OLIVEIRA BARROS</option><option value="8330">ONDA BRANCA</option><option value="8331">ONDA VERDE</option><option value="8332">ORIENTE</option><option value="8333">ORINDIUVA</option><option value="8334">ORLANDIA</option><option value="8335">OSASCO</option><option value="8336">OSCAR BRESSANE</option><option value="8337">OSVALDO CRUZ</option><option value="8338">OURINHOS</option><option value="8339">OURO FINO PAULISTA</option><option value="8340">OURO VERDE</option><option value="8341">OUROESTE</option><option value="8342">PACAEMBU</option><option value="8343">PADRE NOBREGA</option><option value="8344">PALESTINA</option><option value="8345">PALMARES PAULISTA</option><option value="8346">PALMEIRA D OESTE</option><option value="8347">PALMEIRAS DE SAO PAULO</option><option value="8348">PALMITAL</option><option value="8349">PANORAMA</option><option value="8350">PARAGUACU PAULISTA</option><option value="8351">PARAIBUNA</option><option value="8352">PARAISO</option><option value="8353">PARAISOLANDIA</option><option value="8354">PARANABI</option><option value="8355">PARANAPANEMA</option><option value="8356">PARANAPIACABA</option><option value="8357">PARANAPUA</option><option value="8358">PARAPUA</option><option value="8359">PARDINHO</option><option value="8360">PARIQUERA-ACU</option><option value="8361">PARISI</option><option value="8362">PARNASO</option><option value="8363">PARQUE MEIA LUA</option><option value="8364">PARURU</option><option value="8365">PATROCINIO PAULISTA</option><option value="8366">PAULICEIA</option><option value="8367">PAULINIA</option><option value="8368">PAULISTANIA</option><option value="8369">PAULO DE FARIA</option><option value="8370">PAULOPOLIS</option><option value="8371">PEDERNEIRAS</option><option value="8372">PEDRA BELA</option><option value="8373">PEDRA BRANCA DE ITARARE</option><option value="8374">PEDRANOPOLIS</option><option value="8375">PEDREGULHO</option><option value="8376">PEDREIRA</option><option value="8377">PEDRINHAS PAULISTA</option><option value="8378">PEDRO BARROS</option><option value="8379">PEDRO DE TOLEDO</option><option value="8380">PENAPOLIS</option><option value="8381">PEREIRA BARRETO</option><option value="8382">PEREIRAS</option><option value="8383">PERUIBE</option><option value="8384">PIACATU</option><option value="8385">PICINGUABA</option><option value="8386">PIEDADE</option><option value="8387">PILAR DO SUL</option><option value="8388">PINDAMONHANGABA</option><option value="8389">PINDORAMA</option><option value="8390">PINHALZINHO</option><option value="8391">PINHEIROS</option><option value="8392">PIONEIROS</option><option value="8393">PIQUEROBI</option><option value="8394">PIQUETE</option><option value="8395">PIRACAIA</option><option value="8396">PIRACICABA</option><option value="8397">PIRAJU</option><option value="8398">PIRAJUI</option><option value="8399">PIRAMBOIA</option><option value="8400">PIRANGI</option><option value="8401">PIRAPITINGUI</option><option value="8402">PIRAPORA DO BOM JESUS</option><option value="8403">PIRAPOZINHO</option><option value="8404">PIRASSUNUNGA</option><option value="8405">PIRATININGA</option><option value="8406">PITANGUEIRAS</option><option value="8407">PLANALTO</option><option value="8408">PLANALTO DO SUL</option><option value="8409">PLATINA</option><option value="8410">POA</option><option value="8411">POLONI</option><option value="8412">POLVILHO</option><option value="8413">POMPEIA</option><option value="8414">PONGAI</option><option value="8415">PONTAL</option><option value="8416">PONTALINDA</option><option value="8417">PONTES GESTAL</option><option value="8418">POPULINA</option><option value="8419">PORANGABA</option><option value="8420">PORTO FELIZ</option><option value="8421">PORTO FERREIRA</option><option value="8422">PORTO NOVO</option><option value="8423">POTIM</option><option value="8424">POTIRENDABA</option><option value="8425">POTUNDUVA</option><option value="8426">PRACINHA</option><option value="8427">PRADINIA</option><option value="8428">PRADOPOLIS</option><option value="8429">PRAIA GRANDE</option><option value="8430">PRATANIA</option><option value="8431">PRESIDENTE ALVES</option><option value="8432">PRESIDENTE BERNARDES</option><option value="8433">PRESIDENTE EPITACIO</option><option value="8434">PRESIDENTE PRUDENTE</option><option value="8435">PRESIDENTE VENCESLAU</option><option value="8436">PRIMAVERA</option><option value="8437">PROMISSAO</option><option value="8438">PRUDENCIO E MORAES</option><option value="8439">QUADRA</option><option value="8440">QUATA</option><option value="8441">QUEIROZ</option><option value="8442">QUELUZ</option><option value="8443">QUINTANA</option><option value="8444">QUIRIRIM</option><option value="8445">RAFARD</option><option value="8446">RANCHARIA</option><option value="8447">RECHAN</option><option value="8448">REDENCAO DA SERRA</option><option value="8449">REGENTE FEIJO</option><option value="8450">REGINOPOLIS</option><option value="8451">REGISTRO</option><option value="8452">RESTINGA</option><option value="8453">RIACHO GRANDE</option><option value="8454">RIBEIRA</option><option value="8455">RIBEIRAO BONITO</option><option value="8456">RIBEIRAO BRANCO</option><option value="8457">RIBEIRAO CORRENTE</option><option value="8458">RIBEIRAO DO SUL</option><option value="8459">RIBEIRAO DOS INDIOS</option><option value="8460">RIBEIRAO GRANDE</option><option value="8461">RIBEIRAO PIRES</option><option value="8462">RIBEIRAO PRETO</option><option value="8463">RIBEIRO DO VALE</option><option value="8464">RIBEIRO DOS SANTOS</option><option value="8465">RIFAINA</option><option value="8466">RINCAO</option><option value="8467">RINOPOLIS</option><option value="8468">RIO CLARO</option><option value="8469">RIO DAS PEDRAS</option><option value="8470">RIO GRANDE DA SERRA</option><option value="8471">RIOLANDIA</option><option value="8472">RIVERSUL</option><option value="8473">ROBERTO</option><option value="8474">ROSALIA</option><option value="8475">ROSANA</option><option value="8476">ROSEIRA</option><option value="8477">RUBIACEA</option><option value="8478">RUBIAO JUNIOR</option><option value="8479">RUBINEIA</option><option value="8480">RUILANDIA</option><option value="8481">SABAUNA</option><option value="8482">SABINO</option><option value="8483">SAGRES</option><option value="8484">SALES</option><option value="8485">SALES OLIVEIRA</option><option value="8486">SALESOPOLIS</option><option value="8487">SALMOURAO</option><option value="8488">SALTINHO</option><option value="8489">SALTO</option><option value="8490">SALTO DE PIRAPORA</option><option value="8491">SALTO DO AVANHANDAVA</option><option value="8492">SALTO GRANDE</option><option value="8493">SANDOVALINA</option><option value="8494">SANTA ADELIA</option><option value="8495">SANTA ALBERTINA</option><option value="8496">SANTA AMERICA</option><option value="8497">SANTA BARBARA D OESTE</option><option value="8498">SANTA BRANCA</option><option value="8499">SANTA CLARA D OESTE</option><option value="8500">SANTA CRUZ DA CONCEICAO</option><option value="8501">SANTA CRUZ DA ESPERANCA</option><option value="8502">SANTA CRUZ DA ESTRELA</option><option value="8503">SANTA CRUZ DAS PALMEIRAS</option><option value="8504">SANTA CRUZ DO RIO PARDO</option><option value="8505">SANTA CRUZ DOS LOPES</option><option value="8506">SANTA ERNESTINA</option><option value="8507">SANTA EUDOXIA</option><option value="8508">SANTA FE DO SUL</option><option value="8509">SANTA GERTRUDES</option><option value="8510">SANTA ISABEL</option><option value="8511">SANTA ISABEL DO MARINHEIRO</option><option value="8512">SANTA LUCIA</option><option value="8513">SANTA MARGARIDA PAULISTA</option><option value="8514">SANTA MARIA DA SERRA</option><option value="8515">SANTA MARIA DO GURUPA</option><option value="8516">SANTA MERCEDES</option><option value="8517">SANTA RITA D OESTE</option><option value="8518">SANTA RITA DO PASSA QUATRO</option><option value="8519">SANTA RITA DO RIBEIRA</option><option value="8520">SANTA ROSA DE VITERBO</option><option value="8521">SANTA SALETE</option><option value="8522">SANTA TERESINHA DE PIRACICABA</option><option value="8523">SANTANA DA PONTE PENSA</option><option value="8524">SANTANA DE PARNAIBA</option><option value="8525">SANTELMO</option><option value="8526">SANTO ANASTACIO</option><option value="8527">SANTO ANDRE</option><option value="8528">SANTO ANTONIO DA ALEGRIA</option><option value="8529">SANTO ANTONIO DA ESTIVA</option><option value="8530">SANTO ANTONIO DE POSSE</option><option value="8531">SANTO ANTONIO DO ARACANGUA</option><option value="8532">SANTO ANTONIO DO JARDIM</option><option value="8533">SANTO ANTONIO DO PARANAPANEMA</option><option value="8534">SANTO ANTONIO DO PINHAL</option><option value="8535">SANTO ANTONIO PAULISTA</option><option value="8536">SANTO EXPEDITO</option><option value="8537">SANTOPOLIS DO AGUAPEI</option><option value="8538">SANTOS</option><option value="8539">SAO BENEDITO DA CACHOEIRINHA</option><option value="8540">SAO BENEDITO DAS AREIAS</option><option value="8541">SAO BENTO DO SAPUCAI</option><option value="8542">SAO BERNARDO DO CAMPO</option><option value="8543">SAO BERTO</option><option value="8544">SAO CAETANO DO SUL</option><option value="8545">SAO CARLOS</option><option value="8546">SAO FRANCISCO</option><option value="8547">SAO FRANCISCO DA PRAIA</option><option value="8548">SAO FRANCISCO XAVIER</option><option value="8549">SAO JOAO DA BOA VISTA</option><option value="8550">SAO JOAO DAS DUAS PONTES</option><option value="8551">SAO JOAO DE IRACEMA</option><option value="8552">SAO JOAO DE ITAGUACU</option><option value="8553">SAO JOAO DO MARINHEIRO</option><option value="8554">SAO JOAO DO PAU D ALHO</option><option value="8555">SAO JOAO NOVO</option><option value="8556">SAO JOAQUIM DA BARRA</option><option value="8557">SAO JOSE DA BELA VISTA</option><option value="8558">SAO JOSE DAS LARANJEIRAS</option><option value="8559">SAO JOSE DO BARREIRO</option><option value="8560">SAO JOSE DO RIO PARDO</option><option value="8561">SAO JOSE DO RIO PRETO</option><option value="8562">SAO JOSE DOS CAMPOS</option><option value="8563">SAO LOURENCO DA SERRA</option><option value="8564">SAO LOURENCO DO TURVO</option><option value="8565">SAO LUIS DO PARAITINGA</option><option value="8566">SAO LUIZ DO GUARICANGA</option><option value="8567">SAO MANUEL</option><option value="8568">SAO MARTINHO D OESTE</option><option value="8569">SAO MIGUEL ARCANJO</option><option value="8570">SAO PAULO</option><option value="8571">SAO PEDRO</option><option value="8572">SAO PEDRO DO TURVO</option><option value="8573">SAO ROQUE</option><option value="8574">SAO ROQUE DA FARTURA</option><option value="8575">SAO SEBASTIAO</option><option value="8576">SAO SEBASTIAO DA GRAMA</option><option value="8577">SAO SEBASTIAO DA SERRA</option><option value="8578">SAO SILVESTRE DE JACAREI</option><option value="8579">SAO SIMAO</option><option value="8580">SAO VICENTE</option><option value="8581">SAPEZAL</option><option value="8582">SARAPUI</option><option value="8583">SARUTAIA</option><option value="8584">SEBASTIANOPOLIS DO SUL</option><option value="8585">SERRA AZUL</option><option value="8586">SERRA NEGRA</option><option value="8587">SERRANA</option><option value="8588">SERTAOZINHO</option><option value="8589">SETE BARRAS</option><option value="8590">SEVERINIA</option><option value="8591">SILVANIA</option><option value="8592">SILVEIRAS</option><option value="8593">SIMOES</option><option value="8594">SIMONSEN</option><option value="8595">SOCORRO</option><option value="8596">SODRELIA</option><option value="8597">SOLEMAR</option><option value="8598">SOROCABA</option><option value="8599">SOUSAS</option><option value="8600">SUD MENNUCCI</option><option value="8601">SUINANA</option><option value="8602">SUMARE</option><option value="8603">SUSSUI</option><option value="8604">SUZANAPOLIS</option><option value="8605">SUZANO</option><option value="8606">TABAJARA</option><option value="8607">TABAPUA</option><option value="8608">TABATINGA</option><option value="8609">TABOAO DA SERRA</option><option value="8610">TACIBA</option><option value="8611">TAGUAI</option><option value="8612">TAIACU</option><option value="8613">TAIACUPEBA</option><option value="8614">TAIUVA</option><option value="8615">TALHADO</option><option value="8616">TAMBAU</option><option value="8617">TANABI</option><option value="8618">TAPINAS</option><option value="8619">TAPIRAI</option><option value="8620">TAPIRATIBA</option><option value="8621">TAQUARAL</option><option value="8622">TAQUARITINGA</option><option value="8623">TAQUARITUBA</option><option value="8624">TAQUARIVAI</option><option value="8625">TARABAI</option><option value="8626">TARUMA</option><option value="8627">TATUI</option><option value="8628">TAUBATE</option><option value="8629">TECAINDA</option><option value="8630">TEJUPA</option><option value="8631">TEODORO SAMPAIO</option><option value="8632">TERMAS DE IBIRA</option><option value="8633">TERRA NOVA D OESTE</option><option value="8634">TERRA ROXA</option><option value="8635">TIBIRICA</option><option value="8636">TIBIRICA DO PARANAPANEMA</option><option value="8637">TIETE</option><option value="8638">TIMBURI</option><option value="8639">TOLEDO</option><option value="8640">TORRE DE PEDRA</option><option value="8641">TORRINHA</option><option value="8642">TRABIJU</option><option value="8643">TREMEMBE</option><option value="8644">TRES ALIANCAS</option><option value="8645">TRES FRONTEIRAS</option><option value="8646">TRES PONTES</option><option value="8647">TRES VENDAS</option><option value="8648">TUIUTI</option><option value="8649">TUJUGUABA</option><option value="8650">TUPA</option><option value="8651">TUPI</option><option value="8652">TUPI PAULISTA</option><option value="8653">TURIBA DO SUL</option><option value="8654">TURIUBA</option><option value="8655">TURMALINA</option><option value="8656">TURVINIA</option><option value="8657">UBARANA</option><option value="8658">UBATUBA</option><option value="8659">UBIRAJARA</option><option value="8660">UCHOA</option><option value="8661">UNIAO PAULISTA</option><option value="8662">UNIVERSO</option><option value="8663">URANIA</option><option value="8664">URU</option><option value="8665">URUPES</option><option value="8666">URURAI</option><option value="8667">UTINGA</option><option value="8668">VALE FORMOSO</option><option value="8669">VALENTIM GENTIL</option><option value="8670">VALINHOS</option><option value="8671">VALPARAISO</option><option value="8672">VANGLORIA</option><option value="8673">VARGEM</option><option value="8674">VARGEM GRANDE DO SUL</option><option value="8675">VARGEM GRANDE PAULISTA</option><option value="8676">VARPA</option><option value="8677">VARZEA PAULISTA</option><option value="8678">VENDA BRANCA</option><option value="8679">VERA CRUZ</option><option value="8680">VICENTE DE CARVALHO</option><option value="8681">VICENTINOPOLIS</option><option value="8682">VILA DIRCE</option><option value="8683">VILA NERY</option><option value="8684">VILA XAVIER</option><option value="8685">VINHEDO</option><option value="8686">VIRADOURO</option><option value="8687">VISTA ALEGRE DO ALTO</option><option value="8688">VITORIA BRASIL</option><option value="8689">VITORIANA</option><option value="8690">VOTORANTIM</option><option value="8691">VOTUPORANGA</option><option value="8692">ZACARIAS</option></select>
                                    </p>
                                </div>
                            </div>
                            <div>
                                <hr>
                                <p>
                                    <button id="cancelar" class="button blue" type="reset" onclick="location.href='/Sistema/Empregados';">
                                        <span>Cancelar</span>
                                    </button>
                                    <button id="enviar" class="button green" type="submit" value="Save">
                                        <span>Salvar</span>
                                    </button>
                                    <span id="processando" class="note loading" style="display: none;">Processando...</span>
                                </p>
                            </div>
                            
                        </div></form>
                    </div>
                </div>
            </div>

            <br />
            
            <!--
            
                <div class="sb-box" style="clear:both;">
				    <div class="sb-box-inner content">
					    <div class="header">
						    <h3>Dados do Funcionário</h3>
					    </div>
					    <div class="bcont">
                            
                                <table class="infotable" cellspacing="0" cellpadding="0" width="100%">
							        <thead>
								        <tr>
                                            <th>Nome</th>
									        <th style="text-align:center;">Admissão</th>
                                            <th style="text-align:center;">Experiência</th>
                                            <th style="text-align:center;">Dias da semana</th>
                                            <th style="text-align:center;">Ocupação</th>
                                            <th>Salário</th>
                                            <th style="width:95px;text-align:center;">Data alteracao cargo/salario</th>
                                            <th>Ativo</th>
								        </tr>
							        </thead>
                                    <tbody>
                                    
                                        <tr>
                                            <td>Teste da Silva Prado</td>
                                            <td style="text-align:center">05/03/2014</td>
                                            <td style="text-align:center">30 dias</td>
                                            <td style="text-align:center">
                                            Segunda-feira<br />
                                            Ter&#231;a-feira<br />
                                            Quarta-feira<br />
                                            Quinta-feira<br />
                                            
                                            </td>
                                            <td style="text-align:center;">Empregado Dom&#233;stico(a)</td>                                           
                                            <td>120000,00</td>

                                            
                                            <th style="text-align:center;">-</th>
                                            <td> Sim </td>
                                        </tr>
                                        
                                    </tbody>
						        </table>
                            
					    </div>
				    </div>
			    </div>
            -->
            
		</div>
		<div class="clearingfix">
		</div>
	</div>

    

                            <div id="Div3" class="message AttentionExp" style="margin:27px; width:360px;">
                                     <b>Proximo passo:<br /></b> Clique no icone <b>"Declarações"</b> no menu principal para gerar a declaração de VT.
                            </div>

                            <div id="Div2" class="message informationExp" style="margin:27px; width:360px; height:73px;">
                            <span class="strong">Informativo:</span>
                                 Clique no icone <img src="/Content/images/action.png" alt="acao"  /> no lado direito desta página para:
                                 <ul class="expUL" style="margin-top:3px;">
	                                    <li class="expLI" style="margin-left:-22px">Visualizar o Contrato de trabalho.</li>
	                                    <li class="expLI" style="margin-left:-22px">Ver o Modelo da Carteira de trabalho.</li>
                                </ul>
                                <br />
                        </div>
                    
			
			<%else %>
                    <div id="Div1" class="message error" >
                            <span class="strong">ERRO!</span>Funcionário não localizado!
                        </div>
            <%end if %>
			
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
<%set fulano=nothing %>
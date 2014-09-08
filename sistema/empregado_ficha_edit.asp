<!--#include file="conecta_bd.asp"-->

<%
    'substituir por object oriented
dim ID, EmpregadorID,EnderecoID, Nome,DataNascimento, Sexo,EstadoCivilID,EscolaridadeID
dim NomeMae, NomePai, OpcaoRG, OrgaoEmissorRG, CPF, CNH, QuantidadeDependentes, PIS
dim PensaoAlimenticia, TelefoneResidencial, DataCadPIS, TelefoneCelular, ContatoRecado
dim CEP, Logradouro, Bairro, EstadoID, CidadeID, Endereco_Numero
funcID=limpaquerystring("ID")
dim objCon, objRS, strTXT
Set objCon = Server.CreateObject("ADODB.Connection")
objCon.Open strConn
Set objRS = Server.CreateObject ("ADODB.Recordset")
objRS.CursorLocation = 2 
objRS.CursorType = 1
objRS.LockType = 3
objRS.Open "select * from empregado.empregado inner join empregado.endereco on empregado.empregado.enderecoID= empregado.endereco.ID WHERE empregado.empregado.ID=" & funcID &  " order by empregado.endereco.ID desc", objCon, , ,adCmdText
if (objRS.bof and objRS.eof) then
    response.Write "não encontrado"
else
    ID=objRS("ID")
    EmpregadorID=objRS("EmpregadorID")
    nome=objRS("nome")
    DataNascimento=right("00" & day(objRS("DataNascimento")), 2) & "/" & right("00" & month(objRS("DataNascimento")), 2) & "/" & year(objRS("DataNascimento"))
    Sexo= objRS("Sexo")
    EstadoCivilID=objRS("EstadoCivilID")
    EscolaridadeID=objRS("EscolaridadeID")
    NomeMae=objRS("NomeMae")
    NomePai=objRS("NomePai")
    'OpcaoRG=objRS("OpcaoRG")
    RG=objRS("RG")
    OrgaoEmissorRG=objRS("OrgaoEmissorRG")
    CPF=objRS("CPF")
    CNH=objRS("CNH")
    CarteiraTrabalho=objRS("CarteiraTrabalho")
    QuantidadeDependentes=objRS("QuantidadeDependentes")
    PIS = objRS("PIS")
    PensaoAlimenticia = objRS("PensaoAlimenticia")
    TelefoneResidencial= objRS("TelefoneResidencial")
    DataCadPIS= objRS("DataCadPIS")
    TelefoneCelular= objRS("TelefoneCelular")
    ContatoRecado=objRS("ContatoRecado")
    CEP=objRS("CEP")
    Logradouro=objRS("Logradouro")
    Endereco_Numero=objRS("numero")
    Bairro=objRS("Bairro")
    complemento=objRS("complemento")
    'EstadoID= objRS("EstadoID")
    CidadeID=objRS("CidadeID")
    if request.ServerVariables("content_length")>0 then
        ID=limpaRequestForm("ID")
        EmpregadorID=limpaRequestForm("EmpregadorID")
        nome=limpaRequestForm("nome")
        DataNascimento=limpaRequestForm("DataNascimento")
        Sexo= limpaRequestForm("Sexo")
        EstadoCivilID=limpaRequestForm("EstadoCivilID")
        EscolaridadeID=limpaRequestForm("EscolaridadeID")
        NomeMae=limpaRequestForm("NomeMae")
        NomePai=limpaRequestForm("NomePai")
        OpcaoRG=limpaRequestForm("OpcaoRG")
        RG=limpaRequestForm("RG")
        OrgaoEmissorRG=limpaRequestForm("OrgaoEmissorRG")
        CPF=limpaRequestForm("CPF")
        CNH=limpaRequestForm("CNH")
        CarteiraTrabalho=limpaRequestForm("CarteiraTrabalho")
        QuantidadeDependentes=limpaRequestForm("QuantidadeDependentes")
        PIS = limpaRequestForm("PIS")
        PensaoAlimenticia = limpaRequestForm("PensaoAlimenticia")
        TelefoneResidencial= limpaRequestForm("TelefoneResidencial")
        DataCadPIS= limpaRequestForm("DataCadPIS")
        TelefoneCelular= limpaRequestForm("TelefoneCelular")
        ContatoRecado=limpaRequestForm("ContatoRecado")
        CEP=limpaRequestForm("CEP")
        Logradouro=limpaRequestForm("Logradouro")
        Endereco_Numero=limpaRequestForm("Endereco_Numero")
        Bairro=limpaRequestForm("Bairro")
        complemento=Request.form("complemento")
        EstadoID= limpaRequestForm("EstadoID")
        CidadeID=limpaRequestForm("CidadeID")
        'validação serverside - not now
        dim bolValido
        bolValido=true
        if bolValido then
        'Uma vez validado serverside, socar no BD...


            if len(Logradouro)>0 then objRS("Logradouro") = Logradouro
            if len(CEP)>0 then objRS("CEP") = CEP
            if len(Bairro)>0 then objRS("Bairro") = Bairro
            if len(complemento)>0 then objRS("complemento") = complemento
            if len(CidadeID)>0 then objRS("CidadeID") = CidadeID
            if len(Endereco_Numero)>0 then objRS("Numero") = CidadeID

            objRS.update
            enderecoID=objRS("ID")
            objRS.close
    objRS.cursorLocation=2
            'objRS.Open "", objCon, , ,adCmdTable
            objRS.open "select * from empregado.empregado where ID=" &funcID,objCon,adOpenForwardOnly , adLockOptimistic ,adCmdText
            'objRS.addNew
            'objRS("enderecoID") =  enderecoID        
            objRS("EmpregadorID") = session("ID")
            if len(Nome)>0 then objRS("Nome") = Nome
            if len(DataNascimento)>0 then objRS("DataNascimento") = DataNascimento
            if len(Sexo)>0 then objRS("Sexo") = Sexo
            if len(EstadoCivilID)>0 then objRS("EstadoCivilID") = EstadoCivilID
            if len(EscolaridadeID)>0 then objRS("EscolaridadeID") = EscolaridadeID
            if len(NomeMae)>0 then objRS("NomeMae") = NomeMae
            if len(NomePai)>0 then objRS("NomePai") = NomePai
           ' if len(OpcaoRG)>0 then objRS("OpcaoRG") = OpcaoRG
            if len(RG)>0 then objRS("RG") = RG
            if len(OrgaoEmissorRG)>0 then objRS("OrgaoEmissorRG") = OrgaoEmissorRG
            if len(CPF)>0 then objRS("CPF") = CPF
            if len(CNH)>0 then objRS("CNH") = CNH
            if len(CarteiraTrabalho)>0 then objRS("CarteiraTrabalho") = CarteiraTrabalho
            if len(QuantidadeDependentes)>0 then objRS("QuantidadeDependentes") = QuantidadeDependentes
            if len(PIS)>0 then objRS("PIS") = PIS
            if len(PensaoAlimenticia)>0 then objRS("PensaoAlimenticia") = PensaoAlimenticia
            if len(TelefoneResidencial)>0 then objRS("TelefoneResidencial") = TelefoneResidencial
            'if len(DataCadPIS)>0 then objRS("DataCadPIS") = DataCadPIS
            if len(TelefoneCelular)>0 then objRS("TelefoneCelular") = TelefoneCelular
            if len(ContatoRecado)>0 then objRS("ContatoRecado") = ContatoRecado
            'if len(EnderecoCEP)>0 then objRS("EnderecoCEP") = EnderecoCEP
            if len(ContatoRecado)>0 then objRS("ContatoRecado") = ContatoRecado
            'if len(Logradouro)>0 then objRS("Logradouro") = Logradouro
            'if len(Bairro)>0 then objRS("Bairro") = Bairro  
            'if len(EstadoID)>0 then objRS("EstadoID") = EstadoID
            'if len(CidadeID)>0 then objRS("CidadeID") = CidadeID
            objRS("registroAtivo")=1
            objRS.update
            empregadoID = objRS("ID")
            objRS.close
            objCon.execute "update empregado.endereco set empregadoID=" & empregadoID & " Where ID="  & enderecoID
            set objRS=nothing
            objCon.close
            set objCon=nothing
            'redirecionar por post ou o caralho
            session("temp_func") = empregadoID & "|" & nome
            response.Redirect "empregado_ficha.asp?ID=" & empregadoID
            response.end

        end if
    end if
    
    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="/Content/css/styles.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/Content/Site.css" media="screen" />
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



    <script type="text/javascript">

        $(document).ready(function () {
            if ($('#RG').val().replace(/^\s+|\s+$/g, '').length >= 12 || $('#RG').val() == "") {
                if (document.documentMode == 5 || document.documentMode == 6 || document.documentMode == 7 || document.documentMode == 8) {
                    mascaraRG($("#RG"));
                } else {
                    $("#RG").mask({ mask: "##.###.###-*" });
                }
                $("input:radio[value=RG]").attr("checked", "checked");
            }
            else {
                if (document.documentMode == 5 || document.documentMode == 6 || document.documentMode == 7 || document.documentMode == 8) {
                    mascaraRNE($("#RG"));
                } else {
                    $("#RG").mask({ mask: "a######-*" });
                }
                $("input:radio[value=RNE]").attr("checked", "checked");
            }
            Validate();
            if ($("#Endereco_Cidade_EstadoID > option:selected").attr("value") == "")
                $("#Endereco_CidadeID").attr("disabled", "disabled");

            $("#erro").hide();
            $(".note.loading").hide();

            jQuery.validator.addMethod("dateBR", function (value, element) {
                if (value.length != 10) return false;
                var data = value;
                var dia = data.substr(0, 2);
                var barra1 = data.substr(2, 1);
                var mes = data.substr(3, 2);
                var barra2 = data.substr(5, 1);
                var ano = data.substr(6, 4);
                if (data.length != 10 || barra1 != "/" || barra2 != "/" || isNaN(dia) || isNaN(mes) || isNaN(ano) || dia > 31 || mes > 12) return false;
                if ((mes == 4 || mes == 6 || mes == 9 || mes == 11) && dia == 31) return false;
                if (mes == 2 && (dia > 29 || (dia == 29 && ano % 4 != 0))) return false;
                if (ano < 1900) return false;
                return true;
            }, "Informe uma data válida");

            if ($("#DataNascimento").val() == "01/01/0001 00:00:00") {
                $("#DataNascimento").val("");
            }
            if ($("#DataNascimento").val() != "") {
                $("#DataNascimento").val($('#DataNascimento').val().substr(0, 10));
            }
            /* if ($("#DataCadPIS").val() != "") {
                 $("#DataCadPIS").val($("#DataCadPIS").val().substr(0, 10));
             }*/


            $('#PensaoAlimenticia').live('keypress', function (e) {
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

            // Verificação do modo documento simulado no ie
            if (document.documentMode == 5 || document.documentMode == 6 || document.documentMode == 7 || document.documentMode == 8) {

                $('input').live("keypress", function (e) {
                    if (e.keyCode == 13) {
                        var inputs = $(this).parents("form").eq(0).find(":input");
                        var idx = inputs.index(this);

                        if (idx == inputs.length - 1) {
                            inputs[0].select()
                        } else {
                            inputs[idx + 1].focus(); //  handles submit buttons
                            inputs[idx + 1].select();
                        }
                        return false;
                    }
                });

                $('#enviar').click(function () {
                    var validator = $('#form').validate();
                    var erro = 0;
                    if ($('#Nome').val() == "") {
                        validator.showErrors({ "Nome": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#DataNascimento').val() == "") {
                        validator.showErrors({ "DataNascimento": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#Sexo').val() == "") {
                        validator.showErrors({ "DataNascimento": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#RG').val() == "") {
                        validator.showErrors({ "RG": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#NomeMae').val() == "") {
                        validator.showErrors({ "NomeMae": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#OrgaoEmissorRG').val() == "") {
                        validator.showErrors({ "OrgaoEmissorRG": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#QuantidadeDependentes').val() == "") {
                        validator.showErrors({ "QuantidadeDependentes": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#CarteiraTrabalho').val() == "") {
                        validator.showErrors({ "CarteiraTrabalho": "Este campo é obrigatório. Insira o numero, serie e UF." });
                        erro = 1;
                    }
                    if ($('#PIS').val() == "") {
                        validator.showErrors({ "PIS": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#EstadoCivilID').val() == "") {
                        validator.showErrors({ "EstadoCivilID": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#CPF').val() == "") {
                        validator.showErrors({ "CPF": "Informe um CPF válido. Campo Obrigatorio." });
                        erro = 1;
                    }
                    if ($('#Endereco_CEP').val() == "") {
                        validator.showErrors({ "Endereco.CEP": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#Endereco_Numero').val() == "") {
                        validator.showErrors({ "Endereco.Numero": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#Endereco_Logradouro').val() == "") {
                        validator.showErrors({ "Endereco.Logradouro": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#Endereco_Bairro').val() == "") {
                        validator.showErrors({ "Endereco.Bairro": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#Endereco_Cidade_EstadoID').val() == "") {
                        validator.showErrors({ "Endereco.Cidade.EstadoID": "Este campo é obrigatório." });
                        erro = 1;
                    }
                    if ($('#Endereco_CidadeID').val() == "") {
                        validator.showErrors({ "Endereco.CidadeID": "Este campo é obrigatório." });
                        erro = 1;
                    }


                    if (erro == 1) {
                        $("#erro").show();
                        $("#erro").focus();
                        return false;
                    }

                    return true;
                });

                mascaraData($('#DataNascimento'));
                mascaraCPF($('#CPF'));
                mascaraCNH($('#CNH'));
                mascaraCarteiraTrabalho($("#CarteiraTrabalho"));
                mascaraQuantidadeDependentes($("#QuantidadeDependentes"));
                mascaraPIS($('#PIS'));
                /* mascaraData($('#DataCadPIS'));*/
                mascaraTelefone($('#TelefoneResidencial'));
                mascaraTelefoneCelular($('#TelefoneCelular'));
                //mascaraTelefoneCelular($('#TelefoneRecado'));
                mascaraCEP($("#Endereco_CEP"));

                $("input:radio[name=OpcaoRG]").click(function () {
                    if ($(this).val() == 'RG') {
                        $("#RG").unbind();
                        mascaraRG($("#RG"));
                        $("#RG").bind();
                    }
                    else {
                        $("#RG").unbind();
                        mascaraRNE($("#RG"));
                        $("#RG").bind();
                    }
                });
            } else {
                $("#DataNascimento").mask({ mask: "##/##/####" });
                $("#CPF").mask({ mask: "###.###.###-##" });
                $("#CNH").mask({ mask: "###########" });
                $("#CarteiraTrabalho").mask({ mask: "######.#####-aa" });
                $("#QuantidadeDependentes").mask({ mask: "#" });
                $("#PIS").mask({ mask: "###.#####.##-#" });
                /*$("#DataCadPIS").mask({ mask: "##/##/####" });*/
                $("#TelefoneResidencial").mask({ mask: "(##) #?####-####" });
                $("#TelefoneCelular").mask({ mask: "(##) #?####-####" });
                $("#TelefoneRecado").mask({ mask: "(##) #?####-####" });
                $("#Endereco_CEP").mask({ mask: "#####-###" });
            }

            $("input:radio[name=OpcaoRG]").click(function () {
                if ($(this).val() == 'RG') {
                    $("#RG").unbind();
                    $("#RG").mask({ mask: "##.###.###-*" });
                    $("#RG").bind();
                }
                else {
                    $("#RG").unbind();
                    $("#RG").mask({ mask: "a######-*" });
                    $("#RG").bind();
                }
            });


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
                    Nome: "required",
                    DataNascimento: { required: true, dateBR: true },
                    Sexo: "required",
                    RG: "required",
                    NomeMae: "required",
                    OrgaoEmissorRG: "required",
                    QuantidadeDependentes: "required",
                    CarteiraTrabalho: "required",
                    CPF: { cpf: true },
                    PIS: "required",
                    EstadoCivilID: "required",
                    EscolaridadeID: "required",
                    "Endereco.Logradouro": "required",
                    "Endereco.Bairro": "required",
                    "Endereco.CidadeID": { noneSelected: true },
                    "Endereco.CEP": "required",
                    "Endereco.Numero": "required"
                },
                messages: {
                    Nome: "Este campo é obrigatório.",
                    DataNascimento: { required: "Este campo é obrigatório.", dateBR: "Data Inválida." },
                    Sexo: "Este campo é obrigatório.",
                    RG: "Este campo é obrigatório.",
                    NomeMae: "Este campo é obrigatório.",
                    OrgaoEmissorRG: "Este campo é obrigatório.",
                    QuantidadeDependentes: "Este campo é obrigatório.",
                    CarteiraTrabalho: "Este campo é obrigatório. Insira o numero, serie e UF",
                    PIS: "Este campo é obrigatório.",
                    EstadoCivilID: "Este campo é obrigatório.",
                    CPF: { cpf: 'Informe um CPF válido. Campo Obrigatorio' },
                    EscolaridadeID: "Este campo é obrigatório.",
                    "Endereco.Logradouro": "Este campo é obrigatório.",
                    "Endereco.Bairro": "Este campo é obrigatório.",
                    "Endereco.CidadeID": "Este campo é obrigatório.",
                    "Endereco.CEP": "Este campo é obrigatório.",
                    "Endereco.Numero": "Este campo é obrigatório."
                }
            });
            var cidadeCep = null;
            /*   $('#Endereco_CEP').blur(function () {
                   //$.post('/Services/Localizacao/ConsultaCEP/', { sCep: $("#Endereco_CEP").val() }, function (data) {
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
               });*/

            $('#Endereco_Cidade_EstadoID').change(function () {
                $.ajaxSetup({ cache: false, async: false });
                var selectedItem = $(this).val();
                if (selectedItem == "" || selectedItem == 0) {
                    //Do nothing or hide...?
                } else {
                    //$.post("/Services/Localizacao/GetCidades/" + $("#Endereco_Cidade_EstadoID > option:selected").attr("value"), function (data) {

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
        });

        function mascaraCPF(objeto) {
            objeto.keypress(function (e) {

                if (objeto.val().length == 3 || objeto.val().length == 7) {
                    objeto.val(objeto.val() + ".");
                }
                if (objeto.val().length == 11) {
                    objeto.val(objeto.val() + "-");
                }
                if (objeto.val().length >= 14) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }
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

        function mascaraRNE(objeto) {
            objeto.keypress(function (e) {
                if (objeto.val().length == 7) {
                    objeto.val(objeto.val() + "-");
                }
                if (objeto.val().length >= 9) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }

        function mascaraData(objeto) {
            objeto.keypress(function (e) {
                if (objeto.val().length == 2 || objeto.val().length == 5) {
                    objeto.val(objeto.val() + "/");
                }
                if (objeto.val().length >= 10) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }

        function mascaraCNH(objeto) {
            objeto.keypress(function (e) {
                if (objeto.val().length >= 11) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }

        function mascaraCarteiraTrabalho(objeto) {
            objeto.keypress(function (e) {
                if (objeto.val().length == 6) {
                    objeto.val(objeto.val() + ".");
                }
                if (objeto.val().length == 12) {
                    objeto.val(objeto.val() + "-");
                }
                if (objeto.val().length >= 15) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }

        function mascaraQuantidadeDependentes(objeto) {
            objeto.keypress(function (e) {
                if (objeto.val().length >= 1) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }

        function mascaraPIS(objeto) {
            objeto.keypress(function (e) {
                if (objeto.val().length == 3 || objeto.val().length == 9) {
                    objeto.val(objeto.val() + ".");
                }
                if (objeto.val().length == 12) {
                    objeto.val(objeto.val() + "-");
                }
                if (objeto.val().length >= 14) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }

        function mascaraTelefone(objeto) {
            objeto.keypress(function (e) {
                if (objeto.val().length == 1) {
                    objeto.val('(' + objeto.val());
                }
                if (objeto.val().length == 3) {
                    objeto.val(objeto.val() + ")");
                }
                if (objeto.val().length == 8) {
                    objeto.val(objeto.val() + "-");
                }
                if (objeto.val().length >= 13) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }


        function mascaraTelefoneCelular(objeto) {
            objeto.keypress(function (e) {
                if (objeto.val().length == 1) {
                    objeto.val('(' + objeto.val());
                }
                if (objeto.val().length == 3) {
                    objeto.val(objeto.val() + ")");
                }
                if (objeto.val().length == 9) {
                    objeto.val(objeto.val() + "-");
                }
                if (objeto.val().length >= 14) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }

        function mascaraCEP(objeto) {
            objeto.keypress(function (e) {
                if (objeto.val().length == 5) {
                    objeto.val(objeto.val() + "-");
                }
                if (objeto.val().length >= 9) {
                    objeto.val(objeto.val().substr(0, objeto.val().length - 1));
                }
            });
        }


    </script>

    <script type="text/javascript" src="/Scripts/woow.validateextensions.js"></script>

    <title>Cadastro do Empregado

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


            </div>
            <div class="container_12">
                <div class="grid_12">
                    <div class="sb-box">
                        <div class="sb-box-inner content">
                            <div class="header">
                                <h3>Cadastrar Empregado</h3>
                                <ul class="tabs">
                                    <li class="active"><a href="empregado_ficha.asp?id=<%=funcID %>">Voltar</a></li>
                                </ul>
                            </div>

                            <div class="bcont">

                                <form action="empregado_ficha_edit.asp?ID=<%=funcID %>" id="form" method="post" name="form">

                                    <div id="erro" class="message error">
                                        <span class="strong">ERRO!</span> Verifique os campos abaixo.
                                    </div>

                                    <input id="ID" name="ID" type="hidden" value="0" />
                                    <input id="EmpregadorID" name="EmpregadorID" type="hidden" value="<%=session("ID") %>" />
                                    <input id="Endereco_ID" name="Endereco.ID" type="hidden" value="0" />

                                    <div>
                                        <h3 class="head2" style="margin: 0;">Dados Pessoais</h3>
                                        <span style="float: right">
                                            <b>Campos com <span>*</span> são obrigatórios.</b>
                                        </span>
                                    </div>

                                    <div class="esquerda">
                                        <p>
                                            <b>Nome Completo <span>*</span></b><br />
                                            <input class="inputtext medium" id="Nome" maxlength="128" name="Nome" type="text" value="<%=Nome %>" />

                                        </p>
                                    </div>
                                    <div class="direita">
                                        <p>
                                            <b>Data de Nascimento <span>*</span></b><br />
                                            <input class="inputtext medium" id="DataNascimento" maxlength="128" name="DataNascimento" type="text" value="<%=DataNascimento %>" />

                                        </p>
                                        <!-- p>
							    <b>E-mail</b><br />
							    <input class="inputtext medium" id="Email" maxlength="128" name="Email" type="text" value="" />
							    
						    </p -->
                                    </div>
                                    <div class="esquerda">
                                        <p>
                                            <b>Sexo <span>*</span></b><br />
                                            <input id="Sexo" name="Sexo" type="radio" value="M" <%if sexo="M" then response.write " checked" %> />
                                            Masculino
							    <input id="Sexo" name="Sexo" type="radio" value="F" <%if sexo="F" then response.write " checked" %> />
                                            Feminino
							    
                                        </p>
                                    </div>
                                    <div class="direita">
                                        <p>
                                            <br />
                                            <br />
                                            <br />
                                        </p>
                                    </div>
                                    <div class="esquerda">
                                        <p>
                                            <b>Estado Civil <span>*</span></b><br />
                                            <select id="EstadoCivilID" name="EstadoCivilID">
                                                <option value="">Selecione</option>
                                                <option value="1" <%if EstadoCivilID=1 then response.write " selected" %>>Solteiro</option>
                                                <option value="2" <%if EstadoCivilID=2 then response.write " selected" %>>Casado</option>
                                                <option value="3" <%if EstadoCivilID=3 then response.write " selected" %>>Divorciado</option>
                                                <option value="4" <%if EstadoCivilID=4 then response.write " selected" %>>Vi&#250;vo</option>
                                            </select>
                                        </p>
                                    </div>
                                    <div class="direita">
                                        <p>
                                            <b>Escolaridade <span>*</span></b><br />
                                            <select id="EscolaridadeID" name="EscolaridadeID">
                                                <option value="">Selecione</option>
                                                <option value="1" <%if EscolaridadeID=1 then response.write " selected" %>>Ensino Fundamental Incompleto</option>
                                                <option value="2" <%if EscolaridadeID=2 then response.write " selected" %>>Ensino Fundamental Completo</option>
                                                <option value="3" <%if EscolaridadeID=3 then response.write " selected" %>>Ensino M&#233;dio Incompleto</option>
                                                <option value="4" <%if EscolaridadeID=4 then response.write " selected" %>>Ensino M&#233;dio Completo</option>
                                                <option value="5" <%if EscolaridadeID=5 then response.write " selected" %>>Ensino Superior Incompleto</option>
                                                <option value="6" <%if EscolaridadeID=6 then response.write " selected" %>>Ensino Superior Completo</option>
                                            </select>

                                        </p>
                                    </div>
                                    <div class="esquerda">
                                        <p>
                                            <b>Nome da Mãe <span>*</span></b><br />
                                            <input class="inputtext medium" id="NomeMae" maxlength="128" name="NomeMae" type="text" value="<%=NomeMae %>" />

                                        </p>
                                    </div>
                                    <div class="direita">
                                        <p>
                                            <b>Nome do Pai</b><br />
                                            <input class="inputtext medium" id="NomePai" maxlength="128" name="NomePai" type="text" value="<%=NomePai %>" />

                                        </p>
                                    </div>
                                    <div class="esquerda">
                                        <p>
                                            <b>Identidade <span>*</span></b>
                                            <input type="radio" value="RG" name="OpcaoRG" <%if opcaoRG="RG" or opcaoRG="" then response.write " checked" %> />RG
                                <input type="radio" value="RNE" name="OpcaoRG" <%if opcaoRG="RNE" then response.write " checked" %> />RNE<br />
                                            <input class="inputtext medium" id="RG" maxlength="13" name="RG" type="text" value="<%=RG %>" />

                                        </p>
                                    </div>
                                    <div class="direita">
                                        <p>
                                            <b>Órgão Emissor <span>*</span></b><br />
                                            <input class="inputtext medium" id="OrgaoEmissorRG" maxlength="128" name="OrgaoEmissorRG" type="text" value="<%=OrgaoEmissorRG %>" />

                                        </p>
                                    </div>
                                    <div class="esquerda">
                                        <p>
                                            <b>CPF <span>*</span></b><br />
                                            <input class="inputtext medium" id="CPF" maxlength="128" name="CPF" type="text" value="<%=CPF %>" />

                                        </p>
                                    </div>
                                    <div class="direita">
                                        <p>
                                            <b>Carteira de Habilitação</b> (N° de Registro)<br />
                                            <input class="inputtext medium" id="CNH" maxlength="128" name="CNH" type="text" value="<%=CNH %>" />

                                        </p>
                                    </div>
                                    <div class="esquerda">
                                        <p>
                                            <b>Carteira de Trabalho <span>*</span></b> (N° carteira + serie + UF)
                                            <br />
                                            <input class="inputtext medium" id="CarteiraTrabalho" maxlength="128" name="CarteiraTrabalho" type="text" value="<%=CarteiraTrabalho %>" />

                                            <br />
                                            <b>Ex:</b>123456.12345-SP 
                                        </p>
                                    </div>
                                    <div class="direita">
                                        <p>
                                            <b>Quantidade de Dependentes<span>*</span></b> (menores de 21 anos)<br />
                                            <input class="inputtext medium" id="QuantidadeDependentes" maxlength="128" name="QuantidadeDependentes" type="text" value="<%=QuantidadeDependentes %>" />

                                        </p>
                                    </div>
                                    <div class="esquerda">
                                        <p>
                                            <b>PIS <span>*</span></b><br />
                                            <input class="inputtext medium" id="PIS" maxlength="128" name="PIS" type="text" value="<%=PIS %>" />

                                        </p>
                                    </div>
                                    <div class="direita">
                                        <p>
                                            <b>Pensão Alimenticia<span>*</span></b> (*se houver)<br />
                                            <input class="inputtext medium" id="PensaoAlimenticia" maxlength="128" name="PensaoAlimenticia" type="text" value="<%=PensaoAlimenticia %>" />

                                        </p>
                                    </div>
                                    <div class="esquerda">
                                        <p>
                                            <b>Telefone Residencial</b><br />
                                            <input class="inputtext medium" id="TelefoneResidencial" maxlength="128" name="TelefoneResidencial" type="text" value="<%=TelefoneResidencial %>" />

                                        </p>
                                    </div>
                                    <!--  <div class="direita">
                                        <p>
                                            <b>Data de Cadastro do PIS <span></span></b>
                                            <br />
                                            <input class="inputtext medium" id="DataCadPIS" maxlength="128" name="DataCadPIS" type="text" value="<%=DataCadPIS %>" />

                                        </p>
                                    </div>-->
                                    <div class="esquerda">
                                        <p>
                                            <b>Telefone para Recados</b><br />
                                            <input class="inputtext medium" id="TelefoneRecado" maxlength="128" name="TelefoneRecado" type="text" value="<%=TelefoneRecado %>" />

                                        </p>
                                    </div>
                                    <div class="direita">
                                        <p>
                                            <b>Telefone Celular</b><br />
                                            <input class="inputtext medium" id="TelefoneCelular" maxlength="128" name="TelefoneCelular" type="text" value="<%=TelefoneCelular %>" />

                                        </p>
                                    </div>

                                    <div class="direita">
                                        <p>
                                            <b>Nome do contato para Recados</b><br />
                                            <input class="inputtext medium" id="ContatoRecado" maxlength="128" name="ContatoRecado" type="text" value="<%=ContatoRecado %>" />

                                        </p>
                                    </div>

                                    <div style="clear: both"></div>
                                    <div>
                                        <hr style="float: left; clear: both;" />
                                        <h3 class="head2">Endereço do Funcionário</h3>
                                        <div class="esquerda">
                                            <p>
                                                <b>CEP <span>*</span></b><br />
                                                <input class="inputtext medium" id="Endereco_CEP" maxlength="128" name="CEP"  type="text" value="<%=CEP %>" />

                                            </p>
                                        </div>
                                        <div class="direita">
                                            <p>
                                                <b>Número <span>*</span></b><br />
                                                <input class="inputtext medium" id="Endereco_Numero" maxlength="6" name="Endereco_Numero" type="text" value="<%=Endereco_Numero %>" />

                                            </p>
                                        </div>
                                        <div class="esquerda">
                                            <p>
                                                <b>Complemento</b><br />
                                                <input class="inputtext medium" id="Endereco_Complemento" maxlength="128" name="Complemento" type="text" value="<%=Complemento %>" />

                                            </p>
                                        </div>
                                        <div class="direita">
                                            <p>
                                                <b>Endereço <span>*</span></b><br />
                                                <input class="inputtext medium" id="Endereco_Logradouro" maxlength="128" name="Logradouro" type="text" value="<%=Logradouro %>" />

                                            </p>
                                        </div>
                                        <div class="esquerda">
                                            <p>
                                                <b>Bairro <span>*</span></b><br />
                                                <input class="inputtext medium" id="Endereco_Bairro" maxlength="128" name="Bairro" type="text" value="<%=Bairro %>" />

                                            </p>

                                        </div>
                                        <div class="direita">
                                        </div>
                                        <div class="esquerda">
                                            <p>
                                                <b>Estado <span>*</span></b><br />
                                                <%
                                                   objRS.close 

                                                    objRS.open "select estadoID from dbo.cidade where ID=" & CidadeID, objCon,,,adcmdtext
                                                    if not (objRS.bof and objRS.eof) then estadoID=objRS("estadoID")
                                                    objRS.close

                                                %>
                                                <select id="Endereco_Cidade_EstadoID" name="Endereco.Cidade.EstadoID">
                                                    <option value="">Selecione</option>
                                                    <% objRS.open "Select * from dbo.estado order by ID", objCon,,,adcmdtext
                                                       if objRS.bof and objRS.eof then
                                                            response.Write "<option>Favor contatar o suporte</option>"
                                                        else
                                                            while not objRS.eof
                                                    %>
                                                    <option value="<%=objRS("ID") %>" <%
                                                        if objRS("ID")=estadoID then response.write " selected "
                                                         %>><%=objRS("nome") %></option>
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
                                                <select id="Endereco_CidadeID" name="CidadeID">
                                                    <option value="">Selecione</option>
                                                    <% objRS.open "Select * from dbo.cidade order by ID", objCon,,,adcmdtext
                                                       if objRS.bof and objRS.eof then
                                                            response.Write "<option>Favor contatar o suporte</option>"
                                                        else
                                                            while not objRS.eof

                                                    %>
                                                    <option value="<%=objRS("ID") %>" <%
                                                        if objRS("ID")=cidadeID then response.write " selected "
                                                         %>><%=objRS("nome") %></option>
                                                    <%          objRS.movenext
                                                            wend 
                                                        end if
                                                        objRS.close%>
                                                </select>
                                            </p>
                                        </div>

                                    </div>

                                    <div>
                                        <hr />
                                        <p>
                                            <button id="cancelar" class="button blue" type="reset" onclick="location.href='main.asp';">
                                                <span>Cancelar</span>
                                            </button>
                                            <button id="enviar" class="button green" type="submit" value="Save">
                                                <span>Salvar</span>
                                            </button>
                                            <span id="processando" class="note loading">Processando...</span>
                                        </p>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="clearingfix">
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

            <!-- end div #wrapper -->


        </div>
        <!-- end div #page-body -->
</body>
</html>
<%
   ' objRS.close
    objCon.close
    set objRS=nothing
    set objCon=nothing
    end if %>



<script type="text/javascript">
    function buscaCEP() {

        var cep = $("#Endereco_CEP").val();

        if (cep.length >= 9) {
            $.getJSON('http://clareslab.com.br/ws/cep/json/' + cep + '/', function (json) {
                $("#Endereco_Logradouro").val(json.endereco);
                $("#Endereco_Bairro").val(json.bairro);
                getEstado(json.uf);

                // $("#Endereco_CidadeID").find("option[name='" + json.cidade + "']").attr("selected", "selected");


                $("#Endereco_CidadeID").each(function () {
                    $('option', this).each(function () {
                        if ($(this).text().toLowerCase() == json.cidade.toLowerCase()) {
                            $(this).attr('selected', 'selected')
                        };
                    });
                });


            });
        }
    }

    function getEstado(UF) {
        switch (UF) {
            case "AC":
                $("#Endereco_Cidade_EstadoID").find("option[value='1']").attr("selected", "selected");
                break;
            case "AL":
                $("#Endereco_Cidade_EstadoID").find("option[value='2']").attr("selected", "selected");
                break;
            case "AM":
                $("#Endereco_Cidade_EstadoID").find("option[value='3']").attr("selected", "selected");
                break;
            case "AP":
                $("#Endereco_Cidade_EstadoID").find("option[value='4']").attr("selected", "selected");
                break;
            case "BA":
                $("#Endereco_Cidade_EstadoID").find("option[value='5']").attr("selected", "selected");
                break;
            case "CE":
                $("#Endereco_Cidade_EstadoID").find("option[value='6']").attr("selected", "selected");
                break;
            case "DF":
                $("#Endereco_Cidade_EstadoID").find("option[value='7']").attr("selected", "selected");
                break;
            case "ES":
                $("#Endereco_Cidade_EstadoID").find("option[value='8']").attr("selected", "selected");
                break;
            case "GO":
                $("#Endereco_Cidade_EstadoID").find("option[value='9']").attr("selected", "selected");
                break;
            case "MA":
                $("#Endereco_Cidade_EstadoID").find("option[value='10']").attr("selected", "selected");
                break;
            case "MT":
                $("#Endereco_Cidade_EstadoID").find("option[value='11']").attr("selected", "selected");
                break;
            case "MS":
                $("#Endereco_Cidade_EstadoID").find("option[value='12']").attr("selected", "selected");
                break;
            case "MG":
                $("#Endereco_Cidade_EstadoID").find("option[value='13']").attr("selected", "selected");
                break;
            case "PA":
                $("#Endereco_Cidade_EstadoID").find("option[value='14']").attr("selected", "selected");
                break;
            case "PB":
                $("#Endereco_Cidade_EstadoID").find("option[value='15']").attr("selected", "selected");
                break;
            case "PR":
                $("#Endereco_Cidade_EstadoID").find("option[value='16']").attr("selected", "selected");
                break;
            case "PE":
                $("#Endereco_Cidade_EstadoID").find("option[value='17']").attr("selected", "selected");
                break;
            case "PI":
                $("#Endereco_Cidade_EstadoID").find("option[value='18']").attr("selected", "selected");
                break;
            case "RJ":
                $("#Endereco_Cidade_EstadoID").find("option[value='19']").attr("selected", "selected");
                break;
            case "RN":
                $("#Endereco_Cidade_EstadoID").find("option[value='20']").attr("selected", "selected");
                break;
            case "RS":
                $("#Endereco_Cidade_EstadoID").find("option[value='21']").attr("selected", "selected");
                break;
            case "RO":
                $("#Endereco_Cidade_EstadoID").find("option[value='22']").attr("selected", "selected");
                break;
            case "RR":
                $("#Endereco_Cidade_EstadoID").find("option[value='23']").attr("selected", "selected");
                break;
            case "SC":
                $("#Endereco_Cidade_EstadoID").find("option[value='24']").attr("selected", "selected");
                $("#Endereco_Cidade_EstadoID").val(24);
                break;
            case "SP":
                $("#Endereco_Cidade_EstadoID").find("option[value='25']").attr("selected", "selected");
                break;
            case "SE":
                $("#Endereco_Cidade_EstadoID").find("option[value='26']").attr("selected", "selected");
                break;
            case "TO":
                $("#Endereco_Cidade_EstadoID").find("option[value='27']").attr("selected", "selected");
                break;
        }

        $("#Endereco_Cidade_EstadoID").change();

    }

    $("#Endereco_CEP").change('input', function () {
        buscaCEP();
    });


    $("#Endereco_CEP").mask({ mask: "#####-###" });

</script>

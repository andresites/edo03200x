<!--#include file="conecta_bd.asp"--><%

dim fulano, eleexiste, funcID, essecontrato, contratoExiste, TipoFaltaID, DataFalta, Comentarios, erroClass, bolTemErro, PREfuncID
dim  bolShowForm
    bolShowForm=true    
    bolTemErro=false
    erroClass=""
   
eleexiste=false
set fulano = new empregado
PREfuncID=limpaquerystring("ID")
'busca via objeto os dados do cara
if len(PREfuncID)>0 then    
    fulano.ID=PREfuncID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        nome=fulano.Nome
        funcID= fulano.ID
        set essecontrato=new contrato 
        contratoExiste=essecontrato.getFkrtContrato (funcID, true, 0 )
        novoContratoID = essecontrato.contrato_ID

        if len(request.form("ID"))>0 then    

            TipoFaltaID=limpaRequestForm("TipoFaltaID")
            DataFalta=limpaRequestForm("DataFalta")
            Comentarios=limpaRequestForm("Comentarios") & ""

            if funcID="" then  bolTemErro=true
            if TipoFaltaID="" then  bolTemErro=true
            if DataFalta="" then  bolTemErro=true
            if not IsDate(DataFalta) then  bolTemErro=true


            'valida
            if bolTemErro=false then                
                fulano.salvaFalta  TipoFaltaID, DataFalta, Comentarios
                bolShowForm=false
            else
                erroClass=" style='border-color:red' "
            end if
        else
           for each item in request.Form
    
                response.Write item & " = " & request.form(item) & "<br>"
            next

        end if



    else
        fulano.nome="Não Encontrado"
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
            <div id="atencao" class="message AttentionExpAcima">
			    <span class="strong" style="color:red;">Atenção!!</span> Faltas <b>Não justificadas</b> são <b>DESCONTADAS</b> do salário.
            </div>

            <div class="sb-box">
                
                <div class="sb-box-inner content">
                    <div class="header">
                        <h3><%=fulano.nome %> - LANÇAR FALTA</h3>
                                                <ul class="tabs">
                            <li class="active">
                                <a href="empregado_ficha.asp?ID=<%=funcID %>&tabs=7" hidefocus="true" style="outline: none;">Voltar</a></li>
                        </ul>
                    </div>
                    <%  ' conteúdo vai aqui
                        if eleexiste then %>






                        
                    <%  if bolShowForm then %>
                    <b>Os Campos marcados com <span>*</span> são obrigatórios.</b><br /><br /><br />
						<form action="empregado_lanca_falta.asp?ID=<%=funcID %>" id="form" method="post" name="form">	
                            <input type="hidden" name="ID" value="<%=funcID %>" />
						    <div id="erro" class="message error">
							    <span class="strong">ERRO!</span> Verifique todos os campos abaixo.
						    </div>
                            <div class="esquerda">
                                <p>
                                    <b>Data da Falta <span>*</span></b><br />
                                    <input Value="" class="inputtext medium" <%=erroClass %> id="DataFalta" maxlength="128" name="DataFalta" type="text" value="<%=DataFalta %>" />                                
                                </p>
                            </div>
                            <div class="direita">
                                <p>
                                    <b>Tipo</b><br />
                                        <select id="TipoFaltaID" name="TipoFaltaID">
                                        <option value="2" <%if TipoFaltaID="2" then response.write " selected" %>>Falta Justificada</option>
                                        <option value="1"<%if TipoFaltaID="1" then response.write " selected" %>>Falta N&#227;o Justificada</option>
                                    </select>
                                </p>
                            </div>
						    <p>
							    <b>Comentários <span>*</span></b><br />
							    <textarea class="inputtext" cols="20" rows="6" id="Comentarios" style="width:100%" maxlength="600" name="Comentarios" rows="2"><%=Comentarios %></textarea>
						    </p>
						    <div>
						        <hr />
						        <p>
							        <button id="cancelar" class="button blue" type="reset" onclick="location.href='empregado_ficha.asp?ID=<%=funcID %>';">
								        <span>Cancelar</span>
							        </button>
						            <button id="enviar" name="enviar" class="button green" type="submit" value="Salvar">
							            <span>Enviar</span>
						            </button>
						            <span id="processando" class="note loading">Processando...</span>
						        </p>
						    </div>
						</form>
                    <%  Else %>
                    <h1>Falta cadastrada com sucesso</h1>
                    <div>
                        <a  href="empregado_ficha.asp?ID=<%=funcID %>&tabs=7">Voltar</a>
                    </div>
                    <%  end if %>


                    <%else %>
                    <h1>Funcionário não encontrado</h1>
                    <%end if %>
                    <!--qui-->
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
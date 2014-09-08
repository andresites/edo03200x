<!--#include file="conecta_bd.asp"-->

<%    
    response.Buffer=true
function ListTablesADO()
  Dim Conn 
    set conn = server.CreateObject("ADODB.Connection")
  Dim TablesSchema 
    set TablesSchema = server.CreateObject("ADODB.recordset")
  Dim ColumnsSchema 
    set ColumnsSchema = server.CreateObject("ADODB.recordset")

  'Open connection you want To get database objects
  Conn.Provider = "MSDASQL"
  Conn.Open strConn
  
  'Get all database tables.
  Set TablesSchema = Conn.OpenSchema(adSchemaTables) 
  Do While Not TablesSchema.EOF
    'Get all table columns.
    Set ColumnsSchema = Conn.OpenSchema(adSchemaColumns, _
      Array(Empty, Empty, "" & TablesSchema("TABLE_NAME")))
    Do While Not ColumnsSchema.EOF
      response.Write "<p>" & TablesSchema("TABLE_NAME") & ", " & _
        ColumnsSchema("COLUMN_NAME") &"</p>"
        response.Flush  
      ColumnsSchema.MoveNext
    Loop
    TablesSchema.MoveNext
  Loop
End function
    
function collationstuff()
  Dim Conn 
    set conn = server.CreateObject("ADODB.Connection")
  Dim TablesSchema 
    set TablesSchema = server.CreateObject("ADODB.recordset")
  Dim ColumnsSchema 
    set ColumnsSchema = server.CreateObject("ADODB.recordset")

  'Open connection you want To get database objects
  Conn.Provider = "MSDASQL"
  Conn.Open strConn
  
  'Get all database tables.
  Set TablesSchema = Conn.OpenSchema(adSchemaCollations) 
  Do While Not TablesSchema.EOF
    'Get all table columns.
    Set ColumnsSchema = Conn.OpenSchema(adSchemaColumns, _
      Array(Empty, Empty, "" & TablesSchema("TABLE_NAME")))
    Do While Not ColumnsSchema.EOF
      response.Write "<p>" & TablesSchema("TABLE_NAME") & ", " & _
        ColumnsSchema("COLUMN_NAME") &"</p>"
        response.Flush  
      ColumnsSchema.MoveNext
    Loop
    TablesSchema.MoveNext
  Loop
End function    


function ExcluiCompletamenteFuncionario(ID)
    set objCon= server.CreateObject("ADODB.Connection")
    objCon.open strconn
  Dim Conn 
    set conn = server.CreateObject("ADODB.Connection")
  Dim TablesSchema 
    set TablesSchema = server.CreateObject("ADODB.recordset")
  Dim ColumnsSchema 
    set ColumnsSchema = server.CreateObject("ADODB.recordset")

  'Open connection you want To get database objects
  Conn.Provider = "MSDASQL"
  Conn.Open strConn
  
  'Get all database tables.
  Set TablesSchema = Conn.OpenSchema(adSchemaTables) 
  Do While Not TablesSchema.EOF
    'Get all table columns.

         if cstr(TablesSchema("TABLE_SCHEMA"))="Empregado" then 
              if cstr(TablesSchema("TABLE_NAME"))="Empregado" then 
                   
              else

                    leSQL = "delete from " & TablesSchema("TABLE_SCHEMA") & "." & TablesSchema("TABLE_NAME") & " where empregadoID=" & ID
     response.Write "<p>" & leSQL & "</p>"
                    on error resume next
                    objCon.execute leSQL
                   
              end if
        end if

   ' Set ColumnsSchema = Conn.OpenSchema(adSchemaColumns, _
  '    Array(Empty, Empty, "" & TablesSchema("TABLE_NAME")))
  '  Do While Not ColumnsSchema.EOF

       ' if cstr(TablesSchema("TABLE_SCHEMA"))="Empregado" then    
       '     response.Write "<p>delete from " & TablesSchema("TABLE_SCHEMA") & "." & TablesSchema("TABLE_NAME") & " where empregadoID=" & ID
       ' else
        '    response.Write "<p>" & TablesSchema("TABLE_SCHEMA")  & "." & TablesSchema("TABLE_NAME") 
       ' end if
    'response.Write "</p>"
      'response.Write "<p>" & TablesSchema("TABLE_NAME") & ", " & _
        'ColumnsSchema("COLUMN_NAME") &"</p>"
      '  response.Flush  
     ' ColumnsSchema.MoveNext
   ' Loop
    response.Flush 
    TablesSchema.MoveNext
  Loop

    objCon.execute "delete from Empregado.Empregado where empregadoID=" & ID
    response.Write "tudo excluído"
    
end function
            
    'dim objRS, objCon, leSQL, strMenuGrande, empregadoNome, sexo, strMnuPeq, objContrato
  '  dim sSalario, sTipoOcupacao, sContratoID, sDataAdmissao
    set objCon = Server.CreateObject ("ADODB.Connection")
    'Set objRS = Server.CreateObject ("ADODB.Recordset")
    objCon.open strConn
    'lesql="update empregador.empregador set DataExpiracaoAcesso = '12/12/2015' where id=3"
    'lesql="insert into Aliquota.INSS (ID, ValorInicial, ValorFinal, AliquotaEmpregado, AliquotaEmpregador, Ano) Values (192132, 100,10000,12,12,2014)"
  ' leSQL = "ALTER TABLE contrato.AlteracaoCargoSalario  ADD primeiroLancamento INT NULL " 'quando em produção, mudar tudo pra no null
    'FOREIGN KEY REFERENCES Persons empregador.empregador(ID)

    'leSQL = "update contrato.contrato set valeTransporte=1 where ID>0"
   ' leSQL = "delete from empregador.empregador where ID=2017"
    'objCon.execute lesql
    'leSQL = "update aliquota.inss set ano=2014 where ID>0"
    'objCon.execute lesql
    'quando em produção, mudar tudo pra no null

  ' leSQL = " CREATE PROCEDURE empregado.adiantamentoDelete ( @emprID    INT ) As BEGIN SET NOCOUNT ON;  DELETE empregado.adiantamento "
  '  leSQL =  leSQL & " FROM  empregado.adiantamento  WHERE ID = @emprID END GO"
    

 'leSQL =  leSQL & " delete FROM  empregado.empregado  WHERE EmpregadorID=3"
    
'objCon.execute lesql



  ' lançar inss 2013
    'leSQL = "update empregador.empregador set email='24234@sfsdf.com' where email='joana@paivaauditores.com.br'"
 ' objCon.execute lesql
    'gerar aumento na raça
     'set novoaumento = new contrato
    ' response.Write novoaumento.alteraCargoSalario(4008, 7, "téstão", "1233,22", "25/12/1988")
    'set novoaumento=nothing
    
     %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	


<!--script type="text/javascript" src="https://getfirebug.com/firebug-lite.js"></script-->
<!--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>-->
<script type="text/javascript" src="/Scripts/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery.visualize.js"></script>
<script type="text/javascript" src="/scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="/scripts/jquery.util.validateExp.js"></script>
<script type="text/javascript" src="/scripts/jquery.price_format.1.5.js"></script>



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
<h2>List schemma</h2>
    <!--
<dl >

    <dt style="border:1px solid black">
        alguma coisa
    </dt>
    <dd style="border:1px solid black">
        alguma resposta
    </dd>
    <dt>
        outra coisa
    </dt>
    <dd>
        outra resposta
    </dd>
    <dt>
        alguma outra coisa
    </dt>
    <dd>
        alguma outra resposta
    </dd>



</dl>-->
<%=ExcluiCompletamenteFuncionario(1006) %>

</body>
</html>



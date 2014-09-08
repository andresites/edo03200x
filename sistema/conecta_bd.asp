<%    'Response.ContentType = "text/html"
'Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
'Response.CodePage = 65001
'Response.CharSet = "UTF-8"
    '============================IMPORTANTE==============
        'CRIAR TABELA PARA DESCONTO DE DEPENDENTES NO IR
        'POR ENQUANTO ESTÁ LITERAL EM 179.71
    ''''O DESONNTO MÁXIMO INSS TAMBÉM ESTÁ LITERAL
    '====================================================

    DIM valDescontoDependente, maximoDescontoINSS
    valDescontoDependente = 179.71
    maximoDescontoINSS = 482.93

    'coisas a fazer:
    ' mudar os metodos que passam recordset para parametrized querys para evitar injections
    'adicionar empregadorID nas tabelas de faltas, adiantamento, advertencia e as outras de empregado
    ' criar views ou stored procedures para ir mais rápido e evitar sql injection
    'fazer toda a validação server side em todos os scripts que coletam dados
    'Usar regular expressions
    '	Dim regEx
	'   Set regEx = New RegExp
    function dublifica(numbr)
        if len(numbr)>0 then numbr = replace(numbr,",",".") else numbr=0
        if isnumeric(numbr) then dublifica= cdbl(numbr) else dublifica=0
    end function
    Dim x_Centavos, x_I, x_J, x_K, x_Numero, x_QtdCentenas, x_TotCentenas, x_TxtExtenso( 900 ), x_TxtMoeda( 6 ), x_ValCentena( 6 ), x_Valor, x_ValSoma
function GetLastDay(aDate)
    dim intMonth
    dim dteFirstDayNextMonth
    'response.Write aDate
    dtefirstdaynextmonth = dateserial(year(adate),month(adate) + 1, 1)
    GetLastDay = Day(DateAdd ("d", -1, dteFirstDayNextMonth))
end function
' Função Principal de Conversão de Valores em Extenso
Function Extenso( x_Numero )
    ' Matrizes de textos
    x_TxtMoeda( 1 ) = "rea"
    x_TxtMoeda( 2 ) = "mil"
    x_TxtMoeda( 3 ) = "milh"
    x_TxtMoeda( 4 ) = "bilh"
    x_TxtMoeda( 5 ) = "trilh"

    x_TxtExtenso( 1 ) = "um"
    x_TxtExtenso( 2 ) = "dois"
    x_TxtExtenso( 3 ) = "tres"
    x_TxtExtenso( 4 ) = "quatro"
    x_TxtExtenso( 5 ) = "cinco"
    x_TxtExtenso( 6 ) = "seis"
    x_TxtExtenso( 7 ) = "sete"
    x_TxtExtenso( 8 ) = "oito"
    x_TxtExtenso( 9 ) = "nove"
    x_TxtExtenso( 10 ) = "dez"
    x_TxtExtenso( 11 ) = "onze"
    x_TxtExtenso( 12 ) = "doze"
    x_TxtExtenso( 13 ) = "treze"
    x_TxtExtenso( 14 ) = "quatorze"
    x_TxtExtenso( 15 ) = "quinze"
    x_TxtExtenso( 16 ) = "dezesseis"
    x_TxtExtenso( 17 ) = "dezessete"
    x_TxtExtenso( 18 ) = "dezoito"
    x_TxtExtenso( 19 ) = "dezenove"
    x_TxtExtenso( 20 ) = "vinte"
    x_TxtExtenso( 30 ) = "trinta"
    x_TxtExtenso( 40 ) = "quarenta"
    x_TxtExtenso( 50 ) = "cinquenta"
    x_TxtExtenso( 60 ) = "sessenta"
    x_TxtExtenso( 70 ) = "setenta"
    x_TxtExtenso( 80 ) = "oitenta"
    x_TxtExtenso( 90 ) = "noventa"
    x_TxtExtenso( 100 ) = "cento"
    x_TxtExtenso( 200 ) = "duzentos"
    x_TxtExtenso( 300 ) = "trezentos"
    x_TxtExtenso( 400 ) = "quatrocentos"
    x_TxtExtenso( 500 ) = "quinhentos"
    x_TxtExtenso( 600 ) = "seiscentos"
    x_TxtExtenso( 700 ) = "setentos"
    x_TxtExtenso( 800 ) = "oitocentos"
    x_TxtExtenso( 900 ) = "novecentos"
	x_Numero = FormatNumber( x_Numero , 2 )
	x_Centavos = right( x_Numero , 2 )
	x_ValCentena( 0 ) = 0
	x_QtdCentenas = Int( ( Len( x_Numero ) + 1 ) / 4 )

	For x_I = 1 To x_QtdCentenas
		x_ValCentena( x_I ) = ""
	Next
	'
	x_I = 1
	x_J = 1
	For x_K = Len( x_Numero ) - 3 To 1 Step -1
		x_ValCentena( x_J ) = mid( x_Numero , x_K , 1 ) & x_ValCentena( x_J )
		If x_I / 3 = Int( x_I / 3 ) Then
			x_J = x_J + 1
			x_K = x_K - 1
		End If
		x_I = x_I + 1
	Next
	x_TotCentenas = 0
	Extenso = ""
	For x_I = x_QtdCentenas To 1 Step -1

		x_TotCentenas = x_TotCentenas + Int( x_ValCentena( x_I ) )

		If Int( x_ValCentena( x_I ) ) <> 0 Or ( Int( x_ValCentena( x_I ) ) = 0 And x_I = 1 )Then
			If Int( x_ValCentena( x_I ) = 0 And Int( x_ValCentena( x_I + 1 ) ) = 0 And x_I = 1 )Then
				Extenso = Extenso & ExtCentena( x_ValCentena( x_I ) , x_TotCentenas ) & " de " & x_TxtMoeda( x_I )
			Else
				Extenso = Extenso & ExtCentena( x_ValCentena( x_I ) , x_TotCentenas ) & " " & x_TxtMoeda( x_I )
			End If
			If Int( x_ValCentena( x_I ) ) <> 1 Or ( x_I = 1 And x_TotCentenas <> 1 ) Then
				Select Case x_I
					Case 1
						Extenso = Extenso & "is"
					Case 3, 4, 5
						Extenso = Extenso & "ões"
				End Select
			Else
				Select Case x_I
					Case 1
						Extenso = Extenso & "l"
					Case 3, 4, 5
						Extenso = Extenso & "ão"
				End Select
			End If
		End If
		If Int( x_ValCentena( x_I - 1 ) ) = 0 Then
			Extenso = Extenso
		Else
			If ( Int( x_ValCentena( x_I + 1 ) ) = 0 And ( x_I + 1 ) <= x_QtdCentenas ) Or ( x_I = 2 ) Then
				Extenso = Extenso & " e "
			Else
				Extenso = Extenso & ", "
			End If
		End If
	Next

	If x_Centavos > 0 Then
		If Int( x_Centavos ) = 1 Then
				Extenso = Extenso & " e " & ExtDezena( x_Centavos ) & " centavo"
		Else
				Extenso = Extenso &  " e " & ExtDezena( x_Centavos ) & " centavos"
		End If
	End If
	Extenso = UCase( Left( Extenso , 1 ) )&right( Extenso , Len( Extenso ) - 1 )
End Function

Function ExtDezena( x_Valor )
' Retorna o Valor por Extenso referente à DEZENA recebida
ExtDezena = ""
If Int( x_Valor ) > 0 Then
	If Int( x_Valor ) < 20 Then
		ExtDezena = x_TxtExtenso( Int( x_Valor ) )
	Else
		ExtDezena = x_TxtExtenso( Int( Int( x_Valor ) / 10 ) * 10 )
		If ( Int( x_Valor ) / 10 ) - Int( Int( x_Valor ) / 10 ) <> 0 Then
			ExtDezena = ExtDezena & " e " & x_TxtExtenso( Int( right( x_Valor , 1 ) ) )
		End If
	End If
End If
End Function

Function ExtCentena( x_Valor, x_ValSoma )
ExtCentena = ""

If Int( x_Valor ) > 0 Then

	If Int( x_Valor ) = 100 Then
		ExtCentena = "cem"
	Else
		If Int( x_Valor ) < 20 Then
			If Int( x_Valor ) = 1 Then
				If x_ValSoma - Int( x_Valor ) = 0 Then
					ExtCentena = "hum"
				Else
					ExtCentena = x_TxtExtenso( Int( x_Valor ) )
				End If
			Else
					ExtCentena = x_TxtExtenso( Int( x_Valor ) )
			End If
		Else
			If Int( x_Valor ) < 100 Then
				ExtCentena = ExtDezena( right( x_Valor , 2 ) )
			Else
				ExtCentena = x_TxtExtenso( Int( Int( x_Valor ) / 100 )*100 )
				If ( Int( x_Valor ) / 100 ) - Int( Int( x_Valor ) / 100 ) <> 0 Then
					ExtCentena = ExtCentena & " e " & ExtDezena( right( x_Valor , 2 ) )
				End If
			End If
		End If
	End If
End If
End Function


  Public Function Encode_UTF8(astr)
    Dim c 
    Dim utftext 
    utftext = ""
    If isNull(astr) = false or astr <> "" Then
      astr = Replace(astr, "’", "'") 'replacing the apostrophe
      astr = Replace(astr, "–", "-") 'replacing the emdash with minus sign
      For n = 1 To Len(astr)
        c = Asc(Mid(astr, n, 1))
        If c < 128 Then
          utftext = utftext + Mid(astr, n, 1)
        ElseIf ((c > 127) And (c < 2048)) Then
          utftext = utftext + Chr(((c \ 64) Or 192))
          utftext = utftext + Chr(((c And 63) Or 128))
        Else
          utftext = utftext + Chr(((c \ 144) Or 234))
          utftext = utftext + Chr((((c \ 64) And 63) Or 128))
          utftext = utftext + Chr(((c And 63) Or 128))
        End If
      Next
    End If
    Encode_UTF8 = utftext
  End Function

 dim strCurrentPaginaLogin
    strCurrentPaginaLogin=request.ServerVariables("SCRIPT_NAME")
     if instr(1, strCurrentPaginaLogin,"cadastro.asp")>0  then session("ID")=0
       if instr(1, strCurrentPaginaLogin,"cidades2.asp")>0  then 
            if session("ID")="" then session("ID")=0
        end if


       if instr(1, strCurrentPaginaLogin,"chkmail.asp")>0  then 
                if session("ID")="" then session("ID")=0
        end if
    


    if instr(1, strCurrentPaginaLogin,"login.asp")=0 then
        if session("ID")="" then 
            session("erro")="Sessão expirada. Favor logar novamente"
            response.redirect "index.asp"
        end if
    end if

Const adOpenForwardOnly = 0
Const adOpenKeyset = 1
Const adOpenDynamic = 2
Const adOpenStatic = 3

'---- CursorOptionEnum Values ----
Const adHoldRecords = &H00000100
Const adMovePrevious = &H00000200
Const adAddNew = &H01000400
Const adDelete = &H01000800
Const adUpdate = &H01008000
Const adBookmark = &H00002000
Const adApproxPosition = &H00004000
Const adUpdateBatch = &H00010000
Const adResync = &H00020000
Const adNotify = &H00040000

'---- LockTypeEnum Values ----
Const adLockReadOnly = 1
Const adLockPessimistic = 2
Const adLockOptimistic = 3
Const adLockBatchOptimistic = 4

'---- ExecuteOptionEnum Values ----
Const adRunAsync = &H00000010

'---- ObjectStateEnum Values ----
Const adStateClosed = &H00000000
Const adStateOpen = &H00000001
Const adStateConnecting = &H00000002
Const adStateExecuting = &H00000004

'---- CursorLocationEnum Values ----
Const adUseNone = 1
Const adUseServer = 2
Const adUseClient = 3
Const adUseClientBatch = 3

'---- DataTypeEnum Values ----
Const adEmpty = 0
Const adTinyInt = 16
Const adSmallInt = 2
Const adInteger = 3
Const adBigInt = 20
Const adUnsignedTinyInt = 17
Const adUnsignedSmallInt = 18
Const adUnsignedInt = 19
Const adUnsignedBigInt = 21
Const adSingle = 4
Const adDouble = 5
Const adCurrency = 6
Const adDecimal = 14
Const adNumeric = 131
Const adBoolean = 11
Const adError = 10
Const adUserDefined = 132
Const adVariant = 12
Const adIDispatch = 9
Const adIUnknown = 13
Const adGUID = 72
Const adDate = 7
Const adDBDate = 133
Const adDBTime = 134
Const adDBTimeStamp = 135
Const adBSTR = 8
Const adChar = 129
Const adVarChar = 200
Const adLongVarChar = 201
Const adWChar = 130
Const adVarWChar = 202
Const adLongVarWChar = 203
Const adBinary = 128
Const adVarBinary = 204
Const adLongVarBinary = 205

'---- FieldAttributeEnum Values ----
Const adFldMayDefer = &H00000002
Const adFldUpdatable = &H00000004
Const adFldUnknownUpdatable = &H00000008
Const adFldFixed = &H00000010
Const adFldIsNullable = &H00000020
Const adFldMayBeNull = &H00000040
Const adFldLong = &H00000080
Const adFldRowID = &H00000100
Const adFldRowVersion = &H00000200
Const adFldCacheDeferred = &H00001000

'---- EditModeEnum Values ----
Const adEditNone = &H0000
Const adEditInProgress = &H0001
Const adEditAdd = &H0002

'---- RecordStatusEnum Values ----
Const adRecOK = &H0000000
Const adRecNew = &H0000001
Const adRecModified = &H0000002
Const adRecDeleted = &H0000004
Const adRecUnmodified = &H0000008
Const adRecInvalid = &H0000010
Const adRecMultipleChanges = &H0000040
Const adRecPendingChanges = &H0000080
Const adRecCanceled = &H0000100
Const adRecCantRelease = &H0000400
Const adRecConcurrencyViolation = &H0000800
Const adRecIntegrityViolation = &H0001000
Const adRecMaxChangesExceeded = &H0002000
Const adRecObjectOpen = &H0004000
Const adRecOutOfMemory = &H0008000
Const adRecPermissionDenied = &H0010000
Const adRecSchemaViolation = &H0020000
Const adRecDBDeleted = &H0040000

'---- GetRowsOptionEnum Values ----
Const adGetRowsRest = -1

'---- PositionEnum Values ----
Const adPosUnknown = -1
Const adPosBOF = -2
Const adPosEOF = -3

'---- enum Values ----
Const adBookmarkCurrent = 0
Const adBookmarkFirst = 1
Const adBookmarkLast = 2

'---- MarshalOptionsEnum Values ----
Const adMarshalAll = 0
Const adMarshalModifiedOnly = 1

'---- AffectEnum Values ----
Const adAffectCurrent = 1
Const adAffectGroup = 2
Const adAffectAll = 3

'---- FilterGroupEnum Values ----
Const adFilterNone = 0
Const adFilterPendingRecords = 1
Const adFilterAffectedRecords = 2
Const adFilterFetchedRecords = 3
Const adFilterPredicate = 4

'---- SearchDirection Values ----
Const adSearchForward = 0
Const adSearchBackward = 1

'---- ConnectPromptEnum Values ----
Const adPromptAlways = 1
Const adPromptComplete = 2
Const adPromptCompleteRequired = 3
Const adPromptNever = 4

'---- ConnectModeEnum Values ----
Const adModeUnknown = 0
Const adModeRead = 1
Const adModeWrite = 2
Const adModeReadWrite = 3
Const adModeShareDenyRead = 4
Const adModeShareDenyWrite = 8
Const adModeShareExclusive = &Hc
Const adModeShareDenyNone = &H10

'---- IsolationLevelEnum Values ----
Const adXactUnspecified = &Hffffffff
Const adXactChaos = &H00000010
Const adXactReadUncommitted = &H00000100
Const adXactBrowse = &H00000100
Const adXactCursorStability = &H00001000
Const adXactReadCommitted = &H00001000
Const adXactRepeatableRead = &H00010000
Const adXactSerializable = &H00100000
Const adXactIsolated = &H00100000

'---- XactAttributeEnum Values ----
Const adXactCommitRetaining = &H00020000
Const adXactAbortRetaining = &H00040000

'---- PropertyAttributesEnum Values ----
Const adPropNotSupported = &H0000
Const adPropRequired = &H0001
Const adPropOptional = &H0002
Const adPropRead = &H0200
Const adPropWrite = &H0400

'---- ErrorValueEnum Values ----
Const adErrInvalidArgument = &Hbb9
Const adErrNoCurrentRecord = &Hbcd
Const adErrIllegalOperation = &Hc93
Const adErrInTransaction = &Hcae
Const adErrFeatureNotAvailable = &Hcb3
Const adErrItemNotFound = &Hcc1
Const adErrObjectInCollection = &Hd27
Const adErrObjectNotSet = &Hd5c
Const adErrDataConversion = &Hd5d
Const adErrObjectClosed = &He78
Const adErrObjectOpen = &He79
Const adErrProviderNotFound = &He7a
Const adErrBoundToCommand = &He7b
Const adErrInvalidParamInfo = &He7c
Const adErrInvalidConnection = &He7d
Const adErrStillExecuting = &He7f
Const adErrStillConnecting = &He81

'---- ParameterAttributesEnum Values ----
Const adParamSigned = &H0010
Const adParamNullable = &H0040
Const adParamLong = &H0080

'---- ParameterDirectionEnum Values ----
Const adParamUnknown = &H0000
Const adParamInput = &H0001
Const adParamOutput = &H0002
Const adParamInputOutput = &H0003
Const adParamReturnValue = &H0004

'---- CommandTypeEnum Values ----
Const adCmdUnknown = &H0008
Const adCmdText = &H0001
Const adCmdTable = &H0002
Const adCmdStoredProc = &H0004

'---- SchemaEnum Values ----
Const adSchemaProviderSpecific = -1
Const adSchemaAsserts = 0
Const adSchemaCatalogs = 1
Const adSchemaCharacterSets = 2
Const adSchemaCollations = 3
Const adSchemaColumns = 4
Const adSchemaCheckConstraints = 5
Const adSchemaConstraintColumnUsage = 6
Const adSchemaConstraintTableUsage = 7
Const adSchemaKeyColumnUsage = 8
Const adSchemaReferentialContraints = 9
Const adSchemaTableConstraints = 10
Const adSchemaColumnsDomainUsage = 11
Const adSchemaIndexes = 12
Const adSchemaColumnPrivileges = 13
Const adSchemaTablePrivileges = 14
Const adSchemaUsagePrivileges = 15
Const adSchemaProcedures = 16
Const adSchemaSchemata = 17
Const adSchemaSQLLanguages = 18
Const adSchemaStatistics = 19
Const adSchemaTables = 20
Const adSchemaTranslations = 21
Const adSchemaProviderTypes = 22
Const adSchemaViews = 23
Const adSchemaViewColumnUsage = 24
Const adSchemaViewTableUsage = 25
Const adSchemaProcedureParameters = 26
Const adSchemaForeignKeys = 27
Const adSchemaPrimaryKeys = 28
Const adSchemaProcedureColumns = 29

dim strConn
strConn = "Provider=Sqloledb; User ID=edomestico_test; Password=Infosys; Initial Catalog=edomestico_test;Data Source=PALM.arvixe.com"

function formataDatas(dataIn)
    dim outDatas, diaSemana
    if isdate(dataIn) then
        diaSemana = weekday(dataIn)
        select case diaSemana
        case 1
            outDatas = "Domingo, "
        case 2
            outDatas = "Segunda feira, "
        case 3
            outDatas = "Ter&ccedila feira, "
        case 4
            outDatas = "Quarta feira, "
        case 5
            outDatas = "Quinta feira, "
        case 6
            outDatas = "Sexta feira, "
        case 7
            outDatas = "S&aacute;bado, "
        end select
        outDatas=outDatas & day(dataIn) & " de " 
        select case month(dataIn)
            case 1
                outDatas=outDatas & " janeiro de "
            case 2
                    outDatas=outDatas & " fevereiro de "
            case 3
    outDatas=outDatas & " mar&ccedil;o de "
            case 4
    outDatas=outDatas & " abril de "
            case 5
    outDatas=outDatas & " maio de "
            case 6
    outDatas=outDatas & " junho de "
            case 7
    outDatas=outDatas & " julho de "
            case 8
    outDatas=outDatas & " agosto de "
            case 9
    outDatas=outDatas & " setembro de "
            case 10
    outDatas=outDatas & " outubro de "
            case 11
    outDatas=outDatas & " novembro de "
            case 12
    outDatas=outDatas & " dezembro de "
            
        end select
        outDatas=outDatas & year(dataIn)
    else
        outDatas="erroDeData"
    end if
    formataDatas=outDatas

end function

function getCepFromLocaweb(cepLocaweb) 'POPULAR OS DADOS DO CEP COM LOCAWEB
'Toda vez que for atualizar essa função, atualizar no global asa
	Set CEP_obj = server.CreateObject("Correios.CEP")	
	CEP_obj.EncontraCEP(replace(cepLocaweb,"-",""))
	If CEP_obj.Erro = 0 Then 
		endLocaweb = CEP_obj.Endereco 
		baiLocaweb = CEP_obj.Bairro 
		cidLocaweb = CEP_obj.Cidade 
		ufLocaweb = CEP_obj.Estado 	
		getCepFromLocaweb=true
	else
		getCepFromLocaweb=false
	end if
	Set CEP_obj = nothing
end function

function limpaQuerystring(querystring)
	dim entrada
	if len(querystring)>0 then
	        entrada = Request.QueryString(querystring)
	        entrada = replace(entrada,"Æ","")
	        entrada = replace(entrada,"select","")
	        entrada = replace(entrada,"cast(","")
	        entrada = replace(entrada,"Bchar","B C H A R ")
	        entrada = replace(entrada,"char("," C H A R ")
	        entrada = replace(entrada,"="," - igual a - ")
	        entrada = replace(entrada,";"," - PONTOEVIRGULA - ")
	        entrada = replace(entrada,"+"," - sinal de mais - ")
	        entrada = replace(entrada,"--"," - - - - - ")
	        entrada = replace(entrada,"/*"," - FU - ")
	        entrada = replace(entrada,"*/"," - CK - ")
	        entrada = replace(entrada,"XP_"," - x p  - ")
	        entrada = replace(entrada,"xp_"," - x p  - ")
	        entrada = replace(entrada,"[","[[]")
	        entrada = replace(entrada,"%","[%]")
	        entrada = replace(entrada,"_","[_]")
	        entrada = replace(entrada,"_","[_]")
	        entrada = replace(entrada,"sys","[s y s]")
       else
       entrada=""
	 end if
	limpaQuerystring=left(entrada,200)
end function
function limpaRequestForm(campoFormLimp)
	dim entradaForm
    if len(campoFormLimp)>0 then
	    entradaForm = Request.form(campoFormLimp)
	    entradaForm = replace(entradaForm,"Æ","")
	    entradaForm = replace(entradaForm,"select","")
	    entradaForm = replace(entradaForm,"cast(","")
	    entradaForm = replace(entradaForm,"Bchar","B C H A R ")
	    entradaForm = replace(entradaForm,"char(","C H A R ")
	    entradaForm = replace(entradaForm,"="," - igual a - ")
	    entradaForm = replace(entradaForm,"+"," - sinal de mais - ")	
	    entradaForm = replace(entradaForm,"+"," - sinal de mais - ")
	    entradaForm = replace(entradaForm,"--"," - - - - - ")
	    entradaForm = replace(entradaForm,"/*"," - FU - ")
	    entradaForm = replace(entradaForm,"*/"," - CK - ")
	    entradaForm = replace(entradaForm,"XP_"," - x p  - ")
	    entradaForm = replace(entradaForm,"xp_"," - x p  - ")
	
	    entradaForm = replace(entradaForm,"[","[[]")
	    entradaForm = replace(entradaForm,"%","[%]")
	    entradaForm = replace(entradaForm,"_","[_]")
	    entradaForm = replace(entradaForm,"_","[_]")
	    entradaForm = replace(entradaForm,"sys","[s y s]")
    	limpaRequestForm=left(entradaForm,1000)
    else
        	limpaRequestForm=""
	end if	
end function
function formataData(dataAFormatar)
    if isdate(dataAFormatar) then
        formataData=right("00" & day(dataAFormatar),2) & "/" & right("00" & month(dataAFormatar),2) & "/" &  year(dataAFormatar)
    else
        formataData="Formato Invalido"
    end if
end function

''###############################################################################
    '
    '   class empregador
    '   Propriedades:
    'empregador_ID
    'empregador_Nome
    'empregador_Email
    'empregador_Senha
    'empregador_Sexo
    'empregador_DataNascimento
    'empregador_Nacionalidade
    'empregador_RG
    'empregador_OrgaoEmissorRG
    'empregador_CEI
    'empregador_CPF
    'empregador_RecebeNewsletter
    'empregador_TelefoneResidencial
    'empregador_TelefoneComercial
    'empregador_TelefoneCelular
    'empregador_DataCriacao
    'empregador_DataExpiracaoAcesso
    'empregador_EnderecoID
    'empregador_StatusID
    'empregador_Logradouro
        '
    ' Métodos
    '   carregaDadosEmpregador()  ==> depois usar parametro para esse metodo para que eu possa usar no gerenciador do sistema
    '
 '###############################################################################   '
class empregador
'declarations
'PRVS
    private prv_empregador_ID 
    private prv_empregador_Nome 
    private prv_empregador_Email 
    private prv_empregador_Senha 
    private prv_empregador_Sexo 
    private prv_empregador_DataNascimento 
    private prv_empregador_Nacionalidade 
    private prv_empregador_RG 
    private prv_empregador_OrgaoEmissorRG 
    private prv_empregador_CEI 
    private prv_empregador_CPF 
    private prv_empregador_RecebeNewsletter 
    private prv_empregador_TelefoneResidencial 
    private prv_empregador_TelefoneComercial 
    private prv_empregador_TelefoneCelular 
    private prv_empregador_DataCriacao 
    private prv_empregador_DataExpiracaoAcesso 
    private prv_empregador_EnderecoID 
    private prv_empregador_StatusID 
    'endereço
    private prv_endereco_empregador_ID 
    private prv_endereco_empregador_Logradouro 
    private prv_endereco_empregador_Numero 
    private prv_endereco_empregador_Bairro 
    private prv_endereco_empregador_Complemento 
    private prv_endereco_empregador_CEP 
    private prv_endereco_empregador_CidadeID 
    private prv_endereco_empregador_empregadorID
    private prv_endereco_empregador_cidade
    'inicializa
    Private Sub  Class_Initialize()
        prv_empregador_ID="-" 
        prv_empregador_Nome="-" 
        prv_empregador_Email="-" 
        prv_empregador_Senha="-" 
        prv_empregador_Sexo="-" 
        prv_empregador_DataNascimento="-" 
        prv_empregador_Nacionalidade="-" 
        prv_empregador_RG="-" 
        prv_empregador_OrgaoEmissorRG="-" 
        prv_empregador_CEI="-" 
        prv_empregador_CPF="-" 
        prv_empregador_RecebeNewsletter="-" 
        prv_empregador_TelefoneResidencial="-" 
        prv_empregador_TelefoneComercial="-" 
        prv_empregador_TelefoneCelular="-" 
        prv_empregador_DataCriacao="-" 
        prv_empregador_DataExpiracaoAcesso="-" 
        prv_empregador_EnderecoID="-" 
        prv_empregador_StatusID="-"
        prv_endereco_empregador_cidade="-" 
        'endereco
        prv_endereco_empregador_ID="-" 
        prv_endereco_empregador_Logradouro="-" 
        prv_endereco_empregador_Numero="-" 
        prv_endereco_empregador_Bairro="-" 
        prv_endereco_empregador_Complemento="-" 
        prv_endereco_empregador_CEP="-" 
        prv_endereco_empregador_CidadeID="-" 
        prv_endereco_empregador_empregadorID="-" 
    end sub
    'finaliza
    Private Sub Class_Terminate()
        prv_empregador_ID="" 
        prv_empregador_Nome="" 
        prv_empregador_Email="" 
        prv_empregador_Senha="" 
        prv_empregador_Sexo="" 
        prv_empregador_DataNascimento="" 
        prv_empregador_Nacionalidade="" 
        prv_empregador_RG="" 
        prv_empregador_OrgaoEmissorRG="" 
        prv_empregador_CEI="" 
        prv_empregador_CPF="" 
        prv_empregador_RecebeNewsletter="" 
        prv_empregador_TelefoneResidencial="" 
        prv_empregador_TelefoneComercial="" 
        prv_empregador_TelefoneCelular="" 
        prv_empregador_DataCriacao="" 
        prv_empregador_DataExpiracaoAcesso="" 
        prv_empregador_EnderecoID="" 
        prv_empregador_StatusID="" 
        prv_endereco_empregador_ID="" 
        prv_endereco_empregador_Logradouro="" 
        prv_endereco_empregador_Numero="" 
        prv_endereco_empregador_Bairro="" 
        prv_endereco_empregador_Complemento="" 
        prv_endereco_empregador_CEP="" 
        prv_endereco_empregador_CidadeID="" 
        prv_endereco_empregador_empregadorID="" 
        prv_endereco_empregador_cidade="" 
    end sub
    'construtor GET

    Public property get empregador_ID() 
         empregador_ID=prv_empregador_ID
    end property

    Public property get empregador_Nome() 
         empregador_Nome=prv_empregador_Nome
    end property

    Public property get empregador_Email() 
         empregador_Email=prv_empregador_Email
    end property

    Public property get empregador_Senha() 
         empregador_Senha=prv_empregador_Senha
    end property

    Public property get empregador_Sexo() 
         empregador_Sexo=prv_empregador_Sexo
    end property

    Public property get empregador_DataNascimento() 
         empregador_DataNascimento=prv_empregador_DataNascimento
    end property

    Public property get empregador_Nacionalidade() 
         empregador_Nacionalidade=prv_empregador_Nacionalidade
    end property

    Public property get empregador_RG() 
         empregador_RG=prv_empregador_RG
    end property

    Public property get empregador_OrgaoEmissorRG() 
         empregador_OrgaoEmissorRG=prv_empregador_OrgaoEmissorRG
    end property

    Public property get empregador_CEI() 
         empregador_CEI=prv_empregador_CEI
    end property

    Public property get empregador_CPF() 
         empregador_CPF=prv_empregador_CPF
    end property

    Public property get empregador_RecebeNewsletter() 
         empregador_RecebeNewsletter=prv_empregador_RecebeNewsletter
    end property

    Public property get empregador_TelefoneResidencial() 
         empregador_TelefoneResidencial=prv_empregador_TelefoneResidencial
    end property

    Public property get empregador_TelefoneComercial() 
         empregador_TelefoneComercial=prv_empregador_TelefoneComercial
    end property

    Public property get empregador_TelefoneCelular() 
         empregador_TelefoneCelular=prv_empregador_TelefoneCelular
    end property

    Public property get empregador_DataCriacao() 
         empregador_DataCriacao=prv_empregador_DataCriacao
    end property

    Public property get empregador_DataExpiracaoAcesso() 
         empregador_DataExpiracaoAcesso=prv_empregador_DataExpiracaoAcesso
    end property

    Public property get empregador_EnderecoID() 
         empregador_EnderecoID=prv_empregador_EnderecoID
    end property

    Public property get empregador_StatusID() 
         empregador_StatusID=prv_empregador_StatusID
    end property



    Public property get empregador_Logradouro() 
         empregador_Logradouro=prv_endereco_empregador_Logradouro
    end property

    Public property get empregador_Numero() 
         empregador_Numero=prv_endereco_empregador_Numero
    end property

    Public property get empregador_Bairro() 
         empregador_Bairro=prv_endereco_empregador_Bairro
    end property

    Public property get empregador_Complemento() 
         empregador_Complemento=prv_endereco_empregador_Complemento
    end property

    Public property get empregador_CEP() 
         empregador_CEP=prv_endereco_empregador_CEP
    end property

    Public property get empregador_CidadeID() 
         empregador_CidadeID=prv_endereco_empregador_CidadeID
    end property

       Public property get  empregador_cidade() 
         empregador_cidade=prv_endereco_empregador_cidade
    end property

    Public property get empregador_empregadorID() 
         empregador_empregadorID=prv_endereco_empregador_empregadorID
    end property


    'construtor LET
    Public property let empregador_cidade(strIN_Cidade) 
         prv_endereco_empregador_cidade=strIN_Cidade
    end property
    Public property let empregador_ID(strIN_empregador_ID) 
         prv_empregador_ID=strIN_empregador_ID
    end property

    Public property let empregador_Nome(strIN_empregador_Nome) 
         prv_empregador_Nome=strIN_empregador_Nome
    end property

    Public property let empregador_Email(strIN_empregador_Email) 
         prv_empregador_Email=strIN_empregador_Email
    end property

    Public property let empregador_Senha(strIN_empregador_Senha) 
         prv_empregador_Senha=strIN_empregador_Senha
    end property

    Public property let empregador_Sexo(strIN_empregador_Sexo) 
         prv_empregador_Sexo=strIN_empregador_Sexo
    end property

    Public property let empregador_DataNascimento(strIN_empregador_DataNascimento) 
         prv_empregador_DataNascimento=strIN_empregador_DataNascimento
    end property

    Public property let empregador_Nacionalidade(strIN_empregador_Nacionalidade) 
         prv_empregador_Nacionalidade=strIN_empregador_Nacionalidade
    end property

    Public property let empregador_RG(strIN_empregador_RG) 
         prv_empregador_RG=strIN_empregador_RG
    end property

    Public property let empregador_OrgaoEmissorRG(strIN_empregador_OrgaoEmissorRG) 
         prv_empregador_OrgaoEmissorRG=strIN_empregador_OrgaoEmissorRG
    end property

    Public property let empregador_CEI(strIN_empregador_CEI) 
         prv_empregador_CEI=strIN_empregador_CEI
    end property

    Public property let empregador_CPF(strIN_empregador_CPF) 
         prv_empregador_CPF=strIN_empregador_CPF
    end property

    Public property let empregador_RecebeNewsletter(strIN_empregador_RecebeNewsletter) 
         prv_empregador_RecebeNewsletter=strIN_empregador_RecebeNewsletter
    end property

    Public property let empregador_TelefoneResidencial(strIN_empregador_TelefoneResidencial) 
         prv_empregador_TelefoneResidencial=strIN_empregador_TelefoneResidencial
    end property

    Public property let empregador_TelefoneComercial(strIN_empregador_TelefoneComercial) 
         prv_empregador_TelefoneComercial=strIN_empregador_TelefoneComercial
    end property

    Public property let empregador_TelefoneCelular(strIN_empregador_TelefoneCelular) 
         prv_empregador_TelefoneCelular=strIN_empregador_TelefoneCelular
    end property

    Public property let empregador_DataCriacao(strIN_empregador_DataCriacao) 
         prv_empregador_DataCriacao=strIN_empregador_DataCriacao
    end property

    Public property let empregador_DataExpiracaoAcesso(strIN_empregador_DataExpiracaoAcesso) 
         prv_empregador_DataExpiracaoAcesso=strIN_empregador_DataExpiracaoAcesso
    end property

    Public property let empregador_EnderecoID(strIN_empregador_EnderecoID) 
         prv_empregador_EnderecoID=strIN_empregador_EnderecoID
    end property

    Public property let empregador_StatusID(strIN_empregador_StatusID) 
         prv_empregador_StatusID=strIN_empregador_StatusID
    end property



    Public property let empregador_Logradouro(strIN_empregador_Logradouro) 
         prv_endereco_empregador_Logradouro=strIN_empregador_Logradouro
    end property

    Public property let empregador_Numero(strIN_empregador_Numero) 
         prv_endereco_empregador_Numero=strIN_empregador_Numero
    end property

    Public property let empregador_Bairro(strIN_empregador_Bairro) 
         prv_endereco_empregador_Bairro=strIN_empregador_Bairro
    end property

    Public property let empregador_Complemento(strIN_empregador_Complemento) 
         prv_endereco_empregador_Complemento=strIN_empregador_Complemento
    end property

    Public property let empregador_CEP(strIN_empregador_CEP) 
         prv_endereco_empregador_CEP=strIN_empregador_CEP
    end property

    Public property let empregador_CidadeID(strIN_empregador_CidadeID) 
         prv_endereco_empregador_CidadeID=strIN_empregador_CidadeID
    end property

    Public property let empregador_empregadorID(strIN_empregador_empregadorID) 
         prv_endereco_empregador_empregadorID=strIN_empregador_empregadorID
    end property

        'metodo para carregar dados do empregador
     '---------
    'empregador.carregaDadosEmpregador(emprID) 
    '--------- 
    public sub carregaDadosEmpregador(emprID)   
    'depois fine tune isso pra  carregar só o que eu preciso efetivamente
        if emprID="" OR not isnumeric(emprID)  then
            call err.Raise (002020, "Carregar Empregador", "Sessão Expirada ou Inválida")
           
        else
            dim objCon,  objRS, strMsg,  obCmd
            set objCon = Server.CreateObject ("ADODB.Connection")
            Set objRS = Server.CreateObject ("ADODB.Recordset")
            objCon.Open strConn
            leSQL=  "select *from view_carrega_empregador  WHERE ID="& emprID
   
    
   '  response.write leSQL



            strTexto=replace(strTexto,"--","") 
            objRS.open leSQL, objCon,,,adcmdtext        
            if (objRS.bof and objRS.eof) then
                prv_empregador_ID="" 
                prv_empregador_Nome="" 
                prv_empregador_Email="" 
                prv_empregador_Senha="" 
                prv_empregador_Sexo="" 
                prv_empregador_DataNascimento="" 
                prv_empregador_Nacionalidade="" 
                prv_empregador_RG="" 
                prv_empregador_OrgaoEmissorRG="" 
                prv_empregador_CEI="" 
                prv_empregador_CPF="" 
                prv_empregador_RecebeNewsletter="" 
                prv_empregador_TelefoneResidencial="" 
                prv_empregador_TelefoneComercial="" 
                prv_empregador_TelefoneCelular="" 
                prv_empregador_DataCriacao="" 
                prv_empregador_DataExpiracaoAcesso="" 
                prv_empregador_EnderecoID="" 
                prv_endereco_empregador_cidade=""
                prv_empregador_StatusID="" 
                prv_endereco_empregador_ID="" 
                prv_endereco_empregador_Logradouro="" 
                prv_endereco_empregador_Numero="" 
                prv_endereco_empregador_Bairro="" 
                prv_endereco_empregador_Complemento="" 
                prv_endereco_empregador_CEP="" 
                prv_endereco_empregador_CidadeID="" 
                prv_endereco_empregador_empregadorID=""   
                'carregaDadosEmpregador=false 
    'response.Write "nope"
            else
                prv_empregador_ID=objRS("ID")
                prv_empregador_Nome=objRS("Nome")
                prv_empregador_Email=objRS("Email")
                prv_empregador_Senha=objRS("Senha")
                prv_empregador_Sexo=objRS("Sexo")
                prv_empregador_DataNascimento=objRS("DataNascimento")
                prv_empregador_Nacionalidade=objRS("Nacionalidade")
  '  response.Write "OK"
                prv_endereco_empregador_cidade= objRS("cidadeNome")
                prv_empregador_RG=objRS("RG")
                prv_empregador_OrgaoEmissorRG=objRS("OrgaoEmissorRG")
                prv_empregador_CEI=objRS("CEI")
                prv_empregador_CPF=objRS("CPF")
                prv_empregador_RecebeNewsletter=objRS("RecebeNewsletter")
                prv_empregador_TelefoneResidencial=objRS("TelefoneResidencial")
                prv_empregador_TelefoneComercial=objRS("TelefoneComercial")
                prv_empregador_TelefoneCelular=objRS("TelefoneCelular")
                prv_empregador_DataCriacao=objRS("DataCriacao")
                prv_empregador_DataExpiracaoAcesso=objRS("DataExpiracaoAcesso")
                prv_empregador_EnderecoID=objRS("EnderecoID")
                prv_empregador_StatusID=objRS("StatusID")
                prv_endereco_empregador_Logradouro=objRS("Logradouro")
                prv_endereco_empregador_Numero=objRS("Numero")
                prv_endereco_empregador_Bairro=objRS("Bairro")
                prv_endereco_empregador_Complemento=objRS("Complemento")
                prv_endereco_empregador_CEP=objRS("CEP")
                prv_endereco_empregador_CidadeID=objRS("CidadeID")
                prv_endereco_empregador_empregadorID=objRS("empregadorID")
                'carregaDadosEmpregador=true
            end if
            
	        objRS.Close
	        set objRS=nothing
	        objCon.Close
	        set objCon=nothing
            set obCmd=nothing
        end if
    end sub
     '---------
    'empregador.setField(campo, valor, tipo)
    '--------- 
    function setField(campo, valor, tipo)
        dim FormaCampo
        if tipo= "numerico" then
            FormaCampo= valor
        elseif tipo="data" then
            FormaCampo= "'" &  valor & "'" 
        elseif tipo="texto"     then
            FormaCampo= "'" & valor & "'" 
        else 
            FormaCampo= "'" &  valor & "'" 
        end if
        dim objCon
        set objCon=server.CreateObject("ADODB.COnnection")
        objCon.execute "update Empregador.Empregador SET " & campo & "=" & FormaCampo & " where ID="  & prv_empregador_ID
    end function
     '---------
    'empregador.novoEmpregador
    '--------- 
    public function novoEmpregador ()
        'response.Write PeriodoInicio & PeriodoFim
        dim objCon,  objRS, strMsg, strICQ, obCmd
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.Open strConn
        objRS.CursorLocation = 2 
        objRS.CursorType = 1
        objRS.LockType = 3

        objRS.open "empregador.endereco",objCon,,,adCmdTable
        objRS.addNew  
        objRS("Logradouro") =prv_endereco_empregador_Logradouro
        objRS("Numero") =prv_endereco_empregador_Numero
        objRS("Bairro") =prv_endereco_empregador_Bairro
        objRS("Complemento") =prv_endereco_empregador_Complemento
        objRS("CEP") =prv_endereco_empregador_CEP
        objRS("CidadeID") =prv_endereco_empregador_CidadeID
        'objRS("empregadorID") =prv_endereco_empregador_empregadorID
        objRS.update
        prv_endereco_empregador_ID = objRS("ID")
        objRS.close

        objRS.open "empregador.empregador",objCon,,,adCmdTable
        objRS.addNew     
        
        objRS("Nome") =prv_empregador_Nome
        objRS("Email") =prv_empregador_Email
        objRS("Senha") =prv_empregador_Senha
        objRS("Sexo") =prv_empregador_Sexo
        objRS("DataNascimento") =month(prv_empregador_DataNascimento) & "/" & day(prv_empregador_DataNascimento) & "/" & year(prv_empregador_DataNascimento)
        objRS("Nacionalidade") =prv_empregador_Nacionalidade
        objRS("RG") =prv_empregador_RG
        objRS("OrgaoEmissorRG") =prv_empregador_OrgaoEmissorRG
        objRS("CEI") =prv_empregador_CEI
        objRS("CPF") =prv_empregador_CPF
        objRS("RecebeNewsletter") =prv_empregador_RecebeNewsletter
        objRS("TelefoneResidencial") =prv_empregador_TelefoneResidencial
        objRS("TelefoneComercial") =prv_empregador_TelefoneComercial
        objRS("TelefoneCelular") =prv_empregador_TelefoneCelular
        objRS("DataCriacao") =month(now) & "/" & day(now) & "/" & year(now)
        objRS("DataExpiracaoAcesso") ="01/01/2016"
        objRS("EnderecoID") =prv_endereco_empregador_ID
        objRS("StatusID") =1       
        objRS.update
        novoEmpregador = objRS("ID")
        objRS.close
        objCon.close
        set objCon =nothing
        Set objRS =nothing
    end function
    '---------
    'empregador.mudaDadosEmpregador
    '---------
    public function mudaDadosEmpregador (emprID)
        'response.Write PeriodoInicio & PeriodoFim
    'on error resume next
        dim objCon,  objRS, strMsg, strICQ, obCmd
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.Open strConn





      '  objRS.open "select * from empregador.endereco where empregadorID=" & emprID,objCon,adOpenForwardOnly , adLockOptimistic ,adCmdText
   '' response.Write "select * from empregador.endereco where empregadorID=" & emprID
   '     if objRS.bof and objRS.eof then
   '         objRS.addNew
   '     else
   '     end if
   '     if len(prv_endereco_empregador_Logradouro) then objRS("Logradouro") =prv_endereco_empregador_Logradouro
   '     if len(prv_endereco_empregador_Numero) then objRS("Numero") =prv_endereco_empregador_Numero
   '     if len(prv_endereco_empregador_Bairro) then objRS("Bairro") =prv_endereco_empregador_Bairro
   '     if len(prv_endereco_empregador_Complemento) then objRS("Complemento") =prv_endereco_empregador_Complemento
   '     if len(prv_endereco_empregador_CEP) then objRS("CEP") =prv_endereco_empregador_CEP
   '     if len(prv_endereco_empregador_CidadeID) then objRS("CidadeID") =prv_endereco_empregador_CidadeID
   '     'objRS("empregadorID") =prv_endereco_empregador_empregadorID
   '     objRS.update
   '     prv_endereco_empregador_ID = objRS("ID")
   '     objRS.close



        objRS.CursorLocation = adUseServer
        objRS.open "select * from empregador.empregador where ID=" & emprID,objCon,adOpenForwardOnly , adLockOptimistic ,adCmdText
 
        
        objRS("Nome") =prv_empregador_Nome
        objRS("Email") =prv_empregador_Email
        objRS("Senha") =prv_empregador_Senha
        objRS("Sexo") =prv_empregador_Sexo
        objRS("DataNascimento") =month(prv_empregador_DataNascimento) & "/" & day(prv_empregador_DataNascimento) & "/" & year(prv_empregador_DataNascimento)
        objRS("Nacionalidade") =prv_empregador_Nacionalidade
        objRS("RG") =prv_empregador_RG
        objRS("OrgaoEmissorRG") =prv_empregador_OrgaoEmissorRG
        objRS("CEI") =prv_empregador_CEI
        objRS("CPF") =prv_empregador_CPF
        objRS("RecebeNewsletter") =prv_empregador_RecebeNewsletter
        objRS("TelefoneResidencial") =prv_empregador_TelefoneResidencial
        objRS("TelefoneComercial") =prv_empregador_TelefoneComercial
        objRS("TelefoneCelular") =prv_empregador_TelefoneCelular
        objRS("DataCriacao") =month(now) & "/" & day(now) & "/" & year(now)
        objRS("DataExpiracaoAcesso") ="01/01/2016"
        objRS("EnderecoID") =null
        enderecoIDToDelete = objRS("EnderecoID")

       ' objRS("StatusID") =1       
        objRS.update  
        objRS.close


    if len(enderecoIDToDelete) > 0  then  objCon.execute "delete from empregador.endereco WHERE ID=" & enderecoIDToDelete
        set novoEnd = new endereco

        if len(prv_endereco_empregador_Logradouro) then novoEnd.Logradouro =prv_endereco_empregador_Logradouro
        if len(prv_endereco_empregador_Numero) then novoEnd.Numero =prv_endereco_empregador_Numero
        if len(prv_endereco_empregador_Bairro) then novoEnd.Bairro =prv_endereco_empregador_Bairro
        if len(prv_endereco_empregador_Complemento) then novoEnd.Complemento =prv_endereco_empregador_Complemento
        if len(prv_endereco_empregador_CEP) then novoEnd.CEP =prv_endereco_empregador_CEP
        if len(prv_endereco_empregador_CidadeID) then novoEnd.CidadeID =prv_endereco_empregador_CidadeID

       novoEndID = novoEnd.AddEndereco("empregador")
        set novoEnd=nothing
      objCon.execute "update empregador.empregador set enderecoID=" & novoEndID & " Where ID=" & emprID

        
        if err.number<>0 then
            mudaDadosEmpregador= "ERRO: " & err.Description
        else
            mudaDadosEmpregador="OK"
        end if
        objCon.close
        set objCon =nothing
        Set objRS =nothing
       
    end function
end class

'###############################################################################
'Classe Empregado  -  carrega os dados do empregado, adiciona novo empregado, adiciona e lista contratos.    
    'metodos
    'carregaDadosFunc
'       usa a propiedade ID que deve ser carregada quando o objeto é instanciado ou ela aparece automaticamente qdo o empregado é criado
'##############################################################################@

class empregado
    'PRVS
    private prv_ID 
    private prv_Nome 
    private prv_Email 
    private prv_DataNascimento 
    private prv_Sexo 
    private prv_QuantidadeDependentes 
    private prv_NomeMae 
    private prv_NomePai 
    private prv_RG 
    private prv_OrgaoEmissorRG 
    private prv_CPF 
    private prv_CarteiraTrabalho 
    private prv_PIS 
    private prv_DataCadPIS 
    private prv_CNH 
    private prv_PensaoAlimenticia 
    private prv_TelefoneResidencial 
    private prv_TelefoneCelular 
    private prv_TelefoneRecado 
    private prv_ContatoRecado 
    private prv_EmpregadorID     
    private prv_EstadoCivilID 
    private prv_EscolaridadeID 
    private prv_RegistroAtivo 
    private prv_existe
    private prv_rercordsetContrato
    private prv_enderecoID
    private prv_Logradouro
    private prv_Numero
    private prv_Bairro
    private prv_Complemento
    private prv_CEP
    private prv_Cidade
    private prv_Estado
    'vale transporte
    private prv_Quantidade 
    private prv_QuantidadePorExtenso 
    private prv_PeriodoInicio 
    private prv_PeriodoFim 
    private prv_MesReferencia 
    private prv_AnoReferencia 
    private prv_Valor 
    private prv_dtCriacao 
    private prv_TipoTransporte 
    private prv_ValorPorExtenso 
    'adVertencias
    private prv_advertencia_ID 
    private prv_advertencia_Titulo 
    private prv_advertencia_Texto 
    private prv_advertencia_MesReferencia 
    private prv_advertencia_AnoReferencia 
    private prv_advertencia_Data 
    private prv_advertencia_Testemunha 
    private prv_advertencia_RGTestemunha 
    private prv_advertencia_EmpregadoID 
    'suspensão
    private prv_Suspensao_ID 
    private prv_Suspensao_Titulo 
    private prv_Suspensao_Texto 
    private prv_Suspensao_Data 
    private prv_Suspensao_DataInicio 
    private prv_Suspensao_DataFim 
    private prv_Suspensao_Testemunha 
    private prv_Suspensao_RGTestemunha 
    private prv_Suspensao_EmpregadoID 
'adiantamento
    private prv_Adiantamento_ID 
    private prv_Adiantamento_Valor 
    private prv_Adiantamento_ValorPorExtenso 
    private prv_Adiantamento_Descricao 
    private prv_Adiantamento_MesReferencia 
    private prv_Adiantamento_AnoReferencia 
    private prv_Adiantamento_isPrimeiraParcela13 
    private prv_Adiantamento_EmpregadoID 
'afstamento
    private prv_afastamento_ID 
    private prv_afastamento_DataAfastamento 
    private prv_afastamento_DataRetorno 
    private prv_afastamento_Texto 
    private prv_afastamento_Motivo 
    private prv_afastamento_EmpregadoID 

    'inicializa
    Private Sub Class_Initialize()
        prv_ID="-" 
        prv_Nome="-" 
        prv_Email="-" 
        prv_DataNascimento="-" 
        prv_Sexo="-" 
        prv_QuantidadeDependentes="-" 
        prv_NomeMae="-" 
        prv_NomePai="-" 
        prv_RG="-" 
        prv_OrgaoEmissorRG="-" 
        prv_CPF="-" 
        prv_CarteiraTrabalho="-" 
        prv_PIS="-" 
        prv_DataCadPIS="-" 
        prv_CNH="-" 
        prv_PensaoAlimenticia="-" 
        prv_TelefoneResidencial="-" 
        prv_TelefoneCelular="-" 
        prv_TelefoneRecado="-" 
        prv_ContatoRecado="-" 
        prv_EmpregadorID="-" 
        prv_EnderecoID="-" 
        prv_EstadoCivilID="-" 
        prv_EscolaridadeID="-" 
        prv_RegistroAtivo="-" 
        prv_Logradouro="-" 
        prv_Numero="-" 
        prv_Bairro="-" 
        prv_Complemento="-" 
        prv_CEP="-" 
        prv_Cidade="-" 
        prv_Estado="-"        
        'Vale transporte
        prv_Quantidade="-" 
        prv_QuantidadePorExtenso="-" 
        prv_PeriodoInicio="-" 
        prv_PeriodoFim="-" 
        prv_MesReferencia="-" 
        prv_AnoReferencia="-" 
        prv_Valor="-" 
        prv_dtCriacao="-" 
        prv_TipoTransporte="-" 
        prv_ValorPorExtenso="-" 
    '  advertencia
        prv_advertencia_ID="-" 
        prv_advertencia_Titulo="-" 
        prv_advertencia_Texto="-" 
        prv_advertencia_MesReferencia="-" 
        prv_advertencia_AnoReferencia="-" 
        prv_advertencia_Data="-" 
        prv_advertencia_Testemunha="-" 
        prv_advertencia_RGTestemunha="-" 
        prv_advertencia_EmpregadoID="-" 
    'suspensão
        prv_Suspensao_ID="-" 
        prv_Suspensao_Titulo="-" 
        prv_Suspensao_Texto="-" 
        prv_Suspensao_Data="-" 
        prv_Suspensao_DataInicio="-" 
        prv_Suspensao_DataFim="-" 
        prv_Suspensao_Testemunha="-" 
        prv_Suspensao_RGTestemunha="-" 
        prv_Suspensao_EmpregadoID="-" 
    'adiantamento
        prv_Adiantamento_ID="-" 
        prv_Adiantamento_Valor="-" 
        prv_Adiantamento_ValorPorExtenso="-" 
        prv_Adiantamento_Descricao="-" 
        prv_Adiantamento_MesReferencia="-" 
        prv_Adiantamento_AnoReferencia="-" 
        prv_Adiantamento_isPrimeiraParcela13="-" 
        prv_Adiantamento_EmpregadoID="-" 
    'afastamento
        prv_afastamento_ID="-" 
        prv_afastamento_DataAfastamento="-" 
        prv_afastamento_DataRetorno="-" 
        prv_afastamento_Texto="-" 
        prv_afastamento_Motivo="-" 
        prv_afastamento_EmpregadoID="-" 

    end sub
    'finaliza
    Private Sub Class_Terminate()
        prv_ID="" 
        prv_Nome="" 
        prv_Email="" 
        prv_DataNascimento="" 
        prv_Sexo="" 
        prv_QuantidadeDependentes="" 
        prv_NomeMae="" 
        prv_NomePai="" 
        prv_RG="" 
        prv_OrgaoEmissorRG="" 
        prv_CPF="" 
        prv_CarteiraTrabalho="" 
        prv_PIS="" 
        prv_DataCadPIS="" 
        prv_CNH="" 
        prv_PensaoAlimenticia="" 
        prv_TelefoneResidencial="" 
        prv_TelefoneCelular="" 
        prv_TelefoneRecado="" 
        prv_ContatoRecado="" 
        prv_EmpregadorID="" 
        prv_EnderecoID="" 
        prv_EstadoCivilID="" 
        prv_EscolaridadeID="" 
        prv_RegistroAtivo="" 
        prv_existe=false
        prv_Logradouro=""  
        prv_Numero=""  
        prv_Bairro=""  
        prv_Complemento=""  
        prv_CEP=""  
        prv_Cidade=""  
        prv_Estado=""  
'   Vale transporte
        prv_Quantidade="" 
        prv_QuantidadePorExtenso="" 
        prv_PeriodoInicio="" 
        prv_PeriodoFim="" 
        prv_MesReferencia="" 
        prv_AnoReferencia="" 
        prv_Valor="" 
        prv_dtCriacao="" 
        prv_TipoTransporte="" 
        prv_ValorPorExtenso="" 
    'advertencia
        prv_advertencia_ID="" 
        prv_advertencia_Titulo="" 
        prv_advertencia_Texto="" 
        prv_advertencia_MesReferencia="" 
        prv_advertencia_AnoReferencia="" 
        prv_advertencia_Data="" 
        prv_advertencia_Testemunha="" 
        prv_advertencia_RGTestemunha="" 
        prv_advertencia_EmpregadoID="" 
'       suspensão
        prv_Suspensao_ID="" 
        prv_Suspensao_Titulo="" 
        prv_Suspensao_Texto="" 
        prv_Suspensao_Data="" 
        prv_Suspensao_DataInicio="" 
        prv_Suspensao_DataFim="" 
        prv_Suspensao_Testemunha="" 
        prv_Suspensao_RGTestemunha="" 
        prv_Suspensao_EmpregadoID="" 
    'adiantamento
        prv_Adiantamento_ID="" 
        prv_Adiantamento_Valor="" 
        prv_Adiantamento_ValorPorExtenso="" 
        prv_Adiantamento_Descricao="" 
        prv_Adiantamento_MesReferencia="" 
        prv_Adiantamento_AnoReferencia="" 
        prv_Adiantamento_isPrimeiraParcela13="" 
        prv_Adiantamento_EmpregadoID="" 
    'afastamento
        prv_afastamento_ID="" 
        prv_afastamento_DataAfastamento="" 
        prv_afastamento_DataRetorno="" 
        prv_afastamento_Texto="" 
        prv_afastamento_Motivo="" 
        prv_afastamento_EmpregadoID="" 

   end sub

    'construtor GET
    Public property get existe() 
         existe=prv_existe
    end property
    Public property get ID() 
         ID=prv_ID
    end property

    Public property get Nome() 
         Nome=prv_Nome
    end property

    Public property get Email() 
         Email=prv_Email
    end property

    Public property get DataNascimento() 
         DataNascimento=prv_DataNascimento
    end property

    Public property get Sexo() 
         Sexo=prv_Sexo
    end property

    Public property get QuantidadeDependentes() 
         QuantidadeDependentes=prv_QuantidadeDependentes
    end property

    Public property get NomeMae() 
         NomeMae=prv_NomeMae
    end property

    Public property get NomePai() 
         NomePai=prv_NomePai
    end property

    Public property get RG() 
         RG=prv_RG
    end property

    Public property get OrgaoEmissorRG() 
         OrgaoEmissorRG=prv_OrgaoEmissorRG
    end property

    Public property get CPF() 
         CPF=prv_CPF
    end property

    Public property get CarteiraTrabalho() 
         CarteiraTrabalho=prv_CarteiraTrabalho
    end property

    Public property get PIS() 
         PIS=prv_PIS
    end property

    Public property get DataCadPIS() 
         DataCadPIS=prv_DataCadPIS
    end property

    Public property get CNH() 
         CNH=prv_CNH
    end property

    Public property get PensaoAlimenticia() 
         PensaoAlimenticia=prv_PensaoAlimenticia
    end property

    Public property get TelefoneResidencial() 
         TelefoneResidencial=prv_TelefoneResidencial
    end property

    Public property get TelefoneCelular() 
         TelefoneCelular=prv_TelefoneCelular
    end property

    Public property get TelefoneRecado() 
         TelefoneRecado=prv_TelefoneRecado
    end property

    Public property get ContatoRecado() 
         ContatoRecado=prv_ContatoRecado
    end property

    Public property get EmpregadorID() 
         EmpregadorID=prv_EmpregadorID
    end property

    Public property get EnderecoID() 
         EnderecoID=prv_EnderecoID
    end property

    Public property get EstadoCivilID() 
         EstadoCivilID=prv_EstadoCivilID
    end property

    Public property get EscolaridadeID() 
         EscolaridadeID=prv_EscolaridadeID
    end property

    Public property get RegistroAtivo() 
         RegistroAtivo=prv_RegistroAtivo
    end property
    'endereco
    Public property get logradouro() 
         logradouro=prv_Logradouro
    end property
    Public property get numero() 
         numero=prv_numero
    end property
    Public property get bairro() 
         bairro=prv_bairro
    end property
    Public property get CEP() 
         CEP=prv_CEP
    end property
    Public property get cidade() 
         cidade=prv_cidade
    end property
    Public property get estado() 
         estado=prv_estado
    end property

    Public property get complemento() 
         complemento=prv_complemento
    end property

    Public property get Quantidade() 
         Quantidade=prv_Quantidade
    end property

    Public property get QuantidadePorExtenso() 
         QuantidadePorExtenso=prv_QuantidadePorExtenso
    end property

    Public property get PeriodoInicio() 
         PeriodoInicio=prv_PeriodoInicio
    end property

    Public property get PeriodoFim() 
         PeriodoFim=prv_PeriodoFim
    end property

    Public property get MesReferencia() 
         MesReferencia=prv_MesReferencia
    end property

    Public property get AnoReferencia() 
         AnoReferencia=prv_AnoReferencia
    end property

    Public property get Valor() 
         Valor=prv_Valor
    end property

    Public property get dtCriacao() 
         dtCriacao=prv_dtCriacao
    end property

    Public property get TipoTransporte() 
         TipoTransporte=prv_TipoTransporte
    end property

    Public property get ValorPorExtenso() 
         ValorPorExtenso=prv_ValorPorExtenso
    end property

    'advertencias
    Public property get advertencia_ID() 
         advertencia_ID=prv_advertencia_ID
    end property

    Public property get advertencia_Titulo() 
         advertencia_Titulo=prv_advertencia_Titulo
    end property

    Public property get advertencia_Texto() 
         advertencia_Texto=prv_advertencia_Texto
    end property

    Public property get advertencia_MesReferencia() 
         advertencia_MesReferencia=prv_advertencia_MesReferencia
    end property

    Public property get advertencia_AnoReferencia() 
         advertencia_AnoReferencia=prv_advertencia_AnoReferencia
    end property

    Public property get advertencia_Data() 
         advertencia_Data=prv_advertencia_Data
    end property

    Public property get advertencia_Testemunha() 
         advertencia_Testemunha=prv_advertencia_Testemunha
    end property

    Public property get advertencia_RGTestemunha() 
         advertencia_RGTestemunha=prv_advertencia_RGTestemunha
    end property

    Public property get advertencia_EmpregadoID() 
         advertencia_EmpregadoID=prv_advertencia_EmpregadoID
    end property
'suspensão
    Public property get Suspensao_ID() 
         Suspensao_ID = prv_Suspensao_ID
    end property

    Public property get Suspensao_Titulo() 
         Suspensao_Titulo = prv_Suspensao_Titulo
    end property

    Public property get Suspensao_Texto() 
         Suspensao_Texto = prv_Suspensao_Texto
    end property

    Public property get Suspensao_Data() 
         Suspensao_Data = prv_Suspensao_Data
    end property

    Public property get Suspensao_DataInicio() 
         Suspensao_DataInicio = prv_Suspensao_DataInicio
    end property

    Public property get Suspensao_DataFim() 
         Suspensao_DataFim = prv_Suspensao_DataFim
    end property

    Public property get Suspensao_Testemunha() 
         Suspensao_Testemunha = prv_Suspensao_Testemunha
    end property

    Public property get Suspensao_RGTestemunha() 
         Suspensao_RGTestemunha = prv_Suspensao_RGTestemunha
    end property

    Public property get Suspensao_EmpregadoID() 
         Suspensao_EmpregadoID = prv_Suspensao_EmpregadoID
    end property
'adiantamento
    Public property get Adiantamento_ID() 
         Adiantamento_ID = prv_Adiantamento_ID
    end property

    Public property get Adiantamento_Valor() 
         Adiantamento_Valor = prv_Adiantamento_Valor
    end property

    Public property get Adiantamento_ValorPorExtenso() 
         Adiantamento_ValorPorExtenso = prv_Adiantamento_ValorPorExtenso
    end property

    Public property get Adiantamento_Descricao() 
         Adiantamento_Descricao = prv_Adiantamento_Descricao
    end property

    Public property get Adiantamento_MesReferencia() 
         Adiantamento_MesReferencia = prv_Adiantamento_MesReferencia
    end property

    Public property get Adiantamento_AnoReferencia() 
         Adiantamento_AnoReferencia = prv_Adiantamento_AnoReferencia
    end property

    Public property get Adiantamento_isPrimeiraParcela13() 
         Adiantamento_isPrimeiraParcela13 = prv_Adiantamento_isPrimeiraParcela13
    end property

    Public property get Adiantamento_EmpregadoID() 
         Adiantamento_EmpregadoID = prv_Adiantamento_EmpregadoID
    end property
    'afastamento
    Public property get afastamento_ID() 
            afastamento_ID = prv_afastamento_ID
    end property

    Public property get afastamento_DataAfastamento() 
            afastamento_DataAfastamento = prv_afastamento_DataAfastamento
    end property

    Public property get afastamento_DataRetorno() 
            afastamento_DataRetorno = prv_afastamento_DataRetorno
    end property

    Public property get afastamento_Texto() 
            afastamento_Texto = prv_afastamento_Texto
    end property

    Public property get afastamento_Motivo() 
            afastamento_Motivo = prv_afastamento_Motivo
    end property

    Public property get afastamento_EmpregadoID() 
            afastamento_EmpregadoID = prv_afastamento_EmpregadoID
    end property

    '---------------------
    'construtor LET
    '---------------------
    Public property let ID(strIN_ID) 
         prv_ID=strIN_ID
    end property

    Public property let Nome(strIN_Nome) 
         prv_Nome=strIN_Nome
    end property

    Public property let Email(strIN_Email) 
         prv_Email=strIN_Email
    end property

    Public property let DataNascimento(strIN_DataNascimento) 
         prv_DataNascimento=strIN_DataNascimento
    end property

    Public property let Sexo(strIN_Sexo) 
         prv_Sexo=strIN_Sexo
    end property

    Public property let QuantidadeDependentes(strIN_QuantidadeDependentes) 
         prv_QuantidadeDependentes=strIN_QuantidadeDependentes
    end property

    Public property let NomeMae(strIN_NomeMae) 
         prv_NomeMae=strIN_NomeMae
    end property

    Public property let NomePai(strIN_NomePai) 
         prv_NomePai=strIN_NomePai
    end property

    Public property let RG(strIN_RG) 
         prv_RG=strIN_RG
    end property

    Public property let OrgaoEmissorRG(strIN_OrgaoEmissorRG) 
         prv_OrgaoEmissorRG=strIN_OrgaoEmissorRG
    end property

    Public property let CPF(strIN_CPF) 
         prv_CPF=strIN_CPF
    end property

    Public property let CarteiraTrabalho(strIN_CarteiraTrabalho) 
         prv_CarteiraTrabalho=strIN_CarteiraTrabalho
    end property

    Public property let PIS(strIN_PIS) 
         prv_PIS=strIN_PIS
    end property

    Public property let DataCadPIS(strIN_DataCadPIS) 
         prv_DataCadPIS=strIN_DataCadPIS
    end property

    Public property let CNH(strIN_CNH) 
         prv_CNH=strIN_CNH
    end property

    Public property let PensaoAlimenticia(strIN_PensaoAlimenticia) 
         prv_PensaoAlimenticia=strIN_PensaoAlimenticia
    end property

    Public property let TelefoneResidencial(strIN_TelefoneResidencial) 
         prv_TelefoneResidencial=strIN_TelefoneResidencial
    end property

    Public property let TelefoneCelular(strIN_TelefoneCelular) 
         prv_TelefoneCelular=strIN_TelefoneCelular
    end property

    Public property let TelefoneRecado(strIN_TelefoneRecado) 
         prv_TelefoneRecado=strIN_TelefoneRecado
    end property

    Public property let ContatoRecado(strIN_ContatoRecado) 
         prv_ContatoRecado=strIN_ContatoRecado
    end property

    Public property let EmpregadorID(strIN_EmpregadorID) 
         prv_EmpregadorID=strIN_EmpregadorID
    end property

    Public property let EnderecoID(strIN_EnderecoID) 
         prv_EnderecoID=strIN_EnderecoID
    end property

    Public property let EstadoCivilID(strIN_EstadoCivilID) 
         prv_EstadoCivilID=strIN_EstadoCivilID
    end property

    Public property let EscolaridadeID(strIN_EscolaridadeID) 
         prv_EscolaridadeID=strIN_EscolaridadeID
    end property

    Public property let RegistroAtivo(strIN_RegistroAtivo) 
         prv_RegistroAtivo=strIN_RegistroAtivo
    end property
      'endereco
     Public property let logradouro(strIN_logradouro) 
         prv_logradouro=strIN_logradouro
    end property
    Public property let numero(strIN_numero) 
         prv_numero=strIN_numero
    end property
    Public property let bairro(strIN_bairro) 
         prv_bairro=strIN_bairro
    end property
    Public property let complemento(strIN_complemento) 
         prv_complemento=strIN_complemento
    end property
    Public property let CEP(strIN_CEP) 
         prv_CEP=strIN_CEP
    end property
    Public property let cidade(strIN_cidade) 
         prv_cidade=strIN_cidade
    end property
    Public property let estado(strIN_estado) 
         prv_estado=strIN_estado
    end property

    'vale transporte
    Public property let Quantidade(strIN_endEmpregador_Quantidade) 
         prv_Quantidade=strIN_endEmpregador_Quantidade
    end property

    Public property let QuantidadePorExtenso(strIN_endEmpregador_QuantidadePorExtenso) 
         prv_QuantidadePorExtenso=strIN_endEmpregador_QuantidadePorExtenso
    end property

    Public property let PeriodoInicio(strIN_endEmpregador_PeriodoInicio) 
         prv_PeriodoInicio=strIN_endEmpregador_PeriodoInicio
    end property

    Public property let PeriodoFim(strIN_endEmpregador_PeriodoFim) 
         prv_PeriodoFim=strIN_endEmpregador_PeriodoFim
    end property

    Public property let MesReferencia(strIN_endEmpregador_MesReferencia) 
         prv_MesReferencia=strIN_endEmpregador_MesReferencia
    end property

    Public property let AnoReferencia(strIN_endEmpregador_AnoReferencia) 
         prv_AnoReferencia=strIN_endEmpregador_AnoReferencia
    end property

    Public property let Valor(strIN_endEmpregador_Valor) 
         prv_Valor=strIN_endEmpregador_Valor
    end property

    Public property let dtCriacao(strIN_endEmpregador_dtCriacao) 
         prv_dtCriacao=strIN_endEmpregador_dtCriacao
    end property

    Public property let TipoTransporte(strIN_endEmpregador_TipoTransporte) 
         prv_TipoTransporte=strIN_endEmpregador_TipoTransporte
    end property

    Public property let ValorPorExtenso(strIN_endEmpregador_ValorPorExtenso) 
         prv_ValorPorExtenso=strIN_endEmpregador_ValorPorExtenso
    end property
    'advertencias
    Public property let advertencia_ID(strIN_advertencia_ID) 
         prv_advertencia_ID=strIN_advertencia_ID
    end property

    Public property let advertencia_Titulo(strIN_advertencia_Titulo) 
         prv_advertencia_Titulo=strIN_advertencia_Titulo
    end property

    Public property let advertencia_Texto(strIN_advertencia_Texto) 
         prv_advertencia_Texto=strIN_advertencia_Texto
    end property

    Public property let advertencia_MesReferencia(strIN_advertencia_MesReferencia) 
         prv_advertencia_MesReferencia=strIN_advertencia_MesReferencia
    end property

    Public property let advertencia_AnoReferencia(strIN_advertencia_AnoReferencia) 
         prv_advertencia_AnoReferencia=strIN_advertencia_AnoReferencia
    end property

    Public property let advertencia_Data(strIN_advertencia_Data) 
         prv_advertencia_Data=strIN_advertencia_Data
    end property

    Public property let advertencia_Testemunha(strIN_advertencia_Testemunha) 
         prv_advertencia_Testemunha=strIN_advertencia_Testemunha
    end property

    Public property let advertencia_RGTestemunha(strIN_advertencia_RGTestemunha) 
         prv_advertencia_RGTestemunha=strIN_advertencia_RGTestemunha
    end property

    Public property let advertencia_EmpregadoID(strIN_advertencia_EmpregadoID) 
         prv_advertencia_EmpregadoID=strIN_advertencia_EmpregadoID
    end property

'' suspensão
    Public property let Suspensao_ID(strIN_ID) 
         prv_Suspensao_ID=strIN_ID
    end property

    Public property let Suspensao_Titulo(strIN_Titulo) 
         prv_Suspensao_Titulo=strIN_Titulo
    end property

    Public property let Suspensao_Texto(strIN_Texto) 
         prv_Suspensao_Texto=strIN_Texto
    end property

    Public property let Suspensao_Data(strIN_Data) 
         prv_Suspensao_Data=strIN_Data
    end property

    Public property let Suspensao_DataInicio(strIN_DataInicio) 
         prv_Suspensao_DataInicio=strIN_DataInicio
    end property

    Public property let Suspensao_DataFim(strIN_DataFim) 
         prv_Suspensao_DataFim=strIN_DataFim
    end property

    Public property let Suspensao_Testemunha(strIN_Testemunha) 
         prv_Suspensao_Testemunha=strIN_Testemunha
    end property

    Public property let Suspensao_RGTestemunha(strIN_RGTestemunha) 
         prv_Suspensao_RGTestemunha=strIN_RGTestemunha
    end property

    Public property let Suspensao_EmpregadoID(strIN_EmpregadoID) 
         prv_Suspensao_EmpregadoID=strIN_EmpregadoID
    end property
'adiantamento
    Public property let Adiantamento_ID(strIN_ID) 
         prv_Adiantamento_ID=strIN_ID
    end property

    Public property let Adiantamento_Valor(strIN_Valor) 
         prv_Adiantamento_Valor=strIN_Valor
    end property

    Public property let Adiantamento_ValorPorExtenso(strIN_ValorPorExtenso) 
         prv_Adiantamento_ValorPorExtenso=strIN_ValorPorExtenso
    end property

    Public property let Adiantamento_Descricao(strIN_Descricao) 
         prv_Adiantamento_Descricao=strIN_Descricao
    end property

    Public property let Adiantamento_MesReferencia(strIN_MesReferencia) 
         prv_Adiantamento_MesReferencia=strIN_MesReferencia
    end property

    Public property let Adiantamento_AnoReferencia(strIN_AnoReferencia) 
         prv_Adiantamento_AnoReferencia=strIN_AnoReferencia
    end property

    Public property let Adiantamento_isPrimeiraParcela13(strIN_isPrimeiraParcela13) 
         prv_Adiantamento_isPrimeiraParcela13=strIN_isPrimeiraParcela13
    end property

    Public property let Adiantamento_EmpregadoID(strIN_EmpregadoID) 
         prv_Adiantamento_EmpregadoID=strIN_EmpregadoID
    end property
    'afastamento
    Public property let afastamento_ID(strIN_ID) 
         prv_afastamento_ID=strIN_ID
    end property

    Public property let afastamento_DataAfastamento(strIN_DataAfastamento) 
         prv_afastamento_DataAfastamento=strIN_DataAfastamento
    end property

    Public property let afastamento_DataRetorno(strIN_DataRetorno) 
         prv_afastamento_DataRetorno=strIN_DataRetorno
    end property

    Public property let afastamento_Texto(strIN_Texto) 
         prv_afastamento_Texto=strIN_Texto
    end property

    Public property let afastamento_Motivo(strIN_MotivoID) 
         prv_afastamento_Motivo=strIN_MotivoID
    end property

    Public property let afastamento_EmpregadoID(strIN_EmpregadoID) 
         prv_afastamento_EmpregadoID=strIN_EmpregadoID
    end property
    '========================
    '   MÉTODOS
    '========================
    '========================
    '   CARREGAR DADOS - MÉTODO PRINCIPAL
    '========================
    public function carregaDadosFunc()  'Função principal. carrega todas as propriedades do funcionario.   
        if prv_ID="-" OR prv_empregadorID="-" then
            call err.Raise (001020, "carregar dados do funcionario", " faltando ID do funcionario ou do empregador - obrigatorios")
        else
            dim objCon,  objRS, strMsg,  obCmd
            set objCon = Server.CreateObject ("ADODB.Connection")
            Set objRS = Server.CreateObject ("ADODB.Recordset")
            set obCmd = server.CreateObject("ADODB.Command")
            objCon.Open strConn
            obCmd.ActiveConnection = objCon
            obCmd.Prepared = true

            leSQL=  "select "

                leSQL=leSQL&  " Empregado.Empregado.ID as prv_ID, "
                leSQL=leSQL&  " Empregado.Empregado.nome as prv_Nome, "
                leSQL=leSQL&  " Empregado.Empregado.email as prv_Email, "
                leSQL=leSQL&  " Empregado.empregado.DataNascimento as prv_DataNascimento, "
                leSQL=leSQL&  " Empregado.Empregado.Sexo as prv_Sexo, "
                leSQL=leSQL&  " Empregado.Empregado.QuantidadeDependentes as prv_QuantidadeDependentes, "
                leSQL=leSQL&  " Empregado.Empregado.NomeMae as prv_NomeMae, "
                leSQL=leSQL&  " Empregado.Empregado.NomePai as prv_NomePai, "
                leSQL=leSQL&  " Empregado.Empregado.RG as prv_RG, "
                leSQL=leSQL&  " Empregado.Empregado.OrgaoEmissorRG as prv_OrgaoEmissorRG, "
                leSQL=leSQL&  " Empregado.Empregado.CPF as prv_CPF, "
                leSQL=leSQL&  " Empregado.Empregado.CarteiraTrabalho as prv_CarteiraTrabalho, "
                leSQL=leSQL&  " Empregado.Empregado.PIS as prv_PIS, "
                leSQL=leSQL&  " Empregado.Empregado.DataCadPIS as prv_DataCadPIS, "
                leSQL=leSQL&  " Empregado.Empregado.CNH as prv_CNH, "
                leSQL=leSQL&  " Empregado.Empregado.PensaoAlimenticia as prv_PensaoAlimenticia, "
                leSQL=leSQL&  " Empregado.Empregado.TelefoneResidencial as prv_TelefoneResidencial, "
                leSQL=leSQL&  " Empregado.Empregado.TelefoneCelular as prv_TelefoneCelular, "
                leSQL=leSQL&  " Empregado.Empregado.TelefoneRecado as prv_TelefoneRecado, "
                leSQL=leSQL&  " Empregado.Empregado.ContatoRecado as prv_ContatoRecado, "
                leSQL=leSQL&  " Empregado.Empregado.EmpregadorID as prv_EmpregadorID, "
                leSQL=leSQL&  " Empregado.Empregado.EnderecoID as prv_EnderecoID, "
                leSQL=leSQL&  " Empregado.Empregado.EstadoCivilID as prv_EstadoCivilID, "
                leSQL=leSQL&  " Empregado.Empregado.EscolaridadeID as prv_EscolaridadeID, "
                leSQL=leSQL&  " Empregado.Empregado.RegistroAtivo as prv_RegistroAtivo, "
                leSQL=leSQL&  " Empregado.endereco.logradouro as prv_Logradouro, "
                leSQL=leSQL&  " Empregado.endereco.Numero as prv_Numero, "
                leSQL=leSQL&  " Empregado.endereco.Bairro as prv_Bairro, "
                leSQL=leSQL&  " Empregado.endereco.Complemento as prv_Complemento, "
                leSQL=leSQL&  " Empregado.endereco.CEP as prv_CEP, "
                leSQL=leSQL&  " dbo.cidade.Nome as prv_Cidade, "
                leSQL=leSQL&  " dbo.estado.nome as prv_Estado "
    
              
                leSQL=leSQL&  " from "
                leSQL=leSQL&  "Empregado.Empregado inner join empregado.endereco on Empregado.enderecoID=empregado.endereco.ID "
                leSQL=leSQL& " inner join dbo.cidade on Empregado.endereco.cidadeID=cidade.ID "
                leSQL=leSQL& " inner join dbo.estado on cidade.estadoID=estado.ID"    
                leSQL=leSQL& " where empregado.empregado.ID=(?) AND empregado.empregadorID=(?)"
                'leSQL=leSQL& " where empregado.empregado.ID=3 AND empregado.empregadorID=1"
            'response.Write leSQL
           ' leSQL=replace(leSQL,"--","")
            Set newParameter = obCmd.CreateParameter("@empregado.ID", adInteger, adParamInput, 4, prv_ID)
            obCmd.Parameters.Append newParameter
            Set newParameter = obCmd.CreateParameter("@empregadorID", adInteger, adParamInput, 4, prv_empregadorID)
            obCmd.Parameters.Append newParameter 
            obCmd.CommandText =leSQL 
            set objRS=obCmd.EXECUTE
        
            if (objRS.bof and objRS.eof) then
                prv_ID="" 
                prv_Nome="" 
                prv_Email="" 
                prv_DataNascimento="" 
                prv_Sexo="" 
                prv_QuantidadeDependentes="" 
                prv_NomeMae="" 
                prv_NomePai="" 
                prv_RG="" 
                prv_OrgaoEmissorRG="" 
                prv_CPF="" 
                prv_CarteiraTrabalho="" 
                prv_PIS="" 
                prv_DataCadPIS="" 
                prv_CNH="" 
                prv_PensaoAlimenticia="" 
                prv_TelefoneResidencial="" 
                prv_TelefoneCelular="" 
                prv_TelefoneRecado="" 
                prv_ContatoRecado="" 
                prv_EmpregadorID="" 
                prv_EnderecoID="" 
                prv_EstadoCivilID="" 
                prv_EscolaridadeID="" 
                prv_RegistroAtivo=""
                prv_existe=false      
            else
                prv_ID=objRS("prv_ID")
                prv_Nome=objRS("prv_Nome")
                prv_Email=objRS("prv_Email")
                prv_DataNascimento=objRS("prv_DataNascimento")
                prv_Sexo=objRS("prv_Sexo")
                prv_QuantidadeDependentes=objRS("prv_QuantidadeDependentes")
                prv_NomeMae=objRS("prv_NomeMae")
                prv_NomePai=objRS("prv_NomePai")
                prv_RG=objRS("prv_RG")
                prv_OrgaoEmissorRG=objRS("prv_OrgaoEmissorRG")
                prv_CPF=objRS("prv_CPF")
                prv_CarteiraTrabalho=objRS("prv_CarteiraTrabalho")
                prv_PIS=objRS("prv_PIS")
                IF ISDATE( objRS("prv_DataCadPIS") ) THEN 
                    prv_DataCadPIS=day(objRS("prv_DataCadPIS") ) & "/" & month(objRS("prv_DataCadPIS") ) & "/" & year(objRS("prv_DataCadPIS") )
                ELSE 
                    prv_DataCadPIS=null
                end if
               
                prv_CNH=objRS("prv_CNH")
                prv_PensaoAlimenticia=objRS("prv_PensaoAlimenticia")
                prv_TelefoneResidencial=objRS("prv_TelefoneResidencial")
                prv_TelefoneCelular=objRS("prv_TelefoneCelular")
                prv_TelefoneRecado=objRS("prv_TelefoneRecado")
                prv_ContatoRecado=objRS("prv_ContatoRecado")
                prv_EmpregadorID=objRS("prv_EmpregadorID")
                prv_EnderecoID=objRS("prv_EnderecoID")
                prv_EstadoCivilID=objRS("prv_EstadoCivilID")
                prv_EscolaridadeID=objRS("prv_EscolaridadeID")
                prv_RegistroAtivo=objRS("prv_RegistroAtivo")
                prv_Logradouro=objRS("prv_Logradouro")
                prv_Numero=objRS("prv_Numero")  
                prv_Bairro=objRS("prv_Bairro")  
                prv_Complemento=objRS("prv_Complemento")  
                prv_CEP=objRS("prv_CEP")  
                prv_Cidade=objRS("prv_Cidade")  
                prv_Estado=objRS("prv_Estado") 



                prv_existe=true
            end if
            carregaDadosFunc=prv_existe
	        objRS.Close
	        set objRS=nothing
	        objCon.Close
	        set objCon=nothing
            set obCmd=nothing
        end if
    end function
    '========================
    '  13  SALÁRIO
    '========================
    public function calcular13Salario(ano, parcela)
        dim objCon,  objRS, strMsg,  obCmd, seisPorCento, quantidadeVAles
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset") 
        objCon.Open strConn    
        dim objContrato, bolThereIsAContrato, vlrFalta, totAdiantamentos, totAdiantamentos13, salarioBase, AliquotaIR, totFaltas
        dim TotMes
         set objContrato = new Contrato
        bolThereIsAContrato = objContrato.getFkrtContrato( prv_ID, true,0)
        if bolThereIsAContrato then  
            anoAdmissao = year(objContrato.dataAdmissao)
            salarioBase = cdbl(objContrato.salario)
            if anoAdmissao<ano then  
                'foi admitido ha mais de um ano
                ' calculo integral
                for x=1 to 12
                   set lasFaltas = ME.getRecorsetOfFaltasDoMes(x, ano, justificadas)
                    if not (lasFaltas.BOF and lasFaltas.EOF) then 
                        while not lasFaltas.eof
                            totFaltas=totFaltas+1
                            if totFaltas<15 then
                                totMes=totMes+1
                            end if
                            lasFaltas.movenext
                        wend
                    end if
                    totFaltas=0
                    set lasFaltas =nothing
                NEXT
            elseif anoAdmissao=ano then
                'calculo proporcional
                dataAtual = month(now) & "/1/" & year(now)
                diferenca = datediff("d",dataAtual, dtContratacao )
                if diferenca<0  then diferenca=diferenca*-1
                if diferenca<365 then
                    'o lance dos 15 dias
                    totMes =   cint( datediff("d",dataAtual, dtContratacao )/30 )   
                else
                    totMes=12
                end if
            else
                'erro
                totMes=0
            end if
            if  totMes  >0 then
                if parcela=1 then
                    calcular13Salario= cdbl(salarioBase) /12 * totMes
                else
                    'agora o bixo pega
                    '1 - INSS
                    chkSalario=replace(salarioBase,",",".")
                    leSQL="Select AliquotaEmpregado, AliquotaEmpregador from Aliquota.INSS where (" & chkSalario 
                    leSQL = leSQL & " between ValorInicial AND ValorFinal) and ANO=" & ano
            'response.Write leSQL
                    objRs.open leSQL, objCon,,,adcmdtext
                    if (objRS.bof AND objRS.EOF)  then
                        AliquotaEmpregado=0
                        AliquotaEmpregador=0
                    else
                        AliquotaEmpregado=cdbl(objRS("AliquotaEmpregado"))
                        AliquotaEmpregador=cdbl(objRS("AliquotaEmpregador"))

                    end if    
                    objRS.close
                    
                    inssEmpregador = salarioBase * cdbl( AliquotaEmpregador )
            '       pegar aliquota I.R.
                    leSQL="Select Aliquota, ParcelaADeduzir from Aliquota.ImpostoRenda where (" & chkSalario 
                    leSQL = leSQL & " between ValorInicial AND ValorFinal) and ANO=" & ano
                    objRs.open leSQL, objCon,,,adcmdtext
                    if (objRS.bof AND objRS.EOF)  then
                        AliquotaIR=0
                        ParcelaADeduzir=0
                    else
                        AliquotaIR= cdbl( objRS("Aliquota") )
                        ParcelaADeduzir=cdbl(objRS("ParcelaADeduzir") )
                    end if
                    objRS.close      
                    dim pensaoAlimenticia 
                    if me.PEnsaoAlimenticia<>"" then pensaoAlimenticia = cdbl(me.PEnsaoAlimenticia) ELSE pensaoAlimenticia=0
                    dim quantDependentes
                    if me.QuantidadeDependentes<>"" then quantDependentes = cint (me.QuantidadeDependentes) ELSE quantDependentes=0
                    dim descontoPorDependente
                    descontoPorDependente = valDescontoDependente * quantDependentes'descontado da base de calculo para IR     

                    

                    contribuicaoINSS = cdbl(salarioBase) * cdbl( AliquotaEmpregado)
                    if contribuicaoINSS>= maximoDescontoINSS then contribuicaoINSS=maximoDescontoINSS
                    contribuicaoIR = salarioBase - contribuicaoINSS - descontoPorDependente - pensaoAlimenticia
                    descontoIR = (contribuicaoIR * AliquotaIR)-ParcelaADeduzir
'pega adiantamento 13 salario
                    set adiant13Salario = me.getRecordsetOfAdiantamentos(true)
                    if adiant13Salario.bof and adiant13Salario.eof then
                        valorAdiantamento = 0
                    else
                        valorAdiantamento=cdbl(adiant13Salario("valor"))
                    end if
                    set adiant13Salario =nothing 
                    FGTS= salarioBase*0.08
                    valorAPAgar= salarioBase - valorAdiantamento - descontoIR - contribuicaoINSS - pensaoAlimenticia- FGTS
                    
                    objCon.execute "delete from empregado.salario where EmpregadoID=" & prv_ID & " AND is13salario='true' AND anoReferencia=" & ano
                    objRS.CursorType = 1
                    objRS.LockType = 3
                    objRS.open "Empregado.Salario",objCon,,,adCmdTable
                    objRS.addNew 
                    objRS("SalarioBaseContrato")=salarioBase
                'response.Write salarioAPagar
                    objRS("SalarioBruto")=valorAPAgar 'usando salario bruto como liquido...
                    objRS("SalarioDeContribuicao")=salarioBase
                    objRS("QuantidadeFaltasNaoJustificadas")=0
                    objRS("DescontoINSSEmpregado")=contribuicaoINSS
                    objRS("DescontoAdiantamento")=valorAdiantamento
                    objRS("DescontoIRRF")=descontoIR
                    objRS("DescontoVT")=0
                    objRS("DescontoFaltas")=0
                    objRS("TotalDependentes")=quantDependentes
                    objRS("Pensao")=pensaoAlimenticia
                    objRS("Adiantamento13")=valorAdiantamento
                    objRS("INSSEmpregador")=inssEmpregador
                    objRS("FGTSEmpregador")=FGTS
                    objRS("is13Salario")=true
                    objRS("MesReferencia")=12
                    objRS("AnoReferencia")=ano
                    objRS("Data")=  "12/01/" & ano 'gravar dia 01 do salário  month(now) & "/" & day(now) & "/" & year(now)
                    objRS("EmpregadoID")=prv_ID
                    objRS.update
                    calcular13Salario = objRS("ID")
                    objRS.close
                    objCon.close
                    set objCon = nothing
                    Set objRS = nothing
                end if
            end if
        end if
        set objContrato = nothing
    end function
    '========================
    '   SALÁRIO
    '========================
    public function calculaSalarioDoMes(mes, ano)
        dim objCon,  objRS, strMsg,  obCmd, seisPorCento, quantidadeVAles
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset") 
        objCon.Open strConn
'1-sacar o último contrato
        dim objContrato, bolThereIsAContrato, vlrFalta, totAdiantamentos, totAdiantamentos13, salarioBase, AliquotaIR
        set objContrato = new Contrato
        bolThereIsAContrato = objContrato.getFkrtContrato( prv_ID, true,0)
        if bolThereIsAContrato then
            on error resume next
            salarioAVer = cdbl(objContrato.carregaSalarioBaseMes(mes,ano,prv_ID))
            salarioBase=replace(salarioBase,",",".")
            salarioBase=cdbl(salarioAVer)
            vlrFalta=salarioBase / 30 'ver se ´é sempre por 30 ou se tem que ver o numero de dias do mes
            '1- pegar adiantamentos normais - passarParaObjeto
    

            leSQL = "select sum(valor) from empregado.adiantamento where empregadoID=" & prv_ID 
            leSQL = leSQL & " AND  MesReferencia=" & mes & " AND anoReferencia=" & ano & " AND (isPrimeiraPArcela13 is null or isPrimeiraPArcela13  = 'false') "
    'response.Write "<!--SQL:  " & lesql
            objRS.open leSQL, objCon,,,adcmdText
            
            if not isnull(objRS(0)) then 
                totAdiantamentos=cdbl(objRS(0))
            else
                totAdiantamentos=0
            end if
    
            objRS.close
   ' response.Write totAdiantamentos & "-->"
            '2- pegar adiantamentos 13° salario
            leSQL = "select sum(valor) from empregado.adiantamento where empregadoID=" & prv_ID 
            leSQL = leSQL & " AND MesReferencia=" & mes & " AND anoReferencia=" & ano & " AND isPrimeiraPArcela13='true' "
            objRS.open leSQL, objCon,,,adcmdText
           if not isnull(objRS(0)) then 
                totAdiantamentos13=cdbl(objRS(0))
            else
                totAdiantamentos13=0
            end if
            
            objRS.close
            '3- pegar faltas - aqui que é foda... tem que ver o DSRemunerado...
            'Estou selecionando o mes atual e o prévio. Testo para ver se a semana é igual a semana do mes prévio. Se for, computo apenas a falta e o DSR do mes atual de forma que nunca sera descontada um DSR de um mes anterior
        


            leSQL = "select * from empregado.falta where empregadoID=" & prv_ID 
            leSQL = leSQL & " AND (TipoFaltaID=1 or TipoFaltaID=3) AND dataFalta between '" & mes & "/1/" & ano & "' AND '" & mes & "/" & GetLastDay( "1/" & mes &"/"  & ano) & "/" & ano &"'"            
    'response.Write leSQL
            objRS.open leSQL, objCon,,,adcmdTexto
            dim semanaAtual, semanaPrevia, dsRemunerados, totFaltas, diasFaltados
            semanaAtual=0
            semanaPrevia=0
            dsRemunerados=0
            totFaltas=0
            
            if not(objRs.eof AND objRS.BOF) then
                while not objRS.eof
                    semanaAtual=  DatePart ("ww", objRS("dataFalta"))
                    if not isnumeric(mes) then mes=1
                    if month(objRS("dataFalta"))=cint(mes) then
                        if semanaAtual  = semanaPrevia then
                        else
                            dsRemunerados=dsRemunerados+1
                        end if                        
                        totFaltas=totFaltas+1
                    else
                            
                    end if
                    semanaPrevia  = DatePart ("ww", objRS("dataFalta"))   
                    diasFaltados = diasFaltados &   day(objRS("dataFalta")) & ", "
                    objRS.movenext                
                wend       
                if len(diasFaltados)>2 then diasFaltados = left(diasFaltados,len(diasFaltados)-2)         
            end if
            objRS.close  
            response.Write "<!--totFaltas " & totFaltas & "-->"
           'pegar valor VT
            'obs: - essa função não é pra ser chamada diretamente na página "empregado_ficha". Ela deverá ser chamada somente quando for carregar o holerite do fulano para
            'que os privates de vale transporte não sejam carregados erroneamente (carregando o mês)
            'ou não, sei lá... vams ver.
            'pensando bem, eu devo criar duas variáveis de contexto (prv_Mes e prv_Ano) para carregar tudo usando essas variáveis... 
            'fica no TODO List
            bolValeTransporte = me.carregaValeTransporte(0, mes, ano, true) 
           
            dim valeTransporte, quantidadeValeTransporte
            quantidadeValeTransporte=0
            valeTransporte=0
            'if objContrato.ValeTransporte=true then               
                 if bolValeTransporte=true then          
                    quantidadeValeTransporte = cint(me.Quantidade) 
                   
                    valeTransporte = cdbl(me.valor) 
                   'response.Write  cdbl(me.valor)
                    'response.Write "<!-- valeTransporte: " & valeTransporte & "-->"   
                    seisPorCento= salarioBase * 0.06 'ponto ou virgula? KCT
                    'quantidadeVAles =  valeTransporte  - totFaltas
                    'descontoValeTransporte = (cdbl(me.valor) / cint(me.quantidade)) * quantidadeVAles
                 else
                    seisPorCento="Vale Transporte não lançado para o mes atual"
                    valeTransporte=0
                    quantidadeValeTransporte=0
                    'quantidadeVAles="Vale Transporte não lançado para o mes atual"
                    'descontoValeTransporte="Vale Transporte não lançado para o mes atual"
                 end if 
            'pegar aliquota do INSS
            chkSalario=replace(salarioBase,",",".")
            leSQL="Select AliquotaEmpregado, AliquotaEmpregador from Aliquota.INSS where (" & chkSalario 
            leSQL = leSQL & " between ValorInicial AND ValorFinal) and ANO=" & ano
    'response.Write leSQL
            objRs.open leSQL, objCon,,,adcmdtext
            if (objRS.bof AND objRS.EOF)  then
                AliquotaEmpregado=0
                AliquotaEmpregador=0
            else
                AliquotaEmpregado=cdbl(objRS("AliquotaEmpregado"))
                AliquotaEmpregador=cdbl(objRS("AliquotaEmpregador"))

            end if
            'response.Write 100 * cdbl( AliquotaEmpregado)
            objRS.close
    '       pegar aliquota I.R.
            leSQL="Select Aliquota, ParcelaADeduzir from Aliquota.ImpostoRenda where (" & chkSalario 
            leSQL = leSQL & " between ValorInicial AND ValorFinal) and ANO=" & ano
    'response.Write leSQL
            objRs.open leSQL, objCon,,,adcmdtext
            if (objRS.bof AND objRS.EOF)  then
                AliquotaIR=0
                ParcelaADeduzir=0
            else
                AliquotaIR= cdbl( objRS("Aliquota") )
                ParcelaADeduzir=cdbl(objRS("ParcelaADeduzir") )
            end if
            objRS.close   

            dim horaBase
            horaBase = salarioBase / 220
            dim pensaoAlimenticia 
            if me.PEnsaoAlimenticia<>"" then pensaoAlimenticia = cdbl(me.PEnsaoAlimenticia) ELSE pensaoAlimenticia=0
            dim quantDependentes
            if me.QuantidadeDependentes<>"" then quantDependentes = cint (me.QuantidadeDependentes) ELSE quantDependentes=0
            dim descontoPorDependente
            descontoPorDependente = valDescontoDependente * quantDependentes'descontado da base de calculo para IR
            
            'response.Write pensaoAlimenticia
            valorADescontarFaltas = (cint(totFaltas) + (dsRemunerados)) * cdbl(vlrFalta)  
               
             response.Write "<!--valorADescontarFaltas " & valorADescontarFaltas & "-->"

            salarioDeContribuicao = salarioBase - valorADescontarFaltas
                'response.Write formatnumber(salarioDeContribuicao,2) *2
    'base de calculo IR = remuneracao - inss - dependentes - pensao
            outString=outString & "<br>******************************"
            outString=outString & "<h3>Rendimentos</h3>"         
            outString=outString & "******************************<br><br>" 
            outString=outString & "<b>Sal&aacute;rio Bruto ...............................R$" & salarioBase & "</b><br>" &vbCrLf
            outString=outString & "Faltas do M&egrave;s (dia(s) " & diasFaltados  
            if len(dsRemunerados)>0 then outString=outString & " + " &  dsRemunerados & " DSR"
            outString=outString & ")  ...............................  R$" & valorADescontarFaltas & "<br>" &vbCrLf
            outString=outString & "Horas Extra (n&atilde;o implementado) ...............................<br>" &vbCrLf
            outString=outString & "Sal&aacute;rio de contribui&ccedil;&atilde;o ............................... R$"  & salarioDeContribuicao & "<br>" & vbCrLf            
            podeDescontar = salarioBase * 0.06
            if (valeTransporte>0 AND valVTDia>0   ) then  valVTDia = valVTransp / quantidadeValeTransporte else valVTDia=0
            if valeTransporte > podeDescontar then
                valorADescontarVT = podeDescontar
            else
                valorADescontarVT = valeTransporte
            end if 
    
            contribuicaoINSS = cdbl(salarioDeContribuicao) * cdbl( AliquotaEmpregado)
            if contribuicaoINSS>= maximoDescontoINSS then contribuicaoINSS=maximoDescontoINSS
            inssEmpregador = salarioDeContribuicao * cdbl( AliquotaEmpregador)
            contribuicaoIR = salarioDeContribuicao - contribuicaoINSS - descontoPorDependente - pensaoAlimenticia
            FGTS = salarioBaseCalculo * 0.08 
   
            leSQL="Select Aliquota, ParcelaADeduzir from Aliquota.ImpostoRenda where (" & replace(contribuicaoIR ,",",".")
            leSQL = leSQL & " between ValorInicial AND ValorFinal) and ANO=" & ano
    'response.Write leSQL
            objRs.open leSQL, objCon,,,adcmdtext
            if (objRS.bof AND objRS.EOF)  then
                AliquotaIR=0
                ParcelaADeduzir=0
            else
                AliquotaIR= cdbl( objRS("Aliquota") )
                ParcelaADeduzir=cdbl(objRS("ParcelaADeduzir") )
            end if
            objRS.close   

            descontoIR = (contribuicaoIR * AliquotaIR)-ParcelaADeduzir

           ' response.Write "desconto IR = " & contribuicaoIR & " * " & AliquotaIR & " = " & descontoIR
    
            salarioDeContribuicao = cdbl(salarioDeContribuicao)
           ' contribuicaoINSS = cdbl(contribuicaoINSS)
            totAdiantamentos = cdbl(totAdiantamentos)
            valorADescontarVT = cdbl(valorADescontarVT)
            descontoIR = cdbl(descontoIR)
            pensaoAlimenticia = cdbl(pensaoAlimenticia)
            FGTS = cdbl(FGTS)
            
           salarioAPagar = salarioDeContribuicao - contribuicaoINSS - totAdiantamentos- valorADescontarVT - descontoIR- pensaoAlimenticia- FGTS
            'sem ir salarioAPagar = salarioDeContribuicao - contribuicaoINSS - totAdiantamentos- valorADescontarVT -  pensaoAlimenticia- FGTS            
            outString=outString & "<br>******************************"
            outString=outString & "<h3>Dedu&ccedil;&otilde;es</h3>"         
            outString=outString & "******************************<br>" 
            outString=outString & "Contribui&ccedil;&atilde;o INSS ............................... R$"  & contribuicaoINSS &vbCrLf
            outString=outString &"Salario de contribuicao: " & salarioDeContribuicao &  "-sal Cont. X  aliquota: " & cdbl(salarioDeContribuicao) *  cdbl(AliquotaEmpregado) & " aliquota: " & cdbl(AliquotaEmpregado) & "<br>"& vbCrLf
            outString=outString & "Desconto Adiantamentos ............................... R$"  & totAdiantamentos & "<br>"& vbCrLf
            outString=outString & "Desconto 6% Vale Transporte ............................... R$"  & valorADescontarVT & "<br>"& vbCrLf
            'outString=outString & "IR Retido na fonte (sobre " & contribuicaoIR & ")............................... R$"  & descontoIR & "<br>"& vbCrLf
            outString=outString & "Pens&atilde; judicial ............................... R$"  & pensaoAlimenticia & "<br>" &vbCrLf
            outString=outString & "FGTS ............................... R$"  & FGTS & "<br>" &vbCrLf
            outString=outString & "<br>******************************<br><br>"
            outString=outString & "<h3>SALARIO A PAGAR: " & salarioAPagar & "</b></h3>" &vbCrLf        
            outString=outString & "<br>******************************<br><br>"
           ' response.Write "<!--" & outString &  "-->"
        
        else
            outString="Primeiro crie o contrato de trabalho <a href='contrato_add.asp?func_ID=" & prv_ID & "'>clicando aqui</a>"
        end if'there is a contrato
    'response.Write totAdiantamentos
    
          '  calculaSalarioDoMes=outString
    'gravar na tabela de salarios
        objCon.execute "delete from empregado.salario where EmpregadoID=" & prv_ID & " AND mesReferencia=" & mes & " AND anoReferencia=" & ano
        objRS.CursorLocation = 2 
        objRS.CursorType = 1
        objRS.LockType = 3
        objRS.open "Empregado.Salario",objCon,,,adCmdTable
        objRS.addNew 
        objRS("SalarioBaseContrato")=salarioBase
    'response.Write salarioAPagar
        objRS("SalarioBruto")=salarioAPagar 'usando salario bruto como liquido...
        objRS("SalarioDeContribuicao")=salarioDeContribuicao
        objRS("QuantidadeFaltasNaoJustificadas")=totFaltas
        objRS("DescontoINSSEmpregado")=contribuicaoINSS
        objRS("DescontoAdiantamento")=totAdiantamentos
        objRS("DescontoIRRF")=descontoIR
        objRS("DescontoVT")=valorADescontarVT
        objRS("DescontoFaltas")=valorADescontarFaltas
        objRS("TotalDependentes")=quantDependentes
        objRS("Pensao")=pensaoAlimenticia
        'objRS("DescontoFerias")=????
        objRS("Adiantamento13")=totAdiantamentos13
        objRS("INSSEmpregador")=inssEmpregador
        objRS("FGTSEmpregador")=FGTS
        objRS("is13Salario")=false
        objRS("MesReferencia")=mes
        objRS("AnoReferencia")=ano
        objRS("Data")=  mes & "/01/" & ano 'gravar dia 01 do salário  month(now) & "/" & day(now) & "/" & year(now)
        objRS("EmpregadoID")=prv_ID
        objRS.update
        calculaSalarioDoMes = objRS("ID")
        objRS.close
        objCon.close
    set objContrato=nothing
        set objCon = nothing
        Set objRS = nothing
        set objContrato = nothing
    end function
    function getRecordsetOf13Salario()
         dim fnSQL, where
        dim objRS2, objCon2


        fnSQL = "select  * from Empregado.Salario  "
        fnSQL=fnSQL & " where Empregado.Salario.EmpregadoID=" & prv_ID  & " AND is13salario='true' order by Empregado.Salario.data DESC "
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfSalarios ", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOf13Salario = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing       
    end function

    function getRecordsetOfSalarios()
         dim fnSQL, where
        dim objRS2, objCon2


        fnSQL = "select  * from Empregado.Salario  "
        fnSQL=fnSQL & " where Empregado.Salario.EmpregadoID=" & prv_ID  & " AND is13salario='false'  order by Empregado.Salario.data DESC "
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfSalarios ", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOfSalarios = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing       
    end function
    function getRecordsetOfSalarioDoMes(mes, ano)
         dim fnSQL, where
        dim objRS2, objCon2


        fnSQL = "select  * from Empregado.Salario  "
        fnSQL=fnSQL & " where Empregado.Salario.EmpregadoID=" & prv_ID  & " AND mesReferencia=" & mes & " AND anoReferencia=" & ano
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfSalarios ", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOfSalarioDoMes = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing       
    end function

    '****************************
      'FUNÇÕES VALE TRANSPORTE
    '****************************
    public function getLastDayOfVT()
        dim objCon,  objRS, strMsg, currentAno
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")            
        objCon.Open strConn   
        strMsg="Select top 1 anoReferencia from empregado.ValeTransporte where empregadoID=" & prv_ID & " order by ID desc"
        if not (objRS.bof and objRS.eof) then
            getLastDayOfVT=objRS("anoReferencia")
        else
            getLastDayOfVT=0
        end if
        objRS.close
        objCon.close
        set objCon =nothing
        Set objRS = nothing  
    end function
    public function addValeTransporte (Quantidade, QuantidadePorExtenso, PeriodoInicio, PeriodoFim, MesReferencia, AnoReferencia, Valor, dtCriacao, TipoTransporte, ValorPorExtenso, EmpregadoID)
        'response.Write PeriodoInicio & PeriodoFim
    Valor=replace(Valor,",",".")
        dim objCon,  objRS, strMsg, strICQ, obCmd
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.Open strConn
        objRS.CursorLocation = 2 
        objRS.CursorType = 1
        objRS.LockType = 3
        objRS.open "Empregado.ValeTransporte",objCon,,,adCmdTable
        objRS.addNew     
        objRS("Quantidade") =Quantidade
        objRS("QuantidadePorExtenso") =QuantidadePorExtenso
        objRS("PeriodoInicio") =month(PeriodoInicio) & "/" & day(PeriodoInicio) & "/" & year(PeriodoInicio)
        objRS("PeriodoFim") =month(PeriodoFim) & "/" & day(PeriodoFim) & "/" & year(PeriodoFim)
        objRS("MesReferencia") =MesReferencia
        objRS("AnoReferencia") =AnoReferencia
        objRS("Valor") =Valor
        objRS("dtCriacao") =dtCriacao
        objRS("TipoTransporte") =TipoTransporte
        objRS("ValorPorExtenso") =ValorPorExtenso
        objRS("EmpregadoID") =EmpregadoID        
        objRS.update
        addValeTransporte = objRS("ID")
        objRS.close
        objCon.close
        set objCon =nothing
        Set objRS = nothing         
    end function        

    public function listaValeTransporte(anoVT)
            dim objCon,  objRS, strMsg, currentAno
            set objCon = Server.CreateObject ("ADODB.Connection")
            Set objRS = Server.CreateObject ("ADODB.Recordset")  
                    objCon.CursorLocation = adUseClient  
            objCon.Open strConn       
            if anoVT=0 or anoVT="" or (not isnumeric(anoVT)) then currentAno=year(now)  else currentAno=anoVT
            strMsg="Select * from empregado.ValeTransporte where empregadoID=" & prv_ID & " AND anoReferencia=" & anoVT
           objRS.CursorLocation = adUseClient
           objRS.locktype=adLockReadOnly
           objRS.CursorType = adOpenStatic
           objRS.open strMsg, objCon,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: listaValeTransporte ", Err.Description
        end if

        set objRS.activeconnection=nothing

        set listaValeTransporte = objRS.clone()
        objRS.close
        objCon.close
        set objCon =nothing
        Set objRS = nothing             
    end function
    public function deleteValeTransporte(idVT)
    ''''usar parametrized query
        dim objCon,  objRS, strMsg, currentAno
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")  
        objCon.CursorLocation = adUseClient  
        objCon.Open strConn 
        objRS.CursorLocation = adUseClient 
        objRS.CursorType = adOpenStatic
        objRS.LockType = adLockBatchOptimistic
        objRS.open "select * from empregado.valetransporte where empregadoID=" & prv_ID & " AND ID=" &  idVT , objcon,,,adcmdText
        IF (objRS.bof and objRS.EOF) then
'do nothing  
            deleteValeTransporte=false
        Else    
            objRS.Delete
            objRS.UpdateBatch 
            deleteValeTransporte=true
        end if
        objRS.close
        objCon.close
        set objCon =nothing
        Set objRS = nothing         
    end function
    public function carregaValeTransporte(idVT, MES, ano, bolPegaPorMes)
    ''''usar parametrized query
        dim objCon,  objRS, strMsg, currentAno, leSQL
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")  
        objCon.CursorLocation = adUseClient  
        objCon.Open strConn 
        IF bolPegaPorMes=true then
           leSQL=  "select * from empregado.valetransporte where empregadoID=" & prv_ID & " AND mesReferencia=" &  mes& "and anoReferencia=" & ano 
        else
          leSQL=   "select * from empregado.valetransporte where empregadoID=" & prv_ID & " AND ID=" &  idVT 
        end if
        objRS.open leSQL, objcon,,,adcmdText
        IF (objRS.bof and objRS.EOF) then
            prv_Quantidade="-" 
            prv_QuantidadePorExtenso="-" 
            prv_PeriodoInicio="-" 
            prv_PeriodoFim="-" 
            prv_MesReferencia="-" 
            prv_AnoReferencia="-" 
            prv_Valor="-" 
            prv_dtCriacao="-" 
            prv_TipoTransporte="-" 
            prv_ValorPorExtenso="-" 
            carregaValeTransporte=false   
        Else    
            prv_Quantidade=objRS("Quantidade")
            prv_QuantidadePorExtenso=objRS("QuantidadePorExtenso")
            prv_PeriodoInicio=objRS("PeriodoInicio")
            prv_PeriodoFim=objRS("PeriodoFim")
            prv_MesReferencia=objRS("MesReferencia")
            prv_AnoReferencia=objRS("AnoReferencia")
            prv_Valor=objRS("Valor")
            prv_dtCriacao=formataData(objRS("dtCriacao"))
            prv_TipoTransporte=objRS("TipoTransporte")
            prv_ValorPorExtenso=objRS("ValorPorExtenso")
            carregaValeTransporte=true
        end if
        objRS.close
        objCon.close
        set objCon =nothing
        Set objRS = nothing             
    end function
'####################################################
    'funções para advertências
'####################################################
    public function salvaAdvertencia( Titulo, Texto, mesReferencia, anoReferencia,  testemunha, RGTestemunha)    
    'TODO: Tratar erros aqui também    
        dim objCon,  objRS, strMsg, novaData
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        'converte data para DDMMAAA
    'response.Write DataFalta
        novaData=month(now) & "/" & day(now) & "/" & year(now)
        objCon.Open strConn
        objRS.CursorLocation = 2 
        objRS.CursorType = 1
        objRS.LockType = 3
        objRS.open "Empregado.Advertencia",objCon,,,adCmdTable
        objRS.addNew
        objRS("Titulo")=Titulo
        objRS("Texto")=Texto
        objRS("anoReferencia")=anoReferencia
        objRS("mesReferencia")=mesReferencia
        objRS("RGTestemunha")=RGTestemunha
        objRS("testemunha")=testemunha
        objRS("empregadoID")=prv_ID
        objRS("data")=novaData
        objRS.update
        salvaAdvertencia = objRS("ID")
        objCon.close 
        set objRS=nothing
        set objCon=nothing         
    end function

   public function getRecordsetOfAdvertencia()
    'talvez retornar a coleção de contratos... o nome da função seria o indice ou um array... de qqr maneira ela teria que retornar um array e um indice.
        dim fnSQL, where
        dim objRS2, objCon2
        if isUltimo then
            '?sera q precisa??
        end if

        fnSQL = "select  * from Empregado.Advertencia  "
        fnSQL=fnSQL & " where Empregado.Advertencia.EmpregadoID=" & prv_ID  & " order by Empregado.Advertencia.data DESC "
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfAdvertencia ", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOfAdvertencia = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function

   public function getAdvertencia(advID)
    'boleano. Carrega propriedades da advertencia. Usa o funcioario carregado para segurança
        dim fnSQL, where
        dim objRS2, objCon2
        if isUltimo then
            '?sera q precisa??
        end if

        fnSQL = "select  * from Empregado.Advertencia  "
        fnSQL=fnSQL & " where Empregado.Advertencia.EmpregadoID=" & prv_ID  & " AND ID=" & advID 
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if (objRS2.bof and objRS2.EOF) then
            prv_advertencia_ID="-" 
            prv_advertencia_Titulo="-" 
            prv_advertencia_Texto="-" 
            prv_advertencia_MesReferencia="-" 
            prv_advertencia_AnoReferencia="-" 
            prv_advertencia_Data="-" 
            prv_advertencia_Testemunha="-" 
            prv_advertencia_RGTestemunha="-" 
            prv_advertencia_EmpregadoID="-" 
            getAdvertencia=false
        else
            prv_advertencia_ID=objRS2("ID")
            prv_advertencia_Titulo=objRS2("Titulo")
            prv_advertencia_Texto=objRS2("Texto")
            prv_advertencia_MesReferencia=objRS2("MesReferencia")
            prv_advertencia_AnoReferencia=objRS2("AnoReferencia")
            prv_advertencia_Data= objRS2("Data") 
            prv_advertencia_Testemunha=objRS2("Testemunha")
            prv_advertencia_RGTestemunha=objRS2("RGTestemunha")
            prv_advertencia_EmpregadoID=objRS2("EmpregadoID")
            getAdvertencia=true
        end if                
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function



'####################################################
    'funções para suspensão
'####################################################
    public function salvaSuspensao(Titulo, Texto, data, dataInicio, dataFim, testemumnha, RGTestemunha)    
    'TODO: Tratar erros aqui também    
        dim objCon,  objRS, strMsg, novaData
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        'converte data para DDMMAAA
    'response.Write DataFalta
        novaData=month(data) & "/" & day(data) & "/" & year(data)
        objCon.Open strConn

        novaData=month(DataFalta) & "/" & day(DataFalta) & "/" & year(dataFalta)
        objRS.CursorLocation = 2 
        objRS.CursorType = 1
        objRS.LockType = 3
        objRS.open "Empregado.suspensao",objCon,,,adCmdTable
        objRS.addNew
        objRS("Titulo")=Titulo
        objRS("Texto")=Texto
        objRS("dataInicio")=month(dataInicio) & "/" & day(dataInicio) & "/" & year(dataInicio)
        objRS("RGTestemunha")=RGTestemunha
        objRS("dataFim")=month(dataFim) & "/" & day(dataFim) & "/" & year(dataFim)
        objRS("testemunha")=testemumnha
        objRS("empregadoID")=prv_ID
        objRS("data")=novaData
        objRS.update
        salvaSuspensao = objRS("ID")
        objCon.close 
        set objRS=nothing
        set objCon=nothing       
    'Lançar faltas na suspensão        
    'faltas tipo 2- justificada
       
               'lança as faltas
        do while datediff("d",dataInicio,dataFim)>=0  
            salvaFalta 3, dataInicio, "Falta por motivo de suspensão: "  & Titulo   
            dataInicio = dateAdd("d",1,dataInicio)
        loop
      
    end function

   public function getRecordsetOfSuspensao()
    'talvez retornar a coleção de contratos... o nome da função seria o indice ou um array... de qqr maneira ela teria que retornar um array e um indice.
        dim fnSQL, where
        dim objRS2, objCon2
        fnSQL = "select  * from Empregado.Suspensao  "
        fnSQL=fnSQL & " where Empregado.Suspensao.EmpregadoID=" & prv_ID  & " order by Empregado.Suspensao.ID DESC"
        set objCon2 = Server.CreateObject ("ADODB.Connection")

        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfSuspensao ", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOfSuspensao = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function

   public function getSuspensao(advID)
    'boleano. Carrega propriedades da advertencia. Usa o funcioario carregado para segurança
        dim fnSQL, where
        dim objRS2, objCon2
        if isUltimo then
            '?sera q precisa??
        end if

        fnSQL = "select  * from Empregado.Suspensao  "
        fnSQL=fnSQL & " where Empregado.Suspensao.EmpregadoID=" & prv_ID  & " AND ID=" & advID 
       
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if (objRS2.bof and objRS2.EOF) then
            prv_Suspensao_ID="-" 
            prv_Suspensao_Titulo="-" 
            prv_Suspensao_Texto="-" 
            prv_Suspensao_Data="-" 
            prv_Suspensao_DataInicio="-" 
            prv_Suspensao_DataFim="-" 
            prv_Suspensao_Testemunha="-" 
            prv_Suspensao_RGTestemunha="-" 
            prv_Suspensao_EmpregadoID="-"  
            getSuspensao= false
        else
            prv_Suspensao_ID=objRS2("ID")
            prv_Suspensao_Titulo=objRS2("Titulo")
            prv_Suspensao_Texto=objRS2("Texto")
            prv_Suspensao_Data=formataData( objRS2("Data") )
            prv_Suspensao_DataInicio= objRS2("DataInicio") 
            prv_Suspensao_DataFim= objRS2("DataFim") 
            prv_Suspensao_Testemunha=objRS2("Testemunha")
            prv_Suspensao_RGTestemunha=objRS2("RGTestemunha")
            prv_Suspensao_EmpregadoID=objRS2("EmpregadoID")
             getSuspensao= true
        end if                
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function




'####################################################
    'funções para faltas
'####################################################
    public function salvaFalta(TipoFaltaID, DataFalta, Comentarios)   
    'precisa fazer: Lançar todos os links das faltas, descontos e o kct 
    'TODO: Tratar erros aqui também    
        dim objCon,  objRS, strMsg, novaData
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        'converte data para DDMMAAA
    'response.Write DataFalta
        novaData=month(DataFalta) & "/" & day(DataFalta) & "/" & year(dataFalta)
        objCon.Open strConn
        objRS.CursorLocation = 2 
        objRS.CursorType = 1
        objRS.LockType = 3
        objRS.open "Empregado.Falta",objCon,,,adCmdTable
        objRS.addNew
        objRS("TipoFaltaID")=TipoFaltaID
        objRS("DataFalta")=novaData
        objRS("Comentarios")=Comentarios
        objRS("empregadoID")=prv_ID
        objRS.update
        salvaFalta = objRS("ID")
        objCon.close 
        set objRS=nothing
        set objCon=nothing 
        strNesSal= me.calculaSalarioDoMes (month(DataFalta),  year(DataFalta) )
                
    end function
   public function getRecordsetOfFaltas()
    'talvez retornar a coleção de contratos... o nome da função seria o indice ou um array... de qqr maneira ela teria que retornar um array e um indice.
        dim fnSQL, where
        dim objRS2, objCon2  
        fnSQL = "select  * from Empregado.Falta  "
        fnSQL=fnSQL & " where Empregado.Falta.EmpregadoID=" & prv_ID  & " order by Empregado.Falta.dataFalta DESC"
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfFaltas ", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOfFaltas = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function
    'método para pegar o último contrato
    public function getRecorsetOfFaltasDoMes(mes, ano, justificadas)
        dim leSQL, where
        dim objRS2, objCon2  
        leSQL = "select *  from empregado.falta where empregadoID=" & prv_ID 
        select case justificadas
        case 1 'apenas não justificadas    
            leSQL = leSQL & " AND (TipoFaltaID=1) "
        case 2 ' apenas justificadas
            leSQL = leSQL & " AND (TipoFaltaID=2) "
        case 3  'apenas suspensao
            leSQL = leSQL & " AND (TipoFaltaID=3) "
        case 4 ' apenas afastamento
            leSQL = leSQL & " AND (TipoFaltaID=4) "
        case 5' nao justificadas e suspensões
            leSQL = leSQL & " AND (TipoFaltaID=1 or TipoFaltaID=3) "        
        case 6' justificadas e afastamentos
            leSQL = leSQL & " AND (TipoFaltaID=2 or TipoFaltaID=4) "
        case 7' FÉRIAS
            leSQL = leSQL & " AND (TipoFaltaID=7) "
        case else ' todas

        end select
        leSQL = leSQL & " AND dataFalta between '" & mes & "/1/" & ano & "' AND '" & mes & "/" &GetLastDay( "1/" & mes &"/"  & ano) & "/" & ano &"'"            

        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        'response.Write leSQL
        objRS2.open leSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfFaltas ", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecorsetOfFaltasDoMes = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function


'####################################################
    'funções para AFASTAMENTO
'####################################################
    public function salvaAfastamento(dataAfastamento, dataRetorno, texto, MotivoID)   
    'precisa fazer: Lançar todos os links das faltas, descontos e o kct 
    'TODO: Tratar erros aqui também    
        dim objCon,  objRS, strMsg, novaData
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        'converte data para DDMMAAA
    'response.Write DataFalta
        novaData=month(DataFalta) & "/" & day(DataFalta) & "/" & year(dataFalta)
        objCon.Open strConn
        objRS.CursorLocation = 2 
        objRS.CursorType = 1
        objRS.LockType = 3
        objRS.open "Empregado.Afastamento",objCon,,,adCmdTable
        objRS.addNew
        objRS("dataAfastamento")=dataAfastamento
        objRS("dataRetorno")=dataRetorno
        objRS("texto")=texto
        objRS("MotivoID")=MotivoID
        objRS("empregadoID")=prv_ID
        objRS.update
        salvaAfastamento = objRS("ID")
        objCon.close 
        set objRS=nothing
        set objCon=nothing         
    end function
   public function getRecordsetOfAfastamentos()
    'talvez retornar a coleção de contratos... o nome da função seria o indice ou um array... de qqr maneira ela teria que retornar um array e um indice.
        dim fnSQL, where
        dim objRS2, objCon2
  
        fnSQL = "select  *, empregado.motivo.nome as motivo, empregado.afastamento.ID as afastamento_ID   from Empregado.Afastamento inner join empregado.motivo on empregado.afastamento.motivoID=empregado.motivo.ID  "
        fnSQL=fnSQL & " where Empregado.Afastamento.EmpregadoID=" & prv_ID  & " order by Empregado.Afastamento.dataAfastamento DESC"
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfAfastamentos ", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOfAfastamentos = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function
   public function getAfastamento(afstID)
    'boleano. Carrega propriedades da advertencia. Usa o funcioario carregado para segurança
        dim fnSQL, where
        dim objRS2, objCon2
        if isUltimo then
            '?sera q precisa??
        end if

        fnSQL = "select  *, empregado.afastamento.ID as afastamento_ID from Empregado.Afastamento  inner join empregado.motivo on empregado.afastamento.motivoID=empregado.motivo.ID "
        fnSQL=fnSQL & " where Empregado.Afastamento.EmpregadoID=" & prv_ID  & " AND  empregado.afastamento.ID=" & afstID 
       
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if (objRS2.bof and objRS2.EOF) then
            prv_afastamento_ID="-" 
            prv_afastamento_DataAfastamento="-" 
            prv_afastamento_DataRetorno="-" 
            prv_afastamento_Texto="-" 
            prv_afastamento_Motivo="-" 
            prv_afastamento_EmpregadoID="-" 
            getAfastamento= false
        else
            prv_afastamento_ID=objRS2("afastamento_ID")
            prv_afastamento_DataAfastamento=objRS2("DataAfastamento")
            prv_afastamento_DataRetorno=objRS2("DataRetorno")
            prv_afastamento_Texto=objRS2("Texto")
            prv_afastamento_Motivo=objRS2("nome")
            prv_afastamento_EmpregadoID=objRS2("EmpregadoID")
            getAfastamento= true
        end if                
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function
    'método para pegar o último contrato


'####################################################
    'funções para ADIANTAMENTO
'####################################################
    public function lancaAdiantamento(valor, valorPorExtenso, descricao, mesReferencia, anoReferencia, isPrimeiraParcela13)   
    'precisa fazer: Lançar todos os links das faltas, descontos e o kct 
    'TODO: Tratar erros aqui também    
        dim objCon,  objRS, strMsg, novaData
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        'converte data para DDMMAAA
    'response.Write DataFalta
    valor=replace(valor,".","")
    valor=replace(valor,",",".")
        novaData=month(DataFalta) & "/" & day(DataFalta) & "/" & year(dataFalta)
        objCon.Open strConn
        objRS.CursorLocation = 2 
        objRS.CursorType = 1
        objRS.LockType = 3
        objRS.open "Empregado.Adiantamento",objCon,,,adCmdTable
        objRS.addNew
        objRS("valor")=valor
        objRS("valorPorExtenso")=valorPorExtenso
        objRS("mesReferencia")=mesReferencia
        objRS("anoReferencia")=anoReferencia
        objRS("descricao")=descricao
        objRS("isPrimeiraParcela13")=isPrimeiraParcela13
        objRS("empregadoID")=prv_ID
        objRS.update
        lancaAdiantamento = objRS("ID")
        objCon.close 
        set objRS=nothing
        set objCon=nothing  
        'atualiza salário daquele mês...
        me.calculaSalarioDoMes  mesReferencia, anoReferencia    
    end function

   public function getRecordsetOfAdiantamentos(DECIMOTERCEIRO)
        dim fnSQL, where
        dim objRS2, objCon2
  
        fnSQL = "select  * from Empregado.Adiantamento "
        fnSQL=fnSQL & " where Empregado.Adiantamento.EmpregadoID=" & prv_ID  
        IF DECIMOTERCEIRO = TRUE THEN
            fnSQL=fnSQL & " and empregado.adiantamento.IsPrimeiraParcela13='true' "        
        ELSEif DECIMOTERCEIRO=false then
            fnSQL=fnSQL & " and not empregado.adiantamento.IsPrimeiraParcela13='true' " 
        else
              fnSQL=fnSQL & ""  
        END IF

        fnSQL=fnSQL & " order by Empregado.Adiantamento.ID DESC"
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfAdiantamentos ", Err.Description
        end if
        set objRS2.activeconnection=nothing
        set getRecordsetOfAdiantamentos = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function

   public function getAdiantamento(advID)
    'boleano. Carrega propriedades da advertencia. Usa o funcioario carregado para segurança
        dim fnSQL, where
        dim objRS2, objCon2
        if isUltimo then
            '?sera q precisa??
        end if

        fnSQL = "select  * from Empregado.Adiantamento  "
        fnSQL=fnSQL & " where Empregado.Adiantamento.EmpregadoID=" & prv_ID  & " AND ID=" & advID 
       
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if (objRS2.bof and objRS2.EOF) then
            prv_Adiantamento_ID="-" 
            prv_Adiantamento_Valor="-" 
            prv_Adiantamento_ValorPorExtenso="-" 
            prv_Adiantamento_Descricao="-" 
            prv_Adiantamento_MesReferencia="-" 
            prv_Adiantamento_AnoReferencia="-" 
            prv_Adiantamento_isPrimeiraParcela13="-" 
            prv_Adiantamento_EmpregadoID="-" 
            getAdiantamento= false
        else
            prv_Adiantamento_ID=objRS2("ID")
            prv_Adiantamento_Valor=objRS2("Valor")
            prv_Adiantamento_ValorPorExtenso=objRS2("ValorPorExtenso")
            prv_Adiantamento_Descricao=objRS2("Descricao")
            prv_Adiantamento_MesReferencia=objRS2("MesReferencia")
            prv_Adiantamento_AnoReferencia=objRS2("AnoReferencia")
            prv_Adiantamento_isPrimeiraParcela13=objRS2("isPrimeiraParcela13")
            prv_Adiantamento_EmpregadoID=objRS2("EmpregadoID")
             getAdiantamento= true
        end if                
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function
'####################################################
    'funções para ferias
'####################################################

   public function getRecordsetOfFerias()
    'talvez retornar a coleção de contratos... o nome da função seria o indice ou um array... de qqr maneira ela teria que retornar um array e um indice.
        dim fnSQL, where
        dim objRS2, objCon2  
        fnSQL = "select  * from View_Ferias "
        fnSQL=fnSQL & " where EmpregadoID=" & prv_ID  & " order by feriasID DESC"
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfFaltas ", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOfFerias = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function
    public function salvaFerias(dataInicio, dataInicioPeriodo)   
    'response.Write "<!--dataInicio Mês: " & month(dataInicio) & " dataInicio Dia: " & day(dataInicio) &vbCrLf
    'response.Write "mes + 1: " & FormatDateTime(dateadd("m",1,dataInicio),1)  &vbCrLf
    'response.Write "<br>dataInicioPeriodo Mês: " & month(dataInicioPeriodo) & " dataInicioPeriodo Dia: " & day(dataInicioPeriodo) &"-->"
    'TODO: Tratar erros aqui também    
        dim sqlDataInPer, sqlDataFimPer, sqlDataIn, sqlDataFim
           dtIn=dataInicio' month(dataInicio) & "/" & day(dataInicio) & "/" & year(dataInicio)
           sqlDataIn = year(dataInicio) & "-" & month(dataInicio)  & "-" &  day(sqlDataIn)

            sqlDataInPer =dataInicioPeriodo
            sqlDataInPer = year(dataInicioPeriodo) & "-" & month(dataInicioPeriodo) & "-" & day(dataInicioPeriodo)
    
            dtFimPer = dateAdd("yyyy",1, dataInicioPeriodo)
            dtFimPer = dateAdd("d",-1, dtFimPer)
            sqlDataFimPer = year(dtFimPer) & "-" & month(dtFimPer)  & "-" &  day(dtFimPer)
       

        dim objCon,  objRS, strMsg, novaData
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.Open strConn
        dim objContrato, bolThereIsAContrato, salarioAVer, totFaltas, diasDeFerias, bolPodeTirarFerias, umTerco
        dim pensao, quantDependentes, encargosINSS, baseDeCalculo, IRRF, ParcelaADeduzir, AliquotaIR
        bolPodeTirarFerias = true
        

        set objContrato = new Contrato
        bolThereIsAContrato = objContrato.getFkrtContrato( prv_ID, true,0)



        if bolThereIsAContrato then
            '- 1- pegar o salário bruto e transformar em double
            salarioAVer = cdbl(objContrato.carregaSalarioBaseMes(month(dataInicio) ,year(dataInicio) ,prv_ID))
            umTerco = salarioAVer/3
            baseDeCalculo = salarioAVer + umTerco
            
            'faltas do periodo
           if datediff("y", objContrato.DataAdmissao , dtIn) = 0 then  bolPodeTirarFerias = false
            response.Write "<!-- datediff adimissão:  " & datediff("y", objContrato.DataAdmissao , dtIn) & "-->"
            leSQL = "select count(ID) From empregado.falta where empregadoID=" & prv_ID & " AND (TipoFaltaID=1 or TipoFaltaID=3) "     
            leSQL=leSQL & " AND dataFalta between '" & sqlDataInPer & "' AND '" & sqlDataFimPer &"'"  
    'response.Write leSQL
            objRS.open leSQL, objCon,,,adcmdtext   
            if objRS.bof and objRS.eof then
                totFaltas = 0    
            else        
                totFaltas = objRS(0)       
            end if
            objRs.close
            if totFaltas<=5 then
                diasDeFerias = 30 
            elseif totFaltas >=6 AND totFaltas<=14 then
                diasDeFerias = 24    
            ELSEIF totFaltas >=15 AND totFaltas<=23 then
                diasDeFerias = 18
            ELSEIF totFaltas >=24 AND totFaltas<=32 then
                diasDeFerias = 12
            ELSEIF totFaltas >32 then
                diasDeFerias = 0
            end if
            if diasDeFerias>0 then
                 dtFim = dateAdd( "d",diasDeFerias, dtIn)
            else
                dtFim = dtIn
                bolPodeTirarFerias=false
            end if
           
            objRS.CursorLocation = 2 
            objRS.CursorType = 1
            objRS.LockType = 3
            objRS.open "Empregado.ferias",objCon,,,adCmdTable
            objRS.addNew
            objRS("dataInicio")=month(dtIn) & "/" & day(dtIn) & "/" & year(dtIn)
            objRS("dataInicioPeriodo")=month(dataInicioPeriodo) & "/" & day(dataInicioPeriodo) & "/" & year(dataInicioPeriodo)
            objRS("dataFim")=month(dtFim) & "/" & day(dtFim) & "/" & year(dtFim)
            objRS("dataFimPeriodo")=month(dtFimPer) & "/" & day(dtFimPer) & "/" & year(dtFimPer)

            objRS("empregadoID")=prv_ID
            objRS.update
            feriasID = objRS("ID")
            objRS.close

                      
            if me.PEnsaoAlimenticia<>"" then pensao = cdbl(me.PEnsaoAlimenticia) ELSE pensao=0
            if me.QuantidadeDependentes<>"" then quantDependentes = cint (me.QuantidadeDependentes) ELSE quantDependentes=0
            descontoPorDependente =valDescontoDependente * quantDependentes
            'INSS
            chkSalario=replace(salarioAVer,",",".")
            leSQL="Select AliquotaEmpregado, AliquotaEmpregador from Aliquota.INSS where (" & replace(chkSalario ,",",".")
            leSQL = leSQL & " between ValorInicial AND ValorFinal) and ANO=" & YEAR(dtFim)
    'response.Write leSQL
            objRs.open leSQL, objCon,,,adcmdtext
            if (objRS.bof AND objRS.EOF)  then
                AliquotaEmpregado=0
                AliquotaEmpregador=0
            else
                AliquotaEmpregado=cdbl(objRS("AliquotaEmpregado"))
                AliquotaEmpregador=cdbl(objRS("AliquotaEmpregador"))
            end if
            objRS.close
            encargosINSS = (baseDeCalculo) * AliquotaEmpregado

            IF encargosINSS > maximoDescontoINSS then encargosINSS = maximoDescontoINSS
            INSSEmpregador = (baseDeCalculo) * AliquotaEmpregador
    '   '''base para desconto no ir
            baseIRRF = baseDeCalculo - encargosINSS - pensao - descontoPorDependente
            
            leSQL="Select Aliquota, ParcelaADeduzir from Aliquota.ImpostoRenda where (" & replace(baseIRRF ,",",".")
            leSQL = leSQL & " between ValorInicial AND ValorFinal) and ANO=" & year(dataInicio)
           

            objRs.open leSQL, objCon,,,adcmdtext
            if (objRS.bof AND objRS.EOF)  then
                AliquotaIR=0
                ParcelaADeduzir=0
            else
                AliquotaIR= cdbl( objRS("Aliquota") )
                ParcelaADeduzir=cdbl(objRS("ParcelaADeduzir") )
            end if
            objRS.close  
            IRRF = (baseIRRF * AliquotaIR) - ParcelaADeduzir
            FGTS = (baseDeCalculo) * 0.08            
            salarioLiquidoAReceber = (baseDeCalculo - encargosINSS - IRRF - fgts)
            objRS.CursorLocation = 2 
            objRS.CursorType = 1
            objRS.LockType = 3
            objRS.open "Empregado.SalarioFerias",objCon,,,adCmdTable
            objRS.addNew
            objRS("SalarioBaseContrato") = salarioAVer
            objRS("SalarioBruto") = salarioLiquidoAReceber
            objRS("SalarioDeContribuicao") =baseDeCalculo 
            objRS("AdicionalFerias") = umTerco
            objRS("DescontoINSSEmpregado") =encargosINSS 
            objRS("DescontoIRRF") =IRRF 
            objRS("INSSEmpregador") = INSSEmpregador
            objRS("FGTSEmpregador") = FGTS
            objRS("TotalDependentes") = quantDependentes
            objRS("Pensao") = pensao
            objRS("FaltasPeriodoAquisitivo") = totFaltas
            objRS("Data") = month(dtIn) & "/" & day(dtIn)&"/" & year(dtIn)
            objRS("EmpregadoID") = prv_ID
            objRS("FeriasID") = feriasID
            objRS.update
            salvaFerias = objRS("ID")
        else
            salvaFerias=0
        end if
        objCon.close 
        set objRS=nothing
        set objCon=nothing         
    end function
end class




'###############################################################################
'Classe CONTRATO - gerencia os contratos do funcionário. Deve adicionar
    'Carregar ID do funcionário antes de chamar os metodos que fazem listagem ou carregam dados
    'metodo gravaContrato

    ' *** LAZY BOY: PeriodoExperienciaID vai carregar a data fim do periodo de experiencia


'###############################################################################
class Contrato
    private prv_funcionario_ID
    private prv_contrato_ID 
    private prv_RecebeFGTS 
    private prv_DataEmissaoContrato 
    private prv_DataAdmissao 
    private prv_Salario 
    private prv_SalarioPorExtenso 
    private prv_isAtivo 
    private prv_DataCriacao 
    private prv_TipoEstabelecimentoID 
    private prv_TipoOcupacaoID 
    private prv_EmpregadoID 
    private prv_EmpregadorID 
    private prv_PeriodoExperienciaID 
    private prv_EnderecoID 
    private prv_ValeTransporte
    private prvTipoOcupacao
    private prvBolThereIsAContrato
    private prvIsPrincipal
     private prv_CBO
    private prv_bolImrimiuReciboCT
    private prv_bolImprimiuModeloCT
    private prv_bolImrpimiuContrato
    private prv_bolImprimiuSolicitacaoVT
    private prv_bolImprimiuAbreMaoVT
    private prv_bolVeioDeAgenciaDeTrabalho

    private prv_Logradouro 
    private prv_Numero 
    private prv_Bairro 
    private prv_Complemento 
    private prv_CEP 
    private prv_CidadeID 
    private prv_Estado
    private prv_ArrayDiasDaSemana

    'Alterações cargos salários

    private prv_AlteracaoCargoSalario_ID 
    private prv_AlteracaoCargoSalario_EmpregadoID 
    private prv_AlteracaoCargoSalario_OcupacaoID 
    private prv_AlteracaoCargoSalario_Motivo 
    private prv_AlteracaoCargoSalario_Salario 
    private prv_AlteracaoCargoSalario_Data 
    private prv_AlteracaoCargoSalario_primeiroLancamento 

   Private Sub Class_Initialize()
        prv_contrato_ID="-" 
        prv_RecebeFGTS="-" 
        prv_DataEmissaoContrato="-" 
        prv_DataAdmissao="-" 
        prv_Salario="-" 
        prv_SalarioPorExtenso="-" 
        prv_isAtivo="-" 
        prv_DataCriacao="-" 
        prv_TipoEstabelecimentoID="-" 
        prv_TipoOcupacaoID="-" 
        prv_EmpregadoID="-" 
        prv_EmpregadorID="-" 
        prv_PeriodoExperienciaID="-" 
        prv_EnderecoID="-" 
        prv_ValeTransporte="-" 
        prvTipoOcupacao="-"            
        prvBolThereIsAContrato=false
        prvIsPrincipal=true
        prv_ArrayDiasDaSemana=array()
         prv_CBO="-"
         prv_bolImprimiuAbreMaoVT=false
         prv_bolImprimiuModeloCT=false
         prv_bolImrpimiuContrato=false
         prv_bolImprimiuSolicitacaoVT=false
         prv_bolImprimiuAbreMaoVT=false
         prv_bolVeioDeAgenciaDeTrabalho=false
        prv_Logradouro="-" 
        prv_Numero="-" 
        prv_Bairro="-" 
        prv_Complemento="-" 
        prv_CEP="-" 
        prv_CidadeID="-" 
        prv_Estado="-"

        prv_AlteracaoCargoSalario_ID="-" 
        prv_AlteracaoCargoSalario_EmpregadoID="-" 
        prv_AlteracaoCargoSalario_OcupacaoID="-" 
        prv_AlteracaoCargoSalario_Motivo="-" 
        prv_AlteracaoCargoSalario_Salario="-" 
        prv_AlteracaoCargoSalario_Data="-" 
        prv_AlteracaoCargoSalario_primeiroLancamento="-" 

   end sub
    Private Sub Class_Terminate()
        prv_contrato_ID="" 
        prv_RecebeFGTS="" 
        prv_DataEmissaoContrato="" 
        prv_DataAdmissao="" 
        prv_Salario="" 
        prv_SalarioPorExtenso="" 
        prv_isAtivo="" 
        prv_DataCriacao="" 
        prv_TipoEstabelecimentoID="" 
        prv_TipoOcupacaoID="" 
        prv_EmpregadoID="" 
        prv_EmpregadorID="" 
        prv_PeriodoExperienciaID="" 
        prv_EnderecoID="" 
        prv_ValeTransporte="" 
        prvTipoOcupacao=""            
        prvBolThereIsAContrato=false
        prvIsPrincipal=true
    prv_CBO=""
         prv_bolImprimiuAbreMaoVT=false
         prv_bolImprimiuModeloCT=false
         prv_bolImrpimiuContrato=false
         prv_bolImprimiuSolicitacaoVT=false
         prv_bolImprimiuAbreMaoVT=false
         prv_bolVeioDeAgenciaDeTrabalho=false
        prv_Logradouro="" 
        prv_Numero="" 
        prv_Bairro="" 
        prv_Complemento="" 
        prv_CEP="" 
        prv_CidadeID="" 
        prv_Estado=""
        IF ISARRAY(prv_ArrayDiasDaSemana) THEN
            erase prv_ArrayDiasDaSemana
        END IF
        prv_AlteracaoCargoSalario_ID="" 
        prv_AlteracaoCargoSalario_EmpregadoID="" 
        prv_AlteracaoCargoSalario_OcupacaoID="" 
        prv_AlteracaoCargoSalario_Motivo="" 
        prv_AlteracaoCargoSalario_Salario="" 
        prv_AlteracaoCargoSalario_Data="" 
        prv_AlteracaoCargoSalario_primeiroLancamento="" 
    end sub
    '
    '   GET'S
    '
    Public property get contrato_ID() 
         contrato_ID=prv_contrato_ID
    end property
    Public property get RecebeFGTS() 
         RecebeFGTS=prv_RecebeFGTS
    end property
    Public property get DataEmissaoContrato() 
         DataEmissaoContrato=prv_DataEmissaoContrato
    end property
    Public property get DataAdmissao() 
         DataAdmissao=prv_DataAdmissao
    end property
    Public property get Salario() 
         Salario=prv_Salario
    end property
    Public property get SalarioPorExtenso() 
         SalarioPorExtenso=prv_SalarioPorExtenso
    end property
    Public property get isAtivo() 
         isAtivo=prv_isAtivo
    end property
    Public property get DataCriacao() 
         DataCriacao=prv_DataCriacao
    end property
    Public property get TipoEstabelecimentoID() 
         TipoEstabelecimentoID=prv_TipoEstabelecimentoID
    end property
    Public property get TipoOcupacaoID() 
         TipoOcupacaoID=prv_TipoOcupacaoID
    end property
    Public property get EmpregadoID() 
         EmpregadoID=prv_EmpregadoID
    end property
    Public property get EmpregadorID() 
         EmpregadorID=prv_EmpregadorID
    end property
    Public property get PeriodoExperienciaID() 
         PeriodoExperienciaID=prv_PeriodoExperienciaID
    end property
    Public property get EnderecoID() 
         EnderecoID=prv_EnderecoID
    end property
    Public property get ValeTransporte() 
         ValeTransporte=prv_ValeTransporte
    end property
	Public property get TipoOcupacao()
		TipoOcupacao=prvTipoOcupacao
	end property
	Public property get bolThereIsAContrato()
		bolThereIsAContrato=prvBolThereIsAContrato
	end property
    Public property get enderecoPrincipal
       enderecoPrincipal = prvIsPrincipal 
    end property
    Public property get DiasDaSemana
       DiasDaSemana = prv_ArrayDiasDaSemana 
    end property

    Public property get bolImrimiuReciboCT
       bolImrimiuReciboCT = prv_bolImrimiuReciboCT
    end property

    Public property get bolImprimiuModeloCT
       bolImprimiuModeloCT = prv_bolImprimiuModeloCT
    end property

    Public property get bolImrpimiuContrato
       bolImrpimiuContrato = prv_bolImrpimiuContrato
    end property

    Public property get bolImprimiuSolicitacaoVT
       bolImprimiuSolicitacaoVT = prv_bolImprimiuSolicitacaoVT
    end property

    Public property get bolImprimiuAbreMaoVT
       bolImprimiuAbreMaoVT = prv_bolImprimiuAbreMaoVT
    end property

    Public property get bolVeioDeAgenciaDeTrabalho
       bolVeioDeAgenciaDeTrabalho = prv_bolVeioDeAgenciaDeTrabalho
    end property

    Public property get Logradouro() 
         Logradouro=prv_Logradouro
    end property

    Public property get Numero() 
         Numero=prv_Numero
    end property

    Public property get Bairro() 
         Bairro=prv_Bairro
    end property

    Public property get Complemento() 
         Complemento=prv_Complemento
    end property

    Public property get CEP() 
         CEP=prv_CEP
    end property

    Public property get CidadeID() 
         CidadeID=prv_CidadeID
    end property

    Public property get estado() 
         estado=prv_estado
    end property
    Public property get CBO() 
         CBO=prv_CBO
    end property
    Public property get AlteracaoCargoSalario_ID() 
         AlteracaoCargoSalario_ID = prv_AlteracaoCargoSalario_ID
    end property

    Public property get AlteracaoCargoSalario_EmpregadoID() 
         AlteracaoCargoSalario_EmpregadoID = prv_AlteracaoCargoSalario_EmpregadoID
    end property

    Public property get AlteracaoCargoSalario_OcupacaoID() 
         AlteracaoCargoSalario_OcupacaoID = prv_AlteracaoCargoSalario_OcupacaoID
    end property

    Public property get AlteracaoCargoSalario_Motivo() 
         AlteracaoCargoSalario_Motivo = prv_AlteracaoCargoSalario_Motivo
    end property

    Public property get AlteracaoCargoSalario_Salario() 
         AlteracaoCargoSalario_Salario = prv_AlteracaoCargoSalario_Salario
    end property

    Public property get AlteracaoCargoSalario_Data() 
         AlteracaoCargoSalario_Data = prv_AlteracaoCargoSalario_Data
    end property

    Public property get AlteracaoCargoSalario_primeiroLancamento() 
         AlteracaoCargoSalario_primeiroLancamento = prv_AlteracaoCargoSalario_primeiroLancamento
    end property

    '
    '   LET'S
    '
   Public property let contrato_ID(strIN_contrato_ID) 
         prv_contrato_ID=strIN_contrato_ID
    end property
    Public property let RecebeFGTS(strIN_RecebeFGTS) 
         prv_RecebeFGTS=strIN_RecebeFGTS
    end property
    Public property let DataEmissaoContrato(strIN_DataEmissaoContrato) 
         prv_DataEmissaoContrato=strIN_DataEmissaoContrato
    end property
    Public property let DataAdmissao(strIN_DataAdmissao) 
         prv_DataAdmissao=strIN_DataAdmissao
    end property
    Public property let Salario(strIN_Salario) 
         prv_Salario=strIN_Salario
    end property
    Public property let SalarioPorExtenso(strIN_SalarioPorExtenso) 
         prv_SalarioPorExtenso=strIN_SalarioPorExtenso
    end property
    Public property let isAtivo(strIN_isAtivo) 
         prv_isAtivo=strIN_isAtivo
    end property
    Public property let DataCriacao(strIN_DataCriacao) 
         prv_DataCriacao=strIN_DataCriacao
    end property
    Public property let TipoEstabelecimentoID(strIN_TipoEstabelecimentoID) 
         prv_TipoEstabelecimentoID=strIN_TipoEstabelecimentoID
    end property
    Public property let TipoOcupacaoID(strIN_TipoOcupacaoID) 
         prv_TipoOcupacaoID=strIN_TipoOcupacaoID
    end property
    Public property let EmpregadoID(strIN_EmpregadoID) 
         prv_EmpregadoID=strIN_EmpregadoID
    end property
    Public property let EmpregadorID(strIN_EmpregadorID) 
         prv_EmpregadorID=strIN_EmpregadorID
    end property
    Public property let PeriodoExperienciaID(strIN_PeriodoExperienciaID) 
         prv_PeriodoExperienciaID=strIN_PeriodoExperienciaID
    end property
    Public property let EnderecoID(strIN_EnderecoID) 
         prv_EnderecoID=strIN_EnderecoID
    end property
    Public property let ValeTransporte(strIN_ValeTransporte) 
         prv_ValeTransporte=strIN_ValeTransporte
    end property
    Public property let TipoOcupacao(strIN_TipoOcupacao) 
         prvTipoOcupacao=strIN_TipoOcupacao
    end property
    Public property let thereIsAContrato(strIN_thereIsAContrato) 
         prvBolThereIsAContrato=strIN_thereIsAContrato
    end property
    Public property let enderecoPrincipal(strInEnderecoPrincipal)
       prvIsPrincipal = strInEnderecoPrincipal 
    end property
    Public property let DiasDaSemana(strInDiasDaSemana)
       prv_ArrayDiasDaSemana = strInDiasDaSemana 
    end property


    Public property let bolImrimiuReciboCT(strInbolImrimiuReciboCT)
       prv_bolImrimiuReciboCT = strInbolImrimiuReciboCT 
    end property
    Public property let bolImprimiuModeloCT(strbolImprimiuModeloCT)
       prv_bolImprimiuModeloCT = strbolImprimiuModeloCT 
    end property
    Public property let bolImprimiuSolicitacaoVT(strbolImprimiuSolicitacaoVT)
       prv_bolImprimiuSolicitacaoVT = strbolImprimiuSolicitacaoVT
    end property
    Public property let bolImprimiuAbreMaoVT(strbolImprimiuAbreMaoVT)
       prv_bolImprimiuAbreMaoVT = strbolImprimiuAbreMaoVT
    end property
    Public property let bolVeioDeAgenciaDeTrabalho(strbolVeioDeAgenciaDeTrabalho)
       prv_bolVeioDeAgenciaDeTrabalho = strbolVeioDeAgenciaDeTrabalho
    end property
    Public property let bolImrpimiuContrato(strbolImrpimiuContrato)
       prv_bolImrpimiuContrato = strbolImrpimiuContrato
    end property
 
    
    Public property let Logradouro(strIN_endEmpregador_Logradouro) 
         prv_Logradouro=strIN_endEmpregador_Logradouro
    end property

    Public property let Numero(strIN_endEmpregador_Numero) 
         prv_Numero=strIN_endEmpregador_Numero
    end property

    Public property let Bairro(strIN_endEmpregador_Bairro) 
         prv_Bairro=strIN_endEmpregador_Bairro
    end property

    Public property let Complemento(strIN_endEmpregador_Complemento) 
         prv_Complemento=strIN_endEmpregador_Complemento
    end property

    Public property let CEP(strIN_endEmpregador_CEP) 
         prv_CEP=strIN_endEmpregador_CEP
    end property

    Public property let CidadeID(strIN_endEmpregador_CidadeID) 
         prv_CidadeID=strIN_endEmpregador_CidadeID
    end property
   
     Public property let estado(strIN_estado) 
         prv_estado=strIN_estado
    end property
      Public property let CBO(strIN_cbo) 
         prv_cbo=strIN_cbo
    end property
    Public property let AlteracaoCargoSalario_ID(strIN_ID) 
         prv_AlteracaoCargoSalario_ID=strIN_ID
    end property

    Public property let AlteracaoCargoSalario_EmpregadoID(strIN_EmpregadoID) 
         prv_AlteracaoCargoSalario_EmpregadoID=strIN_EmpregadoID
    end property

    Public property let AlteracaoCargoSalario_OcupacaoID(strIN_OcupacaoID) 
         prv_AlteracaoCargoSalario_OcupacaoID=strIN_OcupacaoID
    end property

    Public property let AlteracaoCargoSalario_Motivo(strIN_Motivo) 
         prv_AlteracaoCargoSalario_Motivo=strIN_Motivo
    end property

    Public property let AlteracaoCargoSalario_Salario(strIN_Salario) 
         prv_AlteracaoCargoSalario_Salario=strIN_Salario
    end property

    Public property let AlteracaoCargoSalario_Data(strIN_Data) 
         prv_AlteracaoCargoSalario_Data=strIN_Data
    end property

    Public property let AlteracaoCargoSalario_primeiroLancamento(strIN_primeiroLancamento) 
         prv_AlteracaoCargoSalario_primeiroLancamento=strIN_primeiroLancamento
    end property           
       'método para gravar contrato

    '---------
    'contrato.gravaContrato
    '---------
    public function gravaContrato()
    'toda a questão do vale transporte precisa ser revisada
            dim  bolValida
            bolValida=true
    'rever FGTS quando sair nova legislação
           if prv_RecebeFGTS="-" then
                call err.Raise (001030, "Criar Contrato - propriedades", " Sinalizar se contrato recebe FGTS")
                bolValida=false
            end if
           if prv_DataEmissaoContrato="-"  OR not IsDate(prv_DataEmissaoContrato) then
                call err.Raise (001040, "Criar Contrato - propriedades", " Data Emissão em formato inválido")
                 bolValida=false
            end if
           if prv_DataAdmissao="-"  OR not IsDate(prv_DataAdmissao) then
                call err.Raise (001050, "Criar Contrato - propriedades", server.HTMLEncode(" Data Admissão em formato inválido"))
                bolValida=false
            end if
            if prv_Salario="-"  OR not IsNumeric(prv_Salario) then
                call err.Raise (001060, "Criar Contrato - propriedades", server.HTMLEncode(" Salário em formato inválido"))
                bolValida=false
            end if
            if prv_SalarioPorExtenso="-"  then
                call err.Raise (001070, "Criar Contrato - propriedades", server.HTMLEncode(" Digitar Salário por Extenso"))
                bolValida=false
            end if
 

            if prv_TipoOcupacaoID="-"  OR not Isnumeric(prv_TipoOcupacaoID) then
                call err.Raise (001100, "Criar Contrato - propriedades", "Tipo de Ocupacao-ID deve ser um numero")
                bolValida=false
            end if

            if prv_EmpregadoID="-"  OR not Isnumeric(prv_EmpregadoID) then
                call err.Raise (001110, "Criar Contrato - propriedades", "Empregado ID deve ser um numero")
                bolValida=false
            end if
            if prv_EmpregadorID="-"  OR not Isnumeric(prv_EmpregadorID) then
                call err.Raise (001120, "Criar Contrato - propriedades", "Empregador ID deve ser um numero")
                bolValida=false
            end if
            if prv_TipoOcupacaoID="-"  OR not Isnumeric(prv_TipoOcupacaoID) then
                call err.Raise (001130, "Criar Contrato - propriedades", "Tipo de Ocupacao-ID deve ser um numero")
                bolValida=false
            end if
            if PeriodoExperienciaID="-"  OR not Isnumeric(PeriodoExperienciaID) then
                call err.Raise (001140, "Criar Contrato - propriedades", "Periodo de experiencia deve ser um numero")
                bolValida=false
            end if
            if prv_EnderecoID="-"  OR not Isnumeric(prv_EnderecoID) then
                call err.Raise (001150, "Criar Contrato - propriedades", "Endereço-ID deve ser um numero")
                bolValida=false
            end if
           ' if prv_ValeTransporte="-"  OR not Isnumeric(prv_ValeTransporte) then
           '     call err.Raise (001160, "Criar Contrato - propriedades", "Entrar Vale Transporte")
           '     bolValida=false
           ' end if    

            if isempty(prv_ArrayDiasDaSemana) then
                
            end if
            if bolValida=true then    
                dim objCon,  objRS, strMsg, strICQ, obCmd
                set objCon = Server.CreateObject ("ADODB.Connection")
                Set objRS = Server.CreateObject ("ADODB.Recordset")
                objCon.Open strConn
                objRS.CursorLocation = 2 
                objRS.CursorType = 1
                objRS.LockType = 3
                objRS.open "Contrato.Contrato",objCon,,,adCmdTable
                objRS.addNew


            'já está validado, gravar tudo...
                objRS("RecebeFGTS") =prv_RecebeFGTS
                objRS("DataEmissaoContrato") =prv_DataEmissaoContrato
                objRS("DataAdmissao") =prv_DataAdmissao
                objRS("Salario") =replace(prv_Salario,",",".")
                objRS("SalarioPorExtenso") =prv_SalarioPorExtenso

                objRS("isAtivo") =true
                if isdate(prv_DataCriacao) then
                    objRS("DataCriacao") =prv_DataCriacao
                Else
                    'response.Write now()
                    objRS("DataCriacao") =month(now()) & "/" & day(now()) & "/" & year(now()) 
                end if
                objRS("TipoEstabelecimentoID") =1
                objRS("TipoOcupacaoID") =prv_TipoOcupacaoID
                objRS("EmpregadoID") =prv_EmpregadoID
                objRS("EmpregadorID") =prv_EmpregadorID
                objRS("PeriodoExperienciaID") =prv_PeriodoExperienciaID
                objRS("EnderecoID") =prv_EnderecoID
                objRS("bolImrimiuReciboCT") =prv_bolImrimiuReciboCT
                objRS("bolImrpimiuContrato") =prv_bolImrpimiuContrato
                objRS("bolImprimiuModeloCT") =prv_bolImprimiuModeloCT
                objRS("bolImprimiuSolicitacaoVT") =prv_bolImprimiuSolicitacaoVT
                objRS("bolImprimiuAbreMaoVT") =prv_bolImprimiuAbreMaoVT
                objRS("bolVeioDeAgenciaDeTrabalho") =prv_bolVeioDeAgenciaDeTrabalho

                objRS("ValeTransporte") =prv_ValeTransporte
                objRS.update
                prv_ID=objRS("ID")
                strContratoID =  objRS("ID")
                'response.Write strContratoID
                gravaContrato=strContratoID
                objRS.close
    
                exec = "insert into contrato.AlteracaoCargoSalario (empregadoID, OcupacaoID, Motivo, Salario, Data, primeiroLancamento) Values ("
                exec=exec& prv_EmpregadoID &", " & prv_TipoOcupacaoID &  ",  'Inicial', " & replace(prv_Salario,",",".") & ", '" & prv_DataAdmissao & "', 1)"
'response.Write exec
                objCon.execute exec
    '           gravar dias da setimana...
                addDiasDaSemana prv_ID, prv_ArrayDiasDaSemana 
                objCon.close 
                set objRS=nothing
                set objCon=nothing   
            else    
                gravaContrato="erro ao gravar"  
            end if
    end function
    '---------
    'contrato.gravaContrato.alteraCargoSalario(EmpregadoID, OcupacaoID, Motivo, Salario, Data)
    '---------
    public function alteraCargoSalario(EmpregadoID, OcupacaoID, Motivo, Salario, Data)
            dim bolValida
            bolValida=true
            if EmpregadoID=""   then
                call err.Raise (002043, "Aumento - empregado nao identificado")
                 bolValida=false
            end if       
             if OcupacaoID=""   then
                call err.Raise (002044, "Aumento - OcupacaoID nao identificado")
                 bolValida=false
            end if  
            if Motivo=""   then
                call err.Raise (002045, "Aumento - Motivo nao identificado")
                 bolValida=false
            end if  
            if Salario=""   then
                call err.Raise (002046, "Salario - Salároo nao identificado")
                 bolValida=false
            end if  
            if Data=""   then
                call err.Raise (002047, "Data - Data nao identificado")
                 bolValida=false
            else
                if not isdate(Data) then
                    call err.Raise (002048, "Data -Em formato inválido")
                     bolValida=false                
                end if
            end if  
            if bolValida then
                salario = replace(Salario,".","")
                salario = replace(Salario,",",".")
                dim objCon,  objRS, strMsg
                set objCon = Server.CreateObject ("ADODB.Connection")
                Set objRS = Server.CreateObject ("ADODB.Recordset")
                objCon.Open strConn
                objRS.CursorLocation = 2 
                objRS.CursorType = 1
                objRS.LockType = 3
                objRS.open "Contrato.AlteracaoCargoSalario",objCon,,,adCmdTable
                objRS.addNew
                objRS("EmpregadoID")=EmpregadoID
                objRS("OcupacaoID")=OcupacaoID

    ''          a data de alteração deve ser sempre o dia 1 do mês subsequente, ou o próprio dia 1 se colocado neste dia. Joana - 14/07/2014
                if day(Data) = 1 then
                    dataAlteracao= Month(Data) & "/" & day(Data) & "/" & year(data)
                else
                     dataAlteracao= Month(dateadd("m",1,Data)) & "/1/" & year(data)
                end if
                objRS("Motivo")=Motivo
                objRS("Salario")=Salario
                objRS("Data")=dataAlteracao' Month(Data) & "/" & day(Data) & "/" & year(data)
                objRS("primeiroLancamento")=0
                objRS.update
                alteraCargoSalario = objRS("ID")
                objRS.close
                exec = "update contrato.contrato set TipoOcupacaoID=" & OcupacaoID & ", Salario=" & Salario & ", SalarioPorExtenso='" & extenso(replace(Salario,".",",")) & "' where EmpregadoID=" & EmpregadoID & " AND empregadorID=" & session("ID")
                objCon.execute exec
                objCon.close 
                set objRS=nothing
                set objCon=nothing  
            else
        
                alteraCargoSalario="0"
            end if
                   
    end function
    '---------
    'contrato.HaSalariosFuturos(mes, ano, empregadoID)
    '---------
    public function HaSalariosFuturos(mes, ano, empregadoID)
        dataFormatada = ano & "-" & mes & "-1"
        dim objCon,  objRS, strMsg
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.Open strConn 
        sql="select * from empregado.salario where empregadoID=" & empregadoID & " AND data >= convert(datetime, '" & dataFormatada & "')"
        objRS.open sql, objCon,,,adcmdtext
        if objRS.bof and objRS.eof then
            HaSalariosFuturos=FALSE
        else
            HaSalariosFuturos=TRUE
        end if 
        objRS.close
        objCon.close 
        set objRS=nothing
        set objCon=nothing
    end function
    public function ExcluiAumentoSalarial(empregadoID, salarioID)
        dim objCon,  objRS, strMsg
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.Open strConn 
        sql="select * from contrato.AlteracaoCargoSalario where empregadoID=" & empregadoID & " order by ID ASC"
         objRS.open sql, objCon,,,adcmdtext
        if objRS.bof and objRS.eof then
            ExcluiAumentoSalarial=false
        else
            dim salAtual, salAnterior
            salAnterior = objRS("Salario")
            while not objRS.eof  

                response.Write " ID Vindo como parametro: " & salarioID & " | ID ATUAL: "  & objRS("ID") & "<br>"



                   ' if objRS("ID") = cint(salarioID) then
                     '   objCon.execute "update contrato.contrato set salario=" & replace(  salAnterior, ",",".") & " where empregadoID=" &  empregadoID
                    '    response.Write salAnterior & "ID: " & objRS("ID") & ", salarioID: " & salarioID & " | " 
                   ' else
                    '    response.Write salAnterior & " NOT " & "ID: " & objRS("ID") & ", salarioID: " & salarioID  & " | " 
                   ' end if
                    'salAnterior = objRS("Salario")
                objRS.movenext
            wend 
            ExcluiAumentoSalarial=true
            objcon.execute "delete from contrato.AlteracaoCargoSalario    WHERE id=" & salarioID
        end if     
        objRS.close    


        
        objCon.close 
        set objRS=nothing
        set objCon=nothing
    end function

    '---------
    'contrato.carregaSalarioBaseMes(mes, ano, EmpregadoID)
    '---------
    public function carregaSalarioBaseMes(mes, ano, EmpregadoID)
        dim objCon,  objRS, strMsg
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.Open strConn
        strMsg="select *  from Contrato.AlteracaoCargoSalario WHERE "
        strMsg=strMsg & " EmpregadoID= " & EmpregadoID & " order by ID asc" ' caso haja mais de uma alteração pro mês, leva a última em cosideraçao
        objRS.open strMsg, objCon,,,adcmdText
        if not (objRS.bof and objRS.eof) then
          
                currentSalario = objRS("salario")
                dataBase = mes & "/01/" & ano
                while not objRS.eof    
                    dataAtualizada = month(objRS("data")) & "/" & day(objRS("data")) & "/" & year(objRS("data"))
                    diferenca =  DateDiff("d",dataAtualizada , dataBase)                
                    if diferenca >= 0 then currentSalario = objRS("salario")
                    lastatas = lastatas & "  -- <br>Data inicial: " & objRS("data") & ", Data Final: " & dataBase & ", diferenca: "  & diferenca & " |<br> "
                    objRS.movenext
                wend
                carregaSalarioBaseMes=formatCurrency(currentSalario,2) '& lastatas
            'else
              '  carregaSalarioBaseMes=objRS("salario") & "recordcount=1"
            'end if      
        else
            carregaSalarioBaseMes=null
        end if 
        objRS.close
        objCon.close 
        set objRS=nothing
        set objCon=nothing
    end function
    '---------
    'contrato.addDiasDaSemana(contID, ddsID) 
    '---------
    private sub addDiasDaSemana(contID, ddsID) ''meio arriscado... melhor mudar isso
        dim objCon, iii
        set objCon=server.CreateObject("ADODB.Connection")
        objCon.open strConn
        for iii=0 to ubound(ddsID)
            'response.Write  "insert into contrato.DiaDaSemanaContrato (contratoID,  DiaDaSemanaID) values (" & contID & ", " & ddsID(iii) & ")"
            objCon.execute "insert into contrato.DiaDaSemanaContrato (contratoID,  DiaDaSemanaID) values (" & contID & ", " & ddsID(iii) & ")"
        next
        objCon.close
        set objCon=nothing
    end sub
    '---------
    'contrato.getDiasDaSemana(idCont) 
    '---------
    public function getDiasDaSemana(idCont)
          dim objRS2, objCon2,outstring
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset") 
        objCon2.open strConn
        leSQL= "select dbo.DiaDaSemana.Nome as Nome from contrato.DiaDaSemanaContrato inner join  dbo.diaDaSemana on contrato.DiaDaSemanaContrato.DiaDaSemanaID= dbo.diaDaSemana.ID where contrato.DiaDaSemanaContrato.ContratoID=" & idCont & " order by diadasemanaID"
        objRS2.open leSQL, objCon2,,,adCmdText
        if objRS2.Bof and objRS2.EOF then
            getDiasDaSemana = null
        else
            while not objRS2.EOF
                outstring=outstring & objRS2("Nome") & ","
               objRS2.movenext
            wend
            outstring = left(outstring,len(outstring)-1)
            getDiasDaSemana = split(outstring,",")
        end if
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function
    '---------
    'contrato.getFkrtContrato(idFunc, isUltimo, idContrato)
    '---------    

   public function getFkrtContrato(idFunc, isUltimo, idContrato)
    'talvez retornar a coleção de contratos... o nome da função seria o indice ou um array... de qqr maneira ela teria que retornar um array e um indice.
        dim fnSQL, where
        dim objRS2, objCon2
        if isUltimo="true" then
            '?sera q precisa??
        end if
        if idContrato>0 then
            where = " AND Contrato.ID=" & idContrato
        end if
        
        fnSQL = "select top 1 *, dbo.cidade.nome as Cidade, contrato.TipoOcupacao.nome as TipoOcupacao, dbo.estado.nome as estado, contrato.tipoOcupacao.CBO as CBO  from Contrato.Contrato INNER JOIN Contrato.TipoOcupacao on Contrato.Contrato.TipoOcupacaoID=Contrato.TipoOcupacao.ID "
        fnSQL=fnSQL & " INNER JOIN contrato.endereco on Contrato.Contrato.EnderecoID = Contrato.endereco.ID "
        fnSQL=fnSQL & " INNER JOIN dbo.cidade on Contrato.endereco.CidadeID = dbo.cidade.ID inner join dbo.estado on dbo.cidade.estadoID=dbo.estado.ID"
        fnSQL=fnSQL & " where Contrato.Contrato.EmpregadoID=" & idFunc & where & " order by Contrato.Contrato.ID DESC"

    'response.Write fnSQL
    'juntar com endereço
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.open strConn
        objRS2.open fnSQL, objCon2,,,adCmdText
        if (objRS2.bof AND objRS2.EOF) then
            prv_Salario="-"
            prv_DataAdmissao="-"
            prvTipoOcupacao="-"
            prv_contrato_ID="-"
            getFkrtContrato=false
        else
            dim dataForCalcs
           dataForCalcs =cdate( day( objRS2("DataAdmissao")) & "/" & month(objRS2("DataAdmissao")) & "/" & year(objRS2("DataAdmissao")))
            prv_Salario=objRS2("Salario")
            prv_SalarioPorExtenso=objRS2("SalarioPorExtenso")
            prv_DataAdmissao=dataForCalcs'objRS2("DataAdmissao")
            prv_TipoOcupacaoID=objRS2("TipoOcupacao") 
            prv_contrato_ID=objRS2(0) 
            if not isnull(objRS2("DataAdmissao")) then
                select case objRS2("PeriodoExperienciaID") ' PeriodoExperienciaID vai carregar a data fim do periodo de experiencia
                    case 1
                        prv_PeriodoExperienciaID=dateadd("d", dataForCalcs,30)
                    case 2
                        prv_PeriodoExperienciaID=dateadd("d", dataForCalcs,60)
                    case 3
                        prv_PeriodoExperienciaID=dateadd("d", dataForCalcs,90)
                    case 4
                        prv_PeriodoExperienciaID=dataForCalcs
                end select
            else
                prv_PeriodoExperienciaID="01/01/1900"
            end if
            'prv_PeriodoExperienciaID= objRS2("PeriodoExperienciaID")
            getFkrtContrato=True    
            prv_bolImprimiuAbreMaoVT=objRS2("bolImprimiuAbreMaoVT")
            prv_bolImprimiuModeloCT=objRS2("bolImprimiuModeloCT")
            prv_bolImrpimiuContrato=objRS2("bolImrpimiuContrato")
            prv_bolImprimiuSolicitacaoVT=objRS2("bolImprimiuSolicitacaoVT")
            prv_bolImprimiuAbreMaoVT=objRS2("bolImprimiuAbreMaoVT")
            prv_bolVeioDeAgenciaDeTrabalho=objRS2("bolVeioDeAgenciaDeTrabalho")
            prv_ArrayDiasDaSemana = getDiasDaSemana(  idContrato )     
            prv_RecebeFGTS      =objRS2("RecebeFGTS")
            prv_valeTransporte = objRS2("valeTransporte")
            prv_Logradouro=objRS2("Logradouro")
            prv_Numero=objRS2("Numero")
            prv_Bairro=objRS2("Bairro")
            prv_Complemento=objRS2("Complemento")
            prv_CEP=objRS2("CEP")
            prv_CidadeID=objRS2("Cidade")
            prv_Estado=objRS2("Estado")
            prv_CBO=objRS2("CBO")
            prv_isAtivo=objRS2("isAtivo")
            prv_DataEmissaoContrato=objRS2("DataEmissaoContrato")

    'preciso dos dados de dependentes e o kct

        end if
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function
    '---------
    'contrato.baixaImpressao(campo)
    '--------- 
    function baixaImpressao(campo)
        'função para baixar os campos das impressões dos contratos
        dim objCon:  set objCon=server.CreateObject("ADODB.Connection")
        objCon.open strConn
        if not isnumeric(prv_contrato_ID) then
             Err.Raise  Err.Number, " contrato_ID não inicializado - ", Err.Description
        end if

       ' on error resume next
       ' response.Write "update Contrato.Contrato set " & campo & "=1 where ID=" & prv_contrato_ID
        objCon.execute "update Contrato.Contrato set " & campo & "=1 where ID=" & prv_contrato_ID
        if err.number<>0 then
           baixaImpressao=err.Description
        else
              baixaImpressao="Baixado" & prv_contrato_ID
            prv_bolImprimiuAbreMaoVT=true
        end if
        set objCon =nothing
    end function
    '---------
    'contrato.getRecordsetOfContratos(idFunc)
    '--------- 
   public function getRecordsetOfContratos(idFunc)
    'talvez retornar a coleção de contratos... o nome da função seria o indice ou um array... de qqr maneira ela teria que retornar um array e um indice.
        dim fnSQL, where
        dim objRS2, objCon2
        if isUltimo then
            '?sera q precisa??
        end if
        if idContrato>0 then
            where = " AND Contrato.ID=" & idContrato
        end if
        
        fnSQL = "select  * from Contrato.Contrato INNER JOIN Contrato.TipoOcupacao on Contrato.Contrato.TipoOcupacaoID=Contrato.TipoOcupacao.ID "
        fnSQL=fnSQL & " where Contrato.Contrato.EmpregadoID=" & idFunc  & " order by Contrato.Contrato.ID DESC"
        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfContratos", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOfContratos = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function
    '---------
    'contrato.getRecordsetOfAlteracoesContratuais(idFunc)
    '--------- 
   public function getRecordsetOfAlteracoesContratuais(idFunc, sentido)
    'talvez retornar a coleção de contratos... o nome da função seria o indice ou um array... de qqr maneira ela teria que retornar um array e um indice.
        dim fnSQL, where
        dim objRS2, objCon2
        if isUltimo then
            '?sera q precisa??
        end if
        if idContrato>0 then
            where = " AND Contrato.ID=" & idContrato
        end if
        fnSQL= "select * from view_alteracaoSalarial "
        'fnSQL = "select  * from Contrato.AlteracaoCargoSalario INNER JOIN Contrato.TipoOcupacao on Contrato.AlteracaoCargoSalario.OcupacaoID=Contrato.TipoOcupacao.ID "
        fnSQL=fnSQL & " where EmpregadoID=" & idFunc  
        fnSQL=fnSQL & " order by ID " & sentido
    


        set objCon2 = Server.CreateObject ("ADODB.Connection")
        Set objRS2 = Server.CreateObject ("ADODB.Recordset")
        objCon2.CursorLocation = adUseClient 
        objCon2.open strConn
        objRS2.CursorLocation = adUseClient
        objRS2.locktype=adLockReadOnly
        objRS2.CursorType = adOpenStatic
        objRS2.open fnSQL, objCon2,,,adCmdText
        if Err <> 0 then
            Err.Raise  Err.Number, "ADOHelper: getRecordsetOfContratos", Err.Description
        end if

        set objRS2.activeconnection=nothing
        set getRecordsetOfAlteracoesContratuais = objRS2.clone(adLockReadOnly)
        objRS2.close
        objCon2.close
        set objCon2 =nothing
        Set objRS2 = nothing
    end function

end class

    '############################################
    'CLASSE ENDERECO
    'adicionar metodos para pegar nome da cidade e do estado... buscar dados a partir do CEP
    '############################################

class Endereco
	Private m_record_exist
	Private m_ID
	Private m_Logradouro
	Private m_Numero
	Private m_Bairro
	Private m_Complemento
	Private m_CEP
	Private m_CidadeID
    private m_Cidade
    private m_Estado
    private m_EstadoSigla




	Public Property Get ID()
		if cstr(m_ID) = "" then
			ID = 0
		else
			ID = m_ID
		end if
	End Property
	Public Property Let ID(p_Data)
		m_ID = p_Data
	End Property

	Public Property Get Cidade()
		Cidade = m_Cidade
	End Property
	Public Property Let Cidade(p_Data)
		m_Cidade = p_Data
	End Property

	Public Property Get EstadoSigla()
		EstadoSigla = m_EstadoSigla
	End Property
	Public Property Let EstadoSigla(p_Data)
		m_EstadoSigla = p_Data
	End Property
	Public Property Get Estado()
		Estado = m_Estado
	End Property
	Public Property Let Estado(p_Data)
		m_Estado = p_Data
	End Property


	'Read/Store the current Logradouro value
	Public Property Get Logradouro()
		Logradouro = m_Logradouro
	End Property
	Public Property Let Logradouro(p_Data)
		m_Logradouro = p_Data
	End Property

	'Read/Store the current Numero value
	Public Property Get Numero()
		Numero = m_Numero
	End Property
	Public Property Let Numero(p_Data)
		m_Numero = p_Data
	End Property

	'Read/Store the current Bairro value
	Public Property Get Bairro()
		Bairro = m_Bairro
	End Property
	Public Property Let Bairro(p_Data)
		m_Bairro = p_Data
	End Property

	'Read/Store the current Complemento value
	Public Property Get Complemento()
		Complemento = m_Complemento
	End Property
	Public Property Let Complemento(p_Data)
		m_Complemento = p_Data
	End Property

	'Read/Store the current CEP value
	Public Property Get CEP()
		CEP = m_CEP
	End Property
	Public Property Let CEP(p_Data)
		m_CEP = p_Data
	End Property

	'Read/Store the current CidadeID value
	Public Property Get CidadeID()
		if cstr(m_CidadeID) = "" then
			CidadeID = 0
		else
			CidadeID = m_CidadeID
		end if
	End Property
	Public Property Let CidadeID(p_Data)
		m_CidadeID = p_Data
	End Property



     function  AddEndereco(tabela)  
        dim objCon,  objRS, strMsg, strICQ, obCmd
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.Open strConn
        objRS.CursorLocation = 2 
        objRS.CursorType = 1
        objRS.LockType = 3
        objRS.open tabela & ".Endereco",objCon,,,adCmdTable
        objRS.addNew
        objRS("Logradouro")=m_Logradouro
        objRS("Numero")=m_Numero
        objRS("Bairro")=m_Bairro
        objRS("Complemento")=m_Complemento
        objRS("Cep")=m_Cep
    
        objRS("CidadeID")=m_CidadeID
        objRS.update
        AddEndereco = objRS("ID")
        objCon.close 
        set objRS=nothing
        set objCon=nothing   
    end function
    function getEndereco(tabela, ID)
        dim objCon,  objRS, strMsg, strICQ, obCmd
        set objCon = Server.CreateObject ("ADODB.Connection")
        Set objRS = Server.CreateObject ("ADODB.Recordset")
        objCon.Open strConn
        objRS.open "select * from " & tabela & ".Endereco where ID=" & ID, objCon,,,adcmdtext
        if (objRS.bof and objRS.EOF) then


	         m_Logradouro = ""
	         m_Numero = ""
	         m_Bairro = ""
	         m_Complemento = ""
	         m_CEP = ""
	         m_CidadeID = ""
             m_cidade=""
             m_estado=""
             m_EstadoSigla=""
            getEndereco=false
            objRS.close
        else
	         m_Logradouro =objRS("Logradouro")
	         m_Numero =objRS("Numero")
	         m_Bairro =objRS("Bairro")
	         m_Complemento =objRS("Complemento")
	         m_CEP =objRS("CEP")
	         m_CidadeID =objRS("CidadeID")
             objRS.close
             objRS.open "select dbo.Cidade.Nome as Cidade, dbo.Estado.Nome as Estado, dbo.Estado.Sigla as Sigla from dbo.Cidade inner join dbo.Estaedo where where ID=" & m_CidadeID, objCon,,,adcmdtext
             if (objRS.bof and objRS.eof) then
                m_cidade="erro"
                m_estado="erro"
                m_EstadoSigla="erro"
            else
                m_cidade=objRS("Cidade")
                m_estado=objRS("Estado")
                m_EstadoSigla=objRS("Sigla")
            end if
            objRS.close
            getEndereco=true
        end if
        objCon.close 
        set objRS=nothing
        set objCon=nothing

    end function
    'adicionar leitura de endereço...
end class



  '      set patrao=new empregador
 '   patrao.carregaDadosEmpregador 1

 '   patrao.empregador_CidadeID
    'implementar ciade / estado patrão
    'formatar todas as datas já aqui no componente

    ' set fulano = new empregado
    



    'set esseContrato=new contrato
    'esseContrato.DataAdmissao
 '   essecontrato.DiasDaSemana
    
    'set patrao = new empregador
    'patrao.carregaDadosEmpregador
    'fulano.ID=3
    'fulano.EmpregadorID = session("ID")
    'fulano.carregaDadosFunc()
    'response.Write patrao.empregador_Nome &"<br>"
    'response.Write fulano.Nome
  
%>

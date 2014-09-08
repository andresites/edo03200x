<!--#include file="conecta_bd.asp"-->

<%'script de deleção genérico. Exige o parametro "tabs" como integer para redirecionar...


dim  funcID, advtID, preFuncID

    dim objCon,  objRS, strMsg
    set objCon = Server.CreateObject ("ADODB.Connection")
    Set objRS = Server.CreateObject ("ADODB.Recordset")
                    objCon.open strConn
preFuncID=limpaquerystring("id")
tb=limpaquerystring("tb")
    if tb="" then tb="1"
prv=limpaquerystring("prv")
mes=limpaquerystring("mes")
ano=limpaquerystring("ano")
    co = limpaquerystring("co")
'idRegistro = limpaquerystring("id")
lastID = limpaquerystring("lastID")
if tb="" then response.Redirect "empregado_ficha.asp?ID=" & funcID
dim fulano, eleexiste
eleexiste=false
set fulano = new empregado

if len(preFuncID)>0  then  
    
    fulano.ID=preFuncID
    fulano.EmpregadorID=session("ID")
    eleexiste = fulano.carregaDadosFunc ()
    if eleexiste then
        
       ' response.Write "SIM, ELE EXISTE"
        if tb="" then response.Redirect "delreturn.asp?erro=03&ID="& funcID
        if prv="" then response.Redirect "delreturn.asp?erro=04&ID="& funcID
        funcID=fulano.ID
        if isnumeric(tb) then
            select case tb
            case 1
                if lastID="" then 
                   response.Redirect "delreturn.asp?erro=11&ID="& funcID
                else
                   if not isnumeric(prv) then response.Redirect "delreturn.asp?erro=12&ID="& funcID
                    if not isnumeric(co) then response.Redirect "delreturn.asp?erro=13&ID="& funcID 
    '           1- pegar contratoAnterior
                    set essecontrato = new contrato
                    set alteracoesContratuais = essecontrato.getRecordsetOfAlteracoesContratuais(funcID, "ASC" ) 
                        if not (alteracoesContratuais.BOF and alteracoesContratuais.EOF) then
                            DIM currAlteracaoSalarial, currSalario, currCargo
                            currSalario = alteracoesContratuais("Salario")
                            currAlteracaoSalarial = alteracoesContratuais("id")
                            currCargo = alteracoesContratuais("OcupacaoID")
                            while not alteracoesContratuais.EOF

                                if cint(prv) = alteracoesContratuais("ID") then
                                    objCon.execute "update contrato.contrato set TipoOcupacaoID=" & currCargo & ", Salario=" & replace(currSalario,",",".") & " where ID=" & co
                                    objCon.execute "delete from contrato.AlteracaoCargoSalario where ID=" & prv
                                
                                end if
                                if alteracoesContratuais("ID") > cint(prv)  then
                                    objCon.execute "update contrato.contrato set TipoOcupacaoID=" & alteracoesContratuais("OcupacaoID")  & ", Salario=" & replace(alteracoesContratuais("Salario"),",",".") & " where ID=" & co
                                end if

                                currSalario = alteracoesContratuais("Salario")
                                currAlteracaoSalarial = alteracoesContratuais("id")
                                currCargo = alteracoesContratuais("OcupacaoID") 


                                alteracoesContratuais.movenext
                            wend
                            alteracoesContratuais.close
                            set alteracoesContratuais=nothing
                            response.Redirect  "delreturn.asp?tab=01&ID="  & preFuncID
                        end if
                    end if  
            case 4' adiantamentos
                if mes="" or not(isnumeric(mes)) then response.Redirect  "delreturn.asp?erro=41&ID="& funcID
                if ano="" or not(isnumeric(ano)) then response.Redirect  "delreturn.asp?erro=42&ID="& funcID
                sql="delete from empregado.adiantamento where empregadoID=" & funcID & " AND ID=" & prv
                objCon.execute sql
              ' response.Write sql
                fulano.calculaSalarioDoMes mes, ano 'atualiza salario do mÊs
                response.Redirect "delreturn.asp?tab=04&ID="  & preFuncID
            case 5 ' salário
                if mes="" or not(isnumeric(mes))then response.Redirect  "delreturn.asp?erro=51&ID="& funcID
                if ano="" then response.Redirect  "delreturn.asp?erro=52&ID="& funcID
                sql="delete from empregado.Salario where empregadoID=" & funcID & " AND ID=" & prv
                on error resume next
                 objCon.execute sql
                if err.number<>0 then 
                    response.Redirect "delreturn.asp?erro=53&tab=05&ID="  & preFuncID
                else
                    response.Redirect "delreturn.asp?tab=05&ID="  & preFuncID & "&msgAd=" & err.Description
                end if
              case 6 ' 13° salário
                if mes="" or not(isnumeric(mes))then response.Redirect  "delreturn.asp?erro=61&ID="& funcID
                if ano="" then response.Redirect  "delreturn.asp?erro=62&ID="& funcID
                sql="delete from empregado.Salario where empregadoID=" & funcID & " AND ID=" & prv
                on error resume next
                 objCon.execute sql
                if err.number<>0 then 
                    response.Redirect "delreturn.asp?erro=63&tab=06&ID="  & preFuncID
                else
                    response.Redirect "delreturn.asp?tab=06&ID="  & preFuncID & "&msgAd=" & err.Description
                end if
          
            case else
                response.Redirect "delreturn.asp?erro=00&ID="  & preFuncID
            end select
   
            
            objCon.close 
            set objCon=nothing
            set fulano =  nothing
            'response.Redirect "empregado_ficha.asp?ID=" & funcID & "&tabs=" & tb
        else
            
            response.Redirect "delreturn.asp?erro=02&ID="  & preFuncID
        end if
    end if
else
    response.Redirect "delreturn.asp?erro=01&ID="  & preFuncID
end if
   ' objCon.close
    set objCon =nothing
    Set objRS = nothing
%>....
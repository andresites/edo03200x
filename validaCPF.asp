<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="JSON_2.0.4.asp"-->

<%
Function CheckCPF(CPF)
   Dim EVAR1 
   Dim evar2 
   Dim F 
   CPF = Replace(CPF,".","")
   CPF = Replace(CPF,",","")
   CPF = Replace(CPF,"-","")
   CPF = Replace(CPF,"/","")
   
   If Len(Trim(CPF)) <> 11 Then
      CheckCPF = False
      Exit Function
   End If
   Select case trim(CPF)
   Case 00000000000
         CheckCPF = False
      Exit Function
   case 11111111111
         CheckCPF = False
      Exit Function
   Case 22222222222
         CheckCPF = False
      Exit Function
   Case 33333333333
         CheckCPF = False
      Exit Function
   case 44444444444
         CheckCPF = False
      Exit Function
   case 55555555555
         CheckCPF = False
      Exit Function
   case 66666666666
         CheckCPF = False
      Exit Function
   case 77777777777
         CheckCPF = False
      Exit Function
   case 88888888888
         CheckCPF = False
      Exit Function
   case 99999999999
         CheckCPF = False
      Exit Function
   End select   
   
   
   'primeiro digito do CPF
   EVAR1 = 0

   For F = 1 To 9
      EVAR1 = EVAR1 + (Mid(CPF, F, 1)) * (11 - F) 
   Next
   evar2 = 11 - (EVAR1 - (int(EVAR1 / 11) * 11))
   If evar2 = 10 Or evar2 = 11 Then evar2 = 0
   If evar2 <> cint(Mid(CPF, 10, 1)) Then
      CheckCPF = false
      Exit Function
   End If
    'Segundo digito do CPF
   EVAR1 = 0
   F=0
   For F = 1 To 10
       EVAR1 = EVAR1 + Mid(CPF, F, 1) * (12 - F)        
   Next
   evar2 = 11 - (EVAR1 - (int(EVAR1 / 11) * 11))
   If evar2 = 10 Or evar2 = 11 Then evar2 = 0
   If evar2 <> cint(Mid(CPF, 11, 1)) Then
      CheckCPF = false
      Exit Function
  End If
  
  CheckCPF = True
End Function
cpf=request.form("cpf")
    if not(CheckCPF(cpf)) then response.Write "ERRO" else response.Write "OK"

%>
<%
'==================================================================================
'	ASP Classic Class Creator
'	acc_functions.asp
'	by Mamot Reyes
'   http://aspclasscreator.hiligko.com
'==================================================================================



Function IIf(condition,value1,value2)
	If condition Then IIf = value1 Else IIf = value2
End Function

'======================================
'      ERROR CHECKING RELATED
'======================================
'Returns true is string(strm_string is a valid numeric number
function isReallyNumeric(m_string) 
	isReallyNumeric = true 
	period = false
	cntr_check = 0
	for i = 1 to len(m_string) 
		d = mid(m_string, i, 1) 
		if asc(d) < 48 OR asc(d) > 57 then 
			if asc(d) = 46 then
				if period = true and asc(d) = 46 then
					isReallyNumeric = false 
					exit for 
				end if
				period = true
			else
				isReallyNumeric = false 
				exit for 
			end if
		end if 
		if period = true then
			if cntr_check > 2 then
				isReallyNumeric = false 
				exit for 
			end if
			cntr_check = cntr_check +1
		end if
	next 
end function 

function IsEmail (myEmail)
	dim isValidE
  	dim regEx
    isValidE = True
  	set regEx = New RegExp
    regEx.IgnoreCase = False
    regEx.Pattern = "^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
  	isValidE = regEx.Test(myEmail)
	'response.write  isValidE
    IsEmail = isValidE
end function

'====================================
'         DATABASE RELATED
'====================================
'Returns the field (fld_name) from the sql string(strSQL)
function returnSqlField(m_sql, m_fld_name)
	'trace "<br>" & m_sql & "<br>"
	set rsReturnSqlField = FCconn.execute(m_sql)
	if not rsReturnSqlField.eof then
		returnSqlField = rsReturnSqlField(m_fld_name)
	else
		returnSqlField = ""
	end if
	set rsReturnSqlField = nothing
end function

'Returns the lates ID field(m_id_field) from the table(m_table_name)
function getLastID(m_table_name, m_id_field)
	sql = "SELECT top 1 " & m_id_field & " FROM " & m_table_name & " ORDER BY " & m_id_field & " DESC"
	set rsGetLastID = FCconn.execute(sql)
	if not rsGetLastID.EOF then
		getLastId = rsGetLastID(m_id_field)
	else
		getLastId = 0
	end if
	rsGetLastID.close
	set rsGetLastID = nothing
end function

'STRIP CHARACTERS
function strip(str)
	strip = replace(str,"'","''")
end function

function strip2(p_value)
	strip2 = server.HTMLEncode(p_value)
end function

'-------------------------------------------
' Function to Convert String to Hexa
'-------------------------------------------
Function DeHex(pstrString)
	Dim llngIndex
	Dim llngMaxIndex
	Dim lstrHex
	llngMaxIndex = Len(pstrString)
	For llngIndex = 1 To llngMaxIndex
		lstrHex = lstrHex & Right("0" & Hex(Asc(Mid(pstrString, llngIndex, 1))), 2)
	Next
	DeHex = lstrHex
End Function
'-------------------------------------------
' Function to Convert Hexa to String
'-------------------------------------------
Function UnHex(pstrHex)
	Dim llngIndex
	Dim llngMaxIndex
	Dim lstrString
	llngMaxIndex = Len(pstrHex)
	For llngIndex = 1 To llngMaxIndex Step 2
		lstrString = lstrString & Chr("&h" & Mid(pstrHex, llngIndex, 2))
	Next
	UnHex = lstrString
End Function
'-------------------------------------------
' Function to Encrypt the String Value
'-------------------------------------------
Function Encrypt(ByVal string)
	Dim x, i, tmp
	For i = 1 To Len( string )
		x = Mid( string, i, 1 )
		tmp = tmp & Chr( Asc( x ) + 1 )
	Next
	tmp = StrReverse( tmp )
	Encrypt = tmp
End Function
'-------------------------------------------
' Function to Decrypt the String Value
'-------------------------------------------
Function Decrypt(ByVal encryptedstring)
	Dim x, i, tmp
	encryptedstring = StrReverse( encryptedstring )
	For i = 1 To Len( encryptedstring )
		x = Mid( encryptedstring, i, 1 )
		tmp = tmp & Chr( Asc( x ) - 1 )
	Next
	Decrypt = tmp
End Function

function EncryptAutoNumberID(theNumber)
	Dim n, szEnc, t, HiN, LoN, i
	n = CDbl((theNumber + 1570) ^ 2 - 7 * (theNumber + 1570) - 450)
	If n < 0 Then szEnc = "R" Else szEnc = "F"
	n = CStr(abs(n))
	For i = 1 To Len(n) step 2
	  t = Mid(n, i, 2)
	  If Len(t) = 1 Then
	   szEnc = szEnc & t
	   Exit For
	  End If
	  HiN = (CInt(t) And 240) / 16
	  LoN = CInt(t) And 15
	  szEnc = szEnc & Chr(Asc("M") + HiN) & Chr(Asc("C") + LoN)
	Next
	EncryptAutoNumberID = szEnc
End Function

Function DecryptAutoNumberID(theNumber)
	On Error Resume Next
	Dim e, n, sign, t, HiN, LoN, NewN, i
	e = theNumber
	If Left(e, 1) = "R" Then sign = -1 Else sign = 1
	e = Mid(e, 2)
	NewN = ""
	For i = 1 To Len(e) step 2
	  t = Mid(e, i, 2)
	  If Asc(t) >= Asc("0") And Asc(t) <= Asc("9") Then
	   NewN = NewN & t
	   Exit For
	  End If
	  HiN = Mid(t, 1, 1)
	  LoN = Mid(t, 2, 1)
	  HiN = (Asc(HiN) - Asc("M")) * 16
	  LoN = Asc(LoN) - Asc("C")
	  t = CStr(HiN Or LoN)
	  If Len(t) = 1 Then t = "0" & t
	  NewN = NewN & t
	Next
	e = CDbl(NewN) * sign
	DecryptAutoNumberID = CLng((7 + sqr(49 - 4 * (-450 - e))) / 2 - 1570)
End Function

function isPostBack()
	if request.form() <> ""  then
		isPostBack = true
	else
		isPostBack = false
	end if
end function
%>
<%
'==================================================================================
'	ASP Classic Class Creator
'	asp_class_creator.asp
'	by Mamot Reyes
'   http://aspclasscreator.hiligko.com
'	
'	Based from Richard Quinn's "Object Oriented ASP: Using Classes in Classic ASP"
'	http://www.asp101.com/articles/richard/ooasp/default.asp
'
'	Version 0.01 Beta
'	Released: February 2, 2010
'
'	Notes: This will work as long as you dont miss any fields, still no documentation
'==================================================================================
    ConnString ="Provider=Sqloledb; User ID=edomestico_test; Password=Infosys; Initial Catalog=edomestico_test;Data Source=PALM.arvixe.com"
if request.Form <> "" then
	'ConnString 			= request.Form("connstring")
	databasename 		= request.Form("databasename")
	class_name 			= request.Form("class_name")
	table_name 			= request.Form("table_name")
	instance_name 		= request.Form("instance_name")
	create				= request.Form("create")
	var_single			= request.Form("var_single")
	var_plural			= request.Form("var_plural")
	parent_id			= request.Form("parent_id")
	parent_id_name		= request.Form("parent_id_name")
else
	
End If
%><script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function YY_checkform() { //v4.71
//copyright (c)1998,2002 Yaromat.com
  var a=YY_checkform.arguments,oo=true,v='',s='',err=false,r,o,at,o1,t,i,j,ma,rx,cd,cm,cy,dte,at;
  for (i=1; i<a.length;i=i+4){
    if (a[i+1].charAt(0)=='#'){r=true; a[i+1]=a[i+1].substring(1);}else{r=false}
    o=MM_findObj(a[i].replace(/\[\d+\]/ig,""));
    o1=MM_findObj(a[i+1].replace(/\[\d+\]/ig,""));
    v=o.value;t=a[i+2];
    if (o.type=='text'||o.type=='password'||o.type=='hidden'){
      if (r&&v.length==0){err=true}
      if (v.length>0)
      if (t==1){ //fromto
        ma=a[i+1].split('_');if(isNaN(v)||v<ma[0]/1||v > ma[1]/1){err=true}
      } else if (t==2){
        rx=new RegExp("^[\\w\.=-]+@[\\w\\.-]+\\.[a-zA-Z]{2,4}$");if(!rx.test(v))err=true;
      } else if (t==3){ // date
        ma=a[i+1].split("#");at=v.match(ma[0]);
        if(at){
          cd=(at[ma[1]])?at[ma[1]]:1;cm=at[ma[2]]-1;cy=at[ma[3]];
          dte=new Date(cy,cm,cd);
          if(dte.getFullYear()!=cy||dte.getDate()!=cd||dte.getMonth()!=cm){err=true};
        }else{err=true}
      } else if (t==4){ // time
        ma=a[i+1].split("#");at=v.match(ma[0]);if(!at){err=true}
      } else if (t==5){ // check this 2
            if(o1.length)o1=o1[a[i+1].replace(/(.*\[)|(\].*)/ig,"")];
            if(!o1.checked){err=true}
      } else if (t==6){ // the same
            if(v!=MM_findObj(a[i+1]).value){err=true}
      }
    } else
    if (!o.type&&o.length>0&&o[0].type=='radio'){
          at = a[i].match(/(.*)\[(\d+)\].*/i);
          o2=(o.length>1)?o[at[2]]:o;
      if (t==1&&o2&&o2.checked&&o1&&o1.value.length/1==0){err=true}
      if (t==2){
        oo=false;
        for(j=0;j<o.length;j++){oo=oo||o[j].checked}
        if(!oo){s+='* '+a[i+3]+'\n'}
      }
    } else if (o.type=='checkbox'){
      if((t==1&&o.checked==false)||(t==2&&o.checked&&o1&&o1.value.length/1==0)){err=true}
    } else if (o.type=='select-one'||o.type=='select-multiple'){
      if(t==1&&o.selectedIndex/1==0){err=true}
    }else if (o.type=='textarea'){
      if(v.length<a[i+1]){err=true}
    }
    if (err){s+='* '+a[i+3]+'\n'; err=false}
  }
  if (s!=''){alert('The required information is incomplete or contains errors:\t\t\t\t\t\n\n'+s)}
  document.MM_returnValue = (s=='');
}
function secret(){
	var collection_class = document.getElementById("collection_class");
	var verify_script = document.getElementById("verify_script");
	if (document.form1.create[0].checked == true) {
		//alert("1")
		collection_class.style.display = "none"
		verify_script.style.display = "none"
	}else if (document.form1.create[1].checked == true) {
		//alert("2")
		collection_class.style.display = "block"
		verify_script.style.display = "none"
	}else if (document.form1.create[2].checked == true) {
		//alert("3")
		collection_class.style.display = "none"
		verify_script.style.display = "block"
	}
}

//-->
</script>
<form name="form1" method="post" action="">
  <table width="700" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="170">Database Name: </td>
      <td width="531"><input name="databasename" type="text" value="<%=databasename%>" size="70" maxlength="300"></td>
    </tr>
    <tr>
      <td width="170">Connection String: </td>
      <td width="531"><input name="ConnString" type="text" value="<%=connstring%>" size="70" maxlength="300"></td>
    </tr>
    <tr>
      <td>Table Name: </td>
      <td><input name="table_name" type="text" value="<%=table_name%>" size="50" maxlength="50"></td>
    </tr>
    <tr>
      <td>Class Name: </td>
      <td><input name="class_name" type="text" value="<%=class_name%>" size="50" maxlength="50"></td>
    </tr>
    <tr>
      <td>Create:</td>
      <td><input  <%If (CStr(create) = CStr("1")) Then Response.Write("checked=""checked""") : Response.Write("")%> name="create" type="radio" value="1" checked="checked" onclick="javascript:secret()" />
Individual Class
  <input <%If (CStr(create) = CStr("2")) Then Response.Write("checked=""checked""") : Response.Write("")%> name="create" type="radio" value="2" onclick="javascript:secret()" />
Collection Classs
<input <%If (CStr(create) = CStr("3")) Then Response.Write("checked=""checked""") : Response.Write("")%> name="create" type="radio" value="3" onclick="javascript:secret()" />
Verify Script </td>
    </tr>
    <tr>
      <td colspan="2"><div id="collection_class" style="display:none">
        <table width="700%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="170">Object Name Singular : </td>
            <td><input name="var_single" type="text" id="var_single" value="<%=var_single%>" size="50" maxlength="50" /></td>
          </tr>
          <tr>
            <td>Object Name Plural: </td>
            <td><input name="var_plural" type="text" id="var_plural" value="<%=var_plural%>" size="50" maxlength="50" /></td>
          </tr>
          <tr>
            <td>Parent ID : </td>
            <td><input name="parent_id" type="text" id="parent_id" value="<%=parent_id%>" size="50" maxlength="50" /></td>
          </tr>
          <tr>
            <td>Parent ID Name: </td>
            <td><input name="parent_id_name" type="text" id="parent_id_name" value="<%=parent_id_name%>" size="50" maxlength="50" /></td>
          </tr>
        </table>
      </div>
      <div id="verify_script" style="display:none">
        <table width="700%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="170">Instance Name: </td>
            <td><input name="instance_name" type="text" id="instance_name" value="<%=instance_name%>" size="50" maxlength="50" /></td>
          </tr>
        </table>
      </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input name="Submit" type="submit" onClick="YY_checkform('form1','ConnString','#q','0','Field \'ConnString\' is not valid.','table_name','#q','0','Field \'table_name\' is not valid.','class_name','#q','0','Field \'class_name\' is not valid.');return document.MM_returnValue" value="Submit"></td>
    </tr>
  </table>
</form>
<%

sub rw(str_text)
	response.Write str_text
end sub
sub rwbr(str_text)
	response.Write str_text & vbcrlf
end sub
if request.Form <> "" then	
	if isempty(conn) then
		Set conn = Server.CreateObject("ADODB.Connection")



		'conn.connectionstring = ConnString	
		conn.open "Provider=Sqloledb; User ID=edomestico_test; Password=Infosys; Initial Catalog=edomestico_test;Data Source=PALM.arvixe.com"
	end If
	
	Dim oADOX
	Set oADOX = Server.CreateObject("ADOX.Catalog")
	oADOX.ActiveConnection = Conn
	For Each col in oADOX.Tables(table_name).Columns
		db_fields = db_fields & delimeter & col.Name		
		db_field_types = db_field_types & delimeter & col.type
		delimeter = ","
	Next
	Set oADOX = Nothing

	arr_fields 			= split(db_fields, ",")
	arr_field_types     = split(db_field_types, ",")
	if rename_fields =  "" then
		arr_new_fields = arr_fields
	else
		arr_new_fields 		= split(rename_fields, ",")
	end if
	
	parent_id_field		= arr_fields(0)
	rwbr"<textarea name=""textfield"" cols=""80"" rows=""20"">"
	
if create = 1 then
	rwbr"&lt;%"
	rwbr"Class " & class_name
	rwbr"	'Generated using class_creator version 2(02.12.2009)  "
	'CREATING PRIVATE VARIABLES
		rwbr"	Private m_record_exist"
	for x=0 to ubound(arr_fields)
		rwbr"	Private m_" & arr_fields(x)
		if x=0 then
			rwbr"	Private m_encrypted_" & arr_fields(x)
		end if
	next
	'CREATEING GET FUNCTION
	for x=0 to ubound(arr_fields)
		rwbr""
       ' rwbr"	'Field Type = " & arr_field_types(x)
	    select case arr_field_types(x)
			'All Number fields
    	    case 2,17,11,3,20,131,5:    	        
    			
    			rwbr"	'Read/Store the current " & arr_fields(x) & " value"
    			rwbr"	Public Property Get " & arr_new_fields(x) & "()"
    			rwbr"		if cstr(m_" & arr_fields(x) & ") = """" then"
    			rwbr"			" & arr_fields(x) & " = 0"
    			rwbr"		else"
    			rwbr"			" & arr_fields(x) & " = m_" & arr_fields(x) & ""
    			rwbr"		end if"
    			rwbr"	End Property"
    			rwbr"	Public Property Let " & arr_new_fields(x) & "(p_Data)"
    			rwbr"		m_" & arr_fields(x) & " = p_Data"
    			rwbr"	End Property"
    			If cstr(x) = "0" Then
        			rwbr""
        			rwbr"	'Read the current Encrypted " & arr_fields(x) & " value"
        			rwbr"	Public Property Get encrypted_" & arr_new_fields(x) & "()"
        			rwbr"		encrypted_" & arr_fields(x) & " = EncryptAutoNumberID(me." & arr_fields(x) & ")"
        			rwbr"	End Property"
                End If
			'Date time fields
			case 135:
    			
    			rwbr"	'Read/Store the current " & arr_fields(x) & " value"
    			rwbr"	Public Property Get " & arr_new_fields(x) & "()"
    			rwbr"		if cstr(m_" & arr_fields(x) & " & """") = """" then"
    			rwbr"			" & arr_fields(x) & " = ""1900-01-01"""
    			rwbr"		else"
    			rwbr"			" & arr_fields(x) & " = m_" & arr_fields(x) & ""
    			rwbr"		end if"
    			rwbr"	End Property"
    			rwbr"	Public Property Let " & arr_new_fields(x) & "(p_Data)"
    			rwbr"		m_" & arr_fields(x) & " = p_Data"
    			rwbr"	End Property"
			'All Other
    	    case else:
    			rwbr"	'Read/Store the current " & arr_fields(x) & " value"
    			rwbr"	Public Property Get " & arr_new_fields(x) & "()"
    			rwbr"		" & arr_new_fields(x) & " = m_" & arr_fields(x) & ""
    			rwbr"	End Property"
    			rwbr"	Public Property Let " & arr_new_fields(x) & "(p_Data)"
    			rwbr"		m_" & arr_fields(x) & " = p_Data"
    			rwbr"	End Property"
	    end select
	next
	rwbr ""	
	rwbr"	"	
	rwbr"	Public Property Get record_exist() "
	rwbr"		if cstr(m_record_exist) = """" then "
	rwbr"			record_exist = false "
	rwbr"		else "
	rwbr"			record_exist = m_record_exist "
	rwbr"		end if "
	rwbr"	End Property "
	rwbr"	Public Property Let record_exist(p_Data) "
	rwbr"		m_record_exist = p_Data "
	rwbr"	End Property "
	'Creating the loading
	rwbr""
	rwbr""
	rwbr""
	rwbr"'#############  Public Functions, accessible to the web pages ##############"
	'=====================LOAD FROM ID===========================
	rwbr"	'Loads this object's values by loading a record based on the given ID"
	rwbr"	Public Function LoadFromId(p_Id)"
	rwbr"		dim strSQL, MyID"
	rwbr"		MyID = clng(p_Id)"
	rwbr"		strSQL = ""SELECT a.* FROM " & databasename & ".dbo." & table_name & " a """
	rwbr"		strSQL = strSQL & "" WHERE a." & arr_fields(0) &" = "" & MyID & "" """
	rwbr"		LoadFromId = LoadData (strSQL)"
	rwbr"	End Function"
	rwbr""	'=====================LOAD FROM ENCRYPTED ID===========================
	rwbr"	'Loads this object's values by loading a record based on the given ID"
	rwbr"	Public Function LoadFromEncryptedId(p_Id)"
	rwbr"		dim strSQL, MyID"
	rwbr"		MyID = clng(DecryptAutoNumberID(p_Id))"
	rwbr"		strSQL = ""SELECT a.* FROM " & databasename & ".dbo." & table_name & " a """
	rwbr"		strSQL = strSQL & "" WHERE a." & arr_fields(0) &" = "" & MyID & "" """
	rwbr"		LoadFromEncryptedId = LoadData (strSQL)"
	rwbr"	End Function"
	rwbr""
	'========================STORE =========================
	rwbr"    Public Function Store()"
	rwbr"    	Dim strSQL"
	    
		for x=1 to ubound(arr_fields)
		    if instr(lcase(arr_fields(x)), "modif") > 0 and cint(arr_field_types(x))=135 then
		        rwbr"    	Me." & arr_fields(x) & " = now()"
		    end if
		next
	rwbr"        'If the " & databasename & ".dbo." & table_name & " has an existing (Autogenerated!) ID, then run an insert"	    
	rwbr"        if Me." & arr_new_fields(0) & " < 1 then"
	rwbr"            Dim ThisRecordID, arr1, arr2"
	        
		for x=1 to ubound(arr_fields)
		    if instr(lcase(arr_fields(x)), "creat") > 0 and cint(arr_field_types(x))=135 then
		        rwbr"           Me." & arr_fields(x) & " = now()"
		    end if
		next
	rw"            arr1 = Array("
		delimeter = ""
		for x=1 to ubound(arr_fields)
			rw delimeter & """" & arr_fields(x) & """"
			delimeter = ", "
		next
	rwbr")"
	rw"            arr2 = Array("
		delimeter = ""
		for x=1 to ubound(arr_fields)
			rw delimeter & "Me." & arr_fields(x) & ""
			delimeter = ", "
		next
	rwbr")  "          
	rwbr"            Me." & arr_fields(0) & " = InsertRecord(""" & databasename & ".dbo." & table_name &""", """ & arr_fields(0) & """, arr1, arr2)            "
	rwbr"        'Otherwise run an update"
	rwbr"        else        "
	rwbr"            strSQL = strSQL & "" UPDATE " & databasename & ".dbo." & table_name &" SET """
		delimeter = "" 
		for x=1 to ubound(arr_fields)
	rwbr"            strSQL = strSQL & """ & delimeter & " " & arr_fields(x) &" = '"" & SingleQuotes(Me." & arr_new_fields(x) & ") & ""'"""
		delimeter = ","
		next
	rwbr"            strSQL = strSQL & "" where " & arr_fields(0) & " = "" & Me." & arr_new_fields(0)
	rwbr"            RunSQL strSQL    "        
	rwbr"        End if"
	rwbr"        Store =  Me." & arr_fields(0)
	rwbr"    End Function"
	rwbr""
	'==========================DELETE======================
	rwbr"    Public Function Delete"
	rwbr"        strSQL = ""DELETE FROM " & databasename & ".dbo." & table_name & " WHERE " & arr_fields(0) & " = "" & Me." & arr_new_fields(0)
	rwbr"        RunSQL strSQL"
	rwbr"    End Function"
	
	
	'Creating Private Functions
	rwbr""
	rwbr""
	rwbr""
	rwbr"'#############  Private Functions  ##############"
	rwbr"    'Takes a recordset"
	rwbr"    'Fills the object's properties using the recordset"
	rwbr"    Private Function FillFromRS(p_RS)"
	rwbr"        select case p_RS.recordcount"
	rwbr"            case 1"
	for x=0 to ubound(arr_fields)
		rwbr"                Me." & arr_new_fields(x) & " = p_RS.fields(""" & arr_fields(x) & """).Value & """""
	next
	rwbr"                FillFromRS            = Me." & arr_new_fields(0)
	rwbr"                Me.record_exist = true"
	rwbr"            case -1, 0"
	rwbr"                Me.record_exist = false"
	rwbr"                'err.raise 2, ""Item was not found"""
	rwbr"            case else"
	rwbr"                err.raise 3, ""Item was not unique"" "           
	rwbr"        end select"
	rwbr"    End Function"
	rwbr""
	rwbr"    Private Function LoadData(p_strSQL)"
	rwbr"        dim rs"
	rwbr"        set rs = LoadRSFromDB(p_strSQL)"
	rwbr"        LoadData = FillFromRS(rs)"
	rwbr"        rs. close"
	rwbr"        set rs = nothing"
	rwbr"    End Function"
	rwbr"End Class"
	rwbr"%&gt;"
elseif create = 2 then
	rwbr"'############################  " & ucase(var_PLURAL) & "  #######################################"
	rwbr"'	Read the current " & var_plural
	rwbr"	Public Property Get " & var_plural & "()"
	rwbr"		Set " & var_plural & " = m_" & var_plural & ""
	rwbr"	End Property"
	rwbr""
	rwbr"	'Loads all " & var_plural & " into Data class"
	rwbr"	Public Function GetAll" & var_plural & "()"
	rwbr"		dim strSQL"    
	rwbr"		strSQL = ""SELECT a.* FROM " & databasename & ".dbo." & table_name & " a """
	rwbr"		GetAll" & var_plural & " = Load" & var_single & "Data (strSQL)"
	rwbr"	End Function"
	rwbr""
	if trim(parent_id_name) <> "" and trim(parent_id) <> "" then
		rwbr""
		rwbr"	'Loads all " & var_plural & " into Data class By " & parent_id_name
		rwbr"	Public Function GetAll" & var_plural & "By" & parent_id_name & "(p_value)"
		rwbr"		dim strSQL"    
		rwbr"		strSQL = ""SELECT a.* FROM " & databasename & ".dbo." & table_name & " a """
		rwbr"		strSQL = strSQL & "" WHERE a." & parent_id & "='"" & p_value & ""'"""
		rwbr"		GetAll" & var_plural & "By" & parent_id_name & " = Load" & var_single & "Data (strSQL)"
		rwbr"	End Function"
		rwbr""
	end if
	rwbr"	'Takes a recordset"
	rwbr"	'Fills the object's properties using the recordset"
	rwbr"	Private Function Fill" & var_single & "FromRS(p_RS)"
	rwbr"		dim my" & var_single & ""
	rwbr"		dim ctr"
	rwbr"		ctr = 0"
	rwbr"		do while not p_RS.eof"
	rwbr"			set my" & var_single & " = New " & class_name
	for x=0 to ubound(arr_fields)
	rwbr"			my" & var_single & "." & arr_new_fields(x) & " = p_RS.fields(""" & arr_fields(x) & """).Value & """""
	next
	rwbr"			m_" & var_plural & ".Add my" & var_single & "." & arr_new_fields(0) & ", my" & var_single 
	rwbr"			p_RS.movenext"
	rwbr"		loop"
	rwbr"	End Function"
	rwbr""
	rwbr"	Private Function Load" & var_single & "Data(p_strSQL)"
	rwbr"		dim rs"
	rwbr"		set rs = LoadRSFromDB(p_strSQL)"
	rwbr"		Fill" & var_single & "FromRS(rs)"
	rwbr"		Load" & var_single & "Data = rs.recordcount"
	rwbr"		rs. close"
	rwbr"		set rs = nothing"
	rwbr"	End Function"
else
	rwbr"if isPostBack() then"
	rwbr"	set " & instance_name & " = new " & class_name
	for x=0 to ubound(arr_fields)
		rwbr"	" & instance_name & "." & arr_new_fields(x) & " = request.form(""" & arr_fields(x) & """)"
		if x = 0 then
'			rwbr"	id = request.form(""" & arr_new_fields(0) & """)"	
'			rwbr"	" & instance_name & "." & arr_new_fields(0) & " = id	"
			rwbr"	call " & instance_name & ".loadFromId(" & instance_name & "." & arr_new_fields(0) & ")  "
		end if
	next
	for x=1 to ubound(arr_fields)
		rwbr"	if " & instance_name & "." & arr_new_fields(x) & " = """" then"
		rwbr"		error_main 	= g_main_error_msg"
		rwbr"		" & arr_fields(x) & "_error = g_error_style"
		rwbr"	end if"
	next
	rwbr""
	rwbr"	if error_main = """" then"
	rwbr"		" & instance_name & ".store()"
	rwbr"	end if"
	rwbr"else"
	rwbr"	set " & instance_name & " = new " & class_name
	rwbr"	" & instance_name & "." & arr_new_fields(0) & " = request.QueryString(""id"")"	
	rwbr"	call " & instance_name & ".loadFromId(" & instance_name & "." & arr_new_fields(0) & ")"
	rwbr"end if"
	
end if
	rwbr"</textarea>"
end if
    Class contrato
	'Generated using class_creator version 2(02.12.2009)  
	Private m_record_exist
	Private m_ID
	Private m_encrypted_ID
	Private m_RecebeFGTS
	Private m_DataEmissaoContrato
	Private m_DataAdmissao
	Private m_Salario
	Private m_SalarioPorExtenso
	Private m_isAtivo
	Private m_DataCriacao
	Private m_TipoEstabelecimentoID
	Private m_TipoOcupacaoID
	Private m_EmpregadoID
	Private m_EmpregadorID
	Private m_PeriodoExperienciaID
	Private m_EnderecoID
	Private m_ValeTransporte
	Private m_numeroCEI

	'Read/Store the current ID value
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

	'Read the current Encrypted ID value
	Public Property Get encrypted_ID()
		encrypted_ID = EncryptAutoNumberID(me.ID)
	End Property

	'Read/Store the current RecebeFGTS value
	Public Property Get RecebeFGTS()
		if cstr(m_RecebeFGTS) = "" then
			RecebeFGTS = 0
		else
			RecebeFGTS = m_RecebeFGTS
		end if
	End Property
	Public Property Let RecebeFGTS(p_Data)
		m_RecebeFGTS = p_Data
	End Property

	'Read/Store the current DataEmissaoContrato value
	Public Property Get DataEmissaoContrato()
		DataEmissaoContrato = m_DataEmissaoContrato
	End Property
	Public Property Let DataEmissaoContrato(p_Data)
		m_DataEmissaoContrato = p_Data
	End Property

	'Read/Store the current DataAdmissao value
	Public Property Get DataAdmissao()
		DataAdmissao = m_DataAdmissao
	End Property
	Public Property Let DataAdmissao(p_Data)
		m_DataAdmissao = p_Data
	End Property

	'Read/Store the current Salario value
	Public Property Get Salario()
		if cstr(m_Salario) = "" then
			Salario = 0
		else
			Salario = m_Salario
		end if
	End Property
	Public Property Let Salario(p_Data)
		m_Salario = p_Data
	End Property

	'Read/Store the current SalarioPorExtenso value
	Public Property Get SalarioPorExtenso()
		SalarioPorExtenso = m_SalarioPorExtenso
	End Property
	Public Property Let SalarioPorExtenso(p_Data)
		m_SalarioPorExtenso = p_Data
	End Property

	'Read/Store the current isAtivo value
	Public Property Get isAtivo()
		if cstr(m_isAtivo) = "" then
			isAtivo = 0
		else
			isAtivo = m_isAtivo
		end if
	End Property
	Public Property Let isAtivo(p_Data)
		m_isAtivo = p_Data
	End Property

	'Read/Store the current DataCriacao value
	Public Property Get DataCriacao()
		DataCriacao = m_DataCriacao
	End Property
	Public Property Let DataCriacao(p_Data)
		m_DataCriacao = p_Data
	End Property

	'Read/Store the current TipoEstabelecimentoID value
	Public Property Get TipoEstabelecimentoID()
		if cstr(m_TipoEstabelecimentoID) = "" then
			TipoEstabelecimentoID = 0
		else
			TipoEstabelecimentoID = m_TipoEstabelecimentoID
		end if
	End Property
	Public Property Let TipoEstabelecimentoID(p_Data)
		m_TipoEstabelecimentoID = p_Data
	End Property

	'Read/Store the current TipoOcupacaoID value
	Public Property Get TipoOcupacaoID()
		if cstr(m_TipoOcupacaoID) = "" then
			TipoOcupacaoID = 0
		else
			TipoOcupacaoID = m_TipoOcupacaoID
		end if
	End Property
	Public Property Let TipoOcupacaoID(p_Data)
		m_TipoOcupacaoID = p_Data
	End Property

	'Read/Store the current EmpregadoID value
	Public Property Get EmpregadoID()
		if cstr(m_EmpregadoID) = "" then
			EmpregadoID = 0
		else
			EmpregadoID = m_EmpregadoID
		end if
	End Property
	Public Property Let EmpregadoID(p_Data)
		m_EmpregadoID = p_Data
	End Property

	'Read/Store the current EmpregadorID value
	Public Property Get EmpregadorID()
		if cstr(m_EmpregadorID) = "" then
			EmpregadorID = 0
		else
			EmpregadorID = m_EmpregadorID
		end if
	End Property
	Public Property Let EmpregadorID(p_Data)
		m_EmpregadorID = p_Data
	End Property

	'Read/Store the current PeriodoExperienciaID value
	Public Property Get PeriodoExperienciaID()
		if cstr(m_PeriodoExperienciaID) = "" then
			PeriodoExperienciaID = 0
		else
			PeriodoExperienciaID = m_PeriodoExperienciaID
		end if
	End Property
	Public Property Let PeriodoExperienciaID(p_Data)
		m_PeriodoExperienciaID = p_Data
	End Property

	'Read/Store the current EnderecoID value
	Public Property Get EnderecoID()
		if cstr(m_EnderecoID) = "" then
			EnderecoID = 0
		else
			EnderecoID = m_EnderecoID
		end if
	End Property
	Public Property Let EnderecoID(p_Data)
		m_EnderecoID = p_Data
	End Property

	'Read/Store the current ValeTransporte value
	Public Property Get ValeTransporte()
		if cstr(m_ValeTransporte) = "" then
			ValeTransporte = 0
		else
			ValeTransporte = m_ValeTransporte
		end if
	End Property
	Public Property Let ValeTransporte(p_Data)
		m_ValeTransporte = p_Data
	End Property

	'Read/Store the current numeroCEI value
	Public Property Get numeroCEI()
		numeroCEI = m_numeroCEI
	End Property
	Public Property Let numeroCEI(p_Data)
		m_numeroCEI = p_Data
	End Property

	
	Public Property Get record_exist() 
		if cstr(m_record_exist) = "" then 
			record_exist = false 
		else 
			record_exist = m_record_exist 
		end if 
	End Property 
	Public Property Let record_exist(p_Data) 
		m_record_exist = p_Data 
	End Property 



'#############  Public Functions, accessible to the web pages ##############
	'Loads this object's values by loading a record based on the given ID
	Public Function LoadFromId(p_Id)
		dim strSQL, MyID
		MyID = clng(p_Id)
		strSQL = "SELECT a.* FROM edomestico_test.dbo.Contrato a "
		strSQL = strSQL & " WHERE a.ID = " & MyID & " "
		LoadFromId = LoadData (strSQL)
	End Function

	'Loads this object's values by loading a record based on the given ID
	Public Function LoadFromEncryptedId(p_Id)
		dim strSQL, MyID
		MyID = clng(DecryptAutoNumberID(p_Id))
		strSQL = "SELECT a.* FROM edomestico_test.dbo.Contrato a "
		strSQL = strSQL & " WHERE a.ID = " & MyID & " "
		LoadFromEncryptedId = LoadData (strSQL)
	End Function

    Public Function Store()
    	Dim strSQL
        'If the edomestico_test.dbo.Contrato has an existing (Autogenerated!) ID, then run an insert
        if Me.ID < 1 then
            Dim ThisRecordID, arr1, arr2
            arr1 = Array("RecebeFGTS", "DataEmissaoContrato", "DataAdmissao", "Salario", "SalarioPorExtenso", "isAtivo", "DataCriacao", "TipoEstabelecimentoID", "TipoOcupacaoID", "EmpregadoID", "EmpregadorID", "PeriodoExperienciaID", "EnderecoID", "ValeTransporte", "numeroCEI")
            arr2 = Array(Me.RecebeFGTS, Me.DataEmissaoContrato, Me.DataAdmissao, Me.Salario, Me.SalarioPorExtenso, Me.isAtivo, Me.DataCriacao, Me.TipoEstabelecimentoID, Me.TipoOcupacaoID, Me.EmpregadoID, Me.EmpregadorID, Me.PeriodoExperienciaID, Me.EnderecoID, Me.ValeTransporte, Me.numeroCEI)  
            Me.ID = InsertRecord("edomestico_test.dbo.Contrato", "ID", arr1, arr2)            
        'Otherwise run an update
        else        
            strSQL = strSQL & " UPDATE edomestico_test.dbo.Contrato SET "
            strSQL = strSQL & " RecebeFGTS = '" & SingleQuotes(Me.RecebeFGTS) & "'"
            strSQL = strSQL & ", DataEmissaoContrato = '" & SingleQuotes(Me.DataEmissaoContrato) & "'"
            strSQL = strSQL & ", DataAdmissao = '" & SingleQuotes(Me.DataAdmissao) & "'"
            strSQL = strSQL & ", Salario = '" & SingleQuotes(Me.Salario) & "'"
            strSQL = strSQL & ", SalarioPorExtenso = '" & SingleQuotes(Me.SalarioPorExtenso) & "'"
            strSQL = strSQL & ", isAtivo = '" & SingleQuotes(Me.isAtivo) & "'"
            strSQL = strSQL & ", DataCriacao = '" & SingleQuotes(Me.DataCriacao) & "'"
            strSQL = strSQL & ", TipoEstabelecimentoID = '" & SingleQuotes(Me.TipoEstabelecimentoID) & "'"
            strSQL = strSQL & ", TipoOcupacaoID = '" & SingleQuotes(Me.TipoOcupacaoID) & "'"
            strSQL = strSQL & ", EmpregadoID = '" & SingleQuotes(Me.EmpregadoID) & "'"
            strSQL = strSQL & ", EmpregadorID = '" & SingleQuotes(Me.EmpregadorID) & "'"
            strSQL = strSQL & ", PeriodoExperienciaID = '" & SingleQuotes(Me.PeriodoExperienciaID) & "'"
            strSQL = strSQL & ", EnderecoID = '" & SingleQuotes(Me.EnderecoID) & "'"
            strSQL = strSQL & ", ValeTransporte = '" & SingleQuotes(Me.ValeTransporte) & "'"
            strSQL = strSQL & ", numeroCEI = '" & SingleQuotes(Me.numeroCEI) & "'"
            strSQL = strSQL & " where ID = " & Me.ID
            RunSQL strSQL    
        End if
        Store =  Me.ID
    End Function

    Public Function Delete
        strSQL = "DELETE FROM edomestico_test.dbo.Contrato WHERE ID = " & Me.ID
        RunSQL strSQL
    End Function



'#############  Private Functions  ##############
    'Takes a recordset
    'Fills the object's properties using the recordset
    Private Function FillFromRS(p_RS)
        select case p_RS.recordcount
            case 1
                Me.ID = p_RS.fields("ID").Value & ""
                Me.RecebeFGTS = p_RS.fields("RecebeFGTS").Value & ""
                Me.DataEmissaoContrato = p_RS.fields("DataEmissaoContrato").Value & ""
                Me.DataAdmissao = p_RS.fields("DataAdmissao").Value & ""
                Me.Salario = p_RS.fields("Salario").Value & ""
                Me.SalarioPorExtenso = p_RS.fields("SalarioPorExtenso").Value & ""
                Me.isAtivo = p_RS.fields("isAtivo").Value & ""
                Me.DataCriacao = p_RS.fields("DataCriacao").Value & ""
                Me.TipoEstabelecimentoID = p_RS.fields("TipoEstabelecimentoID").Value & ""
                Me.TipoOcupacaoID = p_RS.fields("TipoOcupacaoID").Value & ""
                Me.EmpregadoID = p_RS.fields("EmpregadoID").Value & ""
                Me.EmpregadorID = p_RS.fields("EmpregadorID").Value & ""
                Me.PeriodoExperienciaID = p_RS.fields("PeriodoExperienciaID").Value & ""
                Me.EnderecoID = p_RS.fields("EnderecoID").Value & ""
                Me.ValeTransporte = p_RS.fields("ValeTransporte").Value & ""
                Me.numeroCEI = p_RS.fields("numeroCEI").Value & ""
                FillFromRS            = Me.ID
                Me.record_exist = true
            case -1, 0
                Me.record_exist = false
                'err.raise 2, "Item was not found"
            case else
                err.raise 3, "Item was not unique" 
        end select
    End Function

    Private Function LoadData(p_strSQL)
        dim rs
        set rs = LoadRSFromDB(p_strSQL)
        LoadData = FillFromRS(rs)
        rs. close
        set rs = nothing
    End Function
End Class




'############################  OBJCONTRATOS  #######################################
'	Read the current objContratos
	Public Property Get objContratos()
		Set objContratos = m_objContratos
	End Property

	'Loads all objContratos into Data class
	Public Function GetAllobjContratos()
		dim strSQL
		strSQL = "SELECT a.* FROM edomestico_test.dbo.Contrato a "
		GetAllobjContratos = LoadobjContratoData (strSQL)
	End Function


	'Loads all objContratos into Data class By parentName
	Public Function GetAllobjContratosByparentName(p_value)
		dim strSQL
		strSQL = "SELECT a.* FROM edomestico_test.dbo.Contrato a "
		strSQL = strSQL & " WHERE a.parent='" & p_value & "'"
		GetAllobjContratosByparentName = LoadobjContratoData (strSQL)
	End Function

	'Takes a recordset
	'Fills the object's properties using the recordset
	Private Function FillobjContratoFromRS(p_RS)
		dim myobjContrato
		dim ctr
		ctr = 0
		do while not p_RS.eof
			set myobjContrato = New contrato
			myobjContrato.ID = p_RS.fields("ID").Value & ""
			myobjContrato.RecebeFGTS = p_RS.fields("RecebeFGTS").Value & ""
			myobjContrato.DataEmissaoContrato = p_RS.fields("DataEmissaoContrato").Value & ""
			myobjContrato.DataAdmissao = p_RS.fields("DataAdmissao").Value & ""
			myobjContrato.Salario = p_RS.fields("Salario").Value & ""
			myobjContrato.SalarioPorExtenso = p_RS.fields("SalarioPorExtenso").Value & ""
			myobjContrato.isAtivo = p_RS.fields("isAtivo").Value & ""
			myobjContrato.DataCriacao = p_RS.fields("DataCriacao").Value & ""
			myobjContrato.TipoEstabelecimentoID = p_RS.fields("TipoEstabelecimentoID").Value & ""
			myobjContrato.TipoOcupacaoID = p_RS.fields("TipoOcupacaoID").Value & ""
			myobjContrato.EmpregadoID = p_RS.fields("EmpregadoID").Value & ""
			myobjContrato.EmpregadorID = p_RS.fields("EmpregadorID").Value & ""
			myobjContrato.PeriodoExperienciaID = p_RS.fields("PeriodoExperienciaID").Value & ""
			myobjContrato.EnderecoID = p_RS.fields("EnderecoID").Value & ""
			myobjContrato.ValeTransporte = p_RS.fields("ValeTransporte").Value & ""
			myobjContrato.numeroCEI = p_RS.fields("numeroCEI").Value & ""
			m_objContratos.Add myobjContrato.ID, myobjContrato
			p_RS.movenext
		loop
	End Function

	Private Function LoadobjContratoData(p_strSQL)
		dim rs
		set rs = LoadRSFromDB(p_strSQL)
		FillobjContratoFromRS(rs)
		LoadobjContratoData = rs.recordcount
		rs. close
		set rs = nothing
	End Function
%>
<script language="javascript">secret()</script>
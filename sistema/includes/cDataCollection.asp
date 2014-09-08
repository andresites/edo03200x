<%
Class cDataCollection
	'Private, class member variable
	Private m_class
	Sub Class_Initialize()
		Set m_class = Server.CreateObject ("Scripting.Dictionary")
	End Sub
	
	Sub Class_Terminate()
		Set m_class = Nothing
	End Sub
	
End Class
%>
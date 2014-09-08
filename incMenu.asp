<%

%>

                            <div class="botoesFlash">
                            <a href="/" class="homeMenu"></a>
                            
<%
    function swichMenu(pagina, classe)
        dim currentURL
        currentURL = request.ServerVariables("script_name")
        oScript = split(replace(currentURL,"http://",""),"/")(1)
        finalmente = split(oScript,".")(0)
        if lcase(pagina)=lcase(finalmente) then
           swichMenu = " <span class=" & chr(34) & classe &  " selected""></span>"
        else
            swichMenu = " <a href=" & chr(34) & pagina & ".asp"" class=" & chr(34) & classe & chr(34) & "></a>" 
        end if
    end function
     %>
<%=swichMenu("Empresa", "empresaMenu")%>
<%=swichMenu("OSistema", "sistemaMenu")%>
<%=swichMenu("Planos", "planosMenu")%>
<%=swichMenu("Direitos", "direitosMenu")%>
<%=swichMenu("Deveres", "deveresMenu")%>
<%=swichMenu("Servicos", "servicosMenu")%>
<%=swichMenu("Contato", "cadastroMenu")%>
                            </div>
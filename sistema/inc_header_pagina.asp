
                <div id="adminbar">Bem-vindo, <strong> <a href="cadastro_edit.asp"><%=session("nome")%></a></strong>,
                <%dim dataAFormatar, outData
                    dataAFormatar  =session("expira")
                        if isdate(dataAFormatar) then
        outData = right("00" & day(dataAFormatar),2) & "/" & right("00" & month(dataAFormatar),2) & "/" &  year(dataAFormatar)
    else
        outData = "N/D"
    end if
                    
                    %> Sua Conta Expira em: <%=outData %>
	                <a class="logout" href="logout.asp">Sair</a>
                    <a class="logout" href="/">Voltar ao site</a>
                </div>

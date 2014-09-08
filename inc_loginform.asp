        <form action="/novosistema/login.asp" id="form-Login" name="form-Login"  method="post" style="width:218px; margin-right:7px;">
            <input id="Email" name="Email" type="text"  value="Login" onblur="if(this.value=='') this.value='Login'" onfocus="if(this.value =='Login' ) this.value=''" class="txtLogin" style="width: 197px;border-bottom-width: 1px; margin: 0 0 10px 0; float:left;" />
            <input id="Senha" name="Senha" type="password"  value="Senha" onblur="if(this.value=='') this.value='Senha'" onfocus="if(this.value =='Senha' ) this.value=''" class="txtLogin" style="width: 110px;float:left; margin-top:-2px; margin-left:0"  />
            <input type="submit" value="Entrar" id="btnEntrar" onclick="Troca();" name="btnEntrar" class="btnLogin" style="float:left; margin-top:-2px" />
        </form>
        <a id="Cadastro" class="lnkLogin" style="color:#ffffff; margin-left:8px;" href="cadastro.asp" ><b>Cadastre-se</b></a>
        <a id="esqueci" style="padding:0 10px;color:#ffffff;" class="lnkLogin" href="sendsenha.asp" ><b>Esqueci minha senha</b></a>
        <div id="divErro" class="message error divErroLogin" >
	        <span class="strong" >ERRO!</span> 	    
			        Verifique todos os campos acima.
        </div>
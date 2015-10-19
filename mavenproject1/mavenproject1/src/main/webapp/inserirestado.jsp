<%@page import="controle.EstadoDB"%>
<%@page import="modelo.Estado"%>
<%@page import="controle.CidadeDB"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Cidade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Estado</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>
    <body>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        
       <ul id="dropdown1" class="grey lighten-1 dropdown-content">
            <li><a href="listaestados.jsp">Estados</a></li>
            <li><a href="listacidades.jsp">Cidade</a></li>
            <li><a href="listapessoa.jsp">Pessoas</a></li>
            <li><a href="listacontas.jsp">Contas</a></li>
            <li class="divider"></li>
            <li><a href="index.html">Voltar</a></li>
        </ul>
        <nav class="blue darken-4">
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo grey-text text">Novo Estado</a>
                <ul class="right hide-on-med-and-down">
                    <!-- Dropdown Trigger -->
                    <li><a class="dropdown-button blue-text text-darken-2" href="#!" data-activates="dropdown1">Cadastros<i class="blue-text text-darken-2 mdi-navigation-arrow-drop-down right"></i></a></li>
                </ul>
            </div>
        </nav>
         <%
            String mensagem = "";
            if(request.getParameter("btnEnviar") != null){
                String sigla = request.getParameter("sigla");
                String nome = request.getParameter("nome");
                Estado estado = new Estado(sigla, nome);
                Connection conexao = Conexao.getConexao();
                boolean incluiu = EstadoDB.incluiEstado(estado, conexao);
                if (incluiu){
                    mensagem = "Estado incluido com sucesso!";
                            }else{
                    mensagem = "Erro ao incluir o estado!";
                                  }
            }
            out.println(mensagem);
        %>
        <a href="listaestados.jsp" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">replay</i></a> 
  
        <form class="col s12 indigo lighten-5" name="fmrCidade" method="post">
        <div class="row">
            <div class="input-field col s6">
              <input type="text" class="validate" name="sigla" maxlength="2" size="3" >
              <label>Sigla</label>
            </div>
        </div>
          <div class="row">    
            <div class="input-field col s6">
              <input type="text" class="validate" name="nome" >
              <label>Nome</label>
            </div>
          </div>
          <div class="row"> 
     
            <button class="btn waves-effect waves-light" type="submit" name="btnEnviar">Enviar
                <i class="material-icons right">send</i>
            </button>
          </div>     
        </form>
    </body>
</html>

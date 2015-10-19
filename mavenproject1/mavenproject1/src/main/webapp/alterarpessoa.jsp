<%@page import="modelo.Pessoa"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="controle.PessoaDB"%>
<%@page import="modelo.Estado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração Estado</title>
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
                <a href="#!" class="brand-logo grey-text text">Alterar Cidades</a>
                <ul class="right hide-on-med-and-down">
                    <!-- Dropdown Trigger -->
                    <li><a class="dropdown-button blue-text text-darken-2" href="#!" data-activates="dropdown1">Cadastros<i class="blue-text text-darken-2 mdi-navigation-arrow-drop-down right"></i></a></li>
                </ul>
            </div>
        </nav>
        
        <%
            String mensagem = "";
            Pessoa pessoa = null;
            Connection conexao = Conexao.getConexao();
            if(request.getParameter("btnAltera") != null){
                int codigo = Integer.valueOf(request.getParameter("codigo"));
                String nome = request.getParameter("nome");
                int idade = Integer.valueOf(request.getParameter("idade"));
                String email = request.getParameter("email");
                int cidade = Integer.valueOf(request.getParameter("cidade"));

               pessoa =  new Pessoa(codigo, nome, idade, email, cidade);              
               boolean alterou = PessoaDB.alteraPessoa(pessoa, conexao);
               if(alterou){
                   mensagem = "Pessoa alterada com sucesso!";
               }else{
                   mensagem = "Não foi possível alterar a pessoa!";
               }
            }
            out.print(mensagem);
            
            String id = request.getParameter("id");
            int codigo = Integer.valueOf(id);
            pessoa = PessoaDB.getPessoa(codigo, conexao);
        %>
        <a href="listapessoa.jsp" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">replay</i></a> 
                 
         <form class="col s12 indigo lighten-5" name="fmrCidade" method="post">
                     
            <div class="row">
              <div class="input-field col s6">
                <input type="text" class="validate" name="nome" maxlength="100" size="80" value="<%=pessoa.getNome()%>">
                <label>Nome</label>
              </div>
            </div> 
            
            <div class="row">    
              <div class="input-field col s6">
                  <input type="text" class="validate" name="idade" value="<%=pessoa.getIdade()%>">
                <label>Idade</label>
              </div>
            </div>
          <div class="row">    
            <div class="input-field col s6">
              <input type="text" class="validate" name="email" value="<%=pessoa.getEmail()%>">
              <label>Email</label>
            </div>
          </div>
          <div class="row">    
            <div class="input-field col s6">
                <input type="text" class="validate" name="cidade" value="<%=pessoa.getCid_codigo()%>">
              <label>Cidade</label>
            </div>
          </div>
            
          <div class="row"> 
            <input type="hidden" name="codigo" value="<%=id%>"/>  
            <button class="btn waves-effect waves-light" type="submit" name="btnAltera">Alterar
                <i class="material-icons right">send</i>
            </button>
          </div>     
        </form>
    </body>
</html>

<%@page import="controle.ContaDB"%>
<%@page import="modelo.Conta"%>
<%@page import="controle.CidadeDB"%>
<%@page import="modelo.Cidade"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Conta</title>
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
        <a href="listacontas.jsp" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">replay</i></a> 
        <%
            String mensagem = "";
            Connection conexao = Conexao.getConexao();
            Conta conta = null;
            if(request.getParameter("btnexclui") !=null){
             int codigo = Integer.valueOf(request.getParameter("codigo"));             
             boolean excluiu = ContaDB.excluiConta(codigo, conexao);
             if(excluiu){
                 mensagem = "Conta paga com sucelsso!";
             }else{
                 
                 mensagem = "Não foi possivel pagar a conta!";
             }
            }
            out.println(mensagem);
            out.println("<br/>");
            
            String id = request.getParameter("id");
            int codigo = Integer.valueOf(id);
            conta = ContaDB.getConta(codigo, conexao);
        %>
        
        <form class="col s12 indigo lighten-5" name="exclui" method="post">
          Pagar a Conta ?
         
            <input type="hidden" name="codigo" value="<%= id %>"/>

          <div class="row"> 
            <input type="hidden" name="codigo" value="<%=id%>"/>
            <button class="btn waves-effect waves-light" type="submit" name="btnexclui">Excluir
                <i class="material-icons right">send</i>
            </button>
          </div>     
        </form>    
            

    </body>
</html>

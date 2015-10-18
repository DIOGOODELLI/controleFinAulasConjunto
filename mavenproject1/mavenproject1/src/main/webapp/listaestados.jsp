<%@page import="modelo.Estado"%>
<%@page import="controle.EstadoDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>Lista Estados</title>

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
            <li><a href="listacidades.jsp">Pessoas</a></li>
            <li><a href="listacidades.jsp">Contas</a></li>
            <li class="divider"></li>
            <li><a href="index.html">Voltar</a></li>
        </ul>
        <nav class="blue darken-4">
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo grey-text text">Lista Cidades</a>
                <ul class="right hide-on-med-and-down">
                    <!-- Dropdown Trigger -->
                    <li><a class="dropdown-button blue-text text-darken-2" href="#!" data-activates="dropdown1">Cadastros<i class="blue-text text-darken-2 mdi-navigation-arrow-drop-down right"></i></a></li>
                </ul>
            </div>
        </nav>
        <a href="inserircidade.jsp" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>        
        <a href="index.html" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">replay</i></a> 
        <%
        Connection conexao = Conexao.getConexao();
        ArrayList lista = EstadoDB.getListaEstados(conexao);
        out.println("<table>");
        out.println("<tr>");
        out.println("<td><b>Estado</b></td>");
        out.println("<td><b>Nome</b></td>");
        out.println("<td><b>Opções</b></td>");
        out.println("</tr>");
        for(int i = 0; i < lista.size(); i++){
            Estado estado = (Estado)lista.get(i);
            out.println("<tr>");
            out.println("<td>"+estado.getEst_sigla()+"</td>");
            out.println("<td>"+estado.getNome()+"</td>");
            out.println("<td>");
            out.println("<a href=\"excluircidade.jsp?id="+estado.getEst_sigla()+"\">Excluir</a>");
            out.println("<a href=\"alterarestado.jsp?id="+estado.getEst_sigla()+"\">Alterar</a>");             
            out.println("</td>");
        }
        out.println("</table>");
        %>
        <footer class="page-footer teal  grey darken-3">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <h5 class="white-text">Controle seus Gastos</h5>
                        <p class="grey-text text-lighten-4">E fique rico</p>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    Criado por <a class="brown-text text-lighten-3" href="#">Diogo Odelli</a>
                </div>
            </div>
        </footer>
    </body>
</html>

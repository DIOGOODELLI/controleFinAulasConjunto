<%@page import="controle.ContaDB"%>
<%@page import="modelo.Conta"%>
<%@page import="controle.PessoaDB"%>
<%@page import="modelo.Pessoa"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="controle.EstadoDB"%>
<%@page import="modelo.Estado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração Conta</title>
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
                <a href="#!" class="brand-logo grey-text text">Alterar Conta</a>
                <ul class="right hide-on-med-and-down">
                    <!-- Dropdown Trigger -->
                    <li><a class="dropdown-button blue-text text-darken-2" href="#!" data-activates="dropdown1">Cadastros<i class="blue-text text-darken-2 mdi-navigation-arrow-drop-down right"></i></a></li>
                </ul>
            </div>
        </nav>
        
        <%
            String mensagem = "";
            Conta conta = null;
            Connection conexao = Conexao.getConexao();
            if(request.getParameter("btnAltera") != null){
          
                int cnt_numero = Integer.valueOf(request.getParameter("numero")); 
                String descricao = request.getParameter("descricao");
                String data = request.getParameter("data");
                double valor = Double.parseDouble(request.getParameter("valor"));  
                String tipo = "G";
                String situacao = request.getParameter("situacao");
                int pes_codigo = Integer.valueOf(request.getParameter("pessoa"));
                
                conta = new Conta(cnt_numero, descricao, data, valor, tipo, situacao, pes_codigo);
                
               boolean alterou = ContaDB.alteraConta(conta, conexao);
               if(alterou){
                   mensagem = "Conta alterado com sucesso!";
               }else{
                   mensagem = "Não foi possível alterar a conta!";
               }
            }
            out.print(mensagem);
            
            String id = request.getParameter("id");
            int codigo = Integer.valueOf(id);
            conta = ContaDB.getConta(codigo, conexao);

        %>
        <a href="listacontas.jsp" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">replay</i></a> 
        
           <form class="col s12 indigo lighten-5" name="fmrConta" method="post">
     
          <div class="row">
            <div class="input-field col s6">
                <input type="text" class="validate" name="data" value="<%=conta.getData()%>">
            </div>
          </div> 
          <div class="row">    
            <div class="input-field col s6">
              <input type="text" class="validate" name="descricao" maxlength="100" size="80" value="<%=conta.getDescricao()%>">
              <label>Descrição</label>
            </div>
          </div>
          <div class="row">    
            <div class="input-field col s6">
                <input type="text" class="validate" name="situacao" maxlength="100" size="80" value="<%=conta.getSituacao()%>">
              <label>Situação</label>
            </div>
          </div>
          <div class="row">    
            <div class="input-field col s6">
                <input type="text" class="validate" name="valor" value="<%=conta.getValor()%>">
              <label>Valor</label>
            </div>
          </div>
           <div class="row">    
            <div class="input-field col s6">
                <input type="text" class="validate" name="pessoa" value="<%=conta.getPes_codigo()%>">
              <label>Pessoa</label>
            </div>
          </div>
            
          <div class="row"> 
             <input type="hidden" name="numero" value="<%=id%>"/> 
            <button class="btn waves-effect waves-light" type="submit" name="btnAltera">Alterar
                <i class="material-icons right">send</i>
            </button>
          </div>     
        </form>
    </body>
</html>

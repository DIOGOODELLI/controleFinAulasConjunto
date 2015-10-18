/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Pessoa;

/**
 *
 * @author aluno
 */
public class PessoaDB {
    public static ArrayList getListaPessoa(Connection conexao){
        ArrayList lista = new ArrayList();
        try{
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("select * from pes_codigo");
            while(rs.next()){
                int pes_codigo = rs.getInt("pes_codigo");
                String auxNome = rs.getString("nome");
                int idade = rs.getInt("idade");
                String auxEmail = rs.getString("email");
                int cid_codigo = rs.getInt("cid_codigo");
                Pessoa pessoa = new Pessoa(pes_codigo, auxNome, idade, auxEmail, cid_codigo);
                lista.add(pessoa);
            }
        }
        catch(SQLException e){
            System.out.println("Erro de SQL: "+e.getMessage());
        }
        finally{
            return lista;
        }
    }
    
    public static boolean incluiPessoa(Pessoa pessoa, Connection conexao){
        boolean incluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("insert into pessoa (pes_codigo, nome,idade, email, cid_codigo) values (?,?,?,?,?)");
           
            ps.setInt(5, pessoa.getCid_codigo());
            ps.setString(4, pessoa.getEmail());
            ps.setInt(3, pessoa.getIdade()); 
            ps.setString(2, pessoa.getNome());
            ps.setInt(1, pessoa.getPes_codigo()); 
            int valor  = ps.executeUpdate();
            if(valor == 1){
                incluiu = true;
            }
        }
        catch(SQLException e){
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        finally{
            return incluiu;
        }
    }
    
    public static boolean alteraEstado(Pessoa pessoa, Connection conexao){
        boolean alterou = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("update pessoa set nome = ? and idade = ? and email = ? and cid_codigo = ? where pes_codigo = ?");
            ps.setString(1, pessoa.getNome());
            ps.setInt(2, pessoa.getIdade());
            ps.setString(3, pessoa.getEmail());
            ps.setInt(4, pessoa.getCid_codigo());
            int valor = ps.executeUpdate();
            if(valor == 1){
                alterou = true;
            }
        }
        catch(SQLException e){
            System.out.println("Erro de sql: " + e.getMessage());
        }
        finally{
            return alterou;
        }
    }
    
    public static boolean excluiPessoa(int pessoaCodigo, Connection conexao){
        boolean excluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("delete from pessoa where pes_codigo = ?");
            ps.setInt(1, pessoaCodigo);
            int valor = ps.executeUpdate();
            if(valor == 1){
                excluiu = true;
            }
        }
        catch(SQLException e){
            System.out.println("Erro de sql: " + e.getMessage());
        }
        finally{
            return excluiu;
        }
    }
    
        public static Pessoa getPessoa(int pessoaCodigo, Connection conexao){
        Pessoa pessoa = null;
        try{
            PreparedStatement ps = conexao.prepareStatement("select * from pessoa where pes_codigo = ?");
            ps.setInt(1, pessoaCodigo);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                
                int pes_codigo = rs.getInt("pes_codigo");
                String auxNome = rs.getString("nome");
                int idade = rs.getInt("idade");
                String auxEmail = rs.getString("email");
                int cid_codigo = rs.getInt("cid_codigo");
                
                pessoa = new Pessoa(pes_codigo, auxNome, idade, auxEmail, cid_codigo);
            }
        }catch(SQLException e){
            System.out.println("Erro de sql: " + e.getMessage());
        }finally{
            return pessoa;
        }
    }
    
}

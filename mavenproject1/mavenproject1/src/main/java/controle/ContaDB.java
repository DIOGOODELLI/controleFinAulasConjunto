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
import java.util.Date;
import modelo.Conta;

/**
 *
 * @author aluno
 */
public class ContaDB {
    public static ArrayList getListaContas(Connection conexao){
        ArrayList lista = new ArrayList();
        try{
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("select * from conta");
            while(rs.next()){
                int auxConta = rs.getInt("cnt_numero");
                String auxdescricao = rs.getString("descricao");
                String auxDate = rs.getString("data");
                Double auxvalor = rs.getDouble("valor");
                String auxTipo = rs.getString("tipo");
                String auxSituacao = rs.getString("situacao");
                int auxNome = rs.getInt("pes_codigo");
                
                
                Conta conta = new Conta(auxConta, auxdescricao,auxDate,auxvalor,auxTipo,auxSituacao,auxNome);
                lista.add(conta);
            }
        }
        catch(SQLException e){
            System.out.println("Erro de SQL: "+e.getMessage());
        }
        finally{
            return lista;
        }
    }
    
    public static boolean incluiConta(Conta conta, Connection conexao){
        boolean incluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("insert into conta (cnt_numero, descricao, data, valor, tipo, situacao,pes_codigo) values (?,?,?,?,?,?,?)");
            ps.setInt(7, conta.getPes_codigo());
            ps.setString(6, conta.getSituacao());
            ps.setString(5, conta.getTipo());
            ps.setDouble(4, conta.getValor());
            ps.setString(3, conta.getData());
            ps.setString(2, conta.getDescricao());
            ps.setInt(1, conta.getCnt_numero()); 
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
    
    public static boolean alteraConta(Conta conta, Connection conexao){
        boolean alterou = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("update conta set descricao = ?, data = ?, valor = ?, tipo = ?, situacao = ?, pes_codigo = ? where cnt_numero = ?");
            ps.setString(1, conta.getDescricao());
            ps.setString(2, conta.getData());
            ps.setDouble(3, conta.getValor());
            ps.setString(4, conta.getTipo());
            ps.setString(5, conta.getSituacao());
            ps.setInt(6, conta.getPes_codigo());
            ps.setInt(7, conta.getCnt_numero());
            
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
    
    public static boolean excluiConta(int conta, Connection conexao){
        boolean excluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("delete from conta where cnt_numero = ?");
            ps.setInt(1, conta);
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
    
        public static Conta getConta(int contaCodigo, Connection conexao){
        Conta conta = null;
        try{
            PreparedStatement ps = conexao.prepareStatement("select * from conta where cnt_numero = ?");
            ps.setInt(1, contaCodigo);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int auxConta = rs.getInt("cnt_numero");
                String auxdescricao = rs.getString("descricao");
                String auxDate = rs.getString("data");
                Double auxvalor = rs.getDouble("valor");
                String auxTipo = rs.getString("tipo");
                String auxSituacao = rs.getString("situacao");
                int auxNome = rs.getInt("pes_codigo");
                
                conta = new Conta(auxConta, auxdescricao, auxDate, auxvalor, auxTipo, auxSituacao, auxNome );
            }
        }catch(SQLException e){
            System.out.println("Erro de sql: " + e.getMessage());
        }finally{
            return conta;
        }
    }
    
}

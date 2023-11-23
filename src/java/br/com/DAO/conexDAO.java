/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.DAO;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Sanches
 */
public class conexDAO {
    private final String drive = "com.mysql.cj.jdbc.Driver";
    String port = "3306";
    String nm_banco = "soldiers";
    private final String usuario = "root";
    private final String senha = "";
    private final String url = "jdbc:mysql://localhost:" + port + "/" + nm_banco + "?user=" + usuario + "&password=" + senha;

    public Connection conexBanco() {
        Connection conex = null;
        try {

            Class.forName(drive);
            conex = DriverManager.getConnection(url);

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return conex;
    }

    public void desligarConexao(Connection conex) {
        try {
            conex.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

}

package br.com.DAO;

import br.com.DTO.usuarioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class usuarioDAO {

    Connection conex;
    PreparedStatement pstm;

    public void CadastrarUsuario(usuarioDTO objUsuarioDTO) {

        String sql = "insert into usuarios (nm_usuario, cd_idade, dt_dataNascimento, nm_guerra, nm_patente, nm_usuarioLogin ,cd_senha) values (?, ?, ?, ?, ?, ?, ?)";
        //String sql = "INSERT INTO usuarios (nm_usuario, cd_idade, dt_dataNascimento, nm_guerra, nm_patente, nm_usuarioLogin, cd_senha) VALUES ('Nome do Usuário', 25, '1998-01-01', 'Apelido de Guerra', 'Sentinela', 'Nome de Usuário Login', 'Senha do Usuário')";
        //String sql = "INSERT INTO usuarios (nm_usuario) values (?)";
        conex = new conexDAO().conexBanco();

        try {
            System.out.println(objUsuarioDTO.toString());
            System.out.println(objUsuarioDTO.getNm_usuario());
            
            pstm = conex.prepareStatement(sql);
            pstm.setString(1, objUsuarioDTO.getNm_usuario());
            pstm.setInt(2, objUsuarioDTO.getCd_idade());
            pstm.setString(3, objUsuarioDTO.getDt_dataNascimento());
            pstm.setString(4, objUsuarioDTO.getNm_guerra());
            pstm.setString(5, objUsuarioDTO.getNm_patente());
            pstm.setString(6, objUsuarioDTO.getNm_usuarioLogin());
            pstm.setString(7, objUsuarioDTO.getCd_senha());

            pstm.execute();
            pstm.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}

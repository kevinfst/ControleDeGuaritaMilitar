package servlets;

import br.com.DAO.usuarioDAO;
import br.com.DTO.usuarioDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/CadastrarUsuario"})
public class CadastrarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        usuarioDTO objUsuarioDTO = new usuarioDTO();
        objUsuarioDTO.setNm_usuario(request.getParameter("nm_usuario"));
        usuarioDAO objUsuarioDAO = new usuarioDAO();
        objUsuarioDAO.CadastrarUsuario(objUsuarioDTO);

    }

}

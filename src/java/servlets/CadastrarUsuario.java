package servlets;

import br.com.DAO.usuarioDAO;
import br.com.DTO.usuarioDTO;
import java.io.IOException;
import static java.lang.System.out;
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

        try {
            usuarioDTO objUsuarioDTO = new usuarioDTO();
            objUsuarioDTO.setNm_usuario(request.getParameter("nm_usuario"));
            objUsuarioDTO.setCd_idade(Integer.parseInt(request.getParameter("cd_idade")));
            objUsuarioDTO.setDt_dataNascimento(request.getParameter("dt_dataNascimento"));
            objUsuarioDTO.setNm_guerra(request.getParameter("nm_guerra"));
            objUsuarioDTO.setNm_patente(request.getParameter("nm_patente"));
            objUsuarioDTO.setNm_usuarioLogin(request.getParameter("nm_usuarioLogin"));
            objUsuarioDTO.setCd_senha(request.getParameter("cd_senha"));

            usuarioDAO objUsuarioDAO = new usuarioDAO();
            objUsuarioDAO.CadastrarUsuario(objUsuarioDTO);
            out.print(request.getParameter("nm_usuario"));
        } catch (NumberFormatException e) {

        }

    }

}

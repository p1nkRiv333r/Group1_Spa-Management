/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.RoomDAO;
import DAO.SpaServiceDAO;
import DAO.UserDAO;
import Model.Room;
import Model.SpaService;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Legion
 */
@WebServlet(name="PublicServiceDetailController", urlPatterns={"/public-service-detail"})
public class PublicServiceDetailController extends HttpServlet {
    
    private SpaServiceDAO spaServiceDAO;
    private RoomDAO roomDAO;
    private UserDAO userDao; // Giả sử bạn đã có class UserDao với method getUsersBySpaServiceId


    @Override
    public void init() throws ServletException {
        super.init();
        // Giả sử bạn có Connection khởi tạo ở đây
        spaServiceDAO = new SpaServiceDAO();
        roomDAO = new RoomDAO();
        userDao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing spa service ID");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            SpaService spaService = spaServiceDAO.getSpaServiceById(id);
            
            List<Room> rooms = roomDAO.getRoomsBySpaServiceId(spaService.getId());
            List<User> users = userDao.getUsersBySpaServiceId(spaService.getId());

            if (spaService == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Spa service not found");
                return;
            }

            request.setAttribute("service", spaService);
            request.setAttribute("rooms", rooms);
            request.setAttribute("users", users);
            request.getRequestDispatcher("public-service-detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid spa service ID");
        }
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

    
}

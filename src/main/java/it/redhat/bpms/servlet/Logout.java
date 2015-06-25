package it.redhat.bpms.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name="LogoutServlet", urlPatterns={"logout"})
public class Logout extends HttpServlet {

    Logger logger = Logger.getLogger("it.redhat.bpms");

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("----- [Logout Servlet] Logging out " + request.getRemoteUser() + " --------");
        request.getSession().invalidate();
        response.setHeader("Cache-Control", "no-cache");
        response.sendRedirect("index.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

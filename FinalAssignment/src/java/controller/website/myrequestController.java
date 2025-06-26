/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.website;

import Dal.LeaveRequestDBContext;
import Model.Account;
import Model.LeaveRequest;
import controller.authentication.RoleController;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author anhqu
 */
public class myrequestController extends RoleController {

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account)
            throws ServletException, IOException {

        LeaveRequestDBContext db = new LeaveRequestDBContext();
        ArrayList<LeaveRequest> myRequest = db.listCreatedBy(account.getId());

        req.setAttribute("requests", myRequest);
        req.getRequestDispatcher("/website/myrequest.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account)
            throws ServletException, IOException {
        resp.sendRedirect("myrequest");
    }
}

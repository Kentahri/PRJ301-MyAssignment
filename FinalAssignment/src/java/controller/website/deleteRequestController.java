/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.website;

import Dal.LeaveRequestDBContext;
import Model.Account;
import controller.authentication.RoleController;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author anhqu
 */
public class deleteRequestController extends RoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        LeaveRequestDBContext db = new LeaveRequestDBContext();
        db.delete(id, account.getId());

        resp.sendRedirect("myrequest?message=deleted");
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
    }

}

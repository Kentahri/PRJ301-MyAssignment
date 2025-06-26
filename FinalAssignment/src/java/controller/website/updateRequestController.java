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
import java.sql.Date;

/**
 *
 * @author anhqu
 */
public class updateRequestController extends RoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Date fromDate = Date.valueOf(req.getParameter("fromDate"));
        Date toDate = Date.valueOf(req.getParameter("toDate"));
        String reason = req.getParameter("reason");

        LeaveRequest request = new LeaveRequest();
        request.setId(id);
        request.setStartDate(fromDate);
        request.setEndDate(toDate);
        request.setReason(reason);

        LeaveRequestDBContext db = new LeaveRequestDBContext();
        db.update(request);
        resp.sendRedirect("myrequests?message=updated");
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

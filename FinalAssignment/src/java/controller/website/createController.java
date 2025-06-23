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
public class createController extends RoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        String reason = req.getParameter("reason");
        
        LeaveRequest l = new LeaveRequest();
        l.setAccount(account);
        l.setStartDate(Date.valueOf(fromDate));
        l.setEndDate(Date.valueOf(toDate));
        l.setReason(reason);
        
        LeaveRequestDBContext db = new LeaveRequestDBContext();
        db.insert(l);
        req.setAttribute("message", "bạn vừa tạo thành công đơn nghỉ phép!");
        req.getRequestDispatcher("homepage.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        req.getRequestDispatcher("/website/create.jsp").forward(req, resp);
    }

}

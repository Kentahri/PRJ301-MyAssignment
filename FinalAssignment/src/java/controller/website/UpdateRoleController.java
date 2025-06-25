/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.website;

import Dal.AccountDBContext;
import Dal.RoleDBContext;
import Model.Account;
import Model.Role;
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
public class UpdateRoleController extends RoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int aid = Integer.parseInt(req.getParameter("aid"));
        int rid = Integer.parseInt(req.getParameter("rid"));

        AccountDBContext adb = new AccountDBContext();
        adb.setRole(aid, rid);

        resp.sendRedirect("updaterole?message=success");
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        AccountDBContext adb = new AccountDBContext();
        RoleDBContext rdb = new RoleDBContext();

        ArrayList<Account> accounts = adb.getAllAccounts();
        ArrayList<Role> roles = rdb.list();

        req.setAttribute("accounts", accounts);
        req.setAttribute("roles", roles);
        req.getRequestDispatcher("/website/UpdateRole.jsp").forward(req, resp);
    }

}

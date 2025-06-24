/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.website;

import Dal.AccountDBContext;
import Model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author anhqu
 */
public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("user");
        String password = req.getParameter("pass");
        String displayname = req.getParameter("displayname");

        AccountDBContext db = new AccountDBContext();

        if (db.isExist(username)) {
            req.setAttribute("message", "exists");
            req.getRequestDispatcher("/website/register.jsp").forward(req, resp);
            return;
        }

        Account newAccount = new Account();
        newAccount.setUsername(username);
        newAccount.setPassword(password);
        newAccount.setDisplayname(displayname);

        boolean success = db.register(newAccount);  // insert trả về true nếu thành công

        if (success) {
            db.insertRoleForAccount(newAccount.getId(), 4); // rid = 4 là không có quyền
            resp.sendRedirect("login?message=success");
        } else {
            req.setAttribute("message", "fail");
            req.getRequestDispatcher("/website/register.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/website/register.jsp").forward(req, resp);
    }

}

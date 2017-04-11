/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package toink.handler;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import toink.bean.UserBean;
import toink.dao.UserDao;

/**
 *
 * @author toink
 */
public class UserHandler extends HttpServlet {
    private static String INSERT = "/user.jsp";
    private static String Edit = "/edit.jsp";
    private static String UserRecord = "/listUser.jsp";
    private UserDao dao;

    public UserHandler() throws SQLException {
        super();
        dao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String redirect="";
        String uId = request.getParameter("userid");        
        String action = request.getParameter("action");
        if(!((uId)== null) && action.equalsIgnoreCase("insert"))
        {
        	int id = Integer.parseInt(uId);
        	UserBean user = new UserBean();
        	user.setId(id);
                user.setfName(request.getParameter("firstName"));
                user.setlName(request.getParameter("lastName"));
        	dao.addUser(user);
        	redirect = UserRecord;
                request.setAttribute("users", dao.getAllUsers());    
           	System.out.println("Record Added Successfully");
        }
        else if (action.equalsIgnoreCase("delete")){
                String userId = request.getParameter("userId");
                int uid = Integer.parseInt(userId);
                dao.removeUser(uid);
                redirect = UserRecord;
                request.setAttribute("users", dao.getAllUsers());
                System.out.println("Record Deleted Successfully");
        }else if (action.equalsIgnoreCase("editform")){        	
        	redirect = Edit;            
        }else if (action.equalsIgnoreCase("edit")){
        	String userId = request.getParameter("userId");
                int uid = Integer.parseInt(userId);            
                UserBean user = new UserBean();
        	user.setId(uid);
                user.setfName(request.getParameter("firstName"));
                user.setlName(request.getParameter("lastName"));
                dao.editUser(user);
                request.setAttribute("user", user);
                redirect = UserRecord;
                System.out.println("Record updated Successfully");
         } else if (action.equalsIgnoreCase("listUser")){
                redirect = UserRecord;
                request.setAttribute("users", dao.getAllUsers());
         } else {
                redirect = INSERT;
        }

        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

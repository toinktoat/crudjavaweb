<%@ page import="toink.bean.UserBean"%>
<%@ page import="toink.dao.UserDao"%>
<%@ page import="java.util.*"%>
<%@include file="header.jsp" %>
<%
//UserBean user = new UserBean();
UserDao dao = new UserDao();
List<UserBean> userList = dao.getAllUsers();
//Iterator<UserBean> itr = userList.iterator();
%>
            
           
         
<div class="container">
     <a href="UserHandler?action=insert" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Tambah User</a>
     <br>
     <br>
<table id="example1" class="table table-bordered table-striped">
<thead>    
<tr>
<th>Id</th>
<th>First Name</th>
<th>Last Name</th>
<th>Actions</th>
</tr>
  </thead>
  <tbody>      

<% for (UserBean user : userList) { %>
<tr>
<td><%=user.getId()%></td>
<td><%=user.getfName()%></td>
<td><%=user.getlName()%></td>
<td colspan="2" align="center"><a
href="UserHandler?action=editform&userId=<%=user.getId()%>" class="btn btn-primary"><i class="glyphicon glyphicon-edit"></i></a>
<a
href="UserHandler?action=delete&userId=<%=user.getId()%>" class="btn btn-danger"><i class="glyphicon glyphicon-remove-circle"></i></a></td>

</tr>  

<%    
}
%>
</tbody>


</table>



</div>
<%@include file="footer.jsp" %>
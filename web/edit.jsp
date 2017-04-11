<%@ page import="toink.bean.UserBean"%>
<%@ page import="toink.dao.UserDao"%>
<%@include file="header.jsp" %>
<%
UserBean user = new UserBean();
%>
<%
UserDao dao = new UserDao();
%>
<div class="container">
<form method="POST" action='UserHandler' name="frmEditUser"><input
type="hidden" name="action" value="edit" /> 
<%
String uid = request.getParameter("userId");
if (!((uid) == null)) {
int id = Integer.parseInt(uid);
user = dao.getUserById(id);
%>
<table class="table table-bordered">
<tr>
<td>User ID</td>
<td><input type="text" class="form-control" name="userId" readonly="readonly"
value="<%=user.getId()%>"></td>
</tr>
<tr>
<td>First Name</td>
<td><input type="text" class="form-control" name="firstName" /></td>
</tr>
<tr>
<td>Last Name</td>
<td><input type="text" class="form-control" name="lastName" /></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Update" /></td>
</tr>
</table>
<%
} else
out.println("ID Tidak Ditemukan");
%>
</form>
</div>
<%@include file="footer.jsp" %>
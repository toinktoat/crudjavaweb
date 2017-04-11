<%@include file="header.jsp" %>
<div class="container">
<form method="POST" action='UserHandler' name="frmAddUser"><input
type="hidden" name="action" value="insert" />
    
<p><b>Add New Record</b></p>
<table class="table table-bordered">
<tr>
<td>User ID</td>
<td><input type="text" class="form-control" placeholder="Isi User ID ..." name="userid" /></td>
</tr>
<tr>
<td>First Name</td>
<td><input type="text" class="form-control" placeholder="Isi First Name ..." name="firstName" /></td>
</tr>
<tr>
<td>Last Name</td>
<td><input type="text" class="form-control" placeholder="Isi Last Name ..." name="lastName" /></td>
</tr>
<tr>
<td></td>
<td><input type="submit" class="btn btn-primary" value="Simpan" /></td>
</tr>
</table>
</form>
<p><a href="UserHandler?action=listUser">Lihat Semua Data</a></p>
</div>
<%@include file="footer.jsp" %>
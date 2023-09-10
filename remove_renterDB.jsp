<%@ include file = "connect.jsp" %>

<%
String renter_email = request.getParameter("renter_email");
String owner_email=(String)session.getAttribute("email");
PreparedStatement pst = con.prepareStatement("delete from Renter_DB where OwnerEmail=? and RenterEmail=?");
pst.setString(1,owner_email);
pst.setString(2,renter_email);
int t = pst.executeUpdate();
if(t > 0){
  response.sendRedirect("dashboard.jsp");
}
con.close();
%>
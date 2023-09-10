<%@ include file = "connect.jsp" %>

<%
String renter_email = request.getParameter("renter_email");
String owner_email=(String)session.getAttribute("email");
java.time.LocalDate currdate = java.time.LocalDate.now();
java.time.Month currMonth = currdate.getMonth();
String month = currMonth.toString();
PreparedStatement pst = con.prepareStatement("update Renter_DB set Last_Rent_Month = ?,rent_paid = ? where OwnerEmail = ? and RenterEmail = ?");
pst.setString(1,month);
pst.setString(2,"1");
pst.setString(3,owner_email);
pst.setString(4,renter_email);
int t = pst.executeUpdate();
if(t > 0){
  response.sendRedirect("dashboard.jsp");
}
con.close();
%>
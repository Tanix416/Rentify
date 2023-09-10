<%@ include file = "connect.jsp" %>
<%
java.time.LocalDate currdate = java.time.LocalDate.now();
java.time.Month currMonth = currdate.getMonth();
String month = currMonth.toString();
String owner_email=(String)session.getAttribute("email");
PreparedStatement pst = con.prepareStatement("select * from Renter_DB where OwnerEmail = ?");
pst.setString(1,owner_email);
ResultSet rs = pst.executeQuery();
while(rs.next()){
  String last_rent_month = rs.getString(7);
  if(!last_rent_month.equals(month)){
    String renter_email = rs.getString(6);
    String rent_paid = "0";
    PreparedStatement pst1 = con.prepareStatement("update Renter_DB set rent_paid = ? where OwnerEmail = ? and RenterEmail = ?");
    pst1.setString(1,rent_paid);
    pst1.setString(2,owner_email);
    pst1.setString(3,renter_email);
    int t = pst1.executeUpdate();
  }
}
con.close();
response.sendRedirect("dashboard.jsp");
%>
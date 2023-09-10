<%@ include file="connect.jsp" %>
<%
     //out.println(request.getParameter("email"));
     //out.println(request.getParameter("workshop_id"));
     PreparedStatement pst=con.prepareStatement("select * from Owner_DB where EmailID like ?");
     pst.setString(1,request.getParameter("email"));
     ResultSet rs=pst.executeQuery();
     if(rs.next())
     {
%>
1
<%
     }
     else
     {
%>
0
<%
     }
    con.close();
%>
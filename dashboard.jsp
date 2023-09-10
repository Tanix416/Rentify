<%@ include file = "connect.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Rentify</title>
    <link rel="stylesheet" href="styles/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>

<body class="main-content">
    <header class="section sec1 header active">
<%
try{
java.time.LocalDate currdate = java.time.LocalDate.now();
java.time.Month currMonth = currdate.getMonth();
String month = currMonth.toString();
String owner_email=(String)session.getAttribute("email");
PreparedStatement pst = con.prepareStatement("select * from Owner_DB where EmailID = ?");
pst.setString(1,owner_email);
ResultSet rs = pst.executeQuery();
String name = "";
if(rs.next())
name = rs.getString(1);

%>
        <div class="main-title">
            <h2>
                <span class="bg-text">My Dashboard</span>
                <span class="fg-text">Welcome Back <span><%=name%></span></span>
            </h2>
        </div>
        <div class="renter-details-container">
<%
PreparedStatement pst1 = con.prepareStatement("select * from Renter_DB where OwnerEmail = ? order by rent_paid");
pst1.setString(1,owner_email);
ResultSet rs1 = pst1.executeQuery();
while(rs1.next()){
String renter_name = rs1.getString(1);
String renter_photo = rs1.getString(2);
String renter_roomNo = rs1.getString(3);
String renter_phoneNo = rs1.getString(4);
String renter_email = rs1.getString(6);
String month_rent = rs1.getString(7);
String rent_paid = rs1.getString(8).equals("1") ? "YES" : "NO";
String rent_amount = rs1.getString(10);
String rent_pay_url = "rent_payDB.jsp?renter_email="+renter_email;
String remove_renter_url = "remove_renterDB.jsp?renter_email="+renter_email;
String edit_renter_url =  "edit.jsp?renter_email="+renter_email;
String renter_pic_url = "pic_upload.jsp?renter_email="+renter_email;
String alert_url = "send_email.jsp?renter_email="+renter_email+"& month+"+month;
%>
            <div class="renter-details">
                <div class="renter-preview">
                    <span>
                        <a href = <%=renter_pic_url%>><img src="./img/<%=renter_photo%>" alt="Renter Photograph"></a>
                    </span>
                </div>
                <div class="renter-info">
                    <h5>Name : <%=renter_name%></h5>
                    <h5>Room No. : <%=renter_roomNo%></h5>
                    <h5>Phone No. : <%=renter_phoneNo%></h5>
                    <h5>Last Month : <%=month_rent%></h5>
                    <h5>Amount To Pay : Rs <%=rent_amount%></h5>
                    <h5>Rent Paid : <%=rent_paid%></h5>
                </div>
                <div class="renter-btn">
                    <form action = <%=rent_pay_url%> method = "post"><button type="submit" >Rent Paid</button></form>
                    <form action = <%=alert_url%> method = "post"><button type="submit" >Send Alert</button>
                    <form action=""></form>
                    <form action = <%=edit_renter_url%> method = "post"><button type="submit" >Edit</button></form>
                    <form action = <%=remove_renter_url%> method = "post"><button type="submit" >Remove</button></form>
                </div>
            </div>
            

<%
}
}
catch(Exception e){
    out.println(e);
}
con.close();
%>
 </div>
    </header>
    <main>
        <section class="section sec2 about"></section>
        <section class="section sec3 portfolio"></section>
        <section class="section sec4 blogs"></section>
        <section class="section sec5 contact"></section>
    </main>
    <div class="controls">
    <form action = "renter_new.html">
        <button class="control control-1" type="submit" >
            <i class="fa-regular fa-plus"></i>
        </button>
    </form>
    <form action="send_email1.jsp">
        <button class="control control-2" type="submit">
            <i class="fa-solid fa-reply-all"></i>
        </button>
    </form>
    <form action = "log_out.jsp">
        <button class="control control-3" type="submit" >
            <i class="fa-solid fa-arrow-right-from-bracket"></i>
        </button>
    </form>
    </div>

    <script>
        function textFunc()
        {
            alert("clicked");
        }
    </script>
</body>
</html>
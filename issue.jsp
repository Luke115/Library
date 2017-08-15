<%@ page import="java.sql.*,java.util.*,java.text.*,java.text.SimpleDateFormat" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Date" %>
<script type = "text/javascript" >
function disableBackButton()
{
window.history.forward();
}
setTimeout("disableBackButton()", 0);
</script>
<%
String userid = request.getParameter("userid");
String id0 = request.getParameter("bookname1");
String id1 = request.getParameter("bookname2");
String id2 = request.getParameter("bookname3");
String id3 = request.getParameter("bookname4");

String idj[] = new String[4];
idj[1] = request.getParameter("bookname2");
idj[2] = request.getParameter("bookname3");
idj[3] = request.getParameter("bookname4");

java.util.Date now = new java.util.Date();
String DATE_FORMAT = "dd-MM-yyyy";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
String strDateNew = sdf.format(now) ;

//out.println("Book One:"+idj[1]+"IS");
//out.println(idj[2]);
//out.println(idj[3]);

int i=1;
for(int j=1;j<=3;j++)
{
    if(idj[j]==null || idj[j]=="" )
    {
        
    }
    else if(idj[j] != null || idj[j]!="")
    {
        out.println("Book Is  :"+idj[j]+"....");
        i++;
    }
}
out.println("No. of Books Are:"+i);


Date currentDate = new Date();
        //System.out.println(sdf.format(currentDate));

        // convert date to calendar
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);

        // manipulate date
        c.add(Calendar.DATE, 15);
      

        // convert calendar to date
        Date currentDatePlusOne = c.getTime();

        //out.println(sdf.format(currentDatePlusOne));
        String dates = sdf.format(currentDatePlusOne);





String flag = request.getParameter("flag");

PreparedStatement pstmt;
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/login", "root", "");
pstmt=con.prepareStatement("Insert into transaction(userid,id0,id1,id2,id3,issue_date,return_date,flag) values(?,?,?,?,?,?,?,?)");

pstmt.setString(1,userid);
pstmt.setString(2,id0);
pstmt.setString(3,id1);
pstmt.setString(4,id2);
pstmt.setString(5,id3);
pstmt.setString(6,strDateNew);
pstmt.setString(7,dates);
pstmt.setString(8,flag);
pstmt.executeUpdate();

String id[] = new String[4];
id[0] = id0;
id[1] = id1;
id[2] = id2;
id[3] = id3;
        String book[] =new String[4];
        String bookname[] = new String[4];
        String authorname[] = new String[4];
        int ii=0;
        for(ii=0;ii<i;ii++)
        {
        book[ii] = id[ii];
        Class.forName("com.mysql.jdbc.Driver");
//        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/login", "root", "");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from books where id='" + book[ii] + "'");
        if (rs.next()) {
        bookname[ii] = rs.getString("bookname");
        authorname[ii] = rs.getString("authorname");
        out.println(book[ii]);
        out.println(bookname[ii]);
        out.println(authorname[ii]);
        }
        }
    //Creating a result for getting status that messsage is delivered or not!
    String result;
    
    String total = new String();
        for(int j1=0;j1<i;j1++)
        {
            total = total + bookname[j1]+" by "+authorname[j1]+"\n"; 
        }
    out.println("Total "+total);
    
    
    // Get recipient's email-ID, message & subject-line from index.html page
    final String to = request.getParameter("email");
    final String subject = "Book Issued From Charusat Library.";
    final String messg = total;
    //response.sendRedirect("issuebook.jsp");
    request.setAttribute("errorMessage1", "Book Issued Successfully"); 
    RequestDispatcher dispatcher = request.getRequestDispatcher("issuebook.jsp");
    dispatcher.forward( request, response);
    // Sender's email ID and password needs to be mentioned
    final String from = "hdesai777.hd@gmail.com";
    final String pass = "7383000598";
    
    // Defining the gmail host
    String host = "smtp.gmail.com";
 
    // Creating Properties object
    Properties props = new Properties();
 
    // Defining properties
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.user", from);
    props.put("mail.password", pass);
    props.put("mail.port", "465");
 
    // Authorized the Session object.
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });
 
    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));
        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        // Set Subject: header field
        message.setSubject(subject);
        // Now set the actual message
        
        message.setText(messg);
        
        
        // Send message
        Transport.send(message);
//        request.setAttribute("errorMessage1", "Book Issued Successfully"); 
//        RequestDispatcher dispatcher = request.getRequestDispatcher("issuebook.jsp");
//        dispatcher.forward( request, response);
//        //response.sendRedirect("issuebook.jsp");
        result = "Your mail sent successfully....";
        //response.sendRedirect("issuebook.jsp");
        
        }
        catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send mail....";
        //response.sendRedirect("returnbook.jsp");
        }
//        catch (IllegalStateException e) 
//        {
//           response.sendRedirect("returnbook.jsp");
//        }
//        catch(Exception e)
//        {
//            response.sendRedirect("issuebook.jsp");
//            }   
%>
  <%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*, javax.mail.Session.*" %>
   <%
     String host = "localhost";
      Properties prop = new Properties();
      prop.put("mail.smtp.host", host);
      Session s = Session.getInstance(prop,null);
       MimeMessage message = new MimeMessage(s);

      InternetAddress from = new InternetAddress("hdesai777.hd@gmail.com");
          message.setFrom(from);
        InternetAddress to = new InternetAddress("d16ce165@charusat.edu.in");
       message.addRecipient(Message.RecipientType.TO, to);

         message.setSubject("Test from JavaMail.");
       message.setText("Hello from JavaMail!");
          Transport.send(message);
      %>
    <html>
     <p align="center">A Message has been sent.<br>Check your inbox.</p>
      <p align="center"><a href="mailjavax.jsp">Click here to send another!</a></p>
      </html>
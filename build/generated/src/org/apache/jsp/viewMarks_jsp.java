package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class viewMarks_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Marks View</title>\n");
      out.write("    </head>\n");
      out.write("    <body bgcolor='#5B4CFF'>\n");
      out.write("        <img src=\"images/background.png\" alt=\"hpc logo\" height=\"136\" width=\"800\" />\n");
      out.write("        <table border=\"1\" cellpadding=\"20\" cellspacing=\"10\" align=\"center\">\n");
      out.write("    <tr>\n");
      out.write("        <td><a href=\"createQuiz.html\"><h3>Quiz Creation</h3></a></td>\n");
      out.write("        <td><a href=\"insertAnswers.html\"><h3>Answers Insertion</h3></td>\n");
      out.write("        <td><a href=\"viewMarks.html\"><h3>View Marks</h3></a></td>\n");
      out.write("    </tr>\n");
      out.write("</table>\n");
      out.write("        \n");
  
    String quizId = "quiz1";
    Class.forName ("com.mysql.jdbc.Driver"); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");  
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM viewmarks WHERE quizId='"+quizId+"' ORDER BY marks DESC");

    if(rs !=null)
    {
        while(rs.next())
        {
         //Retrieve by column name
            String rollNo = rs.getString("rollNo");
            String marks = rs.getString("marks");

      out.write("\n");
      out.write("    <table border=\"1\" cellpadding=\"20\" cellspacing=\"10\" align=\"center\">\n");
      out.write("        <tr>\n");
      out.write("            <td>ROLL NO.</td>\n");
      out.write("            &nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("            <td>MARKS OBTAINED</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr> \n");
      out.write("            <td>");
      out.print( rollNo );
      out.write("</td>\n");
      out.write("            &nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("            <td>");
      out.print( marks );
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("    <br />\n");

        }
      }
      stmt.close();
      conn.close();

      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

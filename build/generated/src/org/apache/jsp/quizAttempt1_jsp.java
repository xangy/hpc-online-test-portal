package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class quizAttempt1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Quiz Creation</title>\n");
      out.write("    </head>\n");
      out.write("    <body bgcolor='#5B4CFF'>\n");
      out.write("    <center><h2>Hope, you attempt well.</h2></center>\n");
  
    String quizId = request.getParameter ("quizId");
    
    Class.forName ("com.mysql.jdbc.Driver"); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");  
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * from quiz WHERE quizId='"+quizId+"'");

      out.write("\n");
      out.write("    <center>\n");
      out.write("        <h2><u>Your Quiz ID::");
      out.print( quizId );
      out.write("</u></h2>\n");
      out.write("    </center>\n");

    if(rs !=null)
    {
        while(rs.next())
        {
         //Retrieve by column name
            String qNo = rs.getString("qNumber");
            String q = rs.getString("q");
            String a1 = rs.getString("a1");
            String a2 = rs.getString("a2");
            String a3 = rs.getString("a3");
            String a4 = rs.getString("a4");

      out.write("\n");
      out.write("   \n");
      out.write("    <table border='1'>\n");
      out.write("        <tr> \n");
      out.write("            <td>");
      out.print( qNo );
      out.write("&hybull;");
      out.print( q );
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr> \n");
      out.write("            <td>a&hybull;");
      out.print( a1 );
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr> \n");
      out.write("            <td>b&hybull;");
      out.print( a2 );
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr> \n");
      out.write("            <td>c&hybull;");
      out.print( a3 );
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr> \n");
      out.write("            <td>d&hybull;");
      out.print( a4 );
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("    \n");
      out.write("    <br />\n");

        }
      }
      
      stmt.close();
      conn.close();
      

      out.write("\n");
      out.write("<center>\n");
      out.write("        <iframe src=\"quizAttempt2.html\" width=\"450\" frameborder=\"1\" scrolling=\"yes\">\n");
      out.write("        </iframe>\n");
      out.write("</center>\n");
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

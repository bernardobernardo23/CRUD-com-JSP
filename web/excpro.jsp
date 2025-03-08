<%-- 
    Document   : excpro
    Created on : 2 de mar. de 2025, 18:35:54
    Author     : Ricardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "bernardo");
                PreparedStatement st;
                st = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); //executa o comando sql
                //coloca a execução numa variavel pra tratar erro
                if (resultado == 0) {
                    out.print("Este produto nao esta cadastrado");
                } else {
                    out.print("Produto excluido com sucesso");
                }
            } catch (Exception e) {
                String mensagemerro = e.getMessage();
                out.print("Erro : " + mensagemerro + "Entre em contato com o suporte");
            }
        %>


    </body>
</html>

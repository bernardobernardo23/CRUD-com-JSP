<%-- 
    Document   : index
    Created on : 1 de mar. de 2025, 20:32:02
    Author     : Ricardo
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
            String n;
            n = request.getParameter("nome"); //pega o nome digitado em conpro.html
            try {

                //conexao com BD
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "bernardo");

                //listagem de dados na tabela do bd
                st = conecta.prepareStatement("SELECT * FROM produto WHERE nome LIKE ?");
                st.setString(1, "%" +  n + "%");
                ResultSet rs = st.executeQuery();
        %>
        <table>
            <tr>
                <th>Código</th><th>Nome</th><th>Marca</th><th>Preço</th><th>Ações</th>
            </tr>
            <%
                while (rs.next()) { //passsa linha por linha da tabela --- rs= conecxao
            %>

            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("marca")%></td>
                <td><%= rs.getString("preco")%></td>
                <td><a href="excpro.jsp?codigo=<%= rs.getString("codigo")%>">Excluir</a></td> <!-- como se fosse um getRowlspan() -->
            </tr>


            <%
                }
            %>
        </table>
        <%
            } catch (Exception x) {
                out.print("ERRO :" + x.getMessage());
            }
        %>
    </body>
</html>

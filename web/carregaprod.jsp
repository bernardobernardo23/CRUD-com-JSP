<%-- 
    Document   : carregaprod
    Created on : 2 de mar. de 2025, 22:59:16
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
        <link rel="stylesheet" type="text/css" href="altera.css">
    </head>
    <body>
        <%
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));

            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "bernardo");

            st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo = ?");
            st.setInt(1, c);
            ResultSet resultado = st.executeQuery();

            if (!resultado.next()) {
                out.print("Este produto nao foi encontrado");
            } else {
        %>
        <form method="post" action="alterar_produtos.jsp">
            <p>
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" placeholder="Digite o codigo novamente"  value="<% resultado.getString("codigo"); %>">
            </p>
            <p>
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" size="50" value="<% resultado.getString("nome"); %>">
            </p>
            <p>
                <label for="marca">Marca:</label>
                <input type="text" name="marca" id="marca" value="<% resultado.getString("marca"); %>">
            </p>
            <p>
                <label for="preco">Preço:</label>
                <input type="number"  name="preco" id="preco" value="<% resultado.getString("preco"); %>"> <!<!-- step : exemplo 4 ou 4,50 ou 5,00 -->
            </p>

            <p>
                <input type="submit" value="salvar alterações">
            </p>
        </form>

        <%
            }

        %>
    </body>
</html>

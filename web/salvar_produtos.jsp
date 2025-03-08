<%-- 
    Document   : index
    Created on : 1 de mar. de 2025, 20:32:02
    Author     : Ricardo
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int codigo;
            String nome, marca;
            double preco;

            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            marca = request.getParameter("marca");
            preco = Double.parseDouble(request.getParameter("preco"));

            try {

                //conexao com BD
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "bernardo");

                //inserir dados na tabela do bd
                st = conecta.prepareStatement("INSERT INTO produto VALUES(?,?,?,?)");
                st.setInt(1, codigo);
                st.setString(2, nome);
                st.setString(3, marca);
                st.setDouble(4, preco);
                st.executeUpdate();
                out.print("Produto cadastrado com sucesso");

            } catch (Exception x) {
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("Este produto ja foi cadastrado;");
                } else {
                    out.print("ERRO :" + x.getMessage());
                }
            }
        %>
    </body>
</html>

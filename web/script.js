document.addEventListener("DOMContentLoaded", function () {
    const titulo = "Bem-vindo ao Sistema CRUD com JSP!";
    let index = 0;
    const elemento = document.getElementById("header-title"); //referenciação no htmkl

    function digitar() {
        if (index < titulo.length) {
            elemento.textContent += titulo.charAt(index);
            index++;
            setTimeout(digitar, 100); // Tempo entre cada letra digitada
        }else {
            elemento.style.borderRight = "none";
        } 
    }

    elemento.textContent = ""; // Garante que o texto inicie vazio
    digitar();
});


//else {
 //   elemento.style.borderRight = "none"; Remove cursor após a digitação -- else do if
//}
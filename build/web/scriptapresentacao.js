document.addEventListener("DOMContentLoaded", function () {
    const palavras = ["CREATE", "READ", "UPDATE", "DELETE"]; /*array /lista  */
    let palavraAtual = 0;
    let index = 0; /* qnts letras digitadas*/
    let deletando = false;
    const elemento = document.getElementById("palavra"); /* ligacao com o html*/ 

    function digitar() {
        let palavra = palavras[palavraAtual];

        if (!deletando) {
            elemento.innerHTML = palavra.substring(0, index + 1); /*primeira letra da palavra*/
            index++;
            if (index === palavra.length) {
                deletando = true;
                setTimeout(digitar, 2000);
                return;
            }
        } else {
            elemento.innerHTML = palavra.substring(0, index - 1);
            index--;
            if (index === 0) {
                deletando = false;
                palavraAtual = (palavraAtual + 1) % palavras.length;
            }
        }

        setTimeout(digitar, deletando ? 50 : 100);
    }

    digitar();
});

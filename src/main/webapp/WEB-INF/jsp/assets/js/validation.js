function emailValidate(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const emailResult = emailRegex.test(email);

    if(!emailResult) {
        alert("Email non valida!");
        return false;
    }

    return true;
}

function passwordValidate(password) {
    const passwordRegEx = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    const passwordResult = passwordRegEx.test(password);

    if (!passwordResult) {
        alert("Password non valida!\nLa password deve essere di almeno 8 caratteri, deve contenere un numero, una lettera maiuscola, una lettera minuscola e un carattere speciale.");
        return false;
    }

    return true;
}

function textValidate(text, title) {
    const textRegEx = /^[a-zA-Z0-9\s]+$/;
    const textResult = textRegEx.test(text);

    if (!textResult) {
        alert("Valore in '" + title + "' non valido!");
        return false;
    }

    return true;
}

function registrazioneValidate() {
    const nome = document.getElementById("nomeId").value;
    const cognome = document.getElementById("cognomeId").value;
    const via = document.getElementById("viaId").value;
    const cap = document.getElementById("capId").value;
    const paese = document.getElementById("paeseId").value;
    const numero = document.getElementById("numeroId").value;

    return textValidate(nome, "Nome") && textValidate(cognome, "Cognome") && textValidate(via, "Via") &&
        capValidate(cap) && textValidate(paese, "Paese") && phoneValidate(numero);

}
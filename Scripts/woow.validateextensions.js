function Validate() {
    $.validator.addMethod(
        "greaterThan",
        function (value, element, params) {

            if (value.length == 0 || $(params).val().length == 0) {
                return true;
            }

            var dia1 = value.substr(0, 2)
            var mes1 = value.substr(3, 2)
            var ano1 = value.substr(6, 4)
            var final = ano1 + "/" + mes1 + "/" + dia1;

            var dia2 = $(params).val().substr(0, 2)
            var mes2 = $(params).val().substr(3, 2)
            var ano2 = $(params).val().substr(6, 4)
            var inicio = ano2 + "/" + mes2 + "/" + dia2;

            if (!/Invalid|NaN/.test(new Date(final))) {
                return new Date(final) > new Date(inicio);
            }
            return isNaN(value) && isNaN($(params).val()) || (parseFloat(value) > parseFloat($(params).val()));
        },
        'Must be greater than {0}.'
    );


    $.validator.addMethod('noneSelected',
        function (value, element) {
            return this.optional(element) || (value.indexOf("Selecione") == -1);
        }, "Please select an option");


        // Função de validação de CPF
        $.validator.addMethod("verificaCPF", function (value, element) {
            alert("oi");
            value = value.replace('.', '');
            value = value.replace('.', '');
            cpf = value.replace('-', '');
            while (cpf.length < 11) cpf = "0" + cpf;
            var expReg = /^0+$|^1+$|^2+$|^3+$|^4+$|^5+$|^6+$|^7+$|^8+$|^9+$/;
            var a = [];
            var b = new Number;
            var c = 11;
            for (i = 0; i < 11; i++) {
                a[i] = cpf.charAt(i);
                if (i < 9) b += (a[i] * --c);
            }
            if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11 - x }
            b = 0;
            c = 11;
            for (y = 0; y < 10; y++) b += (a[y] * c--);
            if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11 - x; }
            if ((cpf.charAt(9) != a[9]) || (cpf.charAt(10) != a[10]) || cpf.match(expReg)) return false;
            return true;
        }, "CPF inválido.");  // Mensagem padrão
}




$( document ).ready(function() {
    document.getElementById("btn").onclick =
        function(){
            sendAjaxForm('results', 'math_form', 'calculation1.php');
            return false;
        };
});

function sendAjaxForm(results, math_form, url) {
    if(validate_form('math_form')){
        document.getElementById('X').style.background = 'rgb(255, 255, 255)';
        document.getElementById('Y').style.background = 'rgb(255, 255, 255)';
        document.getElementById('R').style.background = 'rgb(255, 255, 255)';
        $.post(
            url, //url страницы (action_ajax_form.php)
            {
                X: $('#X').val(),
                Y: $('#Y').val(),
                R: $('#R').val()
            },
            function(response) { //Данные отправлены успешно
                document.getElementById("results").innerHTML = response;
            }
        );
    }
}

function validate_form (math_form )
{
    valid = true;

    if ((isNaN($('#X').val()))||($('#X').val() > 4)||($('#X').val() < -4))
    {
        document.getElementById('X').style.background = 'rgb(255, 100, 100)';
        valid = false;
    }
    if ((isNaN($('#Y').val()))||($('#Y').val() > 3)||($('#Y').val() < -5))
    {
        document.getElementById('Y').style.background = 'rgb(255, 100, 100)';
        valid = false;
    }
    if ((isNaN($('#R').val()))||($('#R').val() > 5)||($('#R').val() < 1))
    {
        document.getElementById('R').style.background = 'rgb(255, 100, 100)';
        valid = false;
    }

    return valid;
}
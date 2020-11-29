<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Табличная вёрстка</title>
    <meta charset="UTF-8" />

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script>
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
    </script>

    <link rel="shortcut icon" href="/img/logo.ico" type="image/x-icon">
    <style type="text/css">
        @font-face {
            font-family: "RobotoBold";
            src: url("/fonts/Roboto/Roboto-Bold.ttf") format("truetype");
            font-style: normal;
            font-weight: normal;
        }
        @font-face {
            font-family: "Roboto";
            src: url("/fonts/Roboto/Roboto-Medium.ttf") format("truetype");
            font-style: normal;
            font-weight: normal;
        }
        @font-face {
            font-family: "Cinzel";
            src: url("/fonts/Cinzel/Cinzel-Medium.ttf") format("truetype");
            font-style: normal;
            font-weight: normal;
        }
        @font-face {
            font-family: "Flower";
            src: url("/fonts/Indie_Flower/IndieFlower-Regular.ttf") format("truetype");
            font-style: normal;
            font-weight: normal;
        }
        html, body, table, tbody{
            height: 100%;
            width: 100%;
            padding: 0;
            margin: 0;
        }
        form{
            margin:auto;
            height:100%;
        }
        td > input{
            display: block;
            margin:0 auto;
        }
        td{
            padding: 0;
        }
        td.result{
            vertical-align: top;
        }
        span.result:first-letter{
            color: #000000;
        }
        td[rowspan]{
            background-color: #295699;
        }
        li{
            margin-bottom: 10%;
            font-size: 30px;
        }
        *{
            font-family: "Roboto", serif;
            margin: 0;
        }
        select{
            width: 80%;
        }
        li > input{
            width: 80%;
        }
        #egg{
            color: #F2FEFF;
            font-family: Flower, serif;
            font-size: 45px;
            text-align: center;
        }
        #egg:hover{
            color: #F2F2F2;
            font-family: Flower, serif;
            font-size: 45px;
            text-align: center;
        }
        #hiden{
            color: #FFFFFF;
            font-family: Flower, serif;
            font-size: 158px;
            text-align: center;
        }
        #header{
            font-family: "RobotoBold", Arial, serif;
            color: #F2FEFF;
            font-size: 45px;
            letter-spacing: -0.61px;
        }
        #var{
            font-size: 15px;
            letter-spacing: +0.11px;
        }
        #leftfield{
            background-color: #295699;
        }
    </style>
</head>
<body>
<form name="math_form" action="" method="post">
    <table >
        <tr height = "10%" width="100%" style = "background-color: #CC4230">
            <td width="12%" rowspan="3"></td>
            <th width="76%" align="left" id="header" colspan="3">
                <span dir="ltr">Носов Михаил, P3212</span>
                <span dir="rtl" id="var"> вариант 212017</span></th>
            <td width="12%" rowspan="3"></td>
        </tr>
        <tr>
            <td width="20%">
                <ul>
                    <li height = "33%">
                        <span>X:</span>
                        <select name="X" id="X" required>
                            <option value=-4>-4</option>
                            <option value=-3>-3</option>
                            <option value=-2>-2</option>
                            <option value=-1>-1</option>
                            <option value=0>0</option>
                            <option value=1>1</option>
                            <option value=2>2</option>
                            <option value=3>3</option>
                            <option value=4>4</option>
                        </select>
                    </li height = "33%">
                    <li>
                        <span>Y:</span>
                        <input height="89%" name="Y" id="Y" required placeholder="(-5 ... 3)">
                    </li>
                    <li height = "33%">
                        <span>R:</span>
                        <select name="R" id="R" required>
                            <option value=1>1</option>
                            <option value=2>2</option>
                            <option value=3>3</option>
                            <option value=4>4</option>
                            <option value=5>5</option>
                        </select>
                    </li>
                </ul>
                <input type="submit" id="btn" value="Отправить">
            </td>
            <td width="30%">
                <img id="pic" src="pic2.png" alt="Тут картинка">
<%--                <canvas id="canvas" width="268" height="267">--%>
<%--                    <img id="picture" src="pic2.png" alt="Тут картинка">--%>
<%--                    <%--%>

<%--                    %>--%>
<%--                </canvas>--%>
<%--                <script>--%>
<%--                function getPosition(e){--%>
<%--                var x = y = 0;--%>

<%--                if (!e) {--%>
<%--                var e = window.event;--%>
<%--                }--%>

<%--                if (e.pageX || e.pageY){--%>
<%--                x = e.pageX;--%>
<%--                y = e.pageY;--%>
<%--                } else if (e.clientX || e.clientY){--%>
<%--                x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;--%>
<%--                y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;--%>
<%--                }--%>

<%--                return {x: x, y: y}--%>
<%--                }--%>



<%--                // Отслеживание события загрузки страницы--%>
<%--                window.addEventListener('load', function() {--%>
<%--                var cx = document.getElementById("canvas").getContext("2d");--%>
<%--                // Создание объекта картинки--%>
<%--                let img = new Image();--%>
<%--                // Назначение путь до картинки--%>
<%--                img.src = "pic2.png";--%>
<%--                // Вывод картинки--%>
<%--                cx.drawImage(img, 0, 0);--%>
<%--                $('body').mousemove(function(e){--%>
<%--                var cord = getPosition(e);--%>
<%--                cx.clearRect(0,0,268,267);--%>
<%--                cx.drawImage(img, 0, 0);--%>
<%--                var R = 3;--%>
<%--                var cordX = 0;--%>
<%--                var x = (((cord.x - 132)/102)*R*2).toFixed()/2;--%>
<%--                if(x > 2){--%>
<%--                x = 2;--%>
<%--                }--%>
<%--                if(x < -2){--%>
<%--                x = -2;--%>
<%--                }--%>
<%--                cordX = 132 + parseFloat((102*x/R).toFixed());--%>
<%--                cx.beginPath();--%>
<%--                cx.arc(cordX, cord.y, 3, 0, 2*Math.PI, false);--%>
<%--                cx.fillStyle = 'red';--%>
<%--                cx.fill();--%>
<%--                cx.lineWidth = 1;--%>
<%--                cx.strokeStyle = 'red';--%>
<%--                cx.stroke();--%>
<%--                //console.log(cordX + " " + x + " " + cord.x + " " + cord.y);--%>
<%--                })--%>
<%--                });--%>
<%--                </script>--%>
            </td>
            <td width="26%">
                <span id="egg">Easter egg</span>
            </td>
        </tr>
        <tr height = "30%">
            <td class = "result">
                <span class = "result">Результаты:</span>
            </td>
            <td colspan="2" id="results" style="vertical-align: top;"></td>
        </tr>
    </table>
</form>
</body>
</html>
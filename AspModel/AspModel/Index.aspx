<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AspModel.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <script src="Scripts/jquery-1.8.2.min.js"></script>
    <script src="Handles/GetData.ashx"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

     <input type="button" value="提交信息" id="Button1" onclick="submit1()" />
    </div>
    </form>
</body>
</html>


<script type="text/javascript">

    function submit1() {

        var username = "<%=UserName%>";
      
        var TextBox1value = $("#TextBox1").val();

        var postData = {   CMD: "submit1", TextBox1value: TextBox1value, username: username};
        $.ajax({
            type: "Post",
            url: "Handles/GetData.ashx",
            data: postData,
            dataType: "text",
            success: function (returnVal) {
                returnVal = $.parseJSON(returnVal);
                var flg = returnVal.Data;
                
              
                if (flg != "true") {
                    alert("发送信息发生异常");
                }

            },
            error: function (errMsg) {
                alert('数据加载失败！');
            }
        });
    }

    function WebSocketHelper()
    {
        var socekt = new WebSocket;
        socekt.con
        
    }

    function WebSocketTest() {
        if ("WebSocket" in window) {
            alert("WebSocket is supported by your Browser!");
            // Let us open a web socket
            var ws = new WebSocket("ws://localhost:9998/echo");
            ws.onopen = function () {
                // Web Socket is connected, send data using send()
                ws.send("Message to send");
                alert("Message is sent...");
            };
            ws.onmessage = function (evt) {
                var received_msg = evt.data;
                alert("Message is received...");
            };
            ws.onclose = function () {
                // websocket is closed.
                alert("Connection is closed...");
            };
        }
        else {
            // The browser doesn't support WebSocket
            alert("WebSocket NOT supported by your Browser!");
        }
    }

    function RequestWebService() {
        //这是我们在第一步中创建的Web服务的地址
        var URL = "http://localhost/YBWS/WebService.asmx";

        //在这处我们拼接
        var data;
        data = '<?xml version="1.0" encoding="utf-8"?>';
        data = data + '<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">';
        data = data + '<soap12:Body>';
        data = data + '<HelloWorld xmlns="http://tempuri.org/" />';
        data = data + '</soap12:Body>';
        data = data + '</soap12:Envelope>';

        //创建异步对象
        var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        xmlhttp.Open("POST", URL, false);
        xmlhttp.SetRequestHeader("Content-Type", "application/soap+xml");
        xmlhttp.Send(data);

        document.getElementById("data").innerHTML = xmlhttp.responseText;
    }
    
</script>

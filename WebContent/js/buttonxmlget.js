function sendRequest(url, param, callBack, method){ 

        xhr = createRequest(); //XMLHttpRequest 객체생성 

         

        if(method != "GET" && method != "get" ) 

                method = "POST"; 

                 

        //파라메터 값이 있는지 없는지를 판별한다. 

        var httpParam = (param == null || param == "")?null : param; 

         

        var httpURL = url; 

        //전송방식이 get방식이며, 전달할 파라메터값이 있는 경우 

        if((method == "GET" || method == "get") && httpParam != null){ 

                httpURL = httpURL+"?"+httpParam; 

        } 

         

        xhr.open(method, httpURL, true); 

        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 

        xhr.onreadystatechange = callBack; 

        //전송방식이 post일때는 반드시 파라메터 값을 여기 send)에 기재해야 한다. 

        xhr.send(method == "GET"?httpParam:null);   //전송방식이 post일 때는 반드시 파라메터값을 여기 send()에 기재한다. 

} 
var url = "http://127.0.0.1:9080";
function  loginCheck() {
            var user = document.getElementById("user").value;
            var psd = document.getElementById("psd").value;
            var submit = {"username":user,"passord":psd};
                        $.ajax({
                            url: url+"/accountLogin",
                            data: submit,
                            type: "post",
                            async: false,
                            dataType: "json",
                            success: function (data) {
                                if (data== "success") { //判断返回值，这里根据的业务内容可做调整
                                   alert("登录成功！");
                                }
                                else{
                                    alert("用户名或密码有误！");
                                }
                            },
                            error: function(){
                              
                                alert("未请求到！");
                            }
                        });
                    }
            
                   
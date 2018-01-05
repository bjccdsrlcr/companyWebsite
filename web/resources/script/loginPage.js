/**
 * Created by bjccdsrlcr on 2018/1/3.
 */
document.write("<script language=javascript src='/resources/script/Barrett.js'></script>");
document.write("<script language=javascript src='/resources/script/BigInt.js'></script>");
document.write("<script language=javascript src='/resources/script/RSA.js'></script>");
var websiteLoginPage = {
    //登录页面
    loginPage:{
        init:function () {
            pubexponent = '';
            pubmodules = '';
            $.ajax({
                url:"/getRSAPublicKey",
                dataType:"json",
                type:"get",
                success:function (data) {
                    console.log(data);
                    pubexponent = data.pubexponent;
                    pubmodules = data.pubmodules;
                    console.log(pubmodules);
                    console.log(pubexponent);
                },
            });

            console.log("登录页面初始化");

            $('#loginBtn').click(function () {
                var username = $('#usernameKey').val();
                var password = $('#passwordKey').val();
                var params = {};
                //获得使用公钥加密后的用户名和密码进行传输
                var secretUsername = websiteLoginPage.loginPage.getEncryptedStr(username);
                var secretPassword = websiteLoginPage.loginPage.getEncryptedStr(password);
                params['username'] = secretUsername;
                params['password'] = secretPassword;
                console.log("===============",username,password);
                $.ajax({
                    type:"post",
                    url:"/loginCheck",
                    data: params,
                    async: false,
                    success:function (data) {
                        console.log(data.result);
                        if(data.result == 1){
                            console.log("登录成功");
                            window.location.href = "/index/indexPage";
                        }else {
                            alert("用户名或密码不正确");
                        }
                    },
                });
            })
        },
        getEncryptedStr:function (str) {
            setMaxDigits(200);
            var key = new RSAKeyPair(pubexponent,"",pubmodules);
            return encryptedString(key, encodeURIComponent(str));
        }
    }

};
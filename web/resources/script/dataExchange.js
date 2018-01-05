document.write("<script language=javascript src='/resources/script/Barrett.js'></script>");
document.write("<script language=javascript src='/resources/script/BigInt.js'></script>");
document.write("<script language=javascript src='/resources/script/RSA.js'></script>");
var website = {
    //封装相关ajax的url
    URL: {
        addNewsData: function () {
            return '/news' + '/addNewsData'
        },
    },
    //添加书籍页面
    addBookPage: {
        init: function () {
            console.log("添加页面初始化！");
            var E = window.wangEditor;
            editor = new E('#editor');
            newsID = undefined;
            // 或者 var editor = new E( document.getElementById('#editor') )
            editor.create();
            $('#saveBtn').click(function () {
                website.addBookPage.addNews();
            });
            $('#previewBtn').click(function () {
                if(newsID == undefined){
                    alert("必须先保存新闻信息");
                }else{
                    window.open("/news/newsId="+newsID+"/detail");
                }
            });
            $('#pubBtn').click(function () {
                
            })
        },
        addNews: function () {
            //模态框 对用户添加行为的响应
            var addResultModel = $('#addResultModel');
            var title = $('#titleKey').val();
            var author = $('#authorKey').val();
            var text = editor.txt.html();

            console.log("text----------------" + text);
            var params = {};
            var newsDataUrl = website.URL.addNewsData();
            params['title'] = title;
            params['author'] = author;
            params['date'] = date;
            //text是富文本编辑器的内容
            params['text'] = text;
            $.ajax({
                type: 'post',
                url: newsDataUrl,
                data: params,
                async: false,
                success: function (result) {
                    console.log(result);
                    newsID = result.newsId;
                    if (result.result == "success") {
                        $('#resultMessage').text("保存新闻成功！");
                        addResultModel.modal({
                            show: true,//显示弹出层
                            backdrop: 'static',//禁止位置关闭
                            keyboard: false//关闭键盘事件
                        });
                    }
                }
            });

        }
    },
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
                var secretUsername = website.loginPage.getEncryptedStr(username);
                var secretPassword = website.loginPage.getEncryptedStr(password);
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
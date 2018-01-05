/**
 * Created by bjccdsrlcr on 2018/1/3.
 */
var websiteNewsPage = {
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
    }
};
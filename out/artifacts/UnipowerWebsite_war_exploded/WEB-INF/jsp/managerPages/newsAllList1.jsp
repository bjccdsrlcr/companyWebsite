<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/3
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="box">
    <div class="box-header hidden">
        <h3 class="box-title"></h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <div class="btn-box">
            <div class="btn-group">
                <span class="btn btn-primary" onclick="openModalNews(0, 0)">撰写新闻</span>
            </div>
        </div>
        <table id="table_news" class="table table-bordered table-striped">
            <thead>
            <tr>
                <th><input type="checkbox" name="checkAll" onclick="checkAll()" /></th>
                <th>新闻标题</th>
                <th>发布作者</th>
                <th>发布日期</th>
                <th>新闻类别</th>
                <th>操作</th>
                <th>状态</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

<div class="modal" id="modal_news">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增新闻</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" onsubmit="return false;">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">新闻标题</label>
                        <div class="col-sm-10">
                            <input type="text" id="titleKey" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">发布作者</label>
                        <div class="col-sm-10">
                            <input type="text" id="authorKey" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">新闻类别</label>
                        <div class="col-sm-10">
                            <div id="typeIdKey"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <input type="hidden" id="newsIdKey" class="form-control" />
                        </div>
                    </div>
                    <%--wangEditor--%>

                    <%--summernote--%>
                    <div id="editor"></div>
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<div id="chooseNewsTypeModel" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    <span class="glyphicon glyphicon-studentId"> </span>请选择新闻对应的类别：
                </h3>
            </div>

            <div class="modal-body">
            </div>

            <div class="modal-footer">
                <%--<button type="button" id="addNewsTypeBtn" class="btn btn-primary">保存</button>--%>
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
            </div>
        </div>
    </div>
</div>

<div id="addNewsResultModel" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    <span class="glyphicon glyphicon-studentId"> </span>提示信息：
                </h3>
            </div>

            <div class="modal-body">

            </div>

            <div class="modal-footer">

                <a href="#" class="btn" data-dismiss="modal">关闭</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //	l - Length changing 改变每页显示多少条数据的控件
    //	f - Filtering input 即时搜索框控件
    //	t - The Table 表格本身
    //	i - Information 表格相关信息控件
    //	p - Pagination 分页控件
    //	r - pRocessing 加载等待显示信息
    $(function() {
        console.log("页面初始化！");
//		$("div.toolbar").html('<span class="btn btn-primary">删除</span>');
        $news=$("#table_news").DataTable({
//			"dom":'r<"right"f><"toolbar">t<"bottom"ip><"clear">',
            "bPaginate": true,
            "bLengthChange": false,
            "bFilter": true,
            "bSort": false,
            "bInfo": true,
            "bAutoWidth": false,
            //			"processing": true,
            //"serverSide": true,
            "ajax": {
                "url": "/news/newsListData"
            },
            "autoWidth": false,
            "columns": [{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    return '<input type="checkbox" name="check"/>';
                }
            }, {
                "data": "title"
            }, {
                "data": "author"
            }, {
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    var html = new Date(parseInt(data.date)).toLocaleString().replace(/:d{1,2}$/,' ');
                    return html;
                }
            }, {
                "data": "type_name"
            },{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    var html='<span class="btn btn-primary btn-xs" title="编辑" onclick="openModalNews(1, '+data.fid+')"><i class="fa fa-edit"></i></span>'+
                        '<span class="btn btn-primary btn-xs" title="发布" onclick="isPub('+data.fid+')"><i class="fa fa-play"></i></span>'+
                        '<span class="btn btn-primary btn-xs" title="删除" onclick="del('+data.fid+')"><i class="fa fa-trash-o"></i></span>';
                    return html;
                }
            },{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    var html = '';
                    if(data.is_pub){
                        html='已发布';
                    }else{
                        html='未发布';
                    }
                    return html;
                }
            }],
            "language": {
                "search":"<i class='fa fa-search'></i>",
                "lengthMenu": "_MENU_ 条记录每页",
                "zeroRecords": "没有找到记录",
                "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                "infoEmpty": "无记录",
                "infoFiltered": "(从 _MAX_ 条记录过滤)",
                "paginate": {
                    "previous": "上一页",
                    "next": "下一页"
                }
            },
        })

        //初始化编辑器
        var content='Edit your article here...';
        $('#editor').summernote({
            lang: 'zh-CN',
            height: 200
        });
        //赋值
        $('#editor').code(content);

    });

    function checkAll(){
        if($('input[name=checkAll]')[0].checked){
            $('input[name=check]').each(function(idx,item){
                $(this).attr("checked", true);
            })
        }else{
            $('input[name=check]').each(function(idx,item){
                $(this).attr("checked", false);
            })
        }
    }
    function openModalNews(flag, fid){
        $('#modal_news').modal('show');
        if (flag==0) {
            $('#modal_news').find('.modal-title').html('撰写新闻');
            $('#modal_news').find('.modal-footer').html(
                '<button type="button" id="newsSaveBtn" class="btn btn-primary">保存</button>'+
                '<button type="button" id="newsPreBtn1" class="btn btn-primary">预览</button>'+
                '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>');
            console.log($('#editor1').code());
            $('#modal_news').on('click','#newsSaveBtn',function(){
                var title = $('#titleKey').val();
                var author = $('#authorKey').val();
                //var text = editor.txt.html();
                var text = $('#editor').code();
                console.log(text);
                $.ajax({
                    type: 'post',
                    url: '/news/addNewsData',
                    data: {
                        'title': title,
                        'author': author,
                        'text': text
                    },
                    async: false,
                    success: function (result) {
                        $('#newsIdKey').val(result.newsId);
                        if (result.result == "success") {
                            $('#chooseNewsTypeModel').modal('show');
                            $('#chooseNewsTypeModel').find('.modal-footer').html(
                                '<button type="button" id="addNewsTypeBtn" class="btn btn-primary">保存</button>'+
                                '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>');
                            //拿到新闻类别的列表
                            $.ajax({
                                type: 'post',
                                url: '/newsType/newsTypeListData',
                                success:function (result) {
                                    var typeList = result.data;
                                    var html = '';
                                    for (var i = 0; i< typeList.length; i++){
                                        html+='<div class="checkbox pull-left">'+
                                            '<label><input type="checkbox" name="type" value="'+typeList[i].fid+'">' +typeList[i].type_name+ '</label></div>'
                                    }
                                    $('#chooseNewsTypeModel').find('.modal-body').html(html);
                                },
                            });
                            $('#addNewsTypeBtn').click(function () {
                                var typeIdList = [];
                                $('input[name=type]').each(function(idx,item){
                                    if($(this).is(':checked')){
                                        typeIdList.push({'news_id': result.newsId,
                                            'type_id': $(this).attr("value")});
                                    }
                                });
                                console.log("before adding typeIdList is " + typeIdList);
                                $.ajax({
                                    type: 'post',
                                    url: '/news/addNewsTypeByNewsId',
                                    data: JSON.stringify(typeIdList),
                                    dataType: 'json',
                                    contentType:"application/json",
                                    async: false,
                                    success: function (result) {
                                        if (result.code == "200") {
                                            $('#addNewsResultModel').modal("show");
                                            $('#addNewsResultModel').find('.modal-body').html('添加成功');
                                            console.log("after add types typeIdlist is:" + typeIdList);
                                            $news.ajax.reload();
                                        }
                                    }
                                });

                            });
                        }
                    }
                });

            });
            $('#modal_news').on('click','#newsPreBtn1',function(){
                var fid = $('#newsIdKey').val();
                if(fid==''){
                    alert("必须先保存信息");
                }else {
                    window.open("/news/newsId="+fid+"/detail");
                }
            });
        } else if(flag==1){
            $('#modal_news').find('.modal-title').html('编辑新闻');
            $('#modal_news').find('.modal-footer').html(
                '<button type="button" id="newsUpdateBtn" class="btn btn-primary">更新</button>'+
                '<button type="button" id="newsPreBtn" class="btn btn-primary">预览</button>'+
                '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>');
            // ajax 1 和 ajax 2是得到新闻之前在数据库中的信息并展示
            //ajax 1.得到该新闻之前的信息
            $.ajax({
                type: 'post',
                url: '/news/getNewsById',
                data: {
                     'newsId': fid
                },
                success:function (result) {
                    console.log("author:" + result.author);
                    console.log("title:" + result.title );
                    console.log("text:" + result.text);
                    $('#titleKey').val(result.title);
                    $('#authorKey').val(result.author);
                    $('#editor').code(result.text);
                }
            });
            //ajax 2.得到新闻类别信息
            $.ajax({
                type: 'post',
                url: '/newsType/newsTypeListData',
                success:function (result) {
                    console.log(result);
                    var typeList = result.data;
                    var html = '';
                    for (var i = 0; i< typeList.length; i++){
                        html+='<div class="checkbox pull-left">'+
                            '<label><input type="checkbox" name="updateType" value="'+typeList[i].fid+'">' +typeList[i].type_name+ '</label></div>'
                    }
                    $('#typeIdKey').html(html);
                }
            });
            // 点击事件触发存储过程
            $('#modal_news').on('click','#newsUpdateBtn',function(){
                var typeIdList = [];
                $('input[name=updateType]').each(function(idx,item){
                    if($(this).is(':checked')){
                        typeIdList.push({'news_id': fid,
                            'type_id': $(this).attr("value")});
                    }
                });
                console.log("before adding typeIdList is " + typeIdList);
                // ajax 3 将 新闻ID 和 新闻类别ID 以json格式传到后台，并且存入 新闻与新闻类别的关系表中
                $.ajax({
                    type: 'post',
                    url: '/news/updateNewsTypeByNewsId',
                    data: JSON.stringify(typeIdList),
                    dataType: 'json',
                    contentType:"application/json",
                    async: false,
                    success: function (result) {
                        if (result.code == "200") {
                            console.log("after add newsTypes");
                            console.log("after add types typeIdlist is:" + typeIdList);
                            //$news.ajax.reload();
                        }
                    }
                });
                // ajax 4 将新闻更新后的基础信息 传到后台进行处理
                var title = $('#titleKey').val();
                var author = $('#authorKey').val();
                console.log("author"+author);
                var text = $('#editor').code();
                $.ajax({
                    type: 'post',
                    url: '/news/updateNewsData',
                    data: {
                        'title': title,
                        'author': author,
                        'text': text,
                        'newsId': fid
                    },
                    async: false,
                    success: function (result) {
                        if (result.result == "success") {
//                            $('#resultMessage').text("更新新闻信息成功！");
//                            $('#addNewsResultModel').modal('show');
                            console.log("更新成功");
                            //$news.ajax.reload();
                        }
                    }
                });

                $news.ajax.reload();
            });
            $('#modal_news').on('click','#newsPreBtn',function(){
                window.open("/news/newsId="+fid+"/detail");
            });
        }

    }
    function isPub(id) {
        console.log(id);
        var params = {};
        params['newsId'] = id;
        $.ajax({
            type: 'post',
            url: '/news/isPub',
            data: params,
            success:function (result) {
                console.log(result);
                //进行修改操作之后对页面进行刷新
               $news.ajax.reload();
            }
        });
    }
    function del(id){
        console.log(id);
        if(confirm('确认删除？')){
			$.ajax({
	            url: "/news/deleteNews",
	            data: {
	                "newsId": id
	            },
                success: function (data) {
	                $news.ajax.reload();
	                console.log("删除成功" + data.newsId+"状态码：" + data.code);
	            }
	        });
        }
    }


</script>
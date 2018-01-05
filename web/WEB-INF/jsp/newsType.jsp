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
                <span class="btn btn-primary" onclick="openModalType(0, 0)">新增类别</span>
            </div>
        </div>
        <table id="table_newsType" class="table table-bordered table-striped">
            <thead>
            <tr>
                <th><input type="checkbox" name="checkAll" onclick="checkAll()" /></th>
                <th>序号</th>
                <th>类别名称</th>
                <th>描述</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

<div class="modal" id="modal_newsType">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增新闻类别</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" onsubmit="return false;">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">类别名称</label>
                        <div class="col-sm-10">
                            <input type="text" id="typeNameKey" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10">
                            <textarea rows="5" id="decriptionKey" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <input type="hidden" id="typeIdKey" class="form-control" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
                <%--<button type="button" id="typeSaveBtn" class="btn btn-primary">确定</button>--%>
            </div>
        </div>
    </div>
</div>

<div id="addNewsTypeResultModel" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    <span class="glyphicon glyphicon-studentId"> </span>提示信息：
                </h3>
            </div>

            <div class="modal-body">
                <h4 id="resultMessage"></h4>
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
//		$("div.toolbar").html('<span class="btn btn-primary">删除</span>');
        $newsType=$("#table_newsType").DataTable({
//			"dom":'r<"right"f><"toolbar">t<"bottom"ip><"clear">',
            "bPaginate": true,
            "bLengthChange": false,
            "bFilter": true,
            "bSort": false,
            "bInfo": true,
            "bAutoWidth": false,
            //			"processing": true,
            //			"serverSide": true,
            "ajax": {
                "url": "/newsType/newsTypeListData"
            },
            "autoWidth": false,
            "columns": [{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    return '<input type="checkbox" name="check"/>';
                }
            }, {
                "data": "fid"
            }, {
                "data": "type_name"
            }, {
                "data": "decription"
            },{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    var html='<span class="btn btn-primary btn-xs" title="编辑" onclick="openModalType(1, '+data.fid+')"><i class="fa fa-edit"></i></span>'+
                        '<span class="btn btn-primary btn-xs" title="删除" onclick="del('+data.fid+')"><i class="fa fa-trash-o"></i></span>';
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
    function openModalType(flag, fid){
        $('#modal_newsType').modal('show');
        if (flag==0) {
            $('#modal_newsType').find('.modal-title').html('新增新闻类别');
            $('#modal_newsType').find('.modal-footer').html(
                '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'+
                '<button type="button" id="typeSaveBtn" class="btn btn-primary">保存</button>');
            $('#typeSaveBtn').click(function () {
                //模态框 对用户添加行为的响应
                var addNewsTypeResultModel = $('#addNewsTypeResultModel');
                var typeName = $('#typeNameKey').val();
                var decription = $('#decriptionKey').val();
                console.log(typeName+ decription);
                $.ajax({
                    type: 'post',
                    url: '/newsType/addNewsTypeData',
                    data: {
                        'type_name': typeName,
                        'decription': decription
                    },
                    async: false,
                    success: function (result) {
                        console.log(result);
                        //newsID = result.newsId;
                        if (result.result == "Success") {
                            $('#addNewsTypeResultModel').find('.modal-body').html('<h4>新闻类别保存成功!</h4>');
                            addNewsTypeResultModel.modal({
                                show: true,//显示弹出层
                                backdrop: 'static',//禁止位置关闭
                                keyboard: false//关闭键盘事件
                            });
                        }
                        $newsType.ajax.reload();
                    }
                });

            });
        } else if(flag==1){
            $('#modal_newsType').find('.modal-title').html('编辑新闻类别');
            $('#modal_newsType').find('.modal-footer').html(
                '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'+
                '<button type="button" id="typeUpdateBtn" class="btn btn-primary">更新</button>');
            $.ajax({
                type: 'post',
                url: '/newsType/getTypeById',
                data: {
                    'fid': fid
                },
                success:function (result) {
                    console.log(result);
                    //向该窗口传递数据,有数据 但是html没能渲染出来
                    $('#typeNameKey').val(result.typeName);
                    $('#decriptionKey').val(result.decription);
                    $('#typeIdKey').val(result.fid);
                },
                error:function () {
                    console.log("--")
                }
            });
            $('#typeUpdateBtn').click(function () {
                //模态框 对用户添加行为的响应
                var addNewsTypeResultModel = $('#addNewsTypeResultModel');
                var typeName = $('#typeNameKey').val();
                var decription = $('#decriptionKey').val();
                var type_id = $('#typeIdKey').val();
                console.log(typeName+ decription);
                $.ajax({
                    type: 'post',
                    url: '/newsType/updateNewsType',
                    data: {
                        'type_name': typeName,
                        'decription': decription,
                        'type_id': type_id
                    },
                    async: false,
                    success: function (result) {
                        console.log(result);
                        //newsID = result.newsId;
                        if (result.result == "Success") {
                            $('#addNewsTypeResultModel').find('.modal-body').html('<h4>新闻类别更新成功!</h4>');
                            addNewsTypeResultModel.modal({
                                show: true,//显示弹出层
                                backdrop: 'static',//禁止位置关闭
                                keyboard: false//关闭键盘事件
                            });
                        }
                        $newsType.ajax.reload();
                    }
                });

            });
        }

    }

    function del(id){
        console.log(id);
        if(confirm('确认删除？')){
            $.ajax({
                url: "/newsType/deleteNewsType",
                data: {
                    "fid": id
                },
                success: function (data) {
                    //$news.ajax.reload();
                    console.log("删除成功" + data.newsTypeID+"状态码：" + data.code);
                    $newsType.ajax.reload();
                }
            });
        }
    }
</script>
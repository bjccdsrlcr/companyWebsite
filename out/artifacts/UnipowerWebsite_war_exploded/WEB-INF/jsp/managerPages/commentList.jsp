<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/5
  Time: 11:35
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
        </div>
        <table id="table_comment" class="table table-bordered table-striped">
            <thead>
            <tr>
                <th><input type="checkbox" name="checkAll" onclick="checkAll()" /></th>
                <th>评论内容</th>
                <th>评论日期</th>
                <th>所属新闻</th>
                <th>评论用户</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
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
        $comment=$("#table_comment").DataTable({
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
                "url": "/comments/commentListData"
            },
            "autoWidth": false,
            "columns": [{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    return '<input type="checkbox" name="check"/>';
                }
            }, {
                "data": "text"
            }, {
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    var html = new Date(parseInt(data.date)).toLocaleString().replace(/:d{1,2}$/,' ');
                    return html;
                }
            }, {
                "data": null,
                "orderable": false,
                "render": function (data, type, full, meta) {
                    //console.log(data.news);
                    var html = ''+data.news.title+'';
                    return html;
                }
            },{
                "data": null,
                "orderable": false,
                "render": function (data, type, full, meta) {
                    //console.log(data.user_name);
                    var html = ''+data.user_name+'';
                    return html;
                }
            },{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    var html='<span class="btn btn-primary btn-xs" title="删除" onclick="del(\''+data.fid+'\')"><i class="fa fa-trash-o"></i></span>';
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
    function openModalComment(flag){
        $('#modal_comment').modal('show');
        if (flag==0) {
            $('#modal_comment').find('.modal-title').html('发表评论');
        }
    }

    function del(id){
        console.log(id);
        if(confirm('确认删除？')){
            $.ajax({
                url: "/comments/deleteComment",
                data: {
                    "fid": id
                },
                success: function (data) {
                    //$news.ajax.reload();
                    console.log("删除成功" + data.commentId+"状态码：" + data.code);
                    $comment.ajax.reload();
                }
            });
        }
    }
</script>

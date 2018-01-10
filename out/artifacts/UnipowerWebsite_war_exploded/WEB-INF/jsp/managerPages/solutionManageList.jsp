<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/9
  Time: 12:04
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
                <span class="btn btn-primary" onclick="openModalSolution(0, 0)">发布解决方案</span>
            </div>
        </div>
        <table id="table_solution" class="table table-bordered table-striped">
            <thead>
            <tr>
                <th><input type="checkbox" name="checkAll" onclick="checkAll()" /></th>
                <th>解决方案名称</th>
                <th>解决方案介绍</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

<div class="modal" id="modal_solution">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">发布解决方案</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" onsubmit="return false;">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">解决方案名称</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="solutionNameKey"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">解决方案简介</label>
                        <div class="col-sm-10">

                            <div id="solutionEditor"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <input type="hidden" id="solIdKey" class="form-control" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
                <%--<button type="button" class="btn btn-primary" id="proSaveBtn">确定</button>--%>
            </div>
        </div>
    </div>
</div>
<div id="addSolResultModel" class="modal fade">
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
//		$("div.toolbar").html('<span class="btn btn-primary">删除</span>');
        $solution=$("#table_solution").DataTable({
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
                "url": "/solutions/solutionListData"
            },
            "autoWidth": false,
            "columns": [{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    return '<input type="checkbox" name="check"/>';
                }
            }, {
                "data": "sol_name"
            }, {
                "data": "intro"
            },{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    var html='<span class="btn btn-primary btn-xs" title="编辑" onclick="openModalSolution(1, '+data.fid+')"><i class="fa fa-edit"></i></span>'+
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
        //文本编辑器
        //初始化编辑器
        var content='Edit your article here...';
        $('#solutionEditor').summernote({
            lang: 'zh-CN',
            height: 200
        });
        //赋值
        $('#solutionEditor').code(content);
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
    function openModalSolution(flag, fid){
        $('#modal_solution').modal('show');
        if (flag==0) {
            $('#modal_solution').find('.modal-title').html('发布解决方案');
            $('#modal_solution').find('.modal-footer').html(
                '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'+
                '<button type="button" id="solSaveBtn" class="btn btn-primary">保存</button>');
            $('#modal_solution').on('click','#solSaveBtn',function(){
                var solutionName = $('#solutionNameKey').val();
                var solutionIntrod = $('#solutionEditor').code();
                $.ajax({
                    type: 'post',
                    url: '/solutions/addSolutionData',
                    data: {
                        'sol_name': solutionName,
                        'intro': solutionIntrod
                    },
                    async: false,
                    success: function (result) {
                        if (result.result == "Success") {

                            $('#addSolResultModel').modal('show');
                            $('#addSolResultModel').find('.modal-body').html('添加成功');
                            $solution.ajax.reload();
                        }
                    }
                });

            });
        }else if(flag == 1){
            $('#modal_solution').find('.modal-title').html('编辑解决方案');
            $('#modal_solution').find('.modal-footer').html(
                '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'+
                '<button type="button" id="solUpdateBtn" class="btn btn-primary">更新</button>');
            $.ajax({
                type: 'post',
                url: '/solutions/getSolutionById',
                data: {
                    'fid': fid
                },
                async: false,
                success: function (result) {
                    console.log(result);
                    $('#solutionNameKey').val(result.sol_name);
                    $('#solutionIntrodKey').val(result.intro);
                }
            });
            $('#modal_solution').on('click','#solUpdateBtn',function(){
                var solutionName = $('#solutionNameKey').val();
                var solutionIntrod = $('#solutionEditor').code();
                $.ajax({
                    type: 'post',
                    url: '/solutions/updateSolution',
                    data: {
                        'sol_name': solutionName,
                        'intro': solutionIntrod,
                        'fid': fid
                    },
                    async: false,
                    success: function (result) {
                        if (result.result == "Success") {

                            $('#addSolResultModel').modal('show');
                            $('#addSolResultModel').find('.modal-body').html('更新成功');
                            $solution.ajax.reload();
                        }
                    }
                });

            });
        }
    }

    function del(id){
        console.log(id);
        if(confirm('确认删除？')){
            $.ajax({
                url: "/solutions/deleteSolution",
                data: {
                    "fid": id
                },
                success: function (data) {
                    $solution.ajax.reload();
                    console.log("删除成功" + data.solutionId+  "状态码：" + data.code);
                }
            });
        }
    }
</script>

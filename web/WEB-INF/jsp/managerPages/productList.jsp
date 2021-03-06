<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/5
  Time: 10:20
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
                <span class="btn btn-primary" onclick="openModalProduct(0, 0)">发布产品</span>
            </div>
        </div>
        <table id="table_product" class="table table-bordered table-striped">
            <thead>
            <tr>
                <th><input type="checkbox" name="checkAll" onclick="checkAll()" /></th>
                <th>产品名称</th>
                <th>产品介绍</th>
                <th>操作</th>
                <th>是否热门</th>
                <th>是否发布</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

<div class="modal" id="modal_product_save">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">发布产品</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="productSaveForm" enctype="multipart/form-data" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品名称</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="SproductName"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品简介</label>
                        <div class="col-sm-10">
                            <textarea rows="5" class="form-control" name="SproductIntro"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品图片</label>
                        <div class="col-sm-10">
                            <input type="file" name="Simg">
                        </div>
                    </div>

                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <input type="submit" class="btn btn-primary">
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<div class="modal" id="modal_product_update">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑产品</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="productUpdateForm" enctype="multipart/form-data" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品名称</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="productNameKey" name="productName"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品简介</label>
                        <div class="col-sm-10">
                            <textarea rows="5" class="form-control" id="productIntrodKey" name="productIntro"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <img id="productImg">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品图片</label>
                        <div class="col-sm-10">
                            <input type="file" name="img">
                        </div>
                    </div>

                    <a  href="index.jsp" class="btn btn-default" data-dismiss="modal">取消</a>
                    <input type="submit" class="btn btn-primary" id="proSaveBtn">
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<div id="addProResultModel" class="modal fade">
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
        $product=$("#table_product").DataTable({
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
                "url": "/products/productListData"
            },
            "autoWidth": false,
            "columns": [{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    return '<input type="checkbox" name="check"/>';
                }
            }, {
                "data": "pro_name"
            }, {
                "data": "intro"
            },{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    var html='<span class="btn btn-primary btn-xs" title="编辑" onclick="openModalProduct(1, '+data.fid+')"><i class="fa fa-edit"></i></span>'+
                        '<span class="btn btn-primary btn-xs" title="发布" onclick="isPub('+data.fid+')"><i class="fa fa-play"></i></span>'+
                        '<span class="btn btn-primary btn-xs" title="热门" onclick="isHot('+data.fid+')"><i class="fa fa-adjust"></i></span>'+
                        '<span class="btn btn-primary btn-xs" title="删除" onclick="del('+data.fid+')"><i class="fa fa-trash-o"></i></span>';
                    return html;
                }
            },{
                "data": null,
                "orderable": false,
                "render": function(data, type, full, meta) {
                    var html = '';
                    if(data.is_hot){
                        html='是';
                    }else{
                        html='否';
                    }
                    return html;
                }
            }, {
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
    $('#modal_product_save').on('hide.bs.modal', function () {
        console.log('嘿，我听说您喜欢模态框...');
        window.location.href = '/index/indexPage'});
    $('#modal_product_update').on('hide.bs.modal', function () {
        console.log('嘿，我听说您喜欢模态框...');
        window.location.href = '/index/indexPage'});
    function openModalProduct(flag, fid){
        if (flag==0) {
            $('#modal_product_save').modal('show');
            $('#productSaveForm').on('submit', function(e) {
                e.preventDefault(); // <-- important
                $(this).ajaxSubmit({
                    beforeSubmit:function (formData, jqForm, options) {
                        console.log(formData);
                    },
                    type: 'post',
                    url: '/products/addProductsData',
                    clearForm: true,
                    success:function (result) {
                        if (result.result == "Success") {
                            alert("添加成功!");
                            window.location.href = "/index/indexPage";
                        }
                    }
                });
            });

        }else if(flag == 1){
            $('#modal_product_update').modal('show');
            $.ajax({
                type: 'post',
                url: '/products/getProductById',
                data: {
                    'fid': fid
                },
                async: false,
                success: function (result) {
                    console.log(result);
                    console.log(result.url);
                    $('#productNameKey').val(result.pro_name);
                    $('#productIntrodKey').val(result.intro);
                    $('#productImg').attr("src", result.url);
                }
            });
            $('#productUpdateForm').on('submit', function(e) {
                e.preventDefault(); // <-- important
                $(this).ajaxSubmit({
                    beforeSubmit:function (formData, jqForm, options) {
                        console.log(formData)
                    },
                    type: 'post',
                    url: '/products/updateProduct',
                    clearForm: true,
                    success:function (result) {
                        if (result.result == "Success") {
                            alert("更新成功!");
                            window.location.href = "/index/indexPage";
                        }
                    }
                });
            });
        }
    }
    function isPub(id) {
        console.log(id);
        $.ajax({
            type: 'post',
            url: '/products/isPub',
            data: {
                'productsId': id
            },
            success:function (result) {
                console.log(result);
                //进行修改操作之后对页面进行刷新
                $product.ajax.reload();
            }
        });
    }
    function isHot(id) {
        console.log(id);
        $.ajax({
            type: 'post',
            url: '/products/isHot',
            data: {
                'productsId': id
            },
            success:function (result) {
                console.log(result);
                //进行修改操作之后对页面进行刷新
                $product.ajax.reload();
            }
        });
    }
    function del(id){
        console.log(id);
        if(confirm('确认删除？')){
            $.ajax({
                url: "/products/deleteProduct",
                data: {
                    "fid": id
                },
                success: function (data) {
                    $product.ajax.reload();
                    console.log("删除成功" + data.productID+  "状态码：" + data.code);
                }
            });
        }
    }
</script>

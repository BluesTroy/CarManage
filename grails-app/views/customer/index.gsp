<%--
  Created by IntelliJ IDEA.
  User: Troy
  Date: 2016/6/11
  Time: 12:47
--%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
                客户管理
            <small>客户基本信息</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i> 主页</a></li>
            <li><g:link controller="customer" action="index" >客户管理</g:link></li>
            <li class="active">客户基本信息</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <form id="searchForm" method="get" action="/customer/index" class="form-inline">
            <g:hiddenField name="order" value="${params?.order}"/>
            <g:hiddenField name="sort" value="${params?.sort}"/>
            <g:hiddenField id="offset" name="offset" value="${params?.offset}"/>
            <g:hiddenField name="max" value="${params?.max}"/>
            <div class="box">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="name">姓名</label>
                                <input type="text" id="name" name="name"
                                       class="form-control input-md pull-right" style="width: 150px;"
                                       placeholder="模糊查询" value="${params?.name}"/>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="identityCard">身份证号</label>
                                <input type="text" id="identityCard" name="identityCard"
                                       class="form-control input-md pull-right" style="width: 150px;"
                                       placeholder="模糊查询" value="${params?.identityCard}"/>
                            </div>
                        </div>

                        <div class="col-md-1">
                            <button type="button" class="btn btn-default"
                                    onclick="javascript:searchPage();"><i class="fa fa-search"></i> 查询</button>
                        </div>

                        <div class="col-md-1">
                            <button type="button" class="btn btn-danger"
                                    onclick="javascript:resetPage();">重置</button>
                        </div>

                    </div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->

            <div class="row">
                <div class="col-md-12" id="listBoxDiv">
                    <g:render template="table_list"/>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </form>

        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-info-circle"></i> 客户详情</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body" id="domainModalBody">
                        ...
                    </div><!-- /.box-body -->
                    <div class="box-footer">
                        <div class="row">
                            <div class="col-md-2 col-md-offset-2">
                                <button class="btn btn-block btn-primary" onclick="createCustomer();">
                                    <i class="fa fa-plus"></i> 添加客户
                                </button>
                            </div>

                            <div class="col-md-2">
                                <button id="editButton" type="button" disabled="disabled"
                                        class="btn btn-block btn-primary" onclick="editCustomer();">
                                    <i class="fa fa-edit"></i> 编辑
                                </button>
                            </div>

                            <div class="col-md-2">
                                <button id="saveButton" type="button" disabled="disabled"
                                        class="btn btn-block btn-primary" onclick="saveCustomer();">
                                    <i class="fa fa-save"></i> 保存
                                </button>
                            </div>

                            <div class="col-md-2">
                                <button id="delButton" type="button" disabled="disabled"
                                        class="btn btn-block btn-primary" onclick="deleteCustomer();">
                                    <i class="fa fa-trash"></i> 删除
                                </button>
                            </div>
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<!-- REQUIRED JS SCRIPTS -->

<!-- page script -->
<script>
    $(document).ready(function () {
        fixPaginationA();
    });

    function resetPage() {
        $("#searchForm")[0].reset();
        loadPage();
    }

    function searchPage(){
        $("#offset").val('0');
        loadPage();
    }

    function loadPage() {
        $.post("/customer/loadPage", $("#searchForm").serializeArray(), function (bdata) {
            $("#listBoxDiv").html(bdata);
            fixPaginationA();
        }, "html").done();
    }

    function showCustomer(id) {
        $.post("/customer/edit", {id: id}, function (bdata) {
            $("#domainModalBody").html(bdata);
            // 所有输入表单控件只读显示
            $("#customerForm input:not(:button,:hidden)").prop("readonly", true);
            $("#customerForm select").prop("disabled", true);
            $("#delButton").attr("disabled", false);
            $("#editButton").attr("disabled", false);
        }, "html");
    }


    //////////////////////////////////
    function createCustomer() {
        $.post("/customer/create", null, function (bdata) {
            $("#domainModalBody").html(bdata);
            $("#saveButton").attr("disabled", false);
        }, "html");
    }

    function editCustomer() {
        $("#customerForm input:not(:button,:hidden)").prop("readonly", false);
        $("#delButton").attr("disabled", false);
        $("#saveButton").attr("disabled", false);
    }

    function deleteCustomer(){
        delCustomer($("#id").val());
    }

    function delCustomer(id) {
        var name = $("#td_name_" + id).html();

        bootbox.confirm("您要删除的是 " + name + " 吗？", function (isOk) {
            if (isOk) {
                bootbox.confirm("确认删除吗？", function (isOk) {
                    if (isOk) {
                        $.post("/customer/delete", {id: id}, function (bdata) {
                            if (bdata.status != "success") {
                                bootbox.alert(bdata.message, function () {

                                });
                            } else {
                                $("#offset").val('0');
                                loadPage();
                                /*$("#tr_" + id).remove();
                                var total = parseInt($("#domainTotalCount").html()) - 1;
                                total = total <= 0 ? 0 : total;
                                $("#domainTotalCount").html(total);*/
                                if ($("#id") != null && $("#id").val() == id) {
                                    $("#domainModalBody").html("...");
                                    $("#delButton").attr("disabled", true);
                                    $("#saveButton").attr("disabled", true);
                                    $("#editButton").attr("disabled", true);
                                }
                            }
                        }, "json");
                    }
                });
            }
        });
    }

    function saveCustomer() {
        $.post("/customer/save", $("#customerForm").serializeArray(), function (bdata) {
            if (bdata.status != "success") {
                bootbox.alert(bdata.message);
            } else {
                bootbox.alert("保存成功");
                loadPage();
                $("#domainModalBody").html("...");
                $("#delButton").attr("disabled", true);
                $("#saveButton").attr("disabled", true);
                $("#editButton").attr("disabled", true);
            }
        }, "json");
    }

    function setSort(name, dispayName) {
        $("#sort").val(name);
        if ($("#order").val() == "asc") {
            $("#order").val("desc");
        } else {
            $("#order").val("asc");
        }
        loadPage();
    }




</script>

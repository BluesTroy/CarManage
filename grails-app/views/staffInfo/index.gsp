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
                平台员工管理
            <small>员工基本信息</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i> 主页</a></li>
            <li><g:link controller="staffInfo" action="index" >平台员工管理</g:link></li>
            <li class="active">平台员工基本信息</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <form id="searchForm" method="get" action="/staffInfo/index" class="form-inline">
            <g:hiddenField name="order" value="${params?.order}"/>
            <g:hiddenField name="sort" value="${params?.sort}"/>
            <g:hiddenField id="offset" name="offset" value="${params?.offset}"/>
            <g:hiddenField name="max" value="${params?.max}"/>
            <div class="box">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="staffCode">员工编号</label>
                                <input type="text" id="staffCode" name="staffCode"
                                       class="form-control input-md pull-right" style="width: 150px;"
                                       placeholder="模糊查询" value="${params?.staffCode}"/>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="realName">姓名</label>
                                <input type="text" id="realName" name="realName"
                                       class="form-control input-md pull-right" style="width: 150px;"
                                       placeholder="模糊查询" value="${params?.realName}"/>
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
                        <h3 class="box-title"><i class="fa fa-info-circle"></i> 平台员工详情</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body" id="domainModalBody">
                        ...
                    </div><!-- /.box-body -->
                    <div class="box-footer">
                        <div class="row">
                            <div class="col-md-2 col-md-offset-2">
                                <button class="btn btn-block btn-primary" onclick="createStaffInfo();">
                                    <i class="fa fa-plus"></i> 添加员工
                                </button>
                            </div>

                            <div class="col-md-2">
                                <button id="editButton" type="button" disabled="disabled"
                                        class="btn btn-block btn-primary" onclick="editStaffInfo();">
                                    <i class="fa fa-edit"></i> 编辑
                                </button>
                            </div>

                            <div class="col-md-2">
                                <button id="saveButton" type="button" disabled="disabled"
                                        class="btn btn-block btn-primary" onclick="saveStaffInfo();">
                                    <i class="fa fa-save"></i> 保存
                                </button>
                            </div>

                            <div class="col-md-2">
                                <button id="delButton" type="button" disabled="disabled"
                                        class="btn btn-block btn-primary" onclick="deleteStaffInfo();">
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
        $.post("/staffInfo/loadPage", $("#searchForm").serializeArray(), function (bdata) {
            $("#listBoxDiv").html(bdata);
            fixPaginationA();
        }, "html").done();
    }

    function showStaffInfo(id) {
        $.post("/staffInfo/edit", {id: id}, function (bdata) {
            $("#domainModalBody").html(bdata);
            // 所有输入表单控件只读显示
            $("#staffInfoForm input:not(:button,:hidden)").prop("readonly", true);
            $("#staffInfoForm select").prop("disabled", true);
            $("#delButton").attr("disabled", false);
            $("#editButton").attr("disabled", false);
        }, "html");
    }


    //////////////////////////////////
    function createStaffInfo() {
        $.post("/staffInfo/create", null, function (bdata) {
            $("#domainModalBody").html(bdata);
            $("#saveButton").attr("disabled", false);
        }, "html");
    }

    function editStaffInfo() {
        $("#staffInfoForm input:not(:button,:hidden)").prop("readonly", false);
        $("#delButton").attr("disabled", false);
        $("#saveButton").attr("disabled", false);
    }

    function deleteStaffInfo(){
        delStaffInfo($("#id").val());
    }

    function delStaffInfo(id) {
        var staffCode = $("#td_staffCode_" + id).html();

        bootbox.confirm("您要删除的是 " + staffCode + " 吗？", function (isOk) {
            if (isOk) {
                bootbox.confirm("确认删除吗？", function (isOk) {
                    if (isOk) {
                        $.post("/staffInfo/delete", {id: id}, function (bdata) {
                            if (bdata.status != "success") {
                                bootbox.alert(bdata.message, function () {

                                });
                            } else {
                                $("#tr_" + id).remove();
                                var total = parseInt($("#domainTotalCount").html()) - 1;
                                total = total <= 0 ? 0 : total;
                                $("#domainTotalCount").html(total);
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

    function saveStaffInfo() {
        $.post("/staffInfo/save", $("#staffInfoForm").serializeArray(), function (bdata) {
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

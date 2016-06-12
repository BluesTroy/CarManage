<div class="box box-primary">
    <div class="box-body table-responsive no-padding">
        <table id="systemParameterTable" class="table table-hover table-bordered table-striped table-condensed">
            <thead>
            <tr>
                <th>参数名</th>
                <th>参数值</th>
                <th>参数描述</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="domainTableTbody">
            <g:each in="${systemParameterList}">
                <tr id="tr_${it.id}" onclick="showSystemParameter('${it.id}')" class="cursorPointer">
                    <td id="td_parameterName_${it.id}">${it.parameterName}</td>
                    <td>${it.parameterValue}</td>
                    <td>${it.description}</td>
                    <td id="td_dateCreated_${it.id}">${it.dateCreated}</td>
                    <td id="td_operate_${it.id}" width="100px">
                        <button class="btn btn-default btn-xs" type="button"
                                onclick="delSystemParameter('${it.id}')">删除</button>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <div class="row">
            <div class="col-md-3 pull-left paginatation-total">
                共有 <span id="domainTotalCount">${total}</span> 条记录
            </div>

            <div class="col-md-9">
                <div class="pagination pull-right">
                    <g:paginate controller="systemParameter" action="index" total="${total}"
                                params='[order: "desc", sort: "dateCreated"]'/>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.box -->

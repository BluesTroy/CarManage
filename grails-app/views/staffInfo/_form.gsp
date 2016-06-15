<%@ page import="carmanage.SystemRole" %>
<div class="container-fluid">
    <g:form name="staffInfoForm" url="[controller: 'staffInfo', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${staffInfo?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

    %{--<g:domainError model="${systemRole}"/>--}%
        <div class="row">

            <div class="form-group col-md-3">
                <label for="staffCode">工号</label>
                <g:if test="${action=='edit'}">
                    <span>${staffInfo?.staffCode}</span>
                </g:if>
                <g:else>
                <input id="staffCode" class="form-control" type="text" placeholder="必填项"
                       name="staffCode" value="${staffInfo?.staffCode}">
                </g:else>
            </div>
            <div class="form-group col-md-3">
                <label for="password">密码</label>
                <input id="password" class="form-control" type="password" placeholder="必填项"
                       name="password" value="${staffInfo?.password}">
            </div>
            <div class="form-group col-md-3">
                <label for="realName">姓名</label>
                <input id="realName" class="form-control" type="text" placeholder="必填项"
                       name="realName" value="${staffInfo?.realName}">
            </div>
            <div class="form-group col-md-3">
                <label for="telephone">手机</label>
                <input id="telephone" class="form-control" type="text" placeholder="必填项"
                       name="telephone" value="${staffInfo?.telephone}">
            </div>
            <div class="form-group col-md-3">
                <label for="phone">工作电话</label>
                <input id="phone" class="form-control" type="text" placeholder="必填项"
                       name="phone" value="${staffInfo?.phone}">
            </div>
            <div class="form-group col-md-3">
                <label for="email">工作邮箱</label>
                <input id="email" class="form-control" type="email" placeholder="123@163.com"
                       name="email" value="${staffInfo?.email}">
            </div>
            <div class="form-group col-md-3">
                <label for="systemRole">仓库</label>
                <g:select id="systemRole" name="systemRole" class="form-control" from="${carmanage.SystemRole.list()}" noSelection="['':'请选择...']" optionKey="id"
                          optionValue="roleName" />
            </div>
        </div>
    </g:form>
</div>
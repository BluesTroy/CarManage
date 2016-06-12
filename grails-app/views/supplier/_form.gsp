<div class="container-fluid">
    <g:form name="supplierForm" url="[controller: 'supplier', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${supplier?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

        <div class="row">

            <div class="form-group col-md-3">
                <label for="supplierCode">商户代码</label>
                <g:if test="${action == 'edit'}">
                    <span id="supplierCode">${supplier?.supplierCode}</span>
                </g:if>
                <g:else>
                    <input id="supplierCode" class="form-control" type="text" placeholder="必填项"
                           name="supplierCode" value="${supplier?.supplierCode}">
                </g:else>
            </div>

            <div class="form-group col-md-3">
                <label for="supplierName">商户名称</label>
                <input id="supplierName" class="form-control" type="text" placeholder="必填项"
                       name="supplierName" value="${supplier?.supplierName}">
            </div>

            <div class="form-group col-md-3">
                <label for="telephone">电话</label>
                <input id="telephone" class="form-control" type="text" placeholder="必填项"
                       name="telephone" value="${supplier?.telephone}">
            </div>

            <div class="form-group col-md-3">
                <label for="address">地址</label>
                <input id="address" class="form-control" type="text" placeholder="必填项"
                       name="address" value="${supplier?.address}">
            </div>

            <div class="form-group col-md-3">
                <label for="zipcode">邮编</label>
                <input id="zipcode" class="form-control" type="text" placeholder="必填项"
                       name="zipcode" value="${supplier?.zipcode}">
            </div>

            <div class="form-group col-md-3">
                <label for="description">商户描述</label>
                <input id="description" class="form-control" type="text" placeholder="必填项"
                       name="description" value="${supplier?.description}">
            </div>

            <div class="form-group col-md-3">
                <label for="licenceNumber">营业执照号</label>
                <input id="licenceNumber" class="form-control" type="text" placeholder="必填项"
                       name="licenceNumber" value="${supplier?.licenceNumber}">
            </div>

            <div class="form-group col-md-3">
                <label for="contactsName">联系人姓名</label>
                <input id="contactsName" class="form-control" type="text" placeholder="必填项"
                       name="contactsName" value="${supplier?.contactsName}">
            </div>

            <div class="form-group col-md-3">
                <label for="contactsTelephone">联系人姓名</label>
                <input id="contactsTelephone" class="form-control" type="text" placeholder="必填项"
                       name="contactsTelephone" value="${supplier?.contactsTelephone}">
            </div>
            <div class="form-group col-md-3">
                <label for="contactsEmail">联系人姓名</label>
                <input id="contactsEmail" class="form-control" type="text" placeholder="必填项"
                       name="contactsEmail" value="${supplier?.contactsEmail}">
            </div>


        </div>
    </g:form>
</div>
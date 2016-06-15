package carmanage

import grails.converters.JSON

class PurchaseOrderController {

    static layout = "main"

    def purchaseOrderService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model:[purchaseOrderList:result.purchaseOrderList, total: result.total])
    }

    protected def search(params) {
        if (!params.max) params.max = 2
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = 'desc'
        if (!params.sort) params.sort = 'dateCreated'

        def searchClosure = {
            if (params.orderCode) {
                like('orderCode', "%${params.orderCode}%")
            }
        }

        def c = PurchaseOrder.createCriteria()
        def purchaseOrderList = c.list(params,searchClosure)
        [purchaseOrderList:purchaseOrderList, total: purchaseOrderList.totalCount]


    }

    def index() {
        search(params)
    }

    def create(){
        def purchaseOrder = new PurchaseOrder()
        render(template: "/${controllerName}/form",
                model:[purchaseOrder: purchaseOrder, action:actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [purchaseOrder: PurchaseOrder.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def purchaseOrder

        log.error(params)
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            purchaseOrder = PurchaseOrder.get(params.id)
            purchaseOrder.properties = params
        } else if (params.domainAction == 'create') {
            purchaseOrder = new PurchaseOrder(params)
            purchaseOrder.orderCode = new Date().getTime().toString()
        }
        if (!purchaseOrder.validate()) {
            haserror = true
            message.append(g.domainError([model:purchaseOrder]))
        } else {
            purchaseOrderService.save(purchaseOrder)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def delete() {
        def purchaseOrder = PurchaseOrder.get(params.id)
        purchaseOrder.delete(flush:true)
        render(contentType:'application/json'){
            def result=['status':'success','message':'操作成功']
            render result as JSON
        }

    }
}

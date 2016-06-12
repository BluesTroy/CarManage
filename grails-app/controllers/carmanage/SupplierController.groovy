package carmanage

import grails.converters.JSON

class SupplierController {

    static layout = "main"

    def supplierService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model:[supplierList:result.supplierList, total: result.total])
    }

    protected def search(params) {
        if (!params.max) params.max = 2
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = 'desc'
        if (!params.sort) params.sort = 'dateCreated'

        def searchClosure = {
            if (params.supplierCode) {
                like('supplierCode', "%${params.supplierCode}%")
            }
            if (params.supplierName) {
                like('supplierName', "%${params.supplierName}%")
            }
        }

        def c = Supplier.createCriteria()
        def supplierList = c.list(params,searchClosure)
        [supplierList:supplierList, total: supplierList.totalCount]


    }

    def index() {
        search(params)
    }

    def create(){
        def supplier = new Supplier()
        render(template: "/${controllerName}/form",
                model:[supplier: supplier, action:actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [supplier: Supplier.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def supplier

        log.error(params)
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            supplier = Supplier.get(params.id)
            supplier.properties = params
        } else if (params.domainAction == 'create') {
            supplier = new Supplier(params)
        }
        if (!supplier.validate()) {
            haserror = true
            message.append(g.domainError([model:supplier]))
        } else {
            supplierService.save(supplier)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def delete() {
        def supplier = Supplier.get(params.id)
        supplier.delete(flush:true)
        render(contentType:'application/json'){
            def result=['status':'success','message':'操作成功']
            render result as JSON
        }

    }
}

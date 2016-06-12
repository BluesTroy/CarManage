package carmanage

import grails.converters.JSON

class CustomerController {

    static layout = "main"

    def customerService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model:[customerList:result.customerList, total: result.total])
    }

    protected def search(params) {
        if (!params.max) params.max = 2
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = 'desc'
        if (!params.sort) params.sort = 'dateCreated'

        def searchClosure = {
            if (params.name) {
                like('name', "%${params.name}%")
            }
            if (params.identityCard) {
                like('identityCard', "%${params.identityCard}%")
            }
        }

        def c = Customer.createCriteria()
        def customerList = c.list(params,searchClosure)
        [customerList:customerList, total: customerList.totalCount]


    }

    def index() {
        search(params)
    }

    def create(){
        def customer = new Customer()
        render(template: "/${controllerName}/form",
                model:[customer: customer, action:actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [customer: Customer.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def customer

        log.error(params)
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            customer = Customer.get(params.id)
            customer.properties = params
        } else if (params.domainAction == 'create') {
            customer = new Customer(params)
        }
        if (!customer.validate()) {
            haserror = true
            message.append(g.domainError([model:customer]))
        } else {
            customerService.save(customer)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def delete() {
        def customer = Customer.get(params.id)
        customer.delete(flush:true)
        render(contentType:'application/json'){
            def result=['status':'success','message':'操作成功']
            render result as JSON
        }

    }
}

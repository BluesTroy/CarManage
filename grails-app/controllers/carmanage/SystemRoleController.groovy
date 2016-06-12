package carmanage

import grails.converters.JSON

class SystemRoleController {

    static layout = "main"

    def systemRoleService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model:[systemRoleList:result.systemRoleList, total: result.total])
    }

    protected def search(params) {
        if (!params.max) params.max = 2
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = 'desc'
        if (!params.sort) params.sort = 'dateCreated'

        def searchClosure = {
            if (params.roleName) {
                like('roleName', "%${params.roleName}%")
            }
            if (params.description) {
                like('description', "%${params.description}%")
            }
        }

        def c = SystemRole.createCriteria()
        def systemRoleList = c.list(params,searchClosure)
        [systemRoleList:systemRoleList, total: systemRoleList.totalCount]


    }

    def index() {
        search(params)
    }

    def create(){
        def systemRole = new SystemRole()
        render(template: "/${controllerName}/form",
                model:[systemRole: systemRole, action:actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [systemRole: SystemRole.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def systemRole

        log.error(params)
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            systemRole = SystemRole.get(params.id)
            systemRole.properties = params
        } else if (params.domainAction == 'create') {
            systemRole = new SystemRole(params)
        }
        if (!systemRole.validate()) {
            haserror = true
            message.append(g.domainError([model:systemRole]))
        } else {
            systemRoleService.save(systemRole)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def delete() {
        def systemRole = SystemRole.get(params.id)
        systemRole.delete(flush:true)
        render(contentType:'application/json'){
            def result=['status':'success','message':'操作成功']
            render result as JSON
        }

    }
}

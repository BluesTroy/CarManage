package carmanage

import grails.converters.JSON

class CarInfoController {

    static layout = "main"

    def carInfoService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model:[carInfoList:result.carInfoList, total: result.total])
    }

    protected def search(params) {
        if (!params.max) params.max = 2
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = 'desc'
        if (!params.sort) params.sort = 'dateCreated'

        def searchClosure = {
            if (params.carCode) {
                like('carCode', "%${params.carCode}%")
            }
            if (params.carBrand) {
                like('carBrand', "%${params.carBrand}%")
            }
        }

        def c = CarInfo.createCriteria()
        def carInfoList = c.list(params,searchClosure)
        [carInfoList:carInfoList, total: carInfoList.totalCount]


    }

    def index() {
        log.debug("test..........")
        search(params)
    }

    def create(){
        def carInfo = new CarInfo()
        render(template: "/${controllerName}/form",
                model:[carInfo: carInfo, action:actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [carInfo: CarInfo.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def carInfo

        log.error(params)
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            carInfo = CarInfo.get(params.id)
            carInfo.properties = params
        } else if (params.domainAction == 'create') {
            carInfo = new CarInfo(params)
            carInfo.carCode = new Date().getTime().toString()
        }
        if (!carInfo.validate()) {
            haserror = true
            message.append(g.domainError([model:carInfo]))
        } else {
            carInfoService.save(carInfo)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def delete() {
        def carInfo = CarInfo.get(params.id)
        carInfo.delete(flush:true)
        render(contentType:'application/json'){
            def result=['status':'success','message':'操作成功']
            render result as JSON
        }

    }
}

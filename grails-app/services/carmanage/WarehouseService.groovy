package carmanage

import grails.transaction.Transactional

@Transactional
class WarehouseService {

    def save(warehouse) {
        if(!warehouse.validate()){
//            throw new ValidationException("保存失败", warehouse.errors)
        }else {
            warehouse.save()
        }
    }
}

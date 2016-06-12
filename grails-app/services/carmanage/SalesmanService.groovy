package carmanage

import grails.transaction.Transactional

@Transactional
class SalesmanService {

    def save(salesman) {
        if(!salesman.validate()){
//            throw new ValidationException("保存失败", salesman.errors)
        }else {
            salesman.save()
        }
    }
}

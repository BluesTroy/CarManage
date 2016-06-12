package carmanage

import grails.transaction.Transactional

@Transactional
class PurchaseOrderService {

    def save(purchase) {
        if(!purchase.validate()){
//            throw new ValidationException("保存失败", purchase.errors)
        }else {
            purchase.save()
        }
    }
}

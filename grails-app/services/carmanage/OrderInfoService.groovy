package carmanage

import grails.transaction.Transactional

@Transactional
class OrderInfoService {

    def save(orderInfo) {
        if(!orderInfo.validate()){
//            throw new ValidationException("保存失败", orderInfo.errors)
        }else {
            orderInfo.save()
        }
    }

    def saveOrderDetail(orderDetail){
        if(!orderDetail.validate()){
//            throw new ValidationException("保存失败", orderDetail.errors)
        }else {
            orderDetail.save()
        }
    }

}

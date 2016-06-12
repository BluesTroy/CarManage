package carmanage

import grails.transaction.Transactional

@Transactional
class CustomerService {

    def save(customer) {
        if(!customer.validate()){
//            throw new ValidationException("保存失败", customer.errors)
        }else {
            customer.save()
        }
    }
}

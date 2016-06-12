package carmanage

class StatusToStringTagLib {
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]


    def sexToString={attrs,body->
        out<<g.message(code:"salesman.sex.${attrs.key}")
    }

    def customerSexToString={attrs,body->
        out<<g.message(code:"customer.sex.${attrs.key}")
    }

    def memberToString={attrs,body->
        out<<g.message(code:"customer.isMember.${attrs.key}")
    }

    def statusToString={attrs,body->
        out<<g.message(code:"orderInfo.status.${attrs.key}")
    }

    def storageStatusToString={attrs,body->
        out<<g.message(code:"purchaseOrder.storageStatus.${attrs.key}")
    }



}

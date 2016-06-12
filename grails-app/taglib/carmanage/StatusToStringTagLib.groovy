package carmanage

class StatusToStringTagLib {
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]


    def sexToString={attrs,body->
        out<<g.message(code:"salesman.sex.${attrs.key}")
    }




}

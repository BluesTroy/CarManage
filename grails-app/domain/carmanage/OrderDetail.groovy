package carmanage

class OrderDetail {

    String id
    Date dateCreated
    Date lastUpdate
    String createUser
    String updateUser

    Integer number
    Double singlePrice
    Double totalPrice
    CarInfo carInfo
    String memo

    static belongsTo = [orderInfo:OrderInfo]

    static constraints = {
        number nullable: false
        singlePrice nullable: false
        totalPrice nullable: false
        memo nullable: false, maxSize: 100

    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}

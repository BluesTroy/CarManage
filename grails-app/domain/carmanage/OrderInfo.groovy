package carmanage

class OrderInfo {

    String id
    String dateCreated
    String lastUpdate
    String createUser
    String updateUser

    String orderCode
    Date orderTime
    Date outTime
    Integer saleNumber
    Double totalPrice
    short status
    Date payTime
    Date finishTime
    Salesman salesman
    Customer customer
    String memo

    static  hasMany = [orderDetails:OrderDetail]

    static constraints = {
        orderCode nullable: false, maxSize: 20
        orderTime nullable: true
        outTime nullable: true
        saleNumber nullable: false
        totalPrice nullable: false
        status nullable: false
        payTime nullable: true
        finishTime nullable: true
        memo nullable: true, maxSize: 100

    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}

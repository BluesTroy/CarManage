package carmanage

class WareHouse {
    String id
    String dateCreated
    String lastUpdate
    String createUser
    String updateUser

    String warehouseCode
    Integer maxInventory
    Integer nowInventory
    String memo

    static constraints = {
        warehouseCode nullable: false,maxSize: 20
        maxInventory nullable: false
        nowInventory nullable: false
        memo nullable: true, maxSize: 100
    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}

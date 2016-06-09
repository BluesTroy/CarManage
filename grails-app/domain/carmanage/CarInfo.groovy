package carmanage

class CarInfo {

    String id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String carCode
    String carBrand
    String carType
    String carColor
    String fuelConsumption
    Double price
    Integer inventory
    String memo

    static belongsTo = [warehouse:WareHouse]


    static constraints = {
        carCode nullable: false, maxSize: 20
        carBrand nullable: false, maxSize: 20
        carType nullable: false, maxSize: 50
        carColor nullable: false, maxSize: 10
        fuelConsumption nullable: false, maxSize: 20
        price nullable: false, scale: 2
        inventory nullable: false
        memo nullable: true, maxSize: 100

    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}

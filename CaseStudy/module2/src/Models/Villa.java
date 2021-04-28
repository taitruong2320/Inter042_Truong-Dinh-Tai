package Models;

public class Villa extends Services {
    private String roomStandard;
    private String convenientDescription;
    private double areaPool;
    private int numberOfFloors;

    public Villa() {
    }

    public Villa(String id, String serviceName, double areaUsed, double rentalCosts, int maxNumberOfPeople, String rentType, String roomStandard, String convenientDescription, double areaPool, int numberOfFloors) {
        super(id, serviceName, areaUsed, rentalCosts, maxNumberOfPeople, rentType);
        this.roomStandard = roomStandard;
        this.convenientDescription = convenientDescription;
        this.areaPool = areaPool;
        this.numberOfFloors = numberOfFloors;
    }

    public String getRoomStandard() {
        return roomStandard;
    }

    public void setRoomStandard(String roomStandard) {
        this.roomStandard = roomStandard;
    }

    public String getConvenientDescription() {
        return convenientDescription;
    }

    public void setConvenientDescription(String convenientDescription) {
        this.convenientDescription = convenientDescription;
    }

    public double getAreaPool() {
        return areaPool;
    }

    public void setAreaPool(double areaPool) {
        this.areaPool = areaPool;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    @Override
    public void showInfor() {
        System.out.println("1. Id Service: " + super.getId() +
                "\n\t2. Name Service: " + super.getServiceName() +
                "\n\t3. areaUsed: " + super.getAreaUsed() +
                "\n\t4. rentalCost: " + super.getRentalCosts() +
                "\n\t5. maxNumberOfCustomer: " + super.getMaxNumberOfPeople() +
                "\n\t6. typeRent: " + super.getRentType() +
                "\n\t7. roomStandard: " + this.getRoomStandard() +
                "\n\t8.convenient: " + this.getConvenientDescription() +
                "\n\t9. poolArea: " + this.getAreaPool() +
                "\n\t10. numberOfFloor: " + this.getNumberOfFloors());
    }
}

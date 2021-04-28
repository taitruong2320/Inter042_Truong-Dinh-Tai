package Commons;



public class Menu {
    public static void displayMenuMain() {
        System.out.println("--------FURAMA MANAGER SYSTEM-------");
        System.out.println("1. Add New Services"
                + "\n2.Show Services"
                + "\n3.Add New Customer"
                + "\n4.Show Information of Customer"
                + "\n5.Add New Booking"
                + "\n6.Show Information of Employee"
                + "\n7.Booking Movie Ticket 4D"
                + "\n8.Find Employee"
                + "\n9.Exit");
        System.out.println("--- Please select one function below: ");
    }
    public static void displayMenuAddNewService(){
        System.out.println("-----------Add New Service Menu----------");
        System.out.println("1.Add New Villa"
                +"\n2.Add New House"
                +"\n3.Add New Room"
                +"\n4.Back To Menu"
                +"\n5.Exit");
        System.out.println("--------Select one function below: ");
    }
    public static void  displayMenuBackToMain(){
        System.out.println("-----Enter to continue----------");
        ScannerUtils.scanner.nextLine();
    }
    public static void displayMenuShowService(){
        System.out.println("------------ Show Service Menu---------");
        System.out.println("1.Show All Villa"
                + "\n2.Show All House"
                + "\n3.Show All Room"
                + "\n4.Show All Name Villa Not Duplicate"
                + "\n5.Show All Name House Not Duplicate"
                + "\n6.Show All Name Name Not Duplicate"
                + "\n7.Back to menu"
                + "\n8.Exit");
        System.out.println("--------Select one function below: ");
    }
}

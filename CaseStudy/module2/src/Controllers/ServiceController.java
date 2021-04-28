package Controllers;

import java.io.*;
import java.util.ArrayList;
import java.util.List;


import Models.House;
import Models.Room;
import Models.Services;
import Models.Villa;





import static Controllers.MainController.backMainMenu;
import static Controllers.MainController.processMain;

public class ServiceController {
 

    public static void addNewService(){
        displayMenuAddNewService();
        processMenuAddNewService();
    }

    public static void processMenuAddNewService(){
        switch (ScannerUtils.scanner.nextLine()){
            case "1":
                addNewVilla();
                break;
            case "2" :
//                addNewHouse();
                break;
            case "3":
//                addNewRoom();
                break;
            case "4":
                processMain();
                System.out.println("\n----------------------");
                break;
            case "5":
                System.exit(0);
                break;
            default:
                System.out.println("----Nhap sai hien thi lai menu");
                backMainMenu();
        }
    }

    public static void addNewVilla(){
        Villa villa = new Villa();

        villa.setRoomStandard(inputRoomStandard());
        villa.setConvenientDescription(inputConvenientDescription());
        villa.setAreaPool(inputAreaPool());
    }

    public static String inputRoomStandard(){
        System.out.println("Nhập tên: ");
        return ScannerUtils.scanner.nextLine();
    }
    public static String inputConvenientDescription(){
        System.out.println("Nhập tên: ");
        return ScannerUtils.scanner.nextLine();
    }
    public static Double inputAreaPool(){
        System.out.println("Nhập tên: ");
        return Double.valueOf(ScannerUtils.scanner.nextLine());
    }
}

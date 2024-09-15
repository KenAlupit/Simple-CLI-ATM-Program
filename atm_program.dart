// Importing dart:io file
import 'dart:io';
 
void main()
{
    int pin = 1234;
    int attempts = 0;
    int balance = 1000;

    while(attempts < 3){
      // Asking for favourite number
      print("Enter your pin number:");
  
      // Scanning number
      int? pinInput = int.parse(stdin.readLineSync()!);
      // Here ? and ! are for null safety

      if (pinInput != pin){
        print("Pin invalid please try again.");
        attempts++;
      }else{
        print('Balance Inquiry - [1] \n'
        'Withdraw Cash - [2]\n'
        'Deposit Money - [3]'
        'Transfer Money - [4]\n'
        'Pay Bills - [5]\n'
        'Change Pin - [6]\n'
        );
        print("Select an option:");

        int? choice = int.parse(stdin.readLineSync()!);
        switch (choice){
          case 1:
          print(" Your balance is ${balance}");
          break;
          case 2:
          print("Enter amount to withdraw:");
          int? amountWithdraw = int.parse(stdin.readLineSync()!);
          if (amountWithdraw > balance){
            print("Invalid amount. Try again");
          }else{
            balance -= amountWithdraw;
            print("Your new balance is ${balance}");
          }
          case 3:
          print("Enter amount to deposit:");
         
          int? amountDeposit = int.parse(stdin.readLineSync()!);
            balance += amountDeposit;
            print("You deposited ${amountDeposit}");
            print("Your new balance is ${balance}");
          
          case 4:
          print("Enter name of account holder:");
           String? accntName = stdin.readLineSync();
          print("Enter amount to transfer:");
         
          int? amountTransfer = int.parse(stdin.readLineSync()!);
          if (amountTransfer > balance){
            print("Invalid amount. Try again");
          }else{
            balance -= amountTransfer;
            print("You transferred ${amountTransfer} to ${accntName}");
            print("Your new balance is ${balance}");
          }
          case 5:
            print("Enter name of biller:");
           String? billerName = stdin.readLineSync();
          print("Enter amount to pay:");
         
          int? amountBills = int.parse(stdin.readLineSync()!);
          if (amountBills > balance){
            print("Invalid amount. Try again");
          }else{
            balance -= amountBills;
            print("You have successfully paid ${amountBills} to ${billerName}");
            print("Your new balance is ${balance}");
          }
          case 6:
            print("Enter new pin: ");
            int? newPin = int.parse(stdin.readLineSync()!);
            
            if (newPin == pin){
              print("Your new pin cannot be the same as your old pin");
            } else { 
              pin = newPin;
            }

        }
      }
      
    }
}
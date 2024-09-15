// Importing dart:io file
import 'dart:io';
 
void main()
{
    const int maxAttempts = 3;
    int? pin = 1234;
    int attempts = 0;
    int balance = 1000;
    bool isLoginValid = false;

    while(attempts < maxAttempts){
      print("Enter your pin number:");
  
      int? pinInput = int.tryParse(stdin.readLineSync()!);

      if (pinInput != pin){
        attempts++;
        if (attempts == maxAttempts){
          print("Too many failed login attempts.");
        }else{
          print("Pin invalid please try again.");
        }
      }
      else{
        attempts = 0;
        isLoginValid = true;
        break;
        }
      }

      while(isLoginValid){
        print('Balance Inquiry - [1] \n'
        'Withdraw Cash - [2]\n'
        'Deposit Money - [3]\n'
        'Transfer Money - [4]\n'
        'Pay Bills - [5]\n'
        'Change Pin - [6]\n'
        'Exit - [7]'
        );
        
        print("Select an option:");
        int? choice = int.tryParse(stdin.readLineSync()!);

        if (choice == null) {
          print("Invalid selection, please try again.");
          continue;
        }

        switch (choice){
          case 1:
            print(" Your balance is ${balance}");
            break;
          case 2:
            print("Enter amount to withdraw:");
            int? amountWithdraw = int.tryParse(stdin.readLineSync()!);

            if (amountWithdraw == null || amountWithdraw <= 0) {
              print("Invalid amount. Try again.");
            } else if (amountWithdraw > balance) {
              print("Insufficient balance.");
            } else {
              balance -= amountWithdraw;
              print("Your new balance is \$${balance}");
            }
            break;
          case 3:
            print("Enter amount to deposit:");
            int? amountDeposit = int.tryParse(stdin.readLineSync()!);

            if (amountDeposit == null || amountDeposit <= 0) {
              print("Invalid amount. Try again.");
            } else if (amountDeposit > balance) {
              balance += amountDeposit;
              print("You deposited ${amountDeposit}");
              print("Your new balance is \$${balance}");
            }
            break;
          case 4:
            print("Enter name of account holder:");
            String? accntName = stdin.readLineSync();

            print("Enter account number:");
            String? accntNumber = stdin.readLineSync();

            print("Enter amount to transfer:");
            int? amountTransfer = int.tryParse(stdin.readLineSync()!);
            
            if (amountTransfer == null || amountTransfer <= 0 || amountTransfer > balance){
              print("Invalid amount. Try again");
            }else{
              balance -= amountTransfer;
              print("You have successfully transferred ${amountTransfer} to ${accntName}");
              print("Your new balance is \$${balance}");
            }
            break;
          case 5:
            print("Enter name of biller:");
            String? billerName = stdin.readLineSync();

            print("Enter account number:");
            String? accntNumber = stdin.readLineSync();

            print("Enter amount to pay:");
            int? amountBills = int.tryParse(stdin.readLineSync()!);


            if (amountBills == null || amountBills <= 0 || amountBills > balance){
              print("Invalid amount. Try again");
            }else{
              balance -= amountBills;
              print("You have successfully paid \$${amountBills} to ${billerName}");
              print("Your new balance is \$${balance}");
            }
            break;
          case 6:
            print("Enter new pin:");
            int? newPin = int.tryParse(stdin.readLineSync()!);

            if (newPin == null || newPin == pin) {
              print("Your new pin cannot be the same as your old pin or invalid.");
            } else {
              print("Pin changed successfully.");
              pin = newPin;
            }
            break;
          case 7:
            isLoginValid = false;
            print("Exiting...");
            break;
          default:
            print("Invalid option, please try again.");
      }
    }
}
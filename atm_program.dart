// Importing dart:io file
import 'dart:io';
 
void main()
{
    int pin = 1234;
    int attempts = 0;
    int balance = 1000;
    bool isLoginValid = false;

    while(attempts < 3){
      print("Enter your pin number:");
  
      int? pinInput = int.parse(stdin.readLineSync()!);

      if (pinInput != pin){
        attempts++;
        if (attempts == 3){
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
            break;
          case 3:
            print("Enter amount to deposit:");
            int? amountDeposit = int.parse(stdin.readLineSync()!);
            balance += amountDeposit;
            print("You deposited ${amountDeposit}");
            print("Your new balance is ${balance}");
            break;
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
            break;
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
            break;
          case 6:
            print("Enter new pin: ");
            int? newPin = int.parse(stdin.readLineSync()!);
            
            if (newPin == pin){
              print("Your new pin cannot be the same as your old pin");
            } else { 
              pin = newPin;
            }
            break;
          case 7:
            isLoginValid = false;
            break;
      }
    }
}
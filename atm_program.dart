// Importing dart:io file
import 'dart:io';

void main() {
  const int maxAttempts = 3; // Maximum number of login attempts

  int? pin = 1234; // Default PIN (used for login validation)
  int attempts = 0; // Counter for login attempts
  int balance = 1000; // Initial account balance
  bool isLoginValid = false; // Flag to check if login is valid

  // while loop for entering the pin
  while (attempts < maxAttempts) {
    print("Enter your pin number:");

    int? pinInput = int.tryParse(stdin.readLineSync()!);

    // Check if the entered PIN is incorrect
    if (pinInput != pin) {
      attempts++;
      // reached max attempt
      if (attempts == maxAttempts) {
        print("Too many failed login attempts.");
      } else {
        print("Pin invalid please try again.");
      }
    }
    // if pin input is correct, reset number of attempts and set bool variable "isLoginValid" to true
    else {
      attempts = 0;
      isLoginValid = true;
      break;
    }
  }

  // while loop to display the main features of the atm
  while (isLoginValid) {
    print('Balance Inquiry - [1] \n'
        'Withdraw Cash - [2]\n'
        'Deposit Money - [3]\n'
        'Transfer Money - [4]\n'
        'Pay Bills - [5]\n'
        'Change Pin - [6]\n'
        'Exit - [7]');

    print("Select an option:");
    int? choice = int.tryParse(stdin.readLineSync()!);

    // validation for when the user enters a wrong input
    if (choice == null) {
      print("Invalid selection, please try again.");
      continue;
    }

    // switch case for each feature
    switch (choice) {
      case 1:
        balanceInquiry(balance);
        break;
      case 2:
        balance = withdrawCash(balance);
        break;
      case 3:
        balance = depositMoney(balance);
        break;
      case 4:
        balance = transferMoney(balance);
        break;
      case 5:
        balance = payBills(balance);
        break;
      case 6:
        pin = changePin(pin);
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

// Function to display balance inquiry
void balanceInquiry(balance) {
  print("Your balance is \$${balance}");
}

// Function to withdraw cash and update the balance
int withdrawCash(balance) {
  print("Enter amount to withdraw:");
  int? amountWithdraw = int.tryParse(stdin.readLineSync()!);

  // validation for wrong type of input
  if (amountWithdraw == null || amountWithdraw <= 0) {
    print("Invalid amount. Try again.");
  } // validation for when the user has insufficient balance
  else if (amountWithdraw > balance) {
    print("Insufficient balance.");
  } else {
    balance -= amountWithdraw;
    print("Your new balance is \$${balance}");
  }

  return balance;
}

// Function to deposit money and update the balance
int depositMoney(balance) {
  print("Enter amount to deposit:");
  int? amountDeposit = int.tryParse(stdin.readLineSync()!);

  // validation for wrong type of input
  if (amountDeposit == null || amountDeposit <= 0) {
    print("Invalid amount. Try again.");
  } else{
    balance += amountDeposit;
    print("You deposited ${amountDeposit}");
    print("Your new balance is \$${balance}");
  }
  return balance;
}

// Function to transfer money to another account and update the balance
int transferMoney(balance) {
  print("Enter name of account holder:");
  String? accntName = stdin.readLineSync();

  print("Enter account number:");
  String? accntNumber = stdin.readLineSync();

  print("Enter amount to transfer:");
  int? amountTransfer = int.tryParse(stdin.readLineSync()!);

  // validation for wrong input
  if (amountTransfer == null ||
      amountTransfer <= 0 ||
      amountTransfer > balance) {
    print("Invalid amount. Try again");
  } else {
    balance -= amountTransfer;
    print(
        "You have successfully transferred ${amountTransfer} to ${accntName} with an account number ${accntNumber}");
    print("Your new balance is \$${balance}");
  }
  return balance;
}

// Function to pay bills and update the balance
int payBills(balance) {
  print("Enter name of biller:");
  String? billerName = stdin.readLineSync();

  print("Enter account number:");
  String? accntNumber = stdin.readLineSync();

  print("Enter amount to pay:");
  int? amountBills = int.tryParse(stdin.readLineSync()!);

  // validation for wrong input
  if (amountBills == null || amountBills <= 0 || amountBills > balance) {
    print("Invalid amount. Try again");
  } else {
    balance -= amountBills;
    print(
        "You have successfully paid \$${amountBills} to ${billerName} with an account number ${accntNumber}");
    print("Your new balance is \$${balance}");
  }

  return balance;
}

// Function to change the PIN
int changePin(pin) {
  print("Enter new pin:");
  int? newPin = int.tryParse(stdin.readLineSync()!);

  // validation for wrong input
  if (newPin == null || newPin == pin) {
    print("Your new pin cannot be the same as your old pin or invalid.");
  } else {
    print("Pin changed successfully.");
    pin = newPin;
  }
  return pin;
}

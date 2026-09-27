// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "All Animal ( ${count} )";

  static String m1(count) => "Categories ( ${count} )";

  static String m2(time) => "Resend Code In ${time}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addNewAnimal": MessageLookupByLibrary.simpleMessage("Add New Animal"),
    "addNewCategory": MessageLookupByLibrary.simpleMessage("Add New Category"),
    "animal": MessageLookupByLibrary.simpleMessage("Animal"),
    "animalDeleted": MessageLookupByLibrary.simpleMessage(
      "Animal deleted successfully",
    ),
    "animalDescription": MessageLookupByLibrary.simpleMessage(
      "Animal Description",
    ),
    "animalImageRequired": MessageLookupByLibrary.simpleMessage(
      "Animal image is required",
    ),
    "animalName": MessageLookupByLibrary.simpleMessage("Animal Name"),
    "animalNameRequired": MessageLookupByLibrary.simpleMessage(
      "Animal name is required",
    ),
    "animalPrice": MessageLookupByLibrary.simpleMessage("Animal Price"),
    "animalPriceNumber": MessageLookupByLibrary.simpleMessage(
      "Animal price must be a number",
    ),
    "animalPriceRequired": MessageLookupByLibrary.simpleMessage(
      "Animal price is required",
    ),
    "animalsCount": m0,
    "animooo": MessageLookupByLibrary.simpleMessage("ANIMOOO"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Animoo"),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Camera permission is required to take a photo",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "categoriesCount": m1,
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "categoryDeleted": MessageLookupByLibrary.simpleMessage(
      "Category deleted successfully",
    ),
    "categoryDescription": MessageLookupByLibrary.simpleMessage(
      "Category Description",
    ),
    "categoryImageRequired": MessageLookupByLibrary.simpleMessage(
      "Category image is required",
    ),
    "categoryName": MessageLookupByLibrary.simpleMessage("Category Name"),
    "categoryNameRequired": MessageLookupByLibrary.simpleMessage(
      "Category name is required",
    ),
    "categoryNotFound": MessageLookupByLibrary.simpleMessage(
      "Category not found",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "createAnimalFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to create animal. Please try again.",
    ),
    "createCategoryFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to create category. Please try again.",
    ),
    "createNewCategory": MessageLookupByLibrary.simpleMessage(
      "Create New Category",
    ),
    "createNewPassword": MessageLookupByLibrary.simpleMessage(
      "Create New Password",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteAnimal": MessageLookupByLibrary.simpleMessage("Delete Animal"),
    "deleteAnimalFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to delete animal. Please try again.",
    ),
    "deleteAnimalMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this animal?",
    ),
    "deleteCategory": MessageLookupByLibrary.simpleMessage("Delete Category"),
    "deleteCategoryFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to delete category. Please try again.",
    ),
    "deleteCategoryMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this category?",
    ),
    "descriptionRequired": MessageLookupByLibrary.simpleMessage(
      "Description is required",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Email is required"),
    "emptyResponse": MessageLookupByLibrary.simpleMessage(
      "Empty response from server",
    ),
    "enterAnimalName": MessageLookupByLibrary.simpleMessage(
      "Enter your Animal Name",
    ),
    "enterAnimalPrice": MessageLookupByLibrary.simpleMessage(
      "Enter your Animal Price",
    ),
    "enterCategoryName": MessageLookupByLibrary.simpleMessage(
      "Enter your Category Name",
    ),
    "enterDescription": MessageLookupByLibrary.simpleMessage(
      "Enter your Description",
    ),
    "enterEmail": MessageLookupByLibrary.simpleMessage(
      "Enter your email address",
    ),
    "enterFirstName": MessageLookupByLibrary.simpleMessage(
      "Enter your First Name",
    ),
    "enterLastName": MessageLookupByLibrary.simpleMessage(
      "Enter your Last Name",
    ),
    "enterPhone": MessageLookupByLibrary.simpleMessage("Enter your Phone"),
    "failedToLoadAnimals": MessageLookupByLibrary.simpleMessage(
      "Failed to load animals. Please try again.",
    ),
    "failedToLoadCategories": MessageLookupByLibrary.simpleMessage(
      "Failed to load categories. Please try again.",
    ),
    "failedToPickImage": MessageLookupByLibrary.simpleMessage(
      "Failed to pick image. Please try again",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
    "firstNameRequired": MessageLookupByLibrary.simpleMessage(
      "First name is required",
    ),
    "forgetPassword": MessageLookupByLibrary.simpleMessage(
      "Forget Password....?",
    ),
    "forgetPasswordSubtitle": MessageLookupByLibrary.simpleMessage(
      "Please enter the email address associated with your account, and we\'ll send you OTP to reset your password.",
    ),
    "forgetPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Forget Your Password ?",
    ),
    "haveAccount": MessageLookupByLibrary.simpleMessage(
      "Have an account already?",
    ),
    "helloAnimooo": MessageLookupByLibrary.simpleMessage("Hello in ANIMOOO"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email",
    ),
    "languageName": MessageLookupByLibrary.simpleMessage("English"),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
    "lastNameRequired": MessageLookupByLibrary.simpleMessage(
      "Last name is required",
    ),
    "logIn": MessageLookupByLibrary.simpleMessage("Log In"),
    "logInLink": MessageLookupByLibrary.simpleMessage("Log in"),
    "loginFailed": MessageLookupByLibrary.simpleMessage(
      "Login failed. Please try again.",
    ),
    "me": MessageLookupByLibrary.simpleMessage("Me"),
    "minCharacters": MessageLookupByLibrary.simpleMessage(
      "Minimum characters 12.",
    ),
    "navAnimal": MessageLookupByLibrary.simpleMessage("animal"),
    "navCategory": MessageLookupByLibrary.simpleMessage("category"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "noAccount": MessageLookupByLibrary.simpleMessage("Don’t have an account?"),
    "noAnimalFound": MessageLookupByLibrary.simpleMessage("No Animal Found!"),
    "noAnimalMessage": MessageLookupByLibrary.simpleMessage(
      "There is no Animal to display.",
    ),
    "noAnimalSelectedForDelete": MessageLookupByLibrary.simpleMessage(
      "No animal selected for delete",
    ),
    "noAnimalSelectedForUpdate": MessageLookupByLibrary.simpleMessage(
      "No animal selected for update",
    ),
    "noCategoryFound": MessageLookupByLibrary.simpleMessage(
      "No Category Found!",
    ),
    "noCategoryMessage": MessageLookupByLibrary.simpleMessage(
      "There is no Category to display.",
    ),
    "noCategorySelectedForDelete": MessageLookupByLibrary.simpleMessage(
      "No category selected for delete",
    ),
    "noCategorySelectedForUpdate": MessageLookupByLibrary.simpleMessage(
      "No category selected for update",
    ),
    "noInternetMessage": MessageLookupByLibrary.simpleMessage(
      "Unable to connect to the internet. Please check your connection and try again.",
    ),
    "noInternetTitle": MessageLookupByLibrary.simpleMessage(
      "No Internet Connection Found!",
    ),
    "oneLowercase": MessageLookupByLibrary.simpleMessage(
      "One lowercase character.",
    ),
    "oneNumber": MessageLookupByLibrary.simpleMessage("One number."),
    "oneSpecial": MessageLookupByLibrary.simpleMessage(
      "One special character.",
    ),
    "oneUppercase": MessageLookupByLibrary.simpleMessage(
      "One uppercase character.",
    ),
    "otpSubtitle": MessageLookupByLibrary.simpleMessage(
      "Please enter the 4 digit code sent your phone number",
    ),
    "otpTitle": MessageLookupByLibrary.simpleMessage("OTP Verification"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordHint": MessageLookupByLibrary.simpleMessage(
      "Please add all necessary characters to create safe password.",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordRules": MessageLookupByLibrary.simpleMessage(
      "Password does not meet the required rules",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "phoneRequired": MessageLookupByLibrary.simpleMessage("Phone is required"),
    "photoGallery": MessageLookupByLibrary.simpleMessage("Photo Gallery"),
    "photoLibraryPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Photo library permission is required to select an image",
    ),
    "profileImageRequired": MessageLookupByLibrary.simpleMessage(
      "Profile image is required",
    ),
    "publicLabel": MessageLookupByLibrary.simpleMessage("Public"),
    "refreshTokenFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to refresh access token. Please try again.",
    ),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Remember Me"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "resendCodeIn": m2,
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "seeAll": MessageLookupByLibrary.simpleMessage("See All"),
    "selectFile": MessageLookupByLibrary.simpleMessage("Select file"),
    "selectYourImage": MessageLookupByLibrary.simpleMessage(
      "Select Your Image",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Send  Code"),
    "sendResetFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to send reset email. Please try again.",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signUpNow": MessageLookupByLibrary.simpleMessage("Sign up now"),
    "signupFailed": MessageLookupByLibrary.simpleMessage(
      "Signup failed. Please try again.",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "updateAnimalFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to update animal. Please try again.",
    ),
    "updateCategoryFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to update category. Please try again.",
    ),
    "updatePasswordFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to update password. Please try again.",
    ),
    "uploadAnimalImage": MessageLookupByLibrary.simpleMessage(
      "Upload Image For Your Animal",
    ),
    "uploadCategoryImage": MessageLookupByLibrary.simpleMessage(
      "Upload Image For Your Cateogry",
    ),
    "uploadProfileImage": MessageLookupByLibrary.simpleMessage(
      "Upload Image For Your Profile",
    ),
    "verificationCodeRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter the full verification code",
    ),
    "verificationFailed": MessageLookupByLibrary.simpleMessage(
      "Verification failed. Please try again.",
    ),
  };
}

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Animoo`
  String get appTitle {
    return Intl.message('Animoo', name: 'appTitle', desc: '', args: []);
  }

  /// `English`
  String get languageName {
    return Intl.message('English', name: 'languageName', desc: '', args: []);
  }

  /// `Log In`
  String get logIn {
    return Intl.message('Log In', name: 'logIn', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email address`
  String get enterEmail {
    return Intl.message(
      'Enter your email address',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forget Password....?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password....?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message('Remember Me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Don’t have an account?`
  String get noAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now`
  String get signUpNow {
    return Intl.message('Sign up now', name: 'signUpNow', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Enter your First Name`
  String get enterFirstName {
    return Intl.message(
      'Enter your First Name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Enter your Last Name`
  String get enterLastName {
    return Intl.message(
      'Enter your Last Name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Enter your Phone`
  String get enterPhone {
    return Intl.message(
      'Enter your Phone',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please add all necessary characters to create safe password.`
  String get passwordHint {
    return Intl.message(
      'Please add all necessary characters to create safe password.',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Minimum characters 12.`
  String get minCharacters {
    return Intl.message(
      'Minimum characters 12.',
      name: 'minCharacters',
      desc: '',
      args: [],
    );
  }

  /// `One uppercase character.`
  String get oneUppercase {
    return Intl.message(
      'One uppercase character.',
      name: 'oneUppercase',
      desc: '',
      args: [],
    );
  }

  /// `One lowercase character.`
  String get oneLowercase {
    return Intl.message(
      'One lowercase character.',
      name: 'oneLowercase',
      desc: '',
      args: [],
    );
  }

  /// `One special character.`
  String get oneSpecial {
    return Intl.message(
      'One special character.',
      name: 'oneSpecial',
      desc: '',
      args: [],
    );
  }

  /// `One number.`
  String get oneNumber {
    return Intl.message('One number.', name: 'oneNumber', desc: '', args: []);
  }

  /// `Have an account already?`
  String get haveAccount {
    return Intl.message(
      'Have an account already?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logInLink {
    return Intl.message('Log in', name: 'logInLink', desc: '', args: []);
  }

  /// `Upload Image For Your Profile`
  String get uploadProfileImage {
    return Intl.message(
      'Upload Image For Your Profile',
      name: 'uploadProfileImage',
      desc: '',
      args: [],
    );
  }

  /// `Select file`
  String get selectFile {
    return Intl.message('Select file', name: 'selectFile', desc: '', args: []);
  }

  /// `Photo Gallery`
  String get photoGallery {
    return Intl.message(
      'Photo Gallery',
      name: 'photoGallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Forget Your Password ?`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forget Your Password ?',
      name: 'forgetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the email address associated with your account, and we'll send you OTP to reset your password.`
  String get forgetPasswordSubtitle {
    return Intl.message(
      'Please enter the email address associated with your account, and we\'ll send you OTP to reset your password.',
      name: 'forgetPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Send  Code`
  String get sendCode {
    return Intl.message('Send  Code', name: 'sendCode', desc: '', args: []);
  }

  /// `OTP Verification`
  String get otpTitle {
    return Intl.message(
      'OTP Verification',
      name: 'otpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 4 digit code sent your phone number`
  String get otpSubtitle {
    return Intl.message(
      'Please enter the 4 digit code sent your phone number',
      name: 'otpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Resend Code In {time}`
  String resendCodeIn(String time) {
    return Intl.message(
      'Resend Code In $time',
      name: 'resendCodeIn',
      desc: '',
      args: [time],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `ANIMOOO`
  String get animooo {
    return Intl.message('ANIMOOO', name: 'animooo', desc: '', args: []);
  }

  /// `Hello in ANIMOOO`
  String get helloAnimooo {
    return Intl.message(
      'Hello in ANIMOOO',
      name: 'helloAnimooo',
      desc: '',
      args: [],
    );
  }

  /// `Categories ( {count} )`
  String categoriesCount(int count) {
    return Intl.message(
      'Categories ( $count )',
      name: 'categoriesCount',
      desc: '',
      args: [count],
    );
  }

  /// `Add New Category`
  String get addNewCategory {
    return Intl.message(
      'Add New Category',
      name: 'addNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `No Category Found!`
  String get noCategoryFound {
    return Intl.message(
      'No Category Found!',
      name: 'noCategoryFound',
      desc: '',
      args: [],
    );
  }

  /// `There is no Category to display.`
  String get noCategoryMessage {
    return Intl.message(
      'There is no Category to display.',
      name: 'noCategoryMessage',
      desc: '',
      args: [],
    );
  }

  /// `All Animal ( {count} )`
  String animalsCount(int count) {
    return Intl.message(
      'All Animal ( $count )',
      name: 'animalsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Add New Animal`
  String get addNewAnimal {
    return Intl.message(
      'Add New Animal',
      name: 'addNewAnimal',
      desc: '',
      args: [],
    );
  }

  /// `No Animal Found!`
  String get noAnimalFound {
    return Intl.message(
      'No Animal Found!',
      name: 'noAnimalFound',
      desc: '',
      args: [],
    );
  }

  /// `There is no Animal to display.`
  String get noAnimalMessage {
    return Intl.message(
      'There is no Animal to display.',
      name: 'noAnimalMessage',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Animal Name`
  String get animalName {
    return Intl.message('Animal Name', name: 'animalName', desc: '', args: []);
  }

  /// `Enter your Animal Name`
  String get enterAnimalName {
    return Intl.message(
      'Enter your Animal Name',
      name: 'enterAnimalName',
      desc: '',
      args: [],
    );
  }

  /// `Animal Price`
  String get animalPrice {
    return Intl.message(
      'Animal Price',
      name: 'animalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Animal Price`
  String get enterAnimalPrice {
    return Intl.message(
      'Enter your Animal Price',
      name: 'enterAnimalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Category Name`
  String get categoryName {
    return Intl.message(
      'Category Name',
      name: 'categoryName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Category Name`
  String get enterCategoryName {
    return Intl.message(
      'Enter your Category Name',
      name: 'enterCategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Animal Description`
  String get animalDescription {
    return Intl.message(
      'Animal Description',
      name: 'animalDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Description`
  String get enterDescription {
    return Intl.message(
      'Enter your Description',
      name: 'enterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Delete Animal`
  String get deleteAnimal {
    return Intl.message(
      'Delete Animal',
      name: 'deleteAnimal',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this animal?`
  String get deleteAnimalMessage {
    return Intl.message(
      'Are you sure you want to delete this animal?',
      name: 'deleteAnimalMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Upload Image For Your Animal`
  String get uploadAnimalImage {
    return Intl.message(
      'Upload Image For Your Animal',
      name: 'uploadAnimalImage',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Image`
  String get selectYourImage {
    return Intl.message(
      'Select Your Image',
      name: 'selectYourImage',
      desc: '',
      args: [],
    );
  }

  /// `Category Description`
  String get categoryDescription {
    return Intl.message(
      'Category Description',
      name: 'categoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image For Your Cateogry`
  String get uploadCategoryImage {
    return Intl.message(
      'Upload Image For Your Cateogry',
      name: 'uploadCategoryImage',
      desc: '',
      args: [],
    );
  }

  /// `Create New Category`
  String get createNewCategory {
    return Intl.message(
      'Create New Category',
      name: 'createNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `Delete Category`
  String get deleteCategory {
    return Intl.message(
      'Delete Category',
      name: 'deleteCategory',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this category?`
  String get deleteCategoryMessage {
    return Intl.message(
      'Are you sure you want to delete this category?',
      name: 'deleteCategoryMessage',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get publicLabel {
    return Intl.message('Public', name: 'publicLabel', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Animal`
  String get animal {
    return Intl.message('Animal', name: 'animal', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `category`
  String get navCategory {
    return Intl.message('category', name: 'navCategory', desc: '', args: []);
  }

  /// `animal`
  String get navAnimal {
    return Intl.message('animal', name: 'navAnimal', desc: '', args: []);
  }

  /// `Me`
  String get me {
    return Intl.message('Me', name: 'me', desc: '', args: []);
  }

  /// `No Internet Connection Found!`
  String get noInternetTitle {
    return Intl.message(
      'No Internet Connection Found!',
      name: 'noInternetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unable to connect to the internet. Please check your connection and try again.`
  String get noInternetMessage {
    return Intl.message(
      'Unable to connect to the internet. Please check your connection and try again.',
      name: 'noInternetMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `First name is required`
  String get firstNameRequired {
    return Intl.message(
      'First name is required',
      name: 'firstNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Last name is required`
  String get lastNameRequired {
    return Intl.message(
      'Last name is required',
      name: 'lastNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Phone is required`
  String get phoneRequired {
    return Intl.message(
      'Phone is required',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password does not meet the required rules`
  String get passwordRules {
    return Intl.message(
      'Password does not meet the required rules',
      name: 'passwordRules',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Profile image is required`
  String get profileImageRequired {
    return Intl.message(
      'Profile image is required',
      name: 'profileImageRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the full verification code`
  String get verificationCodeRequired {
    return Intl.message(
      'Please enter the full verification code',
      name: 'verificationCodeRequired',
      desc: '',
      args: [],
    );
  }

  /// `Photo library permission is required to select an image`
  String get photoLibraryPermissionRequired {
    return Intl.message(
      'Photo library permission is required to select an image',
      name: 'photoLibraryPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Camera permission is required to take a photo`
  String get cameraPermissionRequired {
    return Intl.message(
      'Camera permission is required to take a photo',
      name: 'cameraPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Failed to pick image. Please try again`
  String get failedToPickImage {
    return Intl.message(
      'Failed to pick image. Please try again',
      name: 'failedToPickImage',
      desc: '',
      args: [],
    );
  }

  /// `Category name is required`
  String get categoryNameRequired {
    return Intl.message(
      'Category name is required',
      name: 'categoryNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Description is required`
  String get descriptionRequired {
    return Intl.message(
      'Description is required',
      name: 'descriptionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Category image is required`
  String get categoryImageRequired {
    return Intl.message(
      'Category image is required',
      name: 'categoryImageRequired',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load categories. Please try again.`
  String get failedToLoadCategories {
    return Intl.message(
      'Failed to load categories. Please try again.',
      name: 'failedToLoadCategories',
      desc: '',
      args: [],
    );
  }

  /// `No category selected for update`
  String get noCategorySelectedForUpdate {
    return Intl.message(
      'No category selected for update',
      name: 'noCategorySelectedForUpdate',
      desc: '',
      args: [],
    );
  }

  /// `No category selected for delete`
  String get noCategorySelectedForDelete {
    return Intl.message(
      'No category selected for delete',
      name: 'noCategorySelectedForDelete',
      desc: '',
      args: [],
    );
  }

  /// `Animal name is required`
  String get animalNameRequired {
    return Intl.message(
      'Animal name is required',
      name: 'animalNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Animal image is required`
  String get animalImageRequired {
    return Intl.message(
      'Animal image is required',
      name: 'animalImageRequired',
      desc: '',
      args: [],
    );
  }

  /// `Animal price is required`
  String get animalPriceRequired {
    return Intl.message(
      'Animal price is required',
      name: 'animalPriceRequired',
      desc: '',
      args: [],
    );
  }

  /// `Animal price must be a number`
  String get animalPriceNumber {
    return Intl.message(
      'Animal price must be a number',
      name: 'animalPriceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load animals. Please try again.`
  String get failedToLoadAnimals {
    return Intl.message(
      'Failed to load animals. Please try again.',
      name: 'failedToLoadAnimals',
      desc: '',
      args: [],
    );
  }

  /// `Category not found`
  String get categoryNotFound {
    return Intl.message(
      'Category not found',
      name: 'categoryNotFound',
      desc: '',
      args: [],
    );
  }

  /// `No animal selected for update`
  String get noAnimalSelectedForUpdate {
    return Intl.message(
      'No animal selected for update',
      name: 'noAnimalSelectedForUpdate',
      desc: '',
      args: [],
    );
  }

  /// `No animal selected for delete`
  String get noAnimalSelectedForDelete {
    return Intl.message(
      'No animal selected for delete',
      name: 'noAnimalSelectedForDelete',
      desc: '',
      args: [],
    );
  }

  /// `Empty response from server`
  String get emptyResponse {
    return Intl.message(
      'Empty response from server',
      name: 'emptyResponse',
      desc: '',
      args: [],
    );
  }

  /// `Signup failed. Please try again.`
  String get signupFailed {
    return Intl.message(
      'Signup failed. Please try again.',
      name: 'signupFailed',
      desc: '',
      args: [],
    );
  }

  /// `Verification failed. Please try again.`
  String get verificationFailed {
    return Intl.message(
      'Verification failed. Please try again.',
      name: 'verificationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send reset email. Please try again.`
  String get sendResetFailed {
    return Intl.message(
      'Failed to send reset email. Please try again.',
      name: 'sendResetFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update password. Please try again.`
  String get updatePasswordFailed {
    return Intl.message(
      'Failed to update password. Please try again.',
      name: 'updatePasswordFailed',
      desc: '',
      args: [],
    );
  }

  /// `Login failed. Please try again.`
  String get loginFailed {
    return Intl.message(
      'Login failed. Please try again.',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to refresh access token. Please try again.`
  String get refreshTokenFailed {
    return Intl.message(
      'Failed to refresh access token. Please try again.',
      name: 'refreshTokenFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to create category. Please try again.`
  String get createCategoryFailed {
    return Intl.message(
      'Failed to create category. Please try again.',
      name: 'createCategoryFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update category. Please try again.`
  String get updateCategoryFailed {
    return Intl.message(
      'Failed to update category. Please try again.',
      name: 'updateCategoryFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete category. Please try again.`
  String get deleteCategoryFailed {
    return Intl.message(
      'Failed to delete category. Please try again.',
      name: 'deleteCategoryFailed',
      desc: '',
      args: [],
    );
  }

  /// `Category deleted successfully`
  String get categoryDeleted {
    return Intl.message(
      'Category deleted successfully',
      name: 'categoryDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Failed to create animal. Please try again.`
  String get createAnimalFailed {
    return Intl.message(
      'Failed to create animal. Please try again.',
      name: 'createAnimalFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update animal. Please try again.`
  String get updateAnimalFailed {
    return Intl.message(
      'Failed to update animal. Please try again.',
      name: 'updateAnimalFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete animal. Please try again.`
  String get deleteAnimalFailed {
    return Intl.message(
      'Failed to delete animal. Please try again.',
      name: 'deleteAnimalFailed',
      desc: '',
      args: [],
    );
  }

  /// `Animal deleted successfully`
  String get animalDeleted {
    return Intl.message(
      'Animal deleted successfully',
      name: 'animalDeleted',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

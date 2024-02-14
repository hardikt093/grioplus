import '../../utils/base_constants/base_validators_strings.dart';

class Validators {
  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.firstNameRequired;
    }
    return null;
  }

  String? validateMonth(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.monthRequired;
    }
    return null;
  }

  String? validateYear(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.yearRequired;
    }
    return null;
  }

  String? validateCVC(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.cvcRequired;
    }
    return null;
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.userNameRequired;
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.addressRequired;
    }
    return null;
  }

  String? validateCountry(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.countryRequired;
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.cityRequired;
    }
    return null;
  }

  String? validateZip(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.codeRequired;
    } else if (value.length < 6) {
      return BaseValidatorsStrings.codeLength;
    } else {
      return null;
    }
  }

  String? validateEmailOrNumber(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.emailNumberRequired;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isNotEmpty) {
      // Check if the password is between 4 and 60 characters
      if (value.length >= 4 && value.length <= 60) {
        // Check if there is at least one uppercase character
        if (RegExp(r'[A-Z]').hasMatch(value)) {
          // Check if there is at least one lowercase character
          if (RegExp(r'[a-z]').hasMatch(value)) {
            // Check if there are no whitespace characters
            if (!RegExp(r'\s').hasMatch(value)) {
              return null;
            } else {
              return "";
            }
          } else {
            return BaseValidatorsStrings.whiteSpaceValidation;
          }
        } else {
          return BaseValidatorsStrings.uppercaseValidation;
        }
      } else {
        return BaseValidatorsStrings.lengthValidation;
      }
    } else {
      return BaseValidatorsStrings.passwordRequired;
    }
  }

  String? validateConfirmPassword(String oldValue, String newValue) {
    if (newValue.isEmpty || oldValue.isEmpty) {
      return BaseValidatorsStrings.passwordRequired;
    } else if (newValue != oldValue) {
      return BaseValidatorsStrings.notMatchPasswordRequired;
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.lastNameRequired;
    }
    return null;
  }

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return BaseValidatorsStrings.emailRequired;
    } else if (!regExp.hasMatch(value)) {
      return BaseValidatorsStrings.invalidEmail;
    } else {
      return null;
    }
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.mobileRequired;
    } else if (value.length != 10) {
      return BaseValidatorsStrings.mobileLengthValidation;
    } else {
      return null;
    }
  }

  String? validateReason(String value) {
    if (value.isEmpty) {
      return BaseValidatorsStrings.pleaseSelectValidReason;
    }
    return null;
  }
}

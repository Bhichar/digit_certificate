import 'package:digit_certification/models/gender_model/gender_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppUtils {
  static String babyFirstNameKey = 'babyFirstName';
  static String babygender = 'babygender';
  static String babyWeight = 'babyWeight';
  static String motherKey = 'mother';
  static String doctorNameKey = 'doctorName';
  static String hospitalNameKey = 'hospitalName';
  static String placeOfBirthKey = 'placeOfBirth';
  static String tenantIdKey = 'tenantId';

  static List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>
      validators = [
    Validators.required,
    Validators.minLength(2),
    Validators.maxLength(100),
  ];
  static List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>
      validatorsDrop = [
    Validators.required,
  ];

  static Map<String, String Function(Object)>? getValidationMessage(
      String name) {
    return {
      'required': (_) => '$name is required',
      'minLength': (_) => '$name must be minimum of 2 characters',
      'maxLength': (_) => '$name must be maximum of 100 characters',
    };
  }

  static List<GenderModel> genderList = [
    const GenderModel(id: 0, name: 'Male'),
    const GenderModel(id: 1, name: 'Male'),
    const GenderModel(id: 2, name: 'Male'),
  ];
  static String? getNameFromId(int id) {
    try {
      return genderList.firstWhere((gender) => gender.id == id).name;
    } catch (e) {
      // Handle the case where the id is not found
      return null;
    }
  }
}

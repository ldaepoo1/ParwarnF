import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plawarn/modules/auth/api/mobile_auth/send_verify/send_verify.dart';
import 'package:plawarn/modules/auth/page/login_mobile.dart';
import 'package:plawarn/modules/createprofile/widget/page/namepage/name_page.dart';
import 'package:plawarn/modules/searchjop/page/search_jop.dart';
import 'package:plawarn/page/home_page.dart';
import 'package:plawarn/provider/view/api/check_user.dart';
import 'package:plawarn/widget/model/dtos/token/token_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class Userview with ChangeNotifier {
//   Future<bool> saveUser(Useridview user) async {
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('userid', user.id.toString());
//     sp.setString('Fullname', user.fullName.toString());
//     sp.setString('Fname', user.firstName.toString());
//     sp.setString('Lname', user.lastName.toString());
//     notifyListeners();
//     return true;
//   }
// }

// Future<Useridview> getUser() async {
//   final SharedPreferences sp = await SharedPreferences.getInstance();
//   final String? userid = sp.getString('userid');
//   final String? fullname = sp.getString('Fullname');
//   final String? firstname = sp.getString('Fname');
//   final String? lastName = sp.getString('Lname');
//   final String? address = sp.getString('address');
//   return Useridview(
//     id: userid.toString(),
//     fullName: fullname.toString(),
//     firstName: firstname.toString(),
//     lastName: lastName.toString(),
//     avatar: '',
//     gender: '',
//     mobileNumber: '',
//   );
// }

// ทดสอบ ลองย้ายมาไว้ ในไฟล์นี้ดู ว่าจะได้ไม่ต้องเรียกใช้ไฟล์อื่น ยังไม่เสร็จ!
class Tokenview with ChangeNotifier {
  Future<bool> saveUser(GetTokendata token) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('type', token.type.toString());
    sp.setString('token', token.accessToken.toString());
    notifyListeners();
    return true;
  }
}

Future<bool> logout() async {
  final SharedPreferences Token = await SharedPreferences.getInstance();
  final SharedPreferences uid = await SharedPreferences.getInstance();
  uid.clear();
  Token.clear();
  // Token.remove;
  print(token);
  return true;
}

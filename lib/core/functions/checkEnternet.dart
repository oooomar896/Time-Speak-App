import 'dart:io';

checkEntrnet() async {
  try {
    //=============================================here not true internet
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    // ignore: unused_catch_clause
  } on SocketException catch (e) {
    return false;
  }
}

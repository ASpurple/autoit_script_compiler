import 'dart:convert';
import 'dart:io';

Future<void> _saveExetoString() async {
  final exeFile = File("./Aut2exe.exe");
  final stringFile = File("./lib/src/aut2exe.dart");
  if (!await exeFile.exists()) {
    throw Error.safeToString("file Aut2exe.exe is not exists");
  }
  final bytes = await exeFile.readAsBytes();
  var str = base64Encode(bytes);
  str = "const compiler = \"\"\"$str\"\"\";";
  await stringFile.writeAsString(str, flush: true);
}

void main() async {
  await _saveExetoString();
}

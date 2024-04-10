import 'package:autoit_script_compiler/autoit_script_compiler.dart' as autoit;

void main() async {
  await autoit.run("./example/script.au3"); // run autoit script
  // or
  await autoit.compile("./example/script.au3", target: "./script.exe"); // compile autoit script
}

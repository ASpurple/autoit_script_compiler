import "dart:convert";
import "dart:io";
import "package:autoit_script_compiler/src/aut2exe.dart";
import "package:path/path.dart" as path;

String _getCompilerPath() {
  final temp = Directory.systemTemp;
  final exeFilePath = path.join(temp.path, ".autoit_script_dart", "aut2exe.exe");
  return exeFilePath;
}

Future<void> _initCompiler() async {
  final exeFile = File(_getCompilerPath());
  if (!await exeFile.exists()) {
    await Directory(path.dirname(exeFile.path)).create(recursive: true);
    final bytes = base64Decode(compiler);
    await exeFile.writeAsBytes(bytes, flush: true);
  }
}

String _getName(String name) {
  final i = name.lastIndexOf(".");
  if (i < 1) return name;
  return name.substring(0, i);
}

// /in c:\myscript.au3 /out c:\myapp.exe /icon c:\myicon.ico /x64
Future<void> compile(String sourceFile, {String? target, String? icon}) async {
  final exe = _getCompilerPath();
  target = target ?? '${_getName(path.basename(sourceFile))}.exe';
  List<String> args = ["/in", sourceFile, "/out", target];
  if (icon != null) {
    args.add("/icon");
    args.add(icon);
  }
  try {
    await Process.run(exe, args);
  } catch (e) {
    await _initCompiler();
    await Process.run(exe, args);
  }
}

Future<void> run(String sourceFile) async {
  final exe = _getCompilerPath();
  final tempExeFile = path.join(path.dirname(exe), "temp_script.exe");
  await compile(sourceFile, target: tempExeFile);
  await Process.run(tempExeFile, []);
}

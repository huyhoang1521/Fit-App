import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

Map<String, dynamic> fileContent = new Map();

class JsonData {
  File jsonFile;
  Directory dir;
  bool fileExists = false;

  JsonData(String fileName) {
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        fileContent = json.decode(jsonFile.readAsStringSync());
      } else {
        print("file does not exist");
      }
    });
  }

  void createFile(Map<String, dynamic> model, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(model));
  }

  void writeToFile(Map<String, dynamic> model, String fileName) {
    print("Writing to file!");
    //Map<String, dynamic> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(model);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(model, fileName);
    }
    fileContent = json.decode(jsonFile.readAsStringSync());
    printFileContent();
  }

  bool getFileExists() {
    return fileExists;
  }

  Map<String, dynamic> getFileContent() {
    return fileContent;
  }

  void printFileContent() {
    print(fileContent);
  }
}

import "dart:io";
import "dart:math";
import "dart:convert";
import "dart:async";

void main() {
  stdout.write("Введите номер задания: (1-3) ");

  switch(int.parse(stdin.readLineSync()!)){
    case 1: taskOne(); break;
    case 2: taskTwo(); break;
    case 3: taskThree(); break;
  }
}

//===================================================Третье=Задание=============================================================
void taskThree() async{
  stdout.write("Хотите сгенерировать новые входные данные: (yes - 1 / no - any button) ");
  if ((stdin.readLineSync()) == '1'){
    generateMassive();
    print('Массив создан успешно..\n..Перезапустите программу');
  } else {
    var file = new File('nums.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
    List height = [];
    int res = 0;
    await for (String i in file){
      height = (i.split(' '));
    }
    height.removeLast();
    for (int i = 0; i < height.length; ++i){
      for (int k = 0; k < height.length; ++k){
        int a = int.parse(height[i]);
        int b = int.parse(height[k]);
        if ((a > b ? b : a) * (k - i) > res){
          res = (a > b ? b : a) * (k - i);
        }
      }
    }
    print("${height} \n$res");
  }
}
//==============================================================================================================================

//===================================================Второе=Задание=============================================================
void taskTwo() async{
  stdout.write("Хотите сгенерировать новые входные данные: (yes - 1 / no - any button) ");
  try{
    if ((stdin.readLineSync()) == '1'){
      generateMassive();
      print('Массив создан успешно..\n..Перезапустите программу');
    } else {
      List? numMassive;
      List newMassive = [];

      var file = new File('nums.txt').openRead().transform(utf8.decoder).transform(LineSplitter());

      await for (var i in file){
        numMassive = i.split(' ');
      }
      try{
        numMassive!.removeLast();
        for (int i = 0; i < numMassive!.length; ++i){
          int.parse(numMassive[i]) % 2 != 0 ? newMassive.add(numMassive[i]) : newMassive;
        }
      } catch(e) {}

      var newFile = new File('nums.txt').openWrite();
      for (int i = 0; i < newMassive.length; ++i){
        newFile.write('${newMassive[i]} ');
      }

      print("Созданный массив - ${numMassive} \nОтфильтрованный массив - ${newMassive}");
      newFile.close();    
    }
  } catch (e) {
    print('ERROR $e..');
  }
}

void generateMassive(){
  var outFile = new File('nums.txt').openWrite();
  for (int i = 0; i < Random().nextInt(100); ++i){
  outFile.write("${Random().nextInt(100)} ");
  }
  outFile.write('\n');
  outFile.close();
}
//==============================================================================================================================

//=====================================================Первое=Задание===========================================================
void taskOne() async{
  stdout.write("Хотите сгенерировать новые входные данные: (yes - 1 / no - any button) ");
  try{
    if ((int.parse(stdin.readLineSync()!)) == 1){
      generateOutPut();
      print('Массив создан успешно..\n..Перезапустите программу');
    }
  } catch (e) {}

  Stream<String> inFile = new File('input.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
  var outFile = new File("output.txt").openWrite();
  int tryNum = 0;
  List? trueResult;
  
  await for (var i in inFile){
    int maxCoincidence = 0;

    List ticket = i.split(' ');
    if (tryNum > 1){
      for (int m = 0; m < trueResult!.length;++m){
        for (int k = 0; k < (ticket).length; ++k){
          trueResult[m] == ticket[k] ? maxCoincidence += 1 : maxCoincidence;
        }
      }
      if (maxCoincidence > 2){
        outFile.write("$i - Lucky\n");
      } else {
        outFile.write("$i - Unlucky\n");
      }
    } else {
      if (tryNum == 0){
        trueResult = i.split(' '); // Создаем массив с верным ответом
        trueResult.removeLast();  
      }
    }
    ++tryNum;
  }

  outFile.close();
}

void generateOutPut(){
  var outFile = new File('input.txt').openWrite();
  List massiveInput = [0];
  
  while(massiveInput.length <= 10){
    bool tryAddForMassive = true;
    int generateNum = Random().nextInt(32);

    for (int i = 0; i < massiveInput.length; ++i){
      if (massiveInput[i] == generateNum){
        tryAddForMassive = false;
        continue;
      }
    }

    if (tryAddForMassive){
      massiveInput.add(generateNum);
    }
  }
  massiveInput.removeAt(0); // удаление лишнего числа, которое могло повториться

  for (int i = 0; i < massiveInput.length; ++i){
    outFile.write("${massiveInput[i]} "); // Создание победных номеров
  }
  int ticketNums = Random().nextInt(1000);
  outFile.write("\n${ticketNums}\n"); // Создание количества билетов

  for (int k = 0; k < ticketNums; ++k){
    List massivePlayerNums = [0];

    while(massivePlayerNums.length <= 6){
      bool tryAddForMassive = true;
      int generateNumForPlayer = Random().nextInt(32);

      for (int i = 0; i < massivePlayerNums.length; ++i){
        if (massivePlayerNums[i] == generateNumForPlayer){
          tryAddForMassive = false;
          continue;
        }
      }
      if (tryAddForMassive){
        massivePlayerNums.add(generateNumForPlayer);
      }
    }
    massivePlayerNums.removeAt(0); // удаление лишнего числа, которое могло повториться

    for (int j = 0; j < massivePlayerNums.length; ++j){
      outFile.write("${massivePlayerNums[j]} "); // Создание игровых номеров
    }
    outFile.write("\n");
  }
  outFile.close();
}
//==============================================================================================================================
import "dart:io";
import "dart:math";

void main() {
  stdout.write("Введите номер задания: (1-5) ");
  try{
    switch(int.parse(stdin.readLineSync()!)){
      case 1: taskOne(); break;
      case 2: taskTwo(); break;
      case 3: taskThree(); break;
      case 4: taskFour(); break;
      case 5: taskFive(); break;
    }
  } catch(e) {
    print("Введите номер задания (от 1 до 5)..");
  }
}

//=====================================================Пятое=Задание============================================================
void taskFive(){
  var massive = {
    1  : List.generate(30, (_) => Random().nextInt(20) - 10),
    2  : List.generate(30, (_) => Random().nextInt(20) - 10),
    3  : List.generate(30, (_) => Random().nextInt(20) - 10),
    4  : List.generate(30, (_) => Random().nextInt(20) - 10),
    5  : List.generate(30, (_) => Random().nextInt(20) - 10),
    6  : List.generate(30, (_) => Random().nextInt(20) - 10),
    7  : List.generate(30, (_) => Random().nextInt(20) - 10),
    8  : List.generate(30, (_) => Random().nextInt(20) - 10),
    9  : List.generate(30, (_) => Random().nextInt(20) - 10),
    10 : List.generate(30, (_) => Random().nextInt(20) - 10),
    11 : List.generate(30, (_) => Random().nextInt(20) - 10),
    12 : List.generate(30, (_) => Random().nextInt(20) - 10)
  };

  List massiveDate = ['Янв',"Фев","Мар","Апр","Мая","Июн","Июл","Авг","Сен","Окт","Ноя","Дек"];

  for (int i = 0; i < 12; ++i){
    stdout.write("${massiveDate[i]} = '${takeNumMassive(i,massive)}'\n");
  }
}

int takeNumMassive(i,massive){
  num max = 0;
  for (int j = 0; j < 30; ++j){
    max = max + (massive[i+1])![j];
  }
  return max ~/ 12;
}

//==============================================================================================================================

//===================================================Четвертое=Задание==========================================================
void taskFour(){
  var temperature = List.generate(12, (_) => List.generate(30, (_) => Random().nextInt(20) - 10)); 
  var res = [0,0,0,0,0,0,0,0,0,0,0,0];

  for (int i = 0; i < 12; ++i){
    for (int j = 0; j < 30; ++j){
      res[i] += temperature[i][j];
    }
    res[i] = res[i] ~/ 12;
  }
  print("Начальный    массив    - $res");
  print("Отсортированный массив - ${res..sort()}");
}
//==============================================================================================================================

//===================================================Третье=Задание=============================================================
void taskThree(){
  var sizeB;
  var sizeA;
  var massive;
  try{
    stdout.write('Введите значение x: ');
    sizeB = int.parse(stdin.readLineSync()!);
    stdout.write('Введите значение y: ');
    sizeA = int.parse(stdin.readLineSync()!);
    massive = List.generate(sizeA, (y) => List.generate(sizeB, (x) => 1));

    for (int i = 1; i < sizeA; ++i){
      for (int j = 1; j < sizeB; ++j){
        massive[i][j] = massive[i-1][j] + massive[i][j-1];
      }
    }

    if (sizeA > 1 && sizeB > 1){
      for (int i = 0; i < sizeA; ++i){
        for (int j = 0; j < sizeB; ++j){
          stdout.write("${massive[i][j]}\t");
        }
        print("");
      }
    } else {
      print('Массив слишком мал..');
    }     
 
  } catch(e) {
    print('Введены не корректные данные.. $e');
  }
}
//==============================================================================================================================

//===================================================Второе=Задание=============================================================
void taskTwo(){
  var massive = List<int>.generate(100, (int i) => 1 + 2 * i);
  print(massive);
}
//==============================================================================================================================

//=====================================================Первое=Задание===========================================================
void taskOne(){
  var massive = List<int>.generate(100, (int i) => 100 - 3 * i);
  print(massive);
}
//==============================================================================================================================
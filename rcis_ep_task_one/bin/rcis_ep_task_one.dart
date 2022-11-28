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
    print("Введите данные от 1 до 5");
  }
}

//=====================================================Пятое=Задание============================================================
void taskFive(){
  print('Введите предложение: (На английском) ');
  List massive = [];
  var output;
  int noneDigitNum = 0;
  try{
    output = stdin.readLineSync()!;
    if (output != '') {
      massive = output.split(' ');
      for (int i = 0; i < massive.length; ++i){
        if (massive[i] == ' '){
          ++noneDigitNum;
        }
      }
      massive.insert(0, 'Start');
      massive.add('End.');
      noneDigitNum < (massive.join(' ')).length ? print("Количество слов: ${massive.length - 2} \nПредложение: ${massive.join(' ')}") : print('Много пробелов..');
    } else {
      print("Не достаточно информации..");
    }    
  } catch(e) {
    print("ERROR");
  }
}
//==============================================================================================================================

//===================================================Четвертое=Задание==========================================================
void taskFour(){
  stdout.write('Введите размеры массива: ');
  var massive = [];
  try{
    int sizeMassive = int.parse(stdin.readLineSync()!);
    stdout.write('Введите начало диапозона: ');
    int minDigit = int.parse(stdin.readLineSync()!);
    stdout.write("Введите конец диапозона: ");
    int maxDigit = int.parse(stdin.readLineSync()!);
    massive = generateMassive(sizeMassive, minDigit, maxDigit);
  } catch(e) {
    print('Введенно не допустимое значение..');
  }
  for (int i = 0; i < massive.length; ++i ){
    stdout.write('${massive[i]} ');
  }
}

List generateMassive(int size, int minDigit, int maxDigit){
  return List<int>.generate(size, (_) => (Random().nextInt(maxDigit - minDigit) + minDigit));
}
//==============================================================================================================================

//===================================================Третье=Задание=============================================================
void taskThree(){
  print('Производится ввод входных данных в массив.. \nВведите значение которое хотите добавить в массив: ("" - прекращает ввод) ');
  List massive = [];
  var a;
  List res = ['', 0];

  while(a != ''){
    try{
      stdout.write("Введите значение: ");
      a = stdin.readLineSync();
      a != "" ? massive.add(a) : print('Завершение заполнения\n');
    } catch(e) {
      print(e);
    }
  }
  if (massive.isEmpty != true){
    res[1] = massive[0];
    for (int i = 0; i < massive.length; ++i){
      massive[i].length > res[0].length ? res[0] = massive[i] : res[0];
      massive[i].length < res[1].length ? res[1] = massive[i] : res[1];
    }
  }
  res[0] == '' && res[1] == 0 ? print('Нет входных данных..') : print('Максимальное значение - "${res[0]}" \nМинимальное значение - "${res[1]}"');
}
//==============================================================================================================================

//===================================================Второе=Задание=============================================================
void taskTwo(){
  print("Производится ввод входных данных в массив.. \nВведите значение которое хотите добавить в массив: (0 - прекращает ввод) ");
  List massive = [];
  int a = -1;
  List res = [0,1];
  while (a != 0) {
    try{
      stdout.write("Введите число: ");
      a = int.parse(stdin.readLineSync()!);
      a != 0 && a != "" ? massive.add(a) : print("Завершение заполнения\n");
    } catch(e) {
      print("Введенено не допустимое значение...");
    }
  }
  for (int i = 0; i < massive.length; ++i){
    res[0] += massive[i];
    res[1] *= massive[i];
  }
  try{
    print("Сумма равна: ${res[0]} \nПроизведение равно: ${res[1]} \nСреднее число: ${res[0] ~/ massive.length} ");
  } catch(e) {
    print("Нет входных данных");
  }
  }
//==============================================================================================================================

//=====================================================Первое=Задание===========================================================
void taskOne(){
  int maxDigit = 100;
  int maxNum = maxDigit;
  int res = 0;
  var massive = List<int>.generate(10, (_) => (Random().nextInt(maxDigit)));
  for (int i = 0; i < massive.length; ++i){
    massive[i] < maxNum ? {maxNum = massive[i], res = i} : (maxNum) ;
  }
  print("$massive \n$res");
}
//==============================================================================================================================
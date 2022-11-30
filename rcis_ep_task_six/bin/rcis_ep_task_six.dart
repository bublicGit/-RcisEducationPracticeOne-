import "dart:io";
import "dart:convert";
import "dart:async";
import "dart:math";

void main() {
  stdout.write("Введите номер задания: (1-6) ");
  try{
    switch(int.parse(stdin.readLineSync()!)){
      case 1: taskOne(); break;
      case 2: taskTwo(); break;
      case 3: taskThree(); break;
      case 4: taskFour(); break;
      case 5: taskFive(); break;
      case 6: taskSix(); break;
    }
  } catch(e) {
    print("Введите данные от 1 до 6 \n$e");
  }
}

//=====================================================Пятое=Задание============================================================
void taskSix(){
  var massiveData= List.generate(10, (_) => Random().nextDouble() * 200 - 100); 
  List<double> massiveOne = [];
  List<double> massiveTwo = [];
  
  for (int i = 0; i < massiveData.length; ++i)
  {
    (massiveData[i] > 0 ? massiveOne : massiveTwo) .add(massiveData[i]);
  }

  print("\nПоложительный массив: $massiveOne \nОтрицательный массив: $massiveTwo");
}
//==============================================================================================================================

//=====================================================Пятое=Задание============================================================
void taskFive(){
  var sizeB;
  var sizeA;
  var massive;
  try
  {
    stdout.write('Введите значение x: ');
    sizeB = int.parse(stdin.readLineSync()!);
    stdout.write('Введите значение y: ');
    sizeA = int.parse(stdin.readLineSync()!);

  } catch(e){print("ERROR. Не верные значения. ");}
  if (sizeA != null && sizeB != null)
  {
    massive = List.generate(sizeA, (y) => List.generate(sizeB, (x) => Random().nextInt(2)));
    num sum = 0;

    for (int x = 0; x < sizeA; ++x)
    {
      for (int y = 0; y < sizeB; ++y)
      {
        sum += (massive[x][y]);
      }
      massive[x].add(sum % 2 == 0 ? 1 : 0);
      sum = 0;
    }

    for (int x = 0; x < sizeA; ++x)
    {
      for (int y = 0; y < sizeB + 1; ++y)
      {
        stdout.write("${massive[x][y]} \t"); // Вывод массива
      }
      print("");
    }
  }
}
//==============================================================================================================================

//===================================================Четвертое=Задание==========================================================
void taskFour(){
  stdout.write("Введите число a: ");
  int? a;
  try
  {
    a = int.parse(stdin.readLineSync()!);
  } catch(e) {print("ERROR. Введено не верное число.");}
  if (a != null)
  {
    print("Отрицательное число завершает цикл. ");
  }

  int res = 0;
  int num = 1;
  
  while(num >= 0 && a != null)
  {
    try
    {
      stdout.write("Введите число для деления на a: ");
      num = int.parse(stdin.readLineSync()!);
    } catch(e){print("Не допустимое значение ");}
  
    if (num < 0)
    {
      break;
    }
    if (num % a! == 0)
    {
      res += num;
    }
    print(num > 0 && num % a == 0 ? "Число было добавленно к сумме. " : "Число не подходит. ");
  }
  print("Сумма равна: $res");
}
//==============================================================================================================================

//===================================================Третье=Задание=============================================================
void taskThree(){
  int? num;
  try {
    stdout.write("Введите число: ");
    num = int.parse(stdin.readLineSync()!);
  } catch(e) {print("ERROR. Введены не верные данные"); }
  if (num != null)
  {
    print((num % 2 == 0 && num % 10 == 0 ? "Число подходит." : "Число не подходит."));
  }
}
//==============================================================================================================================

//===================================================Второе=Задание=============================================================
void taskTwo() async{
  try
  {
    var file = new File('numsTask2.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
    List<String>? massive;
    await for (var i in file)
    {
      stdout.write("${i} ");
    }
  } catch(e){print("ERROR. Недостаточно данных. ");}
}
//==============================================================================================================================

//=====================================================Первое=Задание===========================================================
void taskOne() async{
  Stream<String>? file;
  try
  {
    file = new File('numsTask1.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
  } catch(e) {print("ERROR. Недостаточно данных. ");}
  if (file != null)
  {
    List<String>? massive;
    await for (var i in file)
    {
      massive = i.split(' ');
    }

    for (int i = 0; i < massive!.length; ++i)
    {
      if ((massive[i]).length % 2 != 0)
      {
        stdout.write("${massive[i]} ");
      }
    }
  }
}
//==============================================================================================================================
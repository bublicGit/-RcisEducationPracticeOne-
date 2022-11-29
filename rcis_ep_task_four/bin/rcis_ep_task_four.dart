import "dart:io";
import "dart:math";
import "dart:convert";
import "dart:async";
import 'dart:core';

void main() {
  stdout.write("Введите номер задания: (1-6) ");
  try{
    switch(int.parse(stdin.readLineSync()!)){
      case 1: taskOne();   break;
      case 2: taskTwo();   break;
      case 3: taskThree(); break;
      case 4: taskFour();  break;
      case 5: taskFive();  break;
      case 6: taskSix();   break;
      default: print("Не верное значение."); break;
    }
  } catch(e) {
    print("Введите номер задания (от 1 до 5)..");
  }
}

//====================================================Шестое=Задание============================================================
void taskSix(){
  int x =  -5 + Random().nextInt(5 - (-5));
  int y =  -5 + Random().nextInt(5 - (-5));

  print("Координаты равны: [$x,$y]");

  // print(((0 - x) * ((-3) - 2) - (2 - 0) * (2 - y)) > 0 && ((2 - x) * ((-3) - (-3)) - ((-2) - 2) * ((-3) - y)) > 0 && (((-2) - x) * (2 - (-3)) - (0 - (-2)) * ((-3) - y)) > 0 || ((0 - x) * ((-3) - 2) - (2 - 0) * (2 - y)) < 0 && ((2 - x) * ((-3) - (-3)) - ((-2) - 2) * ((-3) - y)) < 0 && (((-2) - x) * (2 - (-3)) - (0 - (-2)) * ((-3) - y)) < 0 || ((0 - x) * ((-3) - 2) - (2 - 0) * (2 - y)) == 0 || ((2 - x) * ((-3) - (-3)) - ((-2) - 2) * ((-3) - y)) == 0 || (((-2) - x) * (2 - (-3)) - (0 - (-2)) * ((-3) - y)) == 0 ? "Точка принадлежит" : "Точка не принадлежит");

  int a = ((0 - x) * ((-3) - 2) - (2 - 0) * (2 - y));
  int b = ((2 - x) * ((-3) - (-3)) - ((-2) - 2) * ((-3) - y));
  int c = (((-2) - x) * (2 - (-3)) - (0 - (-2)) * ((-3) - y));

  print(a > 0 && b > 0 && c > 0 || a < 0 && b < 0 && c < 0 || a == 0 || b == 0 || c == 0 ? "Точка принадлежит": "Точка не принадлежит");
}

/* 
(x1 - x0) * (y2 - y1) - (x2 - x1) * (y1 - y0)
(x2 - x0) * (y3 - y2) - (x3 - x2) * (y2 - y0) // Формула
(x3 - x0) * (y1 - y3) - (x1 - x3) * (y3 - y0)
*/

//==============================================================================================================================

//=====================================================Пятое=Задание============================================================
void taskFive(){
  int x =  -5 + Random().nextInt(5 - (-5));
  int y =  -5 + Random().nextInt(5 - (-5));
  print("Координаты равны: [$x,$y]");
  print((x <= 3 && x >= -1) && (y >= -2 && y <= 4) ? "Точка принадлежит" : "Точка не принадлежит");
}

//==============================================================================================================================

//===================================================Четвертое=Задание==========================================================
void taskFour() async{
  stdout.write('Создать массив (1) или пропустить нажав Enter: ');
  if (stdin.readLineSync()! == '1')
  {
    generateNumberArray("numsTask4.txt", " "); // Генерация массива
    print("Массив успешно создан. Перезапустите код");
    return;
  }
  try
  {
    var file = new File('numsTask4.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
    List<String>? numMassive;
    await for (var i in file)
    {
      numMassive = i.split(' ');
    }
    
    int? previousNumber;
    int same = 1;
    int maxSame = 1;

    for (int i = 0; i < numMassive!.length; ++i)
    {
      if (i != 0)
      {
        if (previousNumber == int.parse(numMassive[i]))
        {
          ++same;
        }
        else
        {
          same = 1;
        }
        previousNumber = int.parse(numMassive[i]);
        if (same > maxSame)
        {
          maxSame = same;
        }
      }
      else if (i == 0)
      {
        previousNumber = int.parse(numMassive[i]);
        continue;
      }
    }
    print(maxSame <= 1 ? "Повторяющихся нет.." : "Максимальное количество Повторов $maxSame");
  } catch(e) {print("ERROR");}

}
//==============================================================================================================================

//===================================================Третье=Задание=============================================================
void taskThree() async{
  stdout.write('Создать массив (1) или пропустить нажав Enter: ');
  if (stdin.readLineSync()! == '1')
  {
    generateNumberArray("numsTask3.txt", ","); // Генерация массива
    print("Массив успешно создан. Перезапустите код");
    return;
  }
  try
  {
    var file = new File('numsTask3.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
    List<String>? numMassive;
    await for (var i in file)
    {
      numMassive = i.split(',');
    }
    int max = 0;
    int min = 100;

    for (int i = 0; i < numMassive!.length; ++i)
    {
      if (int.parse(numMassive[i]) > 0)
      {
        if (int.parse(numMassive[i]) > max)
        {
          max = int.parse(numMassive[i]);
        }
        if (int.parse(numMassive[i]) < min)
        {
          min = int.parse(numMassive[i]);
        }
      }
    }
    print(" [$min : $max] ");
  } catch(e) {print('ERROR');}
}
//==============================================================================================================================

//===================================================Второе=Задание=============================================================
void taskTwo() async{
  stdout.write('Создать массив (1) или пропустить нажав Enter: ');
  if (stdin.readLineSync()! == '1')
  {
    generateNumberArray("numsTask2.txt", ";"); // Генерация массива
    print("Массив успешно создан. Перезапустите код");
    return;
  }

  try
  {
    var file = new File('numsTask2.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
    List<String>? numMassive;
    await for (var i in file)
    {
      numMassive = i.split(';');
    }
    int sum = 0;


    for (int i = 0; i < numMassive!.length; ++i)
    {
      if (int.parse(numMassive[i]) > 0)
      {
        sum += int.parse(numMassive[i]);
      }
    }
    print(sum);
  } catch(e) {print("ERROR");}
}
//==============================================================================================================================

//====================================================Генерация=Массива=========================================================
void generateNumberArray(String str, String Sign){
  var outFile = new File(str).openWrite();
  for (int i = 0; i < Random().nextInt(100); ++i){
  outFile.write("${ -100 + Random().nextInt(100 - (-100)) }$Sign");
  }
  outFile.write('${Random().nextInt(100)}\n');
  outFile.close();
}
//==============================================================================================================================

//=====================================================Первое=Задание===========================================================
void taskOne(){
  int num = Random().nextInt(20); // Ввод числа
  print("Число равно: \t${num}");

  int multiplication = 1;
  
  stdout.write("Числа кратные 3 и ' < $num': ");

  for (int i = 0; i < num && num >= 3; ++i)
  {
    if (i > 0 && i % 3 == 0)
    {
      multiplication *= i;
      stdout.write("$i ");
    }
  }

  stdout.write("\nПроизведение натуральных чисел равно: ${multiplication != 1 ? multiplication : 0}");
}
//==============================================================================================================================
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

}

//==============================================================================================================================

//=====================================================Пятое=Задание============================================================
void taskFive(){

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
    int same = 0;
    int maxSame = 0;

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
          same = 0;
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
    print("Повторов $maxSame");
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
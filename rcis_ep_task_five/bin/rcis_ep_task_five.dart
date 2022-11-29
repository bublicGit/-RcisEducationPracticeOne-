import "dart:io";
import "dart:math";
import "dart:convert";
import "dart:async";
import 'dart:core';
import 'dart:typed_data';

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
void taskFive() async{
  stdout.write('Создать массив (1) или пропустить нажав Enter: ');
  if (stdin.readLineSync()! == '1')
  {
    generateNumberArray("numsTask5.txt", ", "); // Генерация массива
    print("Массив успешно создан. Перезапустите код");
    return;
  }
  try
  {
    var file = new File('numsTask5.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
    List<String>? numMassive;
    await for (var i in file)
    {
      numMassive = i.split(', ');
    }

    double arif = 0;
    bool trueArif = false;
    int min = 100;
    int max = 0;
    int numCount = 0;

    for (int i = 0; i < numMassive!.length; ++i)
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

    for (int i = 0; i < numMassive.length; ++i)
    {
      if (trueArif)
      {
        if (int.parse(numMassive[i]) == max || int.parse(numMassive[i]) == min)
        {
          arif /= numCount;
          trueArif = false;
          break;
        }
        arif += int.parse(numMassive[i]);
        ++numCount;
      }
      else
      {
        if (int.parse(numMassive[i]) == min || int.parse(numMassive[i]) == max)
        {
          trueArif = true;
        }
      }
    }

    stdout.write("Массив равен: ");
    for (int i = 0; i < numMassive.length; ++i)
    {
      stdout.write("${numMassive[i]} ");
    }

    print("\nМаксимальное значение: $max\nМинимальное значение: $min \nCреднее арифметическое элементов расположенных между минимальным и максимальным равно: $arif");
  } catch(e){print("ERROR\nУ вас, возможно, массив не создан.");}
}

//==============================================================================================================================

//===================================================Четвертое=Задание==========================================================
void taskFour() async{
  stdout.write('Создать массив (1) или пропустить нажав Enter: ');
  if (stdin.readLineSync()! == '1')
  {
    generateNumberArray("numsTask4.txt", ", "); // Генерация массива
    print("Массив успешно создан. Перезапустите код");
    return;
  }
  try
  {
    var file = new File('numsTask4.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
    List<String>? numMassive;
    await for (var i in file)
    {
      numMassive = i.split(', ');
    }
    int sum = 0;
    int max = 0;
    for (int i = 0; i < numMassive!.length; ++i)
    {
      if (int.parse(numMassive[i]) > max)
      {
        max = int.parse(numMassive[i]);
      }
    }

    for (int i = 0; i < numMassive.length; ++i)
    {
      if (int.parse(numMassive[i]) == max - 1)
      {
        sum += int.parse(numMassive[i]);
      }
    }
    stdout.write("Массив равен: ");
    for (int i = 0; i < numMassive.length; ++i)
    {
      stdout.write("${numMassive[i]} ");
    }
    print("\nСумма элементов, отличающихся от максимального на 1: $sum");
  } catch(e){print("ERROR");}
}
//==============================================================================================================================

//===================================================Третье=Задание=============================================================
void taskThree() async{
  stdout.write('Создать массив (1) или пропустить нажав Enter: ');
  if (stdin.readLineSync()! == '1')
  {
    generateNumberArray("numsTask3.txt", ", "); // Генерация массива
    print("Массив успешно создан. Перезапустите код");
    return;
  }
  try
  {
    var file = new File('numsTask3.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
    List<String>? numMassive;
    await for (var i in file)
    {
      numMassive = i.split(', ');
    }

    int min = 100;
    for (int i = 0; i < numMassive!.length; ++i)
    {
      if (int.parse(numMassive[i]) < min)
      {
        min = int.parse(numMassive[i]);
      }
    }
    double arif = 0;

    for (int i = 0; i < numMassive.length; ++i)
    {
      if (int.parse(numMassive[i]) != min)
      {
        arif += double.parse(numMassive[i]);
      }
      else
      {
        arif /= i;
        break;
      }
    }
    stdout.write("Массив равен: ");
    for (int i = 0; i < numMassive.length; ++i)
    {
      stdout.write("${numMassive[i]} ");
    }
    print("\nСреднее равно: $arif");
  } catch(e){print("ERROR");}
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
  var file = new File('numsTask2.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
  List<String>? numMassive;
  await for (var i in file)
  {
    numMassive = i.split(';');
  }

  stdout.write("Начальный массив: \t");
  for (int i = 0; i < numMassive!.length; ++i)
  {
    stdout.write("${numMassive[i]} ");
  }
  var numMassiveRes = bubbleSort(numMassive);

  stdout.write("\nОтсортированный массив: ");
  for (int i = 0; i < numMassiveRes.length; ++i)
  {
    stdout.write("${numMassiveRes[i]} ");
  }

  var outFile = new File('numsTask2.txt').openWrite();
  for (int i = 0; i < numMassiveRes.length; ++i)
  {
    outFile.write("${numMassiveRes[i]} ");
  }
  outFile.close();
  stdout.write("Результат успешно сохранен. ");
}

List bubbleSort(List data)
{
  for (int i = 0; i < data.length - 1; ++i)
  {
   for (int j = 0; j < data.length - i - 1; ++j)
    {
      if (int.parse(data[j]) > int.parse(data[j + 1]))
      {
        String a = data[j];
        data[j] = data[j + 1];
        data[j + 1] = a;
      }
    }
  }
  return data;
}
//==============================================================================================================================

//=====================================================Первое=Задание===========================================================
void taskOne() async{
  stdout.write('Создать массив (1) или пропустить нажав Enter: ');
  if (stdin.readLineSync()! == '1')
  {
    generateNumberArray("numsTask1.txt", " "); // Генерация массива
    print("Массив успешно создан. Перезапустите код");
    return;
  }
  try
  {
    var file = new File('numsTask1.txt').openRead().transform(utf8.decoder).transform(LineSplitter());
    List<String>? numMassive;
    await for (var i in file)
    {
      numMassive = i.split(' ');
    }

    int multiplication = 1;
    bool trueMultiplication = false;
    int min = 100;

    for (int i = 0; i < numMassive!.length; ++i)
    {
      if (int.parse(numMassive[i]) < min)
      {
        min = int.parse(numMassive[i]);
      }
    }

    for (int i = 0; i < numMassive!.length; ++i)
    {
      if (trueMultiplication)
      {
        multiplication *= int.parse(numMassive[i]);
      }
      else
      {
        if (int.parse(numMassive[i]) == min)
        {
          trueMultiplication = true;
        }
      }
    }
    
    print("Значения массива: $numMassive \nПроизведение после минимального числа $min: $multiplication");
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

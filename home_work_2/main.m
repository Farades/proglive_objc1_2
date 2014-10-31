//
//  main.m
//  home_work_2
//
//  Created by farades on 31.10.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

//Домашнее задание
//1. Создайте собственный перечисляемый тип (typedef enum) CalculationType, содержащий 4 математических действия — сложение, вычитание, умножение и деление (если не знаете английские наименования — translate.google.com).
//2. Напишите функцию, возвращающую int и принимающую в качестве аргументов три переменные: первое число, второе число и тип математической операции. Для простоты сделайте числа переменными типа int. Внутри функции, в зависимости от значения переменной типа CalculationType, выполните соответствующую математическую операцию с числами и верните результат.
//3. Вызовите эту функцию из функции main внутри NSLog 4 раза (не в цикле, а просто подряд), выводя результат вызова в виде (пример для сложения, просто замените "+" на соответствующий символ для других математических операций): «Результат 4 + 15 равен 19». Числа, конечно же, любые на ваш выбор. Постарайтесь сделать реализацию максимально гибкой — такой, чтобы результат вывода можно было легко изменить, поменяв значения первой и второй переменных. Можете использовать одни и те же переменные для всех операций или каждый раз новые — это не принципиально.
//4. Создайте функцию quadMultiplier, принимающую в качестве аргумента целое неотрицательное число с максимально большой известной вам ёмкостью, и возвращающую его же, умноженное на четыре.
//5. Создайте в теле функции main цикл с двадцатью итерациями, начиная с int i = 1 и увеличивая i каждый раз на единицу (количество итераций обозначает число раз, которое будет выполнен код, находящийся в теле (внутри) цикла). В каждой итерации вызывайте функцию quadMultiplier с параметром i и проверяйте, делится ли её результат без остатка на три. Если нет — выводите NSLog'ом полученное значение, если да — выводите «Число <...> кратно трём»
//6. Дополните предыдущий цикл так, чтобы в каждой итерации, независимо от выведенного в консоль сообщения, дополнительно выводилось сообщение «Осталось <...> итераций.
//7. Измените получившийся цикл при помощи continue так, чтобы сообщение об оставшихся итерациях появлялось только в тех случаях, когда результат вызова quadMultiplier не кратен трём.
//8. Заставьте цикл завершиться при помощи break, не выводя никаких очередных сообщений, если возвращённый функцией quadMultiplier результат равен 16.

#import <Foundation/Foundation.h>

typedef enum {
    addition,
    subtraction,
    multiplication,
    division
} CalculationType;

int mathOperation(int num_1, int num_2, CalculationType type);
unsigned quadMultiplier(unsigned number) {return number * 4;}

int main(int argc, const char * argv[]) {

    int operator_1 = 432;
    int operator_2 = 342;
    
    NSLog(@"Результат: %d + %d = %d", operator_1, operator_2, mathOperation(operator_1, operator_2, addition));
    NSLog(@"Результат: %d - %d = %d", operator_1, operator_2, mathOperation(operator_1, operator_2, subtraction));
    NSLog(@"Результат: %d * %d = %d", operator_1, operator_2, mathOperation(operator_1, operator_2, multiplication));
    NSLog(@"Результат: %d / %d = %d", operator_1, operator_2, mathOperation(operator_1, operator_2, division));
    
    for (int i = 1, count = 19; i < 21; count--, i++) {
        unsigned quad = quadMultiplier(i);
        
        if ( quad == 16) {
            break;
        }
        else if ( quad % 3 == 0 ) {
            NSLog(@"%u mod 3 == 0", quad);
            continue;
        }
        else {
            NSLog(@"%u mod 3 != 0", quad);
        }
        
        NSLog(@"Осталось %d итераций", count);
    }

    return 0;
}

int mathOperation(int num_1, int num_2, CalculationType type) {
    int result;
    switch (type) {
        case addition:
            result = num_1 + num_2;
            break;
            
        case subtraction:
            result = num_1 - num_2;
            break;
            
        case multiplication:
            result = num_1 * num_2;
            break;
            
        case division:
            result = num_1 / num_2;
            break;
    }
    return result;
}
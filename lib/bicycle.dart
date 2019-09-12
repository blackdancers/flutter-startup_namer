/**
 * 创建一个简单的 Dart 类;
 *  Bicycle 类包含了一些私有的成员变量，并对外暴露了 getter 和 setter 方法用来对成员变量进行操作。
 *  而在 main() 方法中会进行对 Bicycle 类的实例化操作并将其在控制台中打印出来。
 *  这个类同在 Java 教程中所创建的类拥有同样的功能。
 */

class Bicycle {
  int cadence;
  int speed;
  int gear;

  //定义一个 Bicycle 的构造函数
  Bicycle(this.cadence, this.speed, this.gear){
    this.cadence = cadence;
    this.speed = speed;
    this.gear = gear;
  }

  @override
  String toString() => 'Bicycle: $speed mph';

}

void main() {
//  var bike = new Bicycle(2, 0, 1);
  var bike = Bicycle(2, 0, 1);
  print(bike);
}


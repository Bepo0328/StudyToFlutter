Flutter - Generic
========

# 1. Generic
```
class Circle {}
class Square {}

class SquareSlot {
  insert(Square sqareSlot) {
    
  }
}

class CircleSlot {
  insert(Circle circleSlot) {
    
  }
}

void main() {
   var circleSlot = CircleSlot();
   circleSlot.insert(Circle());
  
   var squareSlot = SquareSlot();
   squareSlot.insert(Square());
}
```
```
class Circle {}
class Square {}
class Triangle {}

class Slot<T> {
  insert(T shape) {
    
  }
}

void main() {
  var circleSlot = Slot<Circle>();
  circleSlot.insert(Circle());
  
  var squareSlot = Slot<Square>();
  squareSlot.insert(Square());
  
  var triangleSlot = Slot<Triangle>();
  triangleSlot.insert(Triangle());
  
  print("Not Warring");
}
```
class Calculation {
  List<String> a = [];

  final RegExp regExp = RegExp("[+\\-x%]");

  void add(String added) {
    if (a.isEmpty) {
      if (!regExp.hasMatch(added)) {
        a.add(added);
      }
    } else if (regExp.hasMatch(a.last)) {
      if (!RegExp("[+\\-x%.]").hasMatch(added))  a.add(added);
    } else {
      if (regExp.hasMatch(added)) {
        if (!RegExp(".").hasMatch(a.last)) a.last += ".0";
        a.add(added);
      } else {
          a.last += added;
        }
      }
    }


  void deleteAll() {
    a = [];
  }

  void deleteOne() {
    if (a.length > 0) {
      if (a.last.length > 1) {
        a.last = a.last.substring(0, a.last.length - 1);
      } else {
        a.removeLast();
      }
    }
  }

  double getResult() {
    if (regExp.hasMatch(a.last)) {
      a.removeLast();
    }

    if (a.last.lastIndexOf(".") == a.last.length - 1) {
      a.last = a.last.substring(0, a.length - 1);
    }

    for (int i = 0; i < a.length; i++) {
      if (a[i] == "x") {
        a[i - 1] = "${double.parse(a[i - 1]) * double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      } else if (a[i] == "%") {
        if (double.parse(a[i+1]) == 0) {
          throw DivideByZeroException();
        }
        a[i - 1] = "${double.parse(a[i - 1]) / double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      }
    }

    for (int i = 0; i < a.length; i++) {
      if (a[i] == "+") {
        a[i - 1] = "${double.parse(a[i - 1]) + double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      } else if (a[i] == "-") {
        a[i - 1] = "${double.parse(a[i - 1]) - double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      }
    }

    if (a.length != 1) {
      throw Error();
    }

    return double.parse(a[0]);
  }

  String getString() {
    String expression = "";
    a.forEach((String element) {
      expression+=element;
    });
    return expression;
  }
}

class DivideByZeroException implements Exception {

}

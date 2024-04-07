class Solution {
  static int? romanToInt(String s) {
    //TODO: Take the Roman Number break it down into individual components

    //TODO:

    //TEST AREA
    print(allDigitsWithRomans[2].digits);
    if (s == 'I') {
      print('$s in integer is 1');
      return 1;
    }

    return 0;
  }
}

List<RomanConvert> allDigitsWithRomans = [
  RomanConvert(1, 'I'),
  RomanConvert(2, 'II'),
  RomanConvert(3, 'III'),
  RomanConvert(4, 'IV'),
  RomanConvert(5, 'V'),
  RomanConvert(6, 'VI'),
  RomanConvert(7, 'VII'),
  RomanConvert(8, 'VIII'),
  RomanConvert(9, 'IX'),
  RomanConvert(10, 'X'),
];

List<RomanConvert> romansNumberChart = [
  RomanConvert(1, 'I'),
  RomanConvert(5, 'V'),
  RomanConvert(10, 'X'),
  RomanConvert(50, 'L'),
  RomanConvert(100, 'C'),
  RomanConvert(500, 'D'),
  RomanConvert(1000, 'M'),
];

class RomanConvert {
  int? digits;
  String? roman;

  // Constructor with named parameters
  RomanConvert(this.digits, this.roman);
}

void main() {
  //Solution solution= Solution();
  Solution.romanToInt('I');
}

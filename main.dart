void main() {
  var converter = NumberConversion();

  print(converter.numberToWord(0));
  print(converter.numberToWord(6));
  print(converter.numberToWord(42));
  print(converter.numberToWord(123));
  print(converter.numberToWord(900));
  print(converter.numberToWord(8379));
  print(converter.numberToWord(1234567));
  print(converter.numberToWord(1000000));
  print(converter.numberToWord(999999999));
}

class NumberConversion{

  static final List<String> zeroToNineteen = ["zero","one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"];

  static final List<String> tens = ["", "", "twenty", "thirty","forty", "fifty",
    "sixty", "seventy", "eighty", "ninety"];


  String zeroToHundred(int num){
    if(num<20){
      return zeroToNineteen[num];
    }
    else{
      int unit = num % 10;
      int ten = num ~/10;
      if(unit == 0){
        return tens[ten];
      }
      else{
        return "${tens[ten]} ${zeroToNineteen[unit]}";
      }

    }
  }

  String hundredToThousand(int num){
    int hundred = num ~/ 100;
    int rest = num % 100;
    String res = "";
    if(hundred != 0){
      res += "${zeroToNineteen[hundred]} hundred";
      if(rest != 0){
        res += " ";
      }
    }
    if(rest != 0){
      if(rest<20){
        res += zeroToNineteen[rest];
      }else{
        res += zeroToHundred(rest);
      }
    }
    return res;
  }

  String numberToWord(int num){
    if(num == 0){
      return "zero";
    }
    int million = num ~/ 1000000;
    int thousand = (num % 1000000) ~/ 1000;
    int rest = num % 1000;

    List<String> wholeNumber = [];

    if(million>0){
      wholeNumber.add("${hundredToThousand(million)} million");
    }
    if(thousand>0){
      wholeNumber.add("${hundredToThousand(thousand)} thousand");
    }
    if(rest>0){
      wholeNumber.add(hundredToThousand(rest));
    }
    return wholeNumber.join(" ");
  }
}

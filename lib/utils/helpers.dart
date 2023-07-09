class Helpers{
  static List<String> splitSerialnumberText(String text){
    List<String> list = [];
    List<String> strList = text.split(' ');
    for (String v in strList) {
      if (v.isNotEmpty &&
          !v.toLowerCase().contains('serialnumber')) {
        String s = v.replaceAll(RegExp(r"[.|_]|[\n|\-]|\r"), '');
        if(s.isNotEmpty){
          list.add(s);
        }
      }
    }
    return list;
  }
}
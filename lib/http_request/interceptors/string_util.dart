class StringUtil {
  static bool isEmpty(String s) {
    return s == null || s.isEmpty;
  }

  static bool isNotEmpty(String s) {
    return !isEmpty(s);
  }

  static bool isIlp(String data) {
    return isNotEmpty(data) && data.toLowerCase().startsWith("ilp");
  }

  static bool isClp(String data) {
    return isNotEmpty(data) && data.toLowerCase().startsWith("clp");
  }

  static bool isTLP(String data) {
    return isNotEmpty(data) && data.toLowerCase().startsWith("tlp");
  }

  static bool isLp(String data) {
    return data.toLowerCase().startsWith("ilp")
        || data.toLowerCase().startsWith("clp")
        || data.toLowerCase().startsWith("slp")
        || data.toLowerCase().startsWith("hlp")
        || data.toLowerCase().startsWith("tlp");
  }
}
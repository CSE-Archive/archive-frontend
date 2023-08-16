String enToFaDigits(String str) {
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < en.length; i++) {
    str = str.replaceAll(en[i], fa[i]);
  }

  return str;
}

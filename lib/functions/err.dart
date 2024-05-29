FormatException cfe(t, x) {
  final a = {'class': t, "data": x};
  print(a);
  return FormatException(a.toString());
}

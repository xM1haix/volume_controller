import "package:flutter/material.dart";

FormatException cfe(t, x) {
  final a = {"class": t, "data": x};
  debugPrint(a.toString());
  return FormatException(a.toString());
}

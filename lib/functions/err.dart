import "package:flutter/material.dart";

///Function which create a Custom Format Exception
FormatException cfe(t, x) {
  final a = {"class": t, "data": x};
  debugPrint(a.toString());
  return FormatException(a.toString());
}

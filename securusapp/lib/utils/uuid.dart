import 'dart:math';

String generateUUID(int length) {
  String uuid = "";
  const chars = "abcdefghijklmnopqrstuvwxyz0123456789";

  Random random = Random();

  for (int i = 0; i < length; i++) {
    uuid += chars[random.nextInt(chars.length)];
  }

  return uuid;
}

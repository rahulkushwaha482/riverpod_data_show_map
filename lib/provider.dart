import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider =
    StateNotifierProvider<Counter, Map<String, dynamic>>((_) => Counter());

class Counter extends StateNotifier<Map<String, dynamic>> {
  // Counter(Map<String, dynamic> data): super(data);
  Counter() : super({});

  void displayFile(String name, String email, String address) {
    Map<String, dynamic> cartMap = {"name": name, "email": email, "address": address};

    state = {...state, ...cartMap};
  }
}


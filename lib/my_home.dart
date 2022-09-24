import 'package:flutter/material.dart';
import 'package:hook_riverpod/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends HookConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataValue = ref.watch(counterProvider);
    String name = dataValue['name'].toString();
    String email = dataValue['email'].toString();
    String address = dataValue['address'].toString();
    print(dataValue);
    return Scaffold(
        appBar: AppBar(
          title: const Text(' demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter email',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: addressController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter address',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).displayFile(
                        nameController.text,
                        emailController.text,
                        addressController.text);
                  },
                  child: const Text('Show Details')),
              const SizedBox(
                height: 20,
              ),
              Text(name),
              const SizedBox(
                height: 10,
              ),
              Text(email),
              const SizedBox(
                height: 10,
              ),
              Text(address),
            ],
          ),
        ));
  }
}

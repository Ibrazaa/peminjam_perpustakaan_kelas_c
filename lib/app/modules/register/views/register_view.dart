import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView <RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formkey,
          child: Column(
            children: [
              TextFormField(
                  controller: controller.namaController,
                  decoration: InputDecoration(hintText: "Masukan Nama"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "nama tidak boleh kosong";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(hintText: "Masukan Username"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "username tidak boleh kosong";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: controller.telpController,
                  decoration: InputDecoration(hintText: "Masukan No telp"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "notelp tidak boleh kosong";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: controller.alamatController,
                  decoration: InputDecoration(hintText: "Masukan Alamat"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "alamat tidak boleh kosong";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(hintText: "Masukan Password"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "password tidak boleh kosong";
                    }
                    return null;
                  }),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        controller.add();
                      },
                      child: Text("Tambah")))
            ],
          ),
        ),
      ),
    );
  }
}

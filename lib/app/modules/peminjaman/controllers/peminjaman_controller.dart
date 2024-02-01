import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_peminjaman.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
class PeminjamanController extends GetxController with StateMixin<List<DataPinjam>> {
final count= 0.obs;


  @override
  void onInit() {
    super.onInit();
    getPinjam();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getPinjam() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(
        Endpoint.pinjam+"/${StorageProvider.read(StorageKey.idUser)}"
      );
      if (response.statusCode == 200) {
        final ResponsePeminjaman responsePeminjaman = ResponsePeminjaman.fromJson(response.data);
        if (responsePeminjaman.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responsePeminjaman.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}


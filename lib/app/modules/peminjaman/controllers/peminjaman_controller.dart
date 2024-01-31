import 'package:get/get.dart';
import '../../../data/constant/endpoint.dart';

import '../../../data/provider/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_pinjam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
class PeminjamanController extends GetxController with StateMixin<List<DataPinjam>> {



  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(
        Endpoint.pinjam,
      );
      if (response.statusCode == 200) {
        final ResponsePinjam responsePinjam = ResponsePinjam.fromJson(response.data);
        if (responsePinjam.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responsePinjam.data, status: RxStatus.success());
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


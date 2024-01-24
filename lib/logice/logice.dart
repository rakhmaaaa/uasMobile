import 'dart:html';
import 'dart:js';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_dart/service/service.dart';

abstract class LogicState {}

abstract class LogicEvent {}

class LogicInitializeState extends LogicState {}

class LogicErrorState extends LogicState {
  final String error;
  LogicErrorState({required this.error});
}

class LogicLoadingState extends LogicState {}

class AddShopEvent extends LogicEvent {
  final int id;
  final String nama;
  final String deskripsi;
  final int harga;
  final String gambar;

  AddShopEvent(
      {required this.id,
      required this.nama,
      required this.deskripsi,
      required this.harga,
      required this.gambar});
}

class AddShopLoading extends LogicState {
  bool isLoading;
  AddShopLoading({required this.isLoading});
}

class LogicalService extends Bloc<LogicEvent, LogicState> {
  final RestAPIService _service;
  LogicalService(this._service) : super(LogicInitializeState()) {
    on<AddShopEvent>((event, emit) async {
      emit(AddShopLoading(isLoading: true));
      await _service
          .addShopService(
              event.id, event.nama, event.deskripsi, event.harga, event.gambar)
          .then((value) {
        emit(AddShopLoading(isLoading: false));
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pop(event.context);
        });
      }).onError((error, stackTrace) {
        emit(AddShopLoading(isLoading: false));
      });
    });
  }
}

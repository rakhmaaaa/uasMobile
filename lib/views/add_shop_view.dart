import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_dart/constants/snack_bar.dart';
import 'package:uas_dart/logice/logice.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _deskripsi = TextEditingController();
  final TextEditingController _harga = TextEditingController();
  final TextEditingController _gambar = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nama.dispose();
    _deskripsi.dispose();
    _harga.dispose();
    _gambar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Shop"),
      ),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _nama,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "Nama"),
        ),
        TextField(
          controller: _deskripsi,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "Deskripsi"),
        ),
        TextField(
          controller: _harga,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "Harga"),
        ),
        TextField(
          controller: _gambar,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "Gambar"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {
            if (_nama.text.isEmpty) {
              snackBar(context, "Masukkan nama barang");
            } else if (_deskripsi.text.isEmpty) {
              snackBar(context, "Masukkan deskrpsi");
            } else if (_harga.text.isEmpty) {
              snackBar(context, "Masukkan harga");
            } else if (_gambar.text.isEmpty) {
              snackBar(context, "Tambahkan gambar");
            } else {
              context.read<LogicalService>().add(AddShopEvent(
                  id: _id.text,
                  nama: _nama.text,
                  deskripsi: _deskripsi.text,
                  harga: _harga.text,
                  gambar: _gambar.text));
            }
          },
          child: BlocBuilder<LogicalService, LogicState>(
            builder: (context, state) {
              if (state is AddShopLoading) {
                bool isLoading = state.isLoading;
                return isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("Add Shop");
              } else {
                return const Text("Tambah");
              }
            },
          ),
        ),
      ],
    );
  }
}

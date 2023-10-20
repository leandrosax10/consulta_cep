import 'package:flutter/material.dart';
import '../model/viacep_model.dart';
import '../repository/via_cep_repository.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController(text: "");

  bool loading = false;

  var viacepModel = ViaCepModel();

  var viaCepRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Consultar CEP"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text(
              "Consulta de CEP",
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              maxLength: 8,
              onChanged: (String value) async {
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  //chamada api pelo repository e model
                  viacepModel = await viaCepRepository.consultarCEP(cep);
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              viacepModel.logradouro ?? "",
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
              style: const TextStyle(fontSize: 22),
            ),
            Visibility(
              visible: loading,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    ));
  }
}

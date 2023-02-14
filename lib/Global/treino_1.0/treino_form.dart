// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:teste/Global/provider/treinoProvider.dart';

// import '../../models/treino_model.dart';

// class TreinoForm extends StatelessWidget {
//   TextEditingController tipoTreinoController = TextEditingController();
//   TextEditingController dataDoTreinoController = TextEditingController();
//   TextEditingController objetivoController = TextEditingController();
//   TextEditingController iconeUrlController = TextEditingController();
//   // Para que eu possa submeter meu formulário eu preciso ter acesso a ele, e com isso devo criar uma GlobalKey;
//   final _form = GlobalKey<FormState>();
//   final Map<String, String> _formData = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //Esconde o ícone original (menu)
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text('Formulário de treino'),
//         actions: <Widget>[
//           IconButton(
//               onPressed: () {
//                 final isValid = _form.currentState!.validate();

//                 if (isValid) {
//                   _form.currentState?.save();

//                   Provider.of<TreinosProvider>(context, listen: false).put(
//                       Treino(
//                           id: _formData['id']!,
//                           tipoDeTreino: _formData["tipoTreino"]!,
//                           dataDoTreino: _formData["dataDoTreino"]!,
//                           objetivo: _formData["objetivo"]!,
//                           icon: _formData["iconeUrl"]!));

//                   Navigator.of(context).pop();
                 
//                 }
//               },
//               icon: Icon(Icons.save))
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(15),
//         child: Form(
//             key: _form,
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                     decoration: InputDecoration(labelText: 'Tipo de treino'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Informe o tipo de treino';
//                       }

//                       if (value.trim().length < 3) {
//                         return "Nome muito pequeno. No mínimo 3 letras";
//                       }

//                       return null;
//                     },
//                     onSaved: (value) {
//                       _formData["tipoTreino"] = value!;
//                     }),
//                 TextFormField(
//                     controller: dataDoTreinoController,
//                     decoration: InputDecoration(
//                       labelText: 'Prazo do treino',
//                       // hintText: '**/**/** até **/**/**'
//                     ),
//                     onSaved: (value) {
//                       _formData["dataDoTreino"] = value!;
//                     }),
//                 TextFormField(
//                     decoration: InputDecoration(labelText: 'Objetivo'),
//                     onSaved: (value) {
//                       _formData["objetivo"] = value!;
//                     }),
//                 TextFormField(
//                     decoration: InputDecoration(labelText: 'URL do ícone'),
//                     onSaved: (value) {
//                       _formData["iconeURL"] = value!;
//                     })
//               ],
//             )),
//       ),
//     );
//   }
// }

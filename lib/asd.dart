import 'package:flutter/material.dart';
import 'package:move/featuers/move/presentation/pages/movies_screen.dart';

class asd extends StatelessWidget {
  const asd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MaterialButton(
        child: const Text('navigate'),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const MainMoviesScreen()));
        },
      ),
    );
  }
}

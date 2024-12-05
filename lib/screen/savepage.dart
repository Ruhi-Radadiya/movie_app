import 'package:flutter/material.dart';
import 'package:movie_app/controller/savecontroller.dart';
import 'package:provider/provider.dart';

class Savepage extends StatelessWidget {
  const Savepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved"),
      ),
      body: Consumer<Savecontroller>(builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.saveData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(provider.saveData[index]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () => provider.removeSavedata(
                            name: provider.saveData[index],
                          ),
                      child: Icon(Icons.close)),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

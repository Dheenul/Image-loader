import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Image Loading error"),
      ),
      body: SafeArea(
          child: Center(
            child: Image.network(
                  "https://images.pexels.com/photos/1921336/pexels-photo-1921336.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  height: 250,
                  width: 150,
                  errorBuilder: (context, error, stackTrace) {
            return Text("Error not found");
                  },
                  loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
                  },
                ),
          )),
    ));
  }
}

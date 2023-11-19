import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;

  const QuoteCard({super.key, required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children:<Widget> [
            Text(
              quote.text,
              style: const TextStyle(
                  color: Colors.orange,
                  letterSpacing: 2,
                  fontSize: 14
              ),
            ),
            Text(
              quote.author,
              style: const TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                  fontSize: 16
              ),
            ),
            TextButton(
              onPressed: (){
                delete();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Icon(Icons.delete_forever, color: Colors.red,),
                  Text('Delete', style: TextStyle(color: Colors.red),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
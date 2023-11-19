import 'package:flutter/material.dart';
import 'package:firstapp/pages/quote.dart';
import 'package:firstapp/pages/quote_card.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int number = 0;
  List<Quote> quotes = [
    Quote(text: 'The only way to do great work is to love what you do.', author: 'Steve Jobs'),
    Quote(text: "In three words I can sum up everything I've learned about life: it goes on.", author: 'Robert Frost'),
    Quote(text: "The future belongs to those who believe in the beauty of their dreams.", author: 'Eleanor Roosevelt'),
    Quote(text: "Success is not final, failure is not fatal: It is the courage to continue that counts.", author: 'Winston Churchill'),
    Quote(text: "Life is really simple, but we insist on making it complicated.", author: 'Confucius')
  ];

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.network('https://www.betaarchive.com/wiki/images/9/94/Pc-logo-png.png', height: 30,),
            Row(
              children: <Widget> [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Your onPressed logic here
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        )
                    ),
                    child: const Text('Register'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        // Your onPressed logic here
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )
                          )
                      ),
                      child: const Text('Login', style: TextStyle(color: Colors.black))
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    FixedPositionElement(color: Colors.red),
                    FixedPositionElement(color: Colors.blue),
                    FixedPositionElement(color: Colors.green),
                    FixedPositionElement(color: Colors.orange),
                    FixedPositionElement(color: Colors.purple),
                    FixedPositionElement(color: Colors.black),
                  ],
                ),
              ),
              const Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.imgur.com/fNbLjuCh.jpg'),
                  radius: 40.0,
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                child: const Row(
                  children: <Widget> [
                    Icon(Icons.shopping_bag),
                    Text('View Shop')
                  ],
                )
              ),
              const Divider(
                height: 90.0,
                color: Colors.black,
              ),
              const Text(
                'Name',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0
                ),
              ),
              const SizedBox(height: 20.0,),
              const Text(
                'Ty Sophearum',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 30.0
                ),
              ),
              const SizedBox(height: 20.0,),
              const Text(
                'A dynamic data',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0
                ),
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          number--;
                        });
                      },
                      child: const Icon(
                        Icons.exposure_minus_1,
                      )
                  ),
                  const SizedBox(width: 20,),
                  Text(
                    '$number',
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        fontSize: 20.0
                    ),
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          number++;
                        });
                      },
                      child: const Icon(
                        Icons.plus_one,
                      )
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              const Row(
                children: <Widget> [
                  Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    'tysophearum91@gmail.com',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              const Text(
                'Quotes of the day',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0
                ),
              ),
              Column(
                children: quotes.map((quote) {
                  return QuoteCard(
                    quote: quote,
                    delete: (){
                      setState(() {
                        quotes.remove(quote);
                      });
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red[600],
        child: const Text('Click'),
      ),
    );
  }
}



class FixedPositionElement extends StatelessWidget {
  final Color color;

  FixedPositionElement({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      color: color,
      child: const Center(
        child: Text(
          'Fixed Element',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(items: [
        // ],),
        appBar: AppBar(
          elevation: 0,
          title: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 5),
                  Container(
                    child: Text(
                      "H12,Raj Homes, Siddhart",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.keyboard_arrow_down_outlined),
                ],
              ),
            ],
          ),
          leadingWidth: 100,
        ),
        body: Column(
          children: [
            // carousel tab
            Container(
              width: double.infinity,
              height: 200,
              color: Color(0XFF00A884),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Clean Your City",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),),
                            SizedBox(height: 10,),
                            OutlinedButton(
                              onPressed: () {},

                              child: Row(
                                children: [
                                  Text(
                                    "Clean Now",
                                    style: TextStyle(color: Colors.white,fontSize: 16),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    weight: 1.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 ,
                      height: 150,
                      child: Image(image: AssetImage("assets/images/register.jpeg"),width: 100, height: 100,),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            // center body

            Container(
              
            )
          ],
        ),
      ),
    );
  }
}

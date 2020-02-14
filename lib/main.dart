import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      title: 'Restaurant',
      theme: new ThemeData(primaryColor: Colors.yellow),
      home: new HomeScreen(),

    );
  }
}
class HomeScreen extends StatelessWidget { // I'm a widget
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title : new Text("Restaurant"),
        
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Accueil"),
                trailing: Icon(Icons.home), 
                onTap: () {
                  //Navigator.of(context).pop();
                  Navigator.push(  
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                },
              ),
              ListTile(
                title: Text("A propos"),
                trailing: Icon(Icons.info), 
                onTap: () {
                  //Navigator.of(context).pop();
                  Navigator.push(  
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                },
              ),
              ListTile(
                title: Text("Nos Menus"),
                trailing: Icon(Icons.fastfood), 
                onTap: () {
                  //Navigator.of(context).pop();
                  Navigator.push(  
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                },
              ),

            ],
          ),
        ),
        body: Container(
          padding: new EdgeInsets.all(20.0),
          child: Center(

            child: ListView(
                children: <Widget>[
                  Padding(
                        padding: EdgeInsets.all(20.0),
                        child: new Text("BIENVENUE, "),
                      ),
                  Center(
                    child:Card(
                    elevation: 4.0,
                    child:  
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Image.network( // We're all widgets!
                                      image2
                                    ),
                      ),
                  ),
                  ),
                  Padding(
                        padding: EdgeInsets.all(10.0),
                        child: new Text("Restaurant BON GOUT, "),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: new Text("Téléphone : 338796789 "),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: new Text("Adresse : Plateau, Av Blaise Diagne"),
                      ),
                ],
                ),
            ),
        )
      );
    }
}

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _MyListScreenState createState() => _MyListScreenState();
}


class _MyListScreenState  extends State<ListScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
   DateTime start = DateTime.parse("2010-01-01");
   DateTime end = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Menus'),

        ),
        bottomNavigationBar: BottomNavigationBar(
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.fastfood),
           title: new Text('Plats'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.local_drink),
           title: new Text('Boissons'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.cake),
           title: Text('Desserts')
         )
       ],
     ),
        
        body: 
        
        new Container(
          //margin: const EdgeInsets.only(top: 20.0),
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          
          child: ListView(
                    children: <Widget>[
                      /*new Padding(
                        padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
                        child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              DateTimePickerFormField(
                                  inputType: InputType.date,
                                  format: DateFormat("yyyy-MM-dd"),
                                  initialDate: DateTime(2019, 1, 1),
                                  editable: true,
                                  decoration: InputDecoration(
                                      labelText: 'Start Date',
                                      hasFloatingPlaceholder: false
                                  ),
                                  onChanged: (dt) {
                                    setState(() => start = dt);
                                    start = dt;
                                    print('Selected date: $start');
                                  },
                                
                                ),
                                DateTimePickerFormField(
                                  inputType: InputType.date,
                                  format: DateFormat("yyyy-MM-dd"),
                                  initialDate: DateTime(2019, 1, 1),
                                  editable: true,
                                  decoration: InputDecoration(
                                      labelText: 'End Date',
                                      hasFloatingPlaceholder: false
                                  ),
                                  onChanged: (dt) {
                                    setState(() => end = dt);
                                    end = dt;
                                    print('Selected date: $end');
                                  },
                                
                                ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: RaisedButton(
                                onPressed: () {
                                  print('Selected started date: $start');
                                  print('Selected ending date: $end');
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  new Center(
                                          child: new CircularProgressIndicator(),
                                  );
                                  setState(() {});
                                  if (_formKey.currentState.validate()) {
                                    // Process data.
                                  }
                                },
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ),*/
                      
                      new FutureBuilder<List<Menu>>(
            
                        future: fetchMenusFromGitHub(start,end),
                        //scrollDirection: Axis.vertical,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return new ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Card( //                           <-- Card widget
                                          child: ListTile(
                                            
                                            leading: CircleAvatar(
                                                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"),
                                              ),
                                            title: Text(snapshot.data[index].description),
                                            dense: true,
                                            
                                            subtitle: Text(snapshot.data[index].name),
                                            trailing: Icon(Icons.keyboard_arrow_right),
                                            onTap: () {
                                              this._showDialog(context,snapshot.data[index].name, snapshot.data[index].description, snapshot.data[index].price);
                                            },
                                          ),
                                        );
                                      },
                                  );
                                } 
                                else if (snapshot.hasError) {
                                  return new Text("${snapshot.error}");
                                }

                                // By default, show a loading spinner
                                return new Center(
                                          child: new CircularProgressIndicator(),
                                  );
                              }, 
                      ),
            ]
          ),
        ),
      );
  }
  void _showDialog(BuildContext context, String nom, String description, int price) {
    // flutter defined function
    showDialog(
      
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          
          title: new Text("Description détaillée du plat"),
          content: ListView(
            
                children: <Widget>[
                  
                  Image.network( // We're all widgets!
                                      'https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg',
                                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child:new Text("Nom du plat : "+"$nom"),
                  ), 
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child:new Text("prix : "+"$price"+ "cfa"),
                  ), 
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child:new Text("description : "+"$description"),
                  ),                  
                  
                  
                  
                  
                ]), 
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<List<Menu>> fetchMenusFromGitHub(DateTime start, DateTime end) async {
    print(start);
    print(end);
    final response = await http.get('https://api.github.com/Menus');
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<Menu> MenuList = createMenuList(responseJson,jsondata);
    return MenuList;
  }

  List<Menu> createMenuList(List data, List restau){
      List<Menu> list = new List();
  for (int i = 0; i < restau.length; i++) {
    String title = data[i]["login"];
    int id = data[i]["id"];
    String description = restau[i]["description"];
    String type = restau[i]["type"];
    int price = restau[i]['price'];
    String image = restau[i]["image"];
    Menu menu = new Menu(
        name: type,id: id, description: description, imageLink: image, price:price);
    list.add(menu);
  }
  print(list);
  return list;
  }
}



class Menu {
  String name;
  String description;
  String imageLink = 'https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg';
  int price;
  int id;
  Menu({this.name,this.id,this.description,this.imageLink,this.price});
}
String url = 'https://github.com/lucasmro/restaurant-api/blob/master/products';
String image1 = 'https://cdn.pixabay.com/photo/2016/05/26/14/11/chef-1417239_960_720.png';
String image2 = 'https://cdn.pixabay.com/photo/2015/09/02/12/43/meal-918639_960_720.jpg';
String image3 = 'https://cdn.pixabay.com/photo/2016/10/22/20/34/wine-1761613_960_720.jpg';
String image4 = 'https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg';
List jsondata = [
  {
			"id": "0",
			"type": "HAMBURGUER",
			"description": "X-EGG",
			"price": 1000,
      "image" :"https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"
		},
		{
			"id": "1",
			"type": "HAMBURGUER",
			"description": "X-EGG",
			"price": 1000,
      "image" :"https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"
		},
		{
			"id": "2",
			"type": "DRINK",
			"description": "Coca-Cola",
			"price": 400,
      "image" :"https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"
		},
		{
			"id": "3",
			"type": "DESSERT",
			"description": "Sorvete",
			"price": 4500,
      "image" :"https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"
		},
    {
			"id": "4",
			"type": "HAMBURGUER",
			"description": "X-EGG",
			"price": 1000,
       "image" :"https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"
		},
		{
			"id": "5",
			"type": "DRINK",
			"description": "Coca-Cola",
			"price": 400,
      "image" :"https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"
		},
		{
			"id": "6",
			"type": "DESSERT",
			"description": "Sorvete",
			"price": 4500,
      "image" :"https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"
		},
    {
			"id": "7",
			"type": "HAMBURGUER",
			"description": "X-EGG",
			"price": 1000,
      "image" :"https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"
		},
		{
			"id": "8",
			"type": "DRINK",
			"description": "Coca-Cola",
			"price": 400,
      "image" :"https://cdn.pixabay.com/photo/2017/01/16/17/45/pancake-1984716_960_720.jpg"
		}

	];
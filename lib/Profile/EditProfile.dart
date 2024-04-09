import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
      bool profile = true;
      bool address = false;
      bool contact = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 200.0, left: 8, right: 8),
            child: Column(
             
              children: <Widget> [
                
              Container(
                padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF675DC2),
                      width: 2,
                    ),
                  ),
                child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/assets/avatar_person.png'),
                  ),
              ),
               
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    children: [
                      
                     Column(
                      children:<Widget>[
                        Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                             IconButton.outlined(
                              onPressed: (){
                                setState(() {
                                  profile = !profile;
                                  if(address == true){
                                    address = !address;
                                  }
                                  if(contact == true ){
                                    contact = !contact;
                                  }
                                  else if(address == false && profile == false && contact == false){
                                    profile = true;
                                  }
                                });
                                }, icon: const Icon(Icons.person_rounded, color: Color(0xff675DC2))),
                             
                             IconButton.outlined(onPressed: (){
                                setState(() {
                                  address = !address;
                                  if(profile == true ){
                                    profile = !profile;
                                  }
                                  if( contact == true ){
                                    contact = !contact;
                                  }
                                  else if(address == false && profile == false && contact == false){
                                    profile = true;
                                  }});
                                }, icon: const Icon(Icons.email, color: Color(0xff675DC2))),
                            ],
                          ),
                      ),
                      ],
                    ),
                    Column(
                      children:<Widget>[
                         profile ? const Column(
                           children: [
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child:  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      labelText: 'First Name',
                                      hintText: 'John',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      ),
                                    ),
                                  ),
                                  
                                ),
                                Expanded(
                                  child:  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      labelText: 'Last Name',
                                      hintText: 'Doe',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                              ),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child:  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      labelText: 'Login/Username',
                                      hintText: 'jdUSer',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      ),
                                    ),
                                  ),
                                  
                                ),
                                Expanded(
                                  child:  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      labelText: 'Email',
                                      hintText: 'johndoe@email.com',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                              ),
                              Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child:  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                  labelText: 'Phone/Telephone',
                                  hintText: 'number123456',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  ),
                                ),
                              ),
                              
                            )
                          ],
                        ),
                           ],
                         ) : const SizedBox(),
                         address ? const Column(
                          children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child:  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: DropdownMenu(
                                  expandedInsets:EdgeInsets.zero,
                                  label: Text('Province or State'),
                                  enableFilter: true,
                                  initialSelection: 'State',
                                  dropdownMenuEntries: [
                                    DropdownMenuEntry(value: 'State', label: 'Province')
                                  ],
                                  inputDecorationTheme: InputDecorationTheme(
                                  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                                  border:OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                ),
                               )
                             ),
                              
                            ),
                            Expanded(
                              child:  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: DropdownMenu(
                                  expandedInsets:EdgeInsets.zero,
                                  label: Text('City'),
                                  enableFilter: true,
                                  initialSelection: 'City',
                                  dropdownMenuEntries: [
                                    DropdownMenuEntry(value: 'State', label: 'City')
                                  ],
                                  inputDecorationTheme: InputDecorationTheme(
                                  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                                  border:OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                ),
                             )
                              ),
                            )
                            
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child:  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    labelText: 'Postal',
                                    hintText: 'Postal0000',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(10))),
                                  ),
                                  style: TextStyle(height: 1),
                                ),
                              ),
                            ),
                            Expanded(
                              child:  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: DropdownMenu(
                                  expandedInsets:EdgeInsets.zero,
                                  label: Text('Country'),
                                  enableFilter: true,
                                  initialSelection: 'Country',
                                  dropdownMenuEntries: [
                                    DropdownMenuEntry(value: 'State', label: 'Country')
                                  ],
                                  inputDecorationTheme: InputDecorationTheme(
                                  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                                  border:OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                ),
                             )
                              ),
                            )
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child:  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                  labelText: 'Address',
                                  hintText: 'Arizona Phoenix',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  ),
                                ),
                              ),
                              
                            ),
                            
                          ],
                        )
                          ],
                         ) : const SizedBox()
                    
                      ],
                    )
                    ],
                    
                  ),
              ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: MediaQuery.of(context).viewInsets,
      child: Container(
              padding:const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF675DC2)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
      ),
    );
  }
}
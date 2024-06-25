import 'package:flutter/material.dart';
import 'package:register/Page/Index.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _IndexState();
}

class _IndexState extends State<Register> {
  double _currentSliderValue = 20;
  double _currentSliderValues = 20;
  String _selectedMajor = 'Computer Science';
  List<String> _selectedLanguages = [];
  bool _isAgreed = false;
  String _imageUrl =
      'https://i.pinimg.com/236x/68/12/3d/68123d4795decc99091bb4b3d9c560c2.jpg';

  String _username = '';

  void _setImageUrl(String url) {
    setState(() {
      _imageUrl = url;
    });
  }

  void _showImageUrlDialog() {
    TextEditingController urlController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Image URL'),
          content: TextField(
            controller: urlController,
            decoration: InputDecoration(hintText: "Enter image URL"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (urlController.text.isNotEmpty) {
                  _setImageUrl(urlController.text);
                }
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
        backgroundColor: Colors.blue, // Set AppBar color to blue
        iconTheme: IconThemeData(
          color: Colors.white, // Change menu button color to white
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/c4/dd/d7/c4ddd74f10657ab9f077e69d26a83206.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 30, // Added space above CircleAvatar for aesthetics
                ),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(_imageUrl),
                ),
                SizedBox(
                  height: 20, // Added space below CircleAvatar for aesthetics
                ),
                ElevatedButton(
                  onPressed: _showImageUrlDialog,
                  child: Text('Enter Image URL',
                      style:
                          TextStyle(color: Colors.white)), // Text color white
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Button color blue
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'), // Font style
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Register",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Roboto'), // Text color white
                ),
                SizedBox(height: 10),
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Roboto'), // Text color white
                ),
                TextField(
                  style: TextStyle(color: Colors.black), // Text color black
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    hintText: 'Enter your name',
                    hintStyle:
                        TextStyle(color: Colors.black), // Hint text color white
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 15.0,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Roboto'), // Text color white
                ),
                TextField(
                  onChanged: (value) {
                    _username = value;
                  },
                  style: TextStyle(color: Colors.black), // Text color black
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    hintText: 'Enter your username',
                    hintStyle:
                        TextStyle(color: Colors.black), // Hint text color white
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 15.0,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Roboto'), // Text color white
                ),
                TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.black), // Text color black
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    hintText: 'Enter your password',
                    hintStyle:
                        TextStyle(color: Colors.black), // Hint text color white
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Weight",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Roboto'), // Text color white
                ),
                Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Height",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Roboto'), // Text color white
                ),
                Slider(
                  value: _currentSliderValues,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValues.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValues = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Major",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Roboto'), // Text color white
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedMajor = 'Computer Science';
                        });
                      },
                      child: Text(
                        'Computer Science',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: _selectedMajor == 'Computer Science'
                            ? Colors.grey.shade400
                            : Colors.pink.shade100,
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedMajor = 'IT';
                        });
                      },
                      child: Text('IT', style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: _selectedMajor == 'IT'
                            ? Colors.grey.shade400
                            : Colors.purple.shade100,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Language",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Roboto'), // Text color white
                ),
                CheckboxListTile(
                  title: Text("Thai", style: TextStyle(color: Colors.black)),
                  value: _selectedLanguages.contains("Thai"),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        _selectedLanguages.add("Thai");
                      } else {
                        _selectedLanguages.remove("Thai");
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text("English", style: TextStyle(color: Colors.black)),
                  value: _selectedLanguages.contains("English"),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        _selectedLanguages.add("English");
                      } else {
                        _selectedLanguages.remove("English");
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text(
                    "Chinese",
                    style: TextStyle(color: Colors.black),
                  ),
                  value: _selectedLanguages.contains("Chinese"),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        _selectedLanguages.add("Chinese");
                      } else {
                        _selectedLanguages.remove("Chinese");
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                SizedBox(height: 10),
                CheckboxListTile(
                  title: Text(
                    "Agree Conditions terms",
                    style: TextStyle(color: Colors.black),
                  ),
                  value: _isAgreed,
                  onChanged: (newValue) {
                    setState(() {
                      _isAgreed = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isAgreed
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Index(
                                title: 'Welcome',
                                username: _username,
                                imageUrl: _imageUrl, // Pass image URL here
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Changed button color to orange
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto', // Font style
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Student {
  String name;
  int present = 0;

  Student(this.name);

  double get percentage {
    double p = present * 3;

    if (p > 100) {
      p = 100;
    }

    return p;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Tracker',
      home: HelloTeacherPage(),
    );
  }
}

class HelloTeacherPage extends StatelessWidget {
  const HelloTeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school_rounded, size: 90, color: Colors.white),

              SizedBox(height: 20),

              Text(
                "Hello Teacher",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Welcome to Attendance Tracker",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 50),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF11998E),
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                ),
                child: Text(
                  "Go to Login",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {

  // Fixed teacher credentials.
  // Change these two values if you want a different username/password.
  final String correctUsername = "teacher";
  final String correctPassword = "teacher123";

  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  LoginPage({super.key});

  void showLoginSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 32),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Login Successful",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            "Welcome Teacher!",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              child: Text("Continue", style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
            )
          ],
        );
      },
    );
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: Row(
            children: [
              Icon(Icons.error_rounded, color: Colors.red, size: 32),
              SizedBox(width: 10),
              Text(
                "Login Failed",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              child: Text("OK", style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void handleLogin(BuildContext context) {

    String enteredUser = user.text.trim();
    String enteredPass = pass.text.trim();

    if (enteredUser != correctUsername) {
      showErrorDialog(context, "Invalid Username! Only teacher can login.");
      return;
    }

    if (enteredPass != correctPassword) {
      showErrorDialog(context, "Password is incorrect.");
      return;
    }

    showLoginSuccessDialog(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Card(
                elevation: 14,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      CircleAvatar(
                        radius: 38,
                        backgroundColor: Color(0xFF11998E),
                        child: Icon(Icons.person, size: 42, color: Colors.white),
                      ),

                      SizedBox(height: 14),

                      Text(
                        "Teacher Login",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF11998E),
                        ),
                      ),

                      SizedBox(height: 30),

                      TextField(
                        controller: user,
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "teacher",
                          prefixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      SizedBox(height: 18),

                      TextField(
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF11998E),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            handleLogin(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  final List<String> subjects = [
    "Mobile Computing",
    "Web Technology",
    "Economics",
    "DSA",
    "Java",
  ];

  final List<Student> students = [

    Student("Pankaj"),
    Student("Anamika"),
    Student("Aaditya"),
    Student("Kamal"),
    Student("Sudhir"),
    Student("Kiran"),
    Student("Nishant"),
    Student("Asawari"),
    Student("Rohit"),
    Student("Priya"),
    Student("Vikram"),
    Student("Sneha"),
    Student("Arjun"),
    Student("Meera"),
    Student("Suresh"),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(

      length: subjects.length,

      child: Scaffold(

        appBar: AppBar(

          title: Text(
            "Attendance System",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          backgroundColor: Color(0xFF11998E),

          bottom: TabBar(
            isScrollable: true,
            tabs: subjects.map((s) => Tab(text: s)).toList(),
          ),
        ),

        body: TabBarView(
          children: subjects.map((subject) {
            return AttendancePage(
              subject: subject,
              students: students,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class AttendancePage extends StatefulWidget {

  final String subject;
  final List<Student> students;

 const AttendancePage({super.key, required this.subject, required this.students});

  @override
State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {

  Map<String, bool> status = {};

  int presentCount() {
    int c = 0;
    status.forEach((k, v) {
      if (v == true) c++;
    });
    return c;
  }

  int absentCount() {
    int c = 0;
    status.forEach((k, v) {
      if (v == false) c++;
    });
    return c;
  }

  void showPercentageDialog() {

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          title: Text(
            "Students Attendance Percentage",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: widget.students.map((s) {

                return Text(
                  "${s.name} : ${s.percentage.toStringAsFixed(1)} %",
                  style: TextStyle(fontSize: 18),
                );

              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void showReportCard() {

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          title: Text(
            "Attendance Report Card",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          content: SingleChildScrollView(

            child: Column(

              children: widget.students.map((s) {

                String msg;

                if (s.percentage >= 75) {
                  msg = "Nice consistency Keep it up!!";
                } else {
                  msg = "Kindly maintain your attendance above 75%";
                }

                return Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "${s.name} : ${s.percentage.toStringAsFixed(1)} %  →  $msg",
                    style: TextStyle(fontSize: 18),
                  ),
                );

              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        SizedBox(height: 10),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF11998E),
            foregroundColor: Colors.white,
          ),
          child: Text("View Students Percentage"),
          onPressed: () {
            showPercentageDialog();
          },
        ),

        SizedBox(height: 10),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF11998E),
            foregroundColor: Colors.white,
          ),
          child: Text("View Report Card"),
          onPressed: () {
            showReportCard();
          },
        ),

        Expanded(

          child: ListView.builder(

            itemCount: widget.students.length,

            itemBuilder: (context, index) {

              Student student = widget.students[index];

              return Container(

                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(
                          student.name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),

                        Text(
                          "Attendance: ${student.percentage.toStringAsFixed(1)} %",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),

                    Row(

                      children: [

                        ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),

                          child: Text("Present"),

                          onPressed: () {

                            setState(() {

                              status[student.name] = true;
                              student.present++;

                            });
                          },
                        ),

                        SizedBox(width: 10),

                        ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),

                          child: Text("Absent"),

                          onPressed: () {

                            setState(() {

                              status[student.name] = false;

                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.all(16),

          child: Text(

            "Present: ${presentCount()}  |  Absent: ${absentCount()}",

            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

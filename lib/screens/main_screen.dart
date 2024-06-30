import 'package:attendex/screens/academic_calendar_screen.dart';
import 'package:attendex/screens/attendance_screen.dart';
import 'package:attendex/screens/exam_schedule_screen.dart';
import 'package:attendex/screens/fees_screen.dart';
import 'package:attendex/screens/notification_screen.dart';
import 'package:attendex/screens/results_screen.dart';
import 'package:attendex/screens/timetable_screen.dart';
import 'package:attendex/screens/transport_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ATTENDEX'),
        backgroundColor: Color.fromARGB(255, 117, 188, 242),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.indigo],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity, height: 180,
            //padding: EdgeInsets.all(),
            color: Color.fromARGB(238, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  // backgroundImage: AssetImage('assets/profile_picture.jpg'), // Add your profile picture
                  radius: 40.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '9928XXXXXXX | email@gmail.com',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Branch: CS   Roll No: XX    Batch: XX',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: [
                _buildGridItem(context, 'Attendance', Icons.check_circle,
                    AttendanceScreen()),
                _buildGridItem(context, 'Academic Calendar',
                    Icons.calendar_today, AcademicCalendarScreen()),
                _buildGridItem(
                    context, 'Timetable', Icons.schedule, TimetableScreen()),
                _buildGridItem(context, 'Fees', Icons.account_balance_wallet,
                    FeesScreen()),
                _buildGridItem(context, 'Transport', Icons.directions_bus,
                    TransportScreen()),
                _buildGridItem(context, 'Exam Schedule', Icons.event,
                    ExamScheduleScreen()),
                _buildGridItem(
                    context, 'Results', Icons.assessment, ResultsScreen()),
                _buildGridItem(context, 'Notification', Icons.notifications,
                    NotificationScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(
      BuildContext context, String title, IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}

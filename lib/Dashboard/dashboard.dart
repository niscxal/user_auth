import 'package:authentication_authorization/Dashboard/analytics.dart';
import 'package:authentication_authorization/Dashboard/contact_us.dart';
import 'package:authentication_authorization/Dashboard/marketing.dart';
import 'package:authentication_authorization/Dashboard/report.dart';
import 'package:authentication_authorization/Dashboard/Sales%20Page/sales.dart';
import 'package:authentication_authorization/Dashboard/settings.dart';
import 'package:authentication_authorization/login.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
    //  List<Widget> _selectedIndex = <Widget>
     final screen = [
      Dashboard(),
      // Analytics(),
      ContactUsPage()
    ];

  void  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        // title: Text("CRM Dashboard", style: TextStyle(color: Colors.white),),
        flexibleSpace: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> const Loginpage()));
                  }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                ),
                 Text("CRM Dashboard", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
          )
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Implement filter action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Graph Section
              Text(
                'Sales Performance',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 200, child: _buildLineChart()),

              SizedBox(height: 20),
              // Grid Dashboard Items
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildDashboardItem(
                      onTap: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context)=> AnalyticsPage())),
                    icon: Icons.analytics,
                    title: 'Analytics',
                    color: Colors.blue,
                  ),
                  _buildDashboardItem(
                    onTap: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context)=> ContactUsPage())),
                    icon: Icons.contact_phone,
                    title: 'Contacts',
                    color: Colors.green,

                  ),
                  _buildDashboardItem(
                    onTap:() =>  Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context)=> MarketingPage())),
                    icon: Icons.campaign,
                    title: 'Marketing',
                    color: Colors.orange,
                  ),
                  _buildDashboardItem(
                    onTap: () => 
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => SalesPage(),)),
                    icon: Icons.sell,
                    title: 'Sales',
                    color: Colors.red,
                  ),
                  _buildDashboardItem(
                    onTap: () => 
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => ReportPage(),)),
                    icon: Icons.report,
                    title: 'Reports',
                    color: Colors.purple,
                  ),
                  _buildDashboardItem(
                    onTap: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context)=> SettingsPage())),
                    icon: Icons.settings,
                    title: 'Settings',
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=> AnalyticsPage()));
            },
            icon: const Icon(Icons.analytics),),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => ContactUsPage()));
            }, 
            icon: const Icon(Icons.contact_phone)),
            label: 'Contacts',)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurpleAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  // Method to build a colorful line chart using fl_chart
  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, interval: 1),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, interval: 1),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.black26),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 2),
              FlSpot(2, 5),
              FlSpot(3, 3.1),
              FlSpot(4, 4),
              FlSpot(5, 3),
              FlSpot(6, 4),
            ],
            isCurved: true,
            barWidth: 4,
            belowBarData: BarAreaData(show: false),
            dotData: FlDotData(show: true),
            color:Colors.blueAccent,
            
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem( {
    void Function()? onTap,
    required IconData icon,
    required String title,
    required Color color,
  }) 
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

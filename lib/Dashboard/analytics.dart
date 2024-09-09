import 'package:authentication_authorization/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Business Analytics'),
        backgroundColor: Colors.purple,
        flexibleSpace: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: IconButton(onPressed: (){
                    // Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=> Dashboard()));
                  }, 
                  icon: Icon(Icons.arrow_back, color: Colors.white,)
                  ),
                ),
                 Text("Analytics", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pie Chart Section
              Text(
                'Sales Distribution',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Center(
                child: SizedBox(
                  height: 200,
                  child: _buildPieChart(),
                ),
              ),
              SizedBox(height: 20),
              
              // Summary Cards Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryCard(
                    title: 'Total Sales',
                    value: '\$150,000',
                    color: Colors.blueAccent,
                  ),
                  _buildSummaryCard(
                    title: 'New Leads',
                    value: '1,200',
                    color: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryCard(
                    title: 'Conversion Rate',
                    value: '35%',
                    color: Colors.orange,
                  ),
                  _buildSummaryCard(
                    title: 'Customer Retention',
                    value: '80%',
                    color: Colors.purple,
                  ),
                ],
              ),
              
              SizedBox(height: 30),
              
              // Recent Activities Section
              Text(
                'Recent Activities',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildActivityList(),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build the Pie Chart using fl_chart
  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: _buildPieChartSections(),
        centerSpaceRadius: 40,
        sectionsSpace: 4,
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: 40,
        title: '40%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 30,
        title: '30%',
        radius: 50,
        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 20,
        title: '20%',
        radius: 55,
        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 10,
        title: '10%',
        radius: 50,
        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }

  // Method to build summary cards for key metrics
  Widget _buildSummaryCard({required String title, required String value, required Color color}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build a list of recent activities
  Widget _buildActivityList() {
    final activities = [
      'Lead Conversion - John Doe',
      'New Sale - Jane Smith',
      'Marketing Campaign Launch',
      'Monthly Performance Report',
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          child: ListTile(
            leading: Icon(Icons.check_circle_outline, color: Colors.blueAccent),
            title: Text(activities[index]),
            subtitle: Text('2 hours ago'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle tap for more details or actions
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Clicked on ${activities[index]}')),
              );
            },
          ),
        );
      },
    );
  }
}

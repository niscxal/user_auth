import 'package:authentication_authorization/Dashboard/Sales%20Page/revenue_analysis.dart';
import 'package:authentication_authorization/Dashboard/Sales%20Page/sales_target.dart';
import 'package:authentication_authorization/Dashboard/Sales%20Page/teams%20_performance.dart';
import 'package:authentication_authorization/Dashboard/dashboard.dart';
import 'package:authentication_authorization/Dashboard/report.dart';
import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                ),
                 Text("Sales", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
          )
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sales Analytics Section
            SalesSection(
              icon: Icons.analytics,
              title: 'Sales Analytics',
              description:
                  'Understand your sales data with in-depth analytics. Identify trends, review product performance, and make data-driven decisions.',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RevenueAnalysisPage()),
                );
              },
            ),
            SizedBox(height: 16),

            // Sales Reports Section
            SalesSection(
              icon: Icons.report,
              title: 'Sales Reports',
              description:
                  'Generate comprehensive sales reports. View monthly, quarterly, and annual performance data to track growth and plan strategies.',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ReportPage()),
                );
              },
            ),
            SizedBox(height: 16),

            // Sales Targets Section
            SalesSection(
              icon: Icons.track_changes,
              title: 'Sales Targets',
              description:
                  'Set ambitious sales goals and monitor your progress. Achieve new milestones and drive your business forward.',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SalesTargetPage()),
                );
              },
            ),
            SizedBox(height: 16),

            // Team Performance Section
            SalesSection(
              icon: Icons.group,
              title: 'Team Performance',
              description:
                  'Evaluate the performance of your sales team. Recognize top performers and motivate your team to achieve more.',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TeamPerformancePage()),
                );
              },
            ),
            SizedBox(height: 16),

            // Customer Feedback Section
            SalesSection(
              icon: Icons.feedback,
              title: 'Customer Feedback',
              description:
                  'Gather valuable customer insights. Analyze feedback and reviews to enhance your sales strategy and improve customer satisfaction.',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CustomerFeedbackPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SalesSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const SalesSection({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder screens for different sections


// class MonthlyReportPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Monthly Report'),
//       ),
//       body: Center(
//         child: Text('Monthly Report Page'),
//       ),
//     );
//   }
// }

// class SetSalesGoalsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Set Sales Goals'),
//       ),
//       body: Center(
//         child: Text('Set Sales Goals Page'),
//       ),
//     );
//   }
// }

// class TeamPerformancePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Team Performance'),
//       ),
//       body: Center(
//         child: Text('Team Performance Page'),
//       ),
//     );
//   }
// }

class CustomerFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Feedback'),
      ),
      body: Center(
        child: Text('Customer Feedback Page'),
      ),
    );
  }
}

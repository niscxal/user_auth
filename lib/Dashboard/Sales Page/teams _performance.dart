import 'package:authentication_authorization/Dashboard/Sales%20Page/sales.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(TeamPerformanceApp());
// }

// class TeamPerformanceApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Team Performance',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: TeamPerformancePage(),
//     );
//   }
// }

class TeamPerformancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        // title: Text('Team Performance'),
        flexibleSpace: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: IconButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=> SalesPage()));
                  }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                ),
                 Text("Sales Target", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
          )
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white,),
            onPressed: () {
              // Open settings
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
              // Team Overview Section
              _buildTeamOverviewSection(),

              SizedBox(height: 20),

              // Performance Metrics Section
              _buildPerformanceMetricsSection(),

              SizedBox(height: 20),

              // Task and Project Status Section
              _buildTaskStatusSection(),

              SizedBox(height: 20),

              // Goals and Achievements Section
              _buildGoalsSection(),

              SizedBox(height: 20),

              // Summary and Reports Section
              _buildSummaryReportsSection(),

              SizedBox(height: 20),

              // Team Communication and Feedback Section
              _buildCommunicationSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for adding new performance data
        },
        child: Icon(Icons.add),
        tooltip: 'Add Performance Data',
      ),
    );
  }

  Widget _buildTeamOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Team Overview',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg"),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("https://images.pexels.com/photos/1898555/pexels-photo-1898555.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2023/07/03/13/13/ai-generated-8104159_1280.jpg'),
            ),
          ],
        ),
        SizedBox(height: 10),
        DropdownButton<String>(
          items: ['Team A', 'Team B', 'Team C']
              .map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
          onChanged: (_) {},
          hint: Text('Select Team'),
        ),
      ],
    );
  }

  Widget _buildPerformanceMetricsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance Metrics',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text('Tasks Completed'),
                      subtitle: Text('75 out of 100'),
                    ),
                    LinearProgressIndicator(
                      value: 0.75,
                      color: Colors.green,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.flag, color: Colors.orange),
                      title: Text('Milestones Achieved'),
                      subtitle: Text('3 out of 5'),
                    ),
                    LinearProgressIndicator(
                      value: 0.6,
                      color: Colors.orange,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTaskStatusSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task and Project Status',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ExpansionTile(
          leading: Icon(Icons.task),
          title: Text('Project Alpha'),
          subtitle: Text('Deadline: 30th Sep'),
          children: <Widget>[
            ListTile(
              title: Text('Task 1: Research'),
              trailing: Checkbox(value: true, onChanged: (_) {}),
            ),
            ListTile(
              title: Text('Task 2: Development'),
              trailing: Checkbox(value: false, onChanged: (_) {}),
            ),
            ListTile(
              title: Text('Task 3: Testing'),
              trailing: Checkbox(value: false, onChanged: (_) {}),
            ),
          ],
        ),
        ExpansionTile(
          leading: Icon(Icons.task),
          title: Text('Project Beta'),
          subtitle: Text('Deadline: 15th Oct'),
          children: <Widget>[
            ListTile(
              title: Text('Task 1: Planning'),
              trailing: Checkbox(value: true, onChanged: (_) {}),
            ),
            ListTile(
              title: Text('Task 2: Implementation'),
              trailing: Checkbox(value: true, onChanged: (_) {}),
            ),
            ListTile(
              title: Text('Task 3: Review'),
              trailing: Checkbox(value: false, onChanged: (_) {}),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCommunicationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Team Communication & Feedback',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Leave a comment...',
            border: OutlineInputBorder(),
          ),
          maxLines: 2,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Send comment
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildGoalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Goals & Achievements',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: [
            Chip(
              label: Text('Increase Sales by 20%'),
              avatar: Icon(Icons.trending_up, color: Colors.green),
            ),
            Chip(
              label: Text('Reduce Costs by 10%'),
              avatar: Icon(Icons.trending_down, color: Colors.red),
            ),
            Chip(
              label: Text('Launch New Feature'),
              avatar: Icon(Icons.new_releases, color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryReportsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary & Reports',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            // Toggle panel expansion
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('Weekly Report'),
                );
              },
              body: ListTile(
                title: Text('Summary of this week\'s performance...'),
              ),
              isExpanded: false,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('Monthly Report'),
                );
              },
              body: ListTile(
                title: Text('Summary of this month\'s performance...'),
              ),
              isExpanded: false,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Overview',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Metrics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Communication',
        ),
      ],
      onTap: (index) {
        // Handle navigation
      },
    );
  }
}

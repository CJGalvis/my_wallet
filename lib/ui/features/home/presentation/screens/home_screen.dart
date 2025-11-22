import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('https://avatar.iran.liara.run/public'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_important_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Pockets(),
            const SizedBox(height: 20),
            Incomes(),
            const SizedBox(height: 20),
            Expenses(),
            const SizedBox(height: 20),
            Balance(),
            const SizedBox(height: 20),
            RecordsCategories(),
            const SizedBox(height: 20),
            LastRcords(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class Balance extends StatelessWidget {
  const Balance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      width: double.infinity,
      height: 80,
      child: Center(
        child: Text('Balance actual'),
      ),
    );
  }
}

class LastRcords extends StatelessWidget {
  const LastRcords({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      width: double.infinity,
      height: 300,
      child: Center(
        child: Text('Ultimos registros'),
      ),
    );
  }
}

class RecordsCategories extends StatelessWidget {
  const RecordsCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      width: double.infinity,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('top de castos'),
          const SizedBox(height: 20),
          Text('gasto 1'),
          Text('gasto 2'),
          Text('gasto 3'),
          Text('gasto 4'),
        ],
      ),
    );
  }
}

class Expenses extends StatelessWidget {
  const Expenses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: 80,
      child: Center(
        child: Text('Egresos'),
      ),
    );
  }
}

class Incomes extends StatelessWidget {
  const Incomes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 80,
      child: Center(
        child: Text('Ingresos'),
      ),
    );
  }
}

class Pockets extends StatelessWidget {
  const Pockets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 10),
                width: 150,
                color: Colors.red,
              );
            },
          ),
        ),
      ),
    );
  }
}

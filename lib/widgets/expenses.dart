
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expences_list.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key}); 

  @override
  State<Expenses> createState()=> _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpences  = [
    Expense(
      title: 'Flutter Course', 
      amount: 19.99, 
      date: DateTime.now(), 
      category: Category.work,
    ),
     Expense(
      title: 'Cinema', 
      amount: 15.69, 
      date: DateTime.now(), 
      category: Category.leisure,
    ),
  ];

  void  _openAddExpenseOverly(){
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context, 
      builder:(ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }
  void _addExpense(Expense expense){
    setState(() {
         _registeredExpences.add(expense);
    });
  }
  void _removeExpense(Expense expense){
    final expenseIndex = _registeredExpences.indexOf(expense);
    setState(() {
      _registeredExpences.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('Epense Deleted.'),
        action: SnackBarAction(
        label: 'Undo',
        onPressed: (){
          setState(() {
            _registeredExpences.insert(expenseIndex, expense);
          });
        },
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent =const  Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if(_registeredExpences.isNotEmpty){
      mainContent= ExpencesesList(
        expenses:_registeredExpences,
        onRemoveExpense: _removeExpense,);
         
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverly,
            icon: const Icon(Icons.add),
            ), 
        ],
      ),
      body:width <600 ? Column(
        children: [ 
          //toolbar with the add button ==> row()

         Chart(expenses: _registeredExpences),
         Expanded(child:mainContent
         ),
        ],
      ):Row(children: [
        Expanded(child:  Chart(expenses: _registeredExpences),
        ),
         Expanded(child:mainContent
         ), 
      ],),
    );
  }
}
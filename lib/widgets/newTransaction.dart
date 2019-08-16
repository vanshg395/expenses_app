import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function selectHandler;

  NewTransaction(this.selectHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.selectHandler(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              elevation: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      // onChanged: (val) => titleInput = val,
                      controller: titleController,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Amount"),
                      // onChanged: (val) => amountInput = val,
                      controller: amountController,
                      onSubmitted: (_) => submitData(),
                    ),
                    FlatButton(
                      child: Text("Add Transaction", style: Theme.of(context).textTheme.title,),
                      onPressed: submitData,
                    )
                  ],
                ),
              ),
            );
  }
}
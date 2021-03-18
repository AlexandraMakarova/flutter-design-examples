import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';

  List<String> _powers = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  String _selectedOption = 'Volar';

  TextEditingController _inputDateFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createInput(),
          Divider(),
          _createEmailField(),
          Divider(),
          _createPasswordField(),
          Divider(),
          _createDateField(context),
          Divider(),
          _createDropdownField(),
          Divider(),
          _createPerson(),
        ],
      ),
      //  child: child,
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter:
              (_name != null) ? Text('${_name.length}') : Text('No characters'),
          hintText: 'Name of person',
          labelText: 'Name',
          helperText: 'First name only',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        _name = value;
        setState(() {
          print(_name);
        });
      },
    );
  }

  Widget _createEmailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Valid email only',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  Widget _createPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) => setState(() {
        _password = value;
      }),
    );
  }

  Widget _createDateField(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateFieldController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Birth date',
        labelText: 'Birth date',
        suffixIcon: Icon(Icons.perm_contact_cal_outlined),
        icon: Icon(Icons.calendar_today_outlined),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  Future _selectDate(BuildContext context) async {
    DateTime _picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2022),
      locale: Locale('ru', 'RU'),
    );

    if (_picked != null) {
      setState(() {
        _date = _picked.toString();
        _inputDateFieldController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    // List<DropdownMenuItem<String>> list = new List.empty();
    List<DropdownMenuItem<String>> list = [];

    _powers.forEach((power) {
      list.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });
    return list;
  }

  Widget _createDropdownField() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _selectedOption,
            items: getOptionsDropdown(),
            onChanged: (option) {
              setState(() {
                _selectedOption = option;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name is: $_name'),
      subtitle: Text('Email is: $_email'),
      trailing: Text(_selectedOption),
    );
  }
}

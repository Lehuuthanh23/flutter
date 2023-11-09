import 'package:flutter/material.dart';

const List<String> list = <String>[
  'CLB Âm nhạc',
  'CLB Võ thuật',
  'CLB Phần cứng',
  'CLB Tin học'
];

class FormDangKy extends StatefulWidget {
  FormDangKy({super.key});

  @override
  State<FormDangKy> createState() => _FormDangKyState();
}

class _FormDangKyState extends State<FormDangKy> {
  Sex? _sex = Sex.female;
  Role? _role = Role.student;
  String val = list.first;
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ĐĂNG KÝ',
              ),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_balance_outlined,
                  ),
                  hintText: 'Nhập họ tên: ',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Giới tính',
                  ),
                  RadioListTile<Sex>(
                    title: const Text('Nam'),
                    value: Sex.male,
                    groupValue: _sex,
                    onChanged: (Sex? value) {
                      setState(() {
                        _sex = value;
                      });
                    },
                  ),
                  RadioListTile<Sex>(
                    title: const Text('Nữ'),
                    value: Sex.female,
                    groupValue: _sex,
                    onChanged: (Sex? value) {
                      setState(() {
                        _sex = value;
                      });
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vai trò',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: RadioListTile<Role>(
                          title: const Text('Giáo viên'),
                          value: Role.teacher,
                          groupValue: _role,
                          onChanged: (Role? value) {
                            setState(() {
                              _role = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: RadioListTile<Role>(
                          title: const Text('Học sinh'),
                          value: Role.student,
                          groupValue: _role,
                          onChanged: (Role? value) {
                            setState(() {
                              _role = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DropdownButton<String>(
                value: val,
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
                style: const TextStyle(color: Colors.black),
                onChanged: (String? value) {
                  setState(() {
                    val = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Colors.blue.withOpacity(.5)),
                    ),
                    hintText: 'Enter Remark: ',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue))),
              ),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
                fillColor: MaterialStateProperty.resolveWith((getColor)),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber)),
                child: const Text("Simple Text Button"),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.4);
                      }
                      return null;
                    },
                  ),
                ),
                child: const Text("Text Button with pseudo"),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.yellow,
                ),
                child: const Text(
                    'ElevatedButton with custom foreground/background'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum Sex { male, female }

enum Role { teacher, student }

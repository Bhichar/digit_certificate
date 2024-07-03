import 'package:digit_certification/app_utils.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../models/birth_registration/birth_registration_model.dart';
import 'registration_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final TextEditingController _idController = TextEditingController();
  List<BirthRegistrationModel> _displayList = [];

  @override
  void initState() {
    super.initState();
    _displayList = DummyData.dummyList;
  }

  Future<void> _searchById() async {
    String id = _idController.text;
    if (id.isEmpty) {
      _displayList = DummyData.dummyList;
    } else {
      _displayList = DummyData.dummyList
          .where((entry) => entry.tenantId.contains(id))
          .toList();
    }

    setState(() {});
  }

  void _navigateToFormsScreen(BirthRegistrationModel? details) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RegistrationFormScreen(details: details)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birth Records'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 6,
                  child: DigitTextField(
                      label: 'Tenant ID', controller: _idController),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: _searchById,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: const DigitColors().burningOrange,
                    child: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _displayList.length,
                itemBuilder: (context, index) {
                  final result = _displayList[index];
                  return DigitCard(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text(
                                  'Baby Details',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              DigitIconButton(
                                icon: Icons.mode_edit_outline_outlined,
                                iconColor: Colors.orange,
                                onPressed: () {
                                  _navigateToFormsScreen(result);
                                },
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                          _titleValueRow(
                              'Baby First Name', result.babyFirstName),
                          _titleValueRow('Doctor Name', result.doctorName),
                          _titleValueRow('Gender',
                              AppUtils.getNameFromId(result.babygender) ?? ''),
                          _titleValueRow('Weight', result.babyWeight),
                          _titleValueRow('Hospital Name', result.hospitalName),
                          _titleValueRow('Mother', result.mother),
                          _titleValueRow('Place of Birth', result.placeOfBirth),
                          _titleValueRow('Tenant ID', result.tenantId),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            DigitElevatedButton(
              onPressed: () => _navigateToFormsScreen(null),
              child: const Text('Register New Birth'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleValueRow(String heading, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '$heading:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

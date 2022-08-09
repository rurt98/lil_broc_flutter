import 'package:flutter/material.dart';
import 'package:lil_broc/widgets/custom_title_button.dart';

enum PerfilSeccion { badges, settings }

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  PerfilSeccion perfilSeccion = PerfilSeccion.badges;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 4.0,
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: false,
        title: const CustomTitleButton(
          title: "Dashboard",
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          _buildHeader(theme),
          if (perfilSeccion == PerfilSeccion.badges) ...[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("BADGES"),
                ],
              ),
            )
          ] else ...[
            const SizedBox(
              height: 18,
            ),
            _buildSettings()
          ],
        ],
      ),
    );
  }

  Widget _buildSettings() {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          _buildListTile(
            icon: Icons.message_sharp,
            txt: "Contact us",
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.star,
              color: Colors.grey,
            ),
            title: const Text(
              "Rate our App",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(txt: "Delete Account", onTap: () {}),
              _buildButton(txt: "Log Out", onTap: () {}),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "The information contained in Lil Broc is for general information purposes only and is not intended as professional dietary advice. We make no warranties or representations as to food life expectancy should be construed only as estimates.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile({
    required String txt,
    required Function() onTap,
    required IconData icon,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
      title: Text(
        txt,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildButton({required Function() onTap, required String txt}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 3.0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FittedBox(
                child: Text(
                  txt,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1.0),
            blurRadius: 15.0,
            offset: const Offset(0.0, 0.75),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: FittedBox(
            child: Column(
              children: [
                const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 140,
                ),
                const Text(
                  "Uriel Torres",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTap(
                      txt: "BADGES",
                      isActive: perfilSeccion == PerfilSeccion.badges,
                      onTap: () => setState(() {
                        perfilSeccion = PerfilSeccion.badges;
                      }),
                    ),
                    _buildTap(
                      txt: "SETTINGS",
                      isActive: perfilSeccion == PerfilSeccion.settings,
                      onTap: () => setState(() {
                        perfilSeccion = PerfilSeccion.settings;
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTap({
    required String txt,
    required Function() onTap,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: Text(
          txt,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : Colors.white38,
          ),
        ),
      ),
    );
  }
}

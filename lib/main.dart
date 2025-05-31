import 'package:flutter/cupertino.dart';

/// Aplicación principal con estilo Cupertino (iOS) que muestra un sistema de menú
/// con navegación entre pantallas.
void main() {
  runApp(MyApp());
}

/// Widget raíz de la aplicación
/// Define el tema y la página inicial con estilo Cupertino.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Menu App',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        brightness: Brightness.light,
      ),
      home: LoginPage(),
    );
  }
}

/// Pantalla de inicio de sesión con diseño Cupertino
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CupertinoColors.activeBlue.withOpacity(0.7),
              CupertinoColors.activeBlue,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        // Logo o imagen
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CupertinoColors.systemBlue.withOpacity(0.1),
                          ),
                          child: Icon(
                            CupertinoIcons.person,
                            size: 60,
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Bienvenido',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Campo de usuario
                        CupertinoTextField(
                          padding: EdgeInsets.all(16),
                          placeholder: 'Usuario',
                          prefix: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(CupertinoIcons.person),
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey6,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Campo de contraseña
                        CupertinoTextField(
                          padding: EdgeInsets.all(16),
                          placeholder: 'Contraseña',
                          obscureText: true,
                          prefix: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(CupertinoIcons.lock),
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey6,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Text('¿Olvidaste tu contraseña?'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Botón de inicio de sesión
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: CupertinoButton(
                            color: CupertinoColors.activeBlue,
                            borderRadius: BorderRadius.circular(10),
                            child: Text(
                              'INICIAR SESIÓN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => MainMenuPage(),
                                ),
                                (route) => false,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Modelo de datos para los elementos del menú
class MenuItem {
  final String nombre;
  final String detalle;
  final IconData icono;

  MenuItem({required this.nombre, required this.detalle, required this.icono});
}

/// Lista de elementos del menú principal actualizada a 3 opciones
List<MenuItem> menuItems = [
  MenuItem(
    nombre: 'Preguntas Frecuentes',
    detalle: 'Consulta información común',
    icono: CupertinoIcons.question_circle,
  ),
  MenuItem(
    nombre: 'Formulario',
    detalle: 'Completa información',
    icono: CupertinoIcons.doc_text,
  ),
  MenuItem(
    nombre: 'Calculadora',
    detalle: 'Realiza cálculos',
    icono: CupertinoIcons.number_square,
  ),
];

/// Lista de preguntas frecuentes utilizando la clase MenuItem
List<MenuItem> preguntasFrecuentes = [
  MenuItem(
    nombre: '¿Cómo puedo cambiar mi contraseña?',
    detalle:
        'Para cambiar tu contraseña, dirígete a la sección de ajustes de perfil. Allí encontrarás la opción "Cambiar contraseña". Deberás ingresar tu contraseña actual y la nueva contraseña dos veces para confirmarla.',
    icono: CupertinoIcons.lock_circle,
  ),
  MenuItem(
    nombre: '¿Cómo contactar con soporte técnico?',
    detalle:
        'Puedes contactar con nuestro equipo de soporte técnico a través del correo soporte@ejemplo.com o llamando al número 01-800-123-4567 en horario de lunes a viernes de 9:00 a 18:00 horas.',
    icono: CupertinoIcons.chat_bubble_2,
  ),
  MenuItem(
    nombre: '¿La aplicación funciona sin conexión a internet?',
    detalle:
        'Algunas funciones básicas de la aplicación están disponibles sin conexión, pero para acceder a todas las características y mantener tus datos actualizados, es recomendable tener conexión a internet.',
    icono: CupertinoIcons.wifi_slash,
  ),
  MenuItem(
    nombre: '¿Cómo puedo actualizar la aplicación?',
    detalle:
        'La aplicación se actualiza automáticamente a través de la tienda de aplicaciones de tu dispositivo. También puedes verificar manualmente si hay actualizaciones disponibles en la App Store o Google Play Store.',
    icono: CupertinoIcons.arrow_down_circle,
  ),
  MenuItem(
    nombre: '¿Es segura mi información personal?',
    detalle:
        'Sí, tu información está protegida mediante protocolos de encriptación avanzados. No compartimos tus datos con terceros sin tu consentimiento y cumplimos con todas las regulaciones de protección de datos aplicables.',
    icono: CupertinoIcons.shield,
  ),
  MenuItem(
    nombre: '¿Puedo usar la aplicación en múltiples dispositivos?',
    detalle:
        'Sí, puedes iniciar sesión en la aplicación desde cualquier dispositivo compatible. Tus datos se sincronizarán automáticamente entre todos tus dispositivos.',
    icono: CupertinoIcons.device_phone_portrait,
  ),
  MenuItem(
    nombre: '¿Cómo puedo reportar un error en la aplicación?',
    detalle:
        'Si encuentras algún error, ve a la sección "Configuración" y selecciona "Reportar un problema". Describe el error con el mayor detalle posible y, si es posible, adjunta capturas de pantalla.',
    icono: CupertinoIcons.exclamationmark_circle,
  ),
];

/// Pantalla del menú principal con diseño Cupertino y 3 opciones
class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Menú Principal'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.square_arrow_right),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(builder: (context) => LoginPage()),
              (route) => false,
            );
          },
        ),
      ),
      backgroundColor: CupertinoColors.systemGrey6,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.9,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey4.withOpacity(0.3),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>
                            ContentPage(menuItem: menuItems[index]),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        menuItems[index].icono,
                        size: 50,
                        color: CupertinoColors.activeBlue,
                      ),
                      SizedBox(height: 15),
                      Text(
                        menuItems[index].nombre,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          menuItems[index].detalle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Pantalla de contenido detallado para cada elemento del menú
class ContentPage extends StatefulWidget {
  final MenuItem menuItem;

  const ContentPage({super.key, required this.menuItem});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  // Set para rastrear qué preguntas están expandidas
  final Set<int> _expandedItems = <int>{};

  // Variables para el estado del formulario
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  DateTime _fechaNacimiento = DateTime.now();
  bool _recibirNotificaciones = true;
  String _generoSeleccionado = 'Masculino';
  double _nivelExperiencia = 5.0;
  String _pais = 'Perú';
  bool _mostrarSelector = false;
  final List<String> _paises = [
    'Perú',
    'Colombia',
    'México',
    'Chile',
    'Argentina',
    'Ecuador',
    'Bolivia',
    'Brasil',
    'Estados Unidos',
    'España',
  ];

  @override
  Widget build(BuildContext context) {
    // Verificar si estamos en la sección de preguntas frecuentes, formulario o calculadora
    bool esPreguntasFrecuentes =
        widget.menuItem.nombre == 'Preguntas Frecuentes';
    bool esFormulario = widget.menuItem.nombre == 'Formulario';
    bool esCalculadora = widget.menuItem.nombre == 'Calculadora';

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.menuItem.nombre),
      ),
      backgroundColor: CupertinoColors.systemGrey6,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                esPreguntasFrecuentes
                    ? 'Preguntas Frecuentes'
                    : esFormulario
                    ? 'Datos Personales'
                    : esCalculadora
                    ? 'Calculadora'
                    : 'Contenido',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: esPreguntasFrecuentes
                        ? _construirListaPreguntas()
                        : esFormulario
                        ? _construirFormulario()
                        : esCalculadora
                        ? _construirCalculadora()
                        : Center(
                            child: Text(
                              'Aquí puedes mostrar más información relacionada con ${widget.menuItem.nombre}',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Método para construir la lista de preguntas frecuentes
  Widget _construirListaPreguntas() {
    return ListView.builder(
      itemCount: preguntasFrecuentes.length,
      itemBuilder: (context, index) {
        // Verificar si esta pregunta está expandida
        final bool isExpanded = _expandedItems.contains(index);

        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: CupertinoColors.systemGrey4.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Alternar el estado de expansión al hacer clic
                setState(() {
                  if (isExpanded) {
                    _expandedItems.remove(index);
                  } else {
                    _expandedItems.add(index);
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          preguntasFrecuentes[index].icono,
                          color: CupertinoColors.activeBlue,
                          size: 28,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            preguntasFrecuentes[index].nombre,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: CupertinoColors.black,
                            ),
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? CupertinoIcons.chevron_up
                              : CupertinoIcons.chevron_down,
                          color: CupertinoColors.activeBlue,
                          size: 18,
                        ),
                      ],
                    ),
                    // Mostramos el detalle solo si está expandido
                    if (isExpanded) ...[
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 8.0),
                        child: Text(
                          preguntasFrecuentes[index].detalle,
                          style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Método para construir el formulario con widgets de Cupertino
  Widget _construirFormulario() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sección de información personal
          _tituloSeccion('Información Personal'),
          _campoTexto(
            'Nombre completo',
            _nombreController,
            CupertinoIcons.person,
          ),
          SizedBox(height: 15),
          _campoTexto(
            'Correo electrónico',
            _emailController,
            CupertinoIcons.mail,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15),
          _campoTexto(
            'Teléfono',
            _telefonoController,
            CupertinoIcons.phone,
            keyboardType: TextInputType.phone,
          ),

          SizedBox(height: 20),
          _tituloSeccion('Fecha de Nacimiento'),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _fechaNacimiento,
              maximumDate: DateTime.now(),
              minimumYear: 1920,
              maximumYear: DateTime.now().year,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  _fechaNacimiento = newDate;
                });
              },
            ),
          ),

          SizedBox(height: 20),
          _tituloSeccion('Género'),
          Container(
            width:
                double.infinity, // Asegura que ocupe todo el ancho disponible
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ), // Ajuste del padding para que coincida con los otros elementos
            child: CupertinoSegmentedControl<String>(
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 0,
              ), // Padding interno más consistente
              children: {
                'Masculino': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('Masculino'),
                ),
                'Femenino': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('Femenino'),
                ),
              },
              onValueChanged: (String value) {
                setState(() {
                  _generoSeleccionado = value;
                });
              },
              groupValue: _generoSeleccionado,
            ),
          ),

          SizedBox(height: 20),
          _tituloSeccion('País de residencia'),
          GestureDetector(
            onTap: () {
              setState(() {
                _mostrarSelector = !_mostrarSelector;
              });
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.globe,
                        color: CupertinoColors.systemGrey,
                      ),
                      SizedBox(width: 10),
                      Text(_pais),
                    ],
                  ),
                  Icon(
                    _mostrarSelector
                        ? CupertinoIcons.chevron_up
                        : CupertinoIcons.chevron_down,
                    color: CupertinoColors.activeBlue,
                  ),
                ],
              ),
            ),
          ),

          if (_mostrarSelector)
            Container(
              height: 150,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CupertinoPicker(
                itemExtent: 40,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    _pais = _paises[index];
                  });
                },
                children: _paises
                    .map((pais) => Center(child: Text(pais)))
                    .toList(),
              ),
            ),

          SizedBox(height: 20),
          _tituloSeccion('Nivel de experiencia'),
          Row(
            children: [
              Icon(CupertinoIcons.star, color: CupertinoColors.systemGrey),
              Expanded(
                child: CupertinoSlider(
                  value: _nivelExperiencia,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  onChanged: (value) {
                    setState(() {
                      _nivelExperiencia = value;
                    });
                  },
                ),
              ),
              Icon(
                CupertinoIcons.star_fill,
                color: CupertinoColors.systemYellow,
              ),
              SizedBox(width: 5),
              Text(
                _nivelExperiencia.round().toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),

          SizedBox(height: 20),
          _tituloSeccion('Preferencias'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.bell,
                      color: CupertinoColors.systemGrey,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Recibir notificaciones',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                CupertinoSwitch(
                  value: _recibirNotificaciones,
                  activeTrackColor: CupertinoColors.activeBlue,
                  onChanged: (bool value) {
                    setState(() {
                      _recibirNotificaciones = value;
                    });
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(10),
              child: Text(
                'Guardar Información',
                style: TextStyle(color: CupertinoColors.white),
              ),
              onPressed: () {
                _mostrarAlertaGuardado(context);
              },
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  // Método para mostrar alerta de guardado
  void _mostrarAlertaGuardado(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text('Formulario Guardado'),
        content: Text('Tu información ha sido guardada correctamente.'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  // Método para generar títulos de sección
  Widget _tituloSeccion(String titulo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: CupertinoColors.activeBlue,
        ),
      ),
    );
  }

  // Método para crear campos de texto estilizados
  Widget _campoTexto(
    String placeholder,
    TextEditingController controller,
    IconData icono, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      padding: EdgeInsets.all(16),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Icon(icono, color: CupertinoColors.systemGrey),
      ),
      keyboardType: keyboardType,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  /// Método para construir la calculadora
  Widget _construirCalculadora() {
    return Column(
      children: [
        // Pantalla de la calculadora
        Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: CupertinoColors.darkBackgroundGray,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.bottomRight,
          child: Text(
            '0',
            style: TextStyle(
              fontSize: 48,
              color: CupertinoColors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        // Teclado de la calculadora
        Expanded(
          child: Column(
            children: [
              // Primera fila: AC, +/-, %, ÷
              _filaCalculadora([
                _botonCalculadora('AC', color: CupertinoColors.systemGrey),
                _botonCalculadora('+/-', color: CupertinoColors.systemGrey),
                _botonCalculadora('%', color: CupertinoColors.systemGrey),
                _botonCalculadora('÷', color: CupertinoColors.activeOrange),
              ]),
              // Segunda fila: 7, 8, 9, ×
              _filaCalculadora([
                _botonCalculadora('7'),
                _botonCalculadora('8'),
                _botonCalculadora('9'),
                _botonCalculadora('×', color: CupertinoColors.activeOrange),
              ]),
              // Tercera fila: 4, 5, 6, -
              _filaCalculadora([
                _botonCalculadora('4'),
                _botonCalculadora('5'),
                _botonCalculadora('6'),
                _botonCalculadora('-', color: CupertinoColors.activeOrange),
              ]),
              // Cuarta fila: 1, 2, 3, +
              _filaCalculadora([
                _botonCalculadora('1'),
                _botonCalculadora('2'),
                _botonCalculadora('3'),
                _botonCalculadora('+', color: CupertinoColors.activeOrange),
              ]),
              // Quinta fila: 0, ., =
              Row(
                children: [
                  // Botón 0 (doble ancho)
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        borderRadius: BorderRadius.circular(40),
                        color: CupertinoColors.darkBackgroundGray,
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontSize: 30,
                              color: CupertinoColors.white,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  // Botón .
                  Expanded(child: _botonCalculadora('.')),
                  // Botón =
                  Expanded(
                    child: _botonCalculadora(
                      '=',
                      color: CupertinoColors.activeOrange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Método para crear una fila de botones de la calculadora
  Widget _filaCalculadora(List<Widget> botones) {
    return Expanded(
      child: Row(
        children: botones.map((boton) => Expanded(child: boton)).toList(),
      ),
    );
  }

  // Método para crear un botón de la calculadora
  Widget _botonCalculadora(
    String texto, {
    Color color = CupertinoColors.darkBackgroundGray,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(40),
        color: color,
        child: Container(
          height: 70,
          alignment: Alignment.center,
          child: Text(
            texto,
            style: TextStyle(
              fontSize: 30,
              color: color == CupertinoColors.systemGrey
                  ? CupertinoColors.black
                  : CupertinoColors.white,
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

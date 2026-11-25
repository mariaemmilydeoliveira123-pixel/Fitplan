import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const FitPlanApp());

// ==========================================
// 1. TEMA E CORES
// ==========================================
class AppColors {
  static const navy = Color(0xFF0B132B);
  static const navyLight = Color(0xFF1C2541);
  static const accent = Color(0xFF5BC0BE);
  static const background = Color(0xFFF4F6F9);
  static const white = Colors.white;
  static const textLight = Color(0xFF8892B0);
  static const textDark = Color(0xFF112240);
  static const danger = Color(0xFFEF476F);
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: AppColors.navy,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.navy,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.navy,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}

// ==========================================
// 2. MODELOS
// ==========================================
class Exercise {
  final String name, sets, rest;
  const Exercise(this.name, this.sets, this.rest);
}

class Meal {
  final String name, items;
  const Meal(this.name, this.items);
}

class DailyWorkout {
  final String dayName, focus;
  final List<Exercise> exercises;
  const DailyWorkout(this.dayName, this.focus, this.exercises);
}

class DailyDiet {
  final String dayName;
  final List<Meal> meals;
  const DailyDiet(this.dayName, this.meals);
}

class Product {
  final String name, image;
  final double price;
  const Product(this.name, this.price, this.image);
}

class CartItem {
  final String name;
  final double price;
  int qty;
  CartItem(this.name, this.price) : qty = 1;
}

class PayMethod {
  final String id, label, desc;
  final IconData icon;
  const PayMethod(this.id, this.label, this.desc, this.icon);
}

class QuotesDatabase {
  static const quotes = [
    "A mudança começa quando você decide não desistir.",
    "Sua dedicação de hoje é seu orgulho de amanhã.",
    "Foco no processo, não na pressa.",
    "Faça por você, não pela aprovação de ninguém.",
    "A disciplina constrói o que a motivação começa.",
    "Não precisa ser perfeito, só precisa continuar.",
    "Cada treino é um investimento em você.",
    "Seja sua própria inspiração.",
    "Evoluir também é respeitar seu tempo.",
    "Desistir não combina com quem tem objetivos.",
    "O segredo está na constância.",
    "Mais amor-próprio, mais cuidado, mais determinação.",
    "Minha maior meta é ser melhor do que fui ontem.",
    "A jornada é minha, o ritmo também.",
    "Não é competição, é evolução.",
    "Transformando esforço em conquistas.",
    "A melhor versão de mim começa com pequenas escolhas.",
    "Treinar é uma forma de demonstrar amor por mim mesma.",
    "Que nunca me falte força para recomeçar.",
    "Por mim, pela minha saúde e pelo meu bem-estar. 🤍",
    "Que a academia seja o lugar onde eu fortaleça não só meu corpo, mas também minha mente e minha determinação. 🤍",
    "Não desista, seu esforço de hoje será seu orgulho amanhã.",
    "Disciplina é continuar mesmo sem motivação.",
    "Cada treino é uma conquista.",
    "Você é seu maior compromisso.",
    "Pequenos passos também levam a grandes resultados.",
    "Não é sobre perfeição, é sobre evolução.",
    "Faça por você, pela sua saúde e felicidade.",
    "A constância vence a pressa.",
    "Seu único limite é não tentar.",
    "Cuide de você, você merece esse esforço.",
    "Um dia de cada vez, sem desistir.",
    "A melhor competição é com a sua própria evolução.",
    "Treine com propósito, evolua com paciência.",
    "Sua jornada, seu ritmo, suas conquistas.",
    "Não espere ter vontade, comece!",
  ];
  static String getRandomQuote() => quotes[Random().nextInt(quotes.length)];
}

// ==========================================
// 3. GERADOR DE PLANOS
// ==========================================
class PlanGenerator {
  static List<DailyWorkout> getWorkoutPlan(String gender, String goal) {
    if (gender == 'Homem') {
      return const [
        DailyWorkout('SEG', 'Peito e Tríceps', [
          Exercise('Supino Reto c/ Halteres', '4x10', '2min'),
          Exercise('Crossover na Polia Média', '4x10', '2min'),
          Exercise('Tríceps Testa c/ Barra W', '4x10', '2min'),
          Exercise('Tríceps Pulley Corda', '4x10', '90s'),
        ]),
        DailyWorkout('TER', 'Costas e Bíceps', [
          Exercise('Puxada Alta Pegada Neutra', '4x10', '2min'),
          Exercise('Remada Cavalinho', '4x10', '90s'),
          Exercise('Rosca Direta c/ Halteres', '4x10', '2min'),
          Exercise('Rosca Martelo Cruzada', '4x10', '90s'),
        ]),
        DailyWorkout('QUA', 'Pernas Completo', [
          Exercise('Agachamento no Hack Machine', '4x10', '2min'),
          Exercise('Leg Press 45', '4x10', '2min'),
          Exercise('Cadeira Extensora', '4x10', '2min'),
          Exercise('Panturrilha Sentado', '4x10', '2min'),
        ]),
        DailyWorkout('QUI', 'Ombro e Core', [
          Exercise('Desenvolvimento c/ Halteres', '4x10', '2min'),
          Exercise('Elevação Lateral c/ Cabo', '4x10', '2min'),
          Exercise('Abdominal na Polia Alta', '4x10', '2min'),
        ]),
        DailyWorkout('SEX', 'Full Body', [
          Exercise('Levantamento Terra', '4x10', '2min'),
          Exercise('Barra Fixa', '4x10', '2min'),
          Exercise('Supino Inclinado', '4x10', '2min'),
        ]),
        DailyWorkout('SÁB', 'Cardio e Mobilidade', [
          Exercise('Esteira Inclinada', '30 min', '-'),
          Exercise('Alongamento Guiado', '15 min', '-'),
        ]),
      ];
    }
    return const [
      DailyWorkout('SEG', 'Glúteos e Posterior', [
        Exercise('Elevação Pélvica', '4x10', '2min'),
        Exercise('Stiff c/ Barra', '4x10', '2min'),
        Exercise('Cadeira Abdutora', '4x10', '2min'),
        Exercise('Mesa Flexora', '4x10', '2min'),
        Exercise('posterior na polia', '4x10', '2min'),
        Exercise('levantamento terra', '4x10', '2min'),
      ]),
      DailyWorkout('TER', 'Superiores', [
        Exercise('desenvolvimento', '4x10', '2min'),
        Exercise('remada curvada', '4x10', '2min'),
        Exercise('Elevação Lateral', '4x10', '2min'),
        Exercise('Tríceps Francês', '4x10', '2min'),
      ]),
      DailyWorkout('QUA', 'Quadríceps Foco', [
        Exercise('Agachamento Livre', '4x10', '2min'),
        Exercise('Leg Press 45', '4x10', '2min'),
        Exercise('Cadeira Extensora', '4x10', '2min'),
        Exercise('Panturrilha em Pé', '4x10', '2min'),
        Exercise('passada', '4x10', '2min'),
        Exercise('afundo', '4x10', '2min'),
        Exercise('bulgaro', '4x10', '2min'),
      ]),
      DailyWorkout('QUI', 'Glúteos Foco', [
        Exercise('terra sumô', '4x10', '2min'),
        Exercise('Búlgaro', '4x10', '2min'),
        Exercise('Abdução na polia', '4x10', '2min'),
        Exercise('strep up', '4x10', '2min'),
        Exercise('coice cruzado', '4x10', '2min'),
      ]),
      DailyWorkout('SEX', 'Cardio e Abdômen', [
        Exercise('Transport (Bike) 30min', '1x', '-'),
        Exercise('Prancha Isométrica', '4x10', '60s'),
        Exercise('Infra na Barra Fixa', '4x10', '60s'),
      ]),
      DailyWorkout('SÁB', 'Leve e Alongamento', [
        Exercise('Caminhada ao Ar Livre', '40 min', '-'),
      ]),
    ];
  }

  static List<DailyDiet> getDietPlan(String goal) {
    final m = goal == 'muscle';
    return [
      DailyDiet('SEG', [
        Meal(
          'Café da Manhã',
          m
              ? '4 ovos, 2 fatias de pão integral, 1 banana.'
              : '2 ovos mexidos, 1 fatia de pão integral, café sem açúcar.',
        ),
        Meal(
          'Almoço',
          m ? '200g de frango, 200g de arroz, feijão e salada.' : '150g de frango grelhado, salada à vontade, 2 colheres de arroz.',
        ),
        Meal(
          'Lanche da Tarde',
          m
              ? 'Whey protein + 30g de castanhas.'
              : '1 iogurte natural desnatado + 1 fruta.',
        ),
        Meal(
          'Jantar',
          m
              ? '200g de carne vermelha magra, batata doce e legumes.'
              : 'Omelete de 3 ovos com legumes cozidos.',
        ),
      ]),
      DailyDiet('TER', [
        Meal('Café da Manhã', 'Tapioca com ovos e queijo branco.'),
        Meal(
          'Almoço',
          m
              ? '200g de peixe (tilápia), macarrão integral e brócolis.'
              : 'Atum em água, arroz integral e salada verde.',
        ),
        Meal('Lanche da Tarde', 'Shake de banana com aveia e leite.'),
        Meal(
          'Jantar',
          m
              ? 'Frango desfiado com purê de batata doce.'
              : 'Sopa de legumes com frango desfiado.',
        ),
      ]),
      DailyDiet('QUA', [
        Meal('Café da Manhã', 'Iogurte grego zero + granola sem açúcar.'),
        Meal(
          'Almoço',
          m
              ? 'Carne moída, arroz, lentilha e salada.'
              : 'Carne moída magra com legumes salteados.',
        ),
        Meal(
          'Lanche da Tarde',
          m ? 'Sanduíche natural de frango.' : '1 fruta + 10 castanhas.',
        ),
        Meal('Jantar', 'Peixe grelhado com legumes assados.'),
      ]),
      DailyDiet('QUI', [
        Meal('Café da Manhã', 'Panqueca de aveia com mel (ou frutas).'),
        Meal(
          'Almoço',
          m
              ? 'Frango ao molho, arroz e salada.'
              : 'Salada de grão de bico com atum.',
        ),
        Meal('Lanche da Tarde', 'Whey protein batido com água.'),
        Meal('Jantar', 'Omelete de espinafre com queijo cottage.'),
      ]),
      DailyDiet('SEX', [
        Meal('Café da Manhã', 'Pão integral com pasta de amendoim e banana.'),
        Meal('Almoço', 'Bife acebolado (ou frango) com arroz e feijão.'),
        Meal('Lanche da Tarde', 'Iogurte com chia.'),
        Meal('Jantar', 'Strogonoff fit (com iogurte) e arroz integral.'),
      ]),
      DailyDiet('SÁB', [
        Meal('Café da Manhã', 'Ovos mexidos com tomate e orégano.'),
        Meal('Almoço', 'Refeição livre (com moderação).'),
        Meal('Lanche da Tarde', 'Vitamina de frutas.'),
        Meal('Jantar', 'Salada completa com frango grelhado.'),
      ]),
    ];
  }
}

// ==========================================
// 4. APP
// ==========================================
class FitPlanApp extends StatelessWidget {
  const FitPlanApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'FitPlan Premium',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
    home: const WelcomeScreen(),
  );
}

// ==========================================
// TELA 1: BOAS-VINDAS
// ==========================================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.network(
                'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?q=80&w=1000&auto=format&fit=crop',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Icon(
                    Icons.fitness_center,
                    size: 100,
                    color: AppColors.accent,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'BEM-VINDO AO\nFITPLAN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      letterSpacing: 2,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Seu parceiro definitivo para alcançar seus objetivos, com treinos e dietas personalizados.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textLight,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileSetupScreen(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      child: const Text(
                        'COMEÇAR AGORA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TELA 2: PERSONALIZAÇÃO
// ==========================================
class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});
  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  String? _gender = 'Homem';
  String? _goal;

  void _finish() {
    if (_goal == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione seu objetivo!'),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(gender: _gender!, goal: _goal!),
      ),
    );
  }

  Widget _buildGoalCard(String id, String title, String desc) {
    final sel = _goal == id;
    return GestureDetector(
      onTap: () => setState(() => _goal = id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: sel ? AppColors.navy : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: sel ? AppColors.navy : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: sel ? AppColors.white : AppColors.textDark,
                    ),
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 12,
                      color: sel ? Colors.white70 : AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
            if (sel) const Icon(Icons.check_circle, color: AppColors.accent),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalização'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seu Gênero',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Homem'),
                    value: 'Homem',
                    // ignore: deprecated_member_use
                    groupValue: _gender,
                    activeColor: AppColors.navy,
                    // ignore: deprecated_member_use
                    onChanged: (v) => setState(() => _gender = v),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Mulher'),
                    value: 'Mulher',
                    // ignore: deprecated_member_use
                    groupValue: _gender,
                    activeColor: AppColors.navy,
                    // ignore: deprecated_member_use
                    onChanged: (v) => setState(() => _gender = v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Qual é o seu foco principal?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildGoalCard(
              'muscle',
              '💪 Ganhar Massa Muscular',
              'Foco em hipertrofia',
            ),
            _buildGoalCard(
              'lose',
              '🔥 Emagrecer',
              'Perda de gordura e condicionamento',
            ),
            _buildGoalCard('tone', '✨ Tonificar', 'Definição muscular e saúde'),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _finish,
                child: const Text('GERAR MEU PLANO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELA 3: HOME
// ==========================================
class HomeScreen extends StatefulWidget {
  final String gender, goal;
  const HomeScreen({super.key, required this.gender, required this.goal});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _currentQuote;

  @override
  void initState() {
    super.initState();
    _currentQuote = QuotesDatabase.getRandomQuote();
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textLight),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.accent),
            tooltip: 'Mudar frase',
            onPressed: () =>
                setState(() => _currentQuote = QuotesDatabase.getRandomQuote()),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const WelcomeScreen()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.navy, AppColors.navyLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.format_quote,
                    color: AppColors.accent,
                    size: 30,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currentQuote,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Sua Jornada',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            _buildActionCard(
              title: 'Treino de Hoje',
              subtitle: 'Rotina Seg a Sáb',
              icon: Icons.fitness_center,
              color: AppColors.accent,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      WorkoutScreen(gender: widget.gender, goal: widget.goal),
                ),
              ),
            ),
            _buildActionCard(
              title: 'Plano Alimentar',
              subtitle: 'Dieta detalhada',
              icon: Icons.restaurant_menu,
              color: Colors.green,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DietScreen(goal: widget.goal),
                ),
              ),
            ),
            _buildActionCard(
              title: 'Minha Evolução',
              subtitle: 'Projeção e IMC',
              icon: Icons.trending_up,
              color: Colors.orange,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EvolutionScreen(goal: widget.goal),
                ),
              ),
            ),
            _buildActionCard(
              title: 'Loja FitPlan',
              subtitle: widget.gender == 'Homem'
                  ? 'Moda Masculina e Suplementos'
                  : 'Moda Feminina e Suplementos',
              icon: Icons.shopping_bag,
              color: AppColors.navy,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StoreScreen(gender: widget.gender),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELA 4: TREINOS
// ==========================================
class WorkoutScreen extends StatelessWidget {
  final String gender, goal;
  const WorkoutScreen({super.key, required this.gender, required this.goal});

  @override
  Widget build(BuildContext context) {
    final workouts = PlanGenerator.getWorkoutPlan(gender, goal);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Treino Semanal'),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: AppColors.accent,
            labelColor: AppColors.accent,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'SEG'),
              Tab(text: 'TER'),
              Tab(text: 'QUA'),
              Tab(text: 'QUI'),
              Tab(text: 'SEX'),
              Tab(text: 'SÁB'),
            ],
          ),
        ),
        body: TabBarView(
          children: workouts.map((d) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.navy,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Foco: ${d.focus}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ...d.exercises.map(
                  (ex) => Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const Icon(
                        Icons.fitness_center,
                        color: AppColors.accent,
                      ),
                      title: Text(
                        ex.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Text(
                              'Séries: ${ex.sets}',
                              style: const TextStyle(
                                color: AppColors.navy,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Descanso: ${ex.rest}',
                              style: const TextStyle(
                                color: AppColors.textLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

// ==========================================
// TELA 5: DIETA
// ==========================================
class DietScreen extends StatelessWidget {
  final String goal;
  const DietScreen({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    final diets = PlanGenerator.getDietPlan(goal);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dieta Semanal'),
          backgroundColor: Colors.green[800],
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'SEG'),
              Tab(text: 'TER'),
              Tab(text: 'QUA'),
              Tab(text: 'QUI'),
              Tab(text: 'SEX'),
              Tab(text: 'SÁB'),
            ],
          ),
        ),
        body: TabBarView(
          children: diets.map((d) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: d.meals.map((meal) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.restaurant,
                              color: Colors.green,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              meal.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.navy,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          meal.items,
                          style: const TextStyle(
                            color: AppColors.textLight,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// ==========================================
// TELA 6: EVOLUÇÃO
// ==========================================
class EvolutionScreen extends StatefulWidget {
  final String goal;
  const EvolutionScreen({super.key, required this.goal});
  @override
  State<EvolutionScreen> createState() => _EvolutionScreenState();
}

class _EvolutionScreenState extends State<EvolutionScreen> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  bool _calculated = false;
  double _imc = 0;
  String _imcStatus = '';
  List<String> _projection = [];

  void _calculate() {
    final weight = double.tryParse(_weightController.text);
    final heightCm = double.tryParse(_heightController.text);
    if (weight == null || heightCm == null || heightCm == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha valores válidos!')),
      );
      return;
    }
    final heightM = heightCm / 100;
    setState(() {
      _imc = weight / (heightM * heightM);
      if (_imc < 18.5) {
        _imcStatus = 'Abaixo do peso';
      } else if (_imc < 24.9) {
        _imcStatus = 'Peso Normal';
      } else if (_imc < 29.9) {
        _imcStatus = 'Sobrepeso';
      } else {
        _imcStatus = 'Obesidade';
      }
      _projection.clear();
      double currentW = weight;
      for (int i = 1; i <= 6; i++) {
        if (widget.goal == 'lose') {
          currentW -= 2.0;
        } else if (widget.goal == 'muscle') {
          currentW += 1.5;
        } else {
          currentW -= 1.0;
        }
        _projection.add('Mês $i: ${currentW.toStringAsFixed(1)} kg');
      }
      _calculated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minha Evolução')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Acompanhe seu progresso',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.navy,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Peso Atual (kg)',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Altura (cm)',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _calculate,
                child: const Text('CALCULAR PROJEÇÃO'),
              ),
            ),
            const SizedBox(height: 24),
            if (_calculated) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.navy,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Seu IMC Atual',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      _imc.toStringAsFixed(1),
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _imcStatus,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Perspectiva para os próximos 6 meses:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ..._projection.map(
                (p) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.accent,
                    ),
                    title: Text(
                      p,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELA 7: LOJA (com carrinho)
// ==========================================
class StoreScreen extends StatefulWidget {
  final String gender;
  const StoreScreen({super.key, required this.gender});
  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final List<CartItem> _cart = [];

  List<Product> _getProducts() {
    if (widget.gender == 'Homem') {
      return const [
        Product('Whey Protein', 189.90, 'assets/images/whey.webp'),
        Product('Creatina', 119.90, 'assets/images/cre.png'),
        Product('Tênis Masculino', 120.00, 'assets/images/tenis_masc.png'),
        Product(
          'Blusa Manga Longa',
          89.90,
          'assets/images/blusa_longa_masc.png',
        ),
        Product('Short de Academia', 130.90, 'assets/images/shot.jpeg'),
        Product('Regata Masculina', 90.90, 'assets/images/regata_masc.png'),
        Product('Blusa Dry Fit', 79.90, 'assets/images/blusa_masc.png'),
        Product('Meia Esportiva', 29.90, 'assets/images/meias_masc.png'),
        Product('Fone de Ouvido', 70.90, 'assets/images/fone_masc.png'),
        Product('Garrafa Térmica', 50.90, 'assets/images/garrafa_masc.png'),
      ];
    }
    return const [
      Product('Legging', 129.90, 'assets/images/calça_fem.png'),
      Product('Short Feminino', 59.90, 'assets/images/short.png'),
      Product('Regata Feminina', 100.90, 'assets/images/regata_fem.png'),
      Product('Blusa Manga Longa', 89.90, 'assets/images/blusa_longa.jpeg'),
      Product('Blusa de Treino', 69.90, 'assets/images/blusa.jpeg'),
      Product('Meia Esportiva', 29.90, 'assets/images/meias_fem.jpeg'),
      Product('Tênis Feminino', 149.90, 'assets/images/tenis_fem.jpg'),
      Product('Whey Protein', 189.90, 'assets/images/whey.webp'),
      Product('Creatina', 119.90, 'assets/images/cre.png'),
      Product('Fone de Ouvido', 70.90, 'assets/images/fone_masc.png'),
      Product('Garrafa Térmica', 50.90, 'assets/images/garrafa_fem.png'),
    ];
  }

  void _addToCart(Product p) {
    setState(() {
      final i = _cart.indexWhere((c) => c.name == p.name);
      if (i >= 0) {
        _cart[i].qty++;
      } else {
        _cart.add(CartItem(p.name, p.price));
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${p.name} adicionado!'),
        backgroundColor: AppColors.navy,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = _getProducts();
    final count = _cart.fold<int>(0, (s, c) => s + c.qty);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loja ${widget.gender == 'Homem' ? 'Masculina' : 'Feminina'}',
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                tooltip: 'Carrinho',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CartScreen(cart: _cart)),
                ).then((_) => setState(() {})),
              ),
              if (count > 0)
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$count',
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.navy,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, i) {
          final p = products[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      p.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'R\$ ${p.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: AppColors.navy,
                    ),
                    onPressed: () => _addToCart(p),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// TELA 8: CARRINHO
// ==========================================
class CartScreen extends StatefulWidget {
  final List<CartItem> cart;
  const CartScreen({super.key, required this.cart});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get _total => widget.cart.fold(0, (s, c) => s + c.price * c.qty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Carrinho')),
      body: widget.cart.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: AppColors.textLight,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Seu carrinho está vazio.',
                    style: TextStyle(fontSize: 16, color: AppColors.textLight),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: widget.cart.length,
                    itemBuilder: (context, i) {
                      final item = widget.cart[i];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'R\$ ${item.price.toStringAsFixed(2)}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () => setState(() {
                                  if (item.qty > 1) {
                                    item.qty--;
                                  } else {
                                    widget.cart.removeAt(i);
                                  }
                                }),
                              ),
                              Text(
                                '${item.qty}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  color: AppColors.accent,
                                ),
                                onPressed: () => setState(() => item.qty++),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'R\$ ${_total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.accent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PaymentScreen(
                                    total: _total,
                                    cart: widget.cart,
                                  ),
                                ),
                              ).then((paid) {
                                if (paid == true && mounted)
                                  Navigator.pop(context);
                              }),
                          child: const Text('FINALIZAR COMPRA'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

// ==========================================
// TELA 9: PAGAMENTO
// ==========================================
class PaymentScreen extends StatefulWidget {
  final double total;
  final List<CartItem> cart;
  const PaymentScreen({super.key, required this.total, required this.cart});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selected;

  static const _methods = [
    PayMethod('pix', 'PIX', 'Aprovação imediata', Icons.pix),
    PayMethod(
      'credit',
      'Cartão de Crédito',
      'Em até 3x sem juros',
      Icons.credit_card,
    ),
    PayMethod(
      'debit',
      'Cartão de Débito',
      'Débito à vista',
      Icons.credit_card_outlined,
    ),
    PayMethod('boleto', 'Boleto', 'Vence em 3 dias úteis', Icons.receipt_long),
  ];

  Future<void> _confirm() async {
    if (_selected == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escolha uma forma de pagamento!'),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }
    final label = _methods.firstWhere((m) => m.id == _selected).label;
    widget.cart.clear();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 64),
              const SizedBox(height: 16),
              const Text(
                'Compra Finalizada!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Pagamento via $label aprovado.\nObrigado pela compra! 🎉',
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textLight, height: 1.4),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('VOLTAR À LOJA'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagamento')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.navy,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    'Total a pagar',
                    style: TextStyle(color: AppColors.textLight, fontSize: 16),
                  ),
                  Text(
                    'R\$ ${widget.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Formas de Pagamento',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ..._methods.map((m) {
              final sel = _selected == m.id;
              return GestureDetector(
                onTap: () => setState(() => _selected = m.id),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: sel ? AppColors.navy : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: sel ? AppColors.navy : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        m.icon,
                        color: sel ? AppColors.accent : AppColors.navy,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              m.label,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: sel ? Colors.white : AppColors.textDark,
                              ),
                            ),
                            Text(
                              m.desc,
                              style: TextStyle(
                                fontSize: 12,
                                color: sel
                                    ? Colors.white70
                                    : AppColors.textLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (sel)
                        const Icon(Icons.check_circle, color: AppColors.accent),
                    ],
                  ),
                ),
              );
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _confirm,
                child: const Text('CONFIRMAR PAGAMENTO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

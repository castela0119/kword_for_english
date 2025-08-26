import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOPIK Words',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'TOPIK Words',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _showSettings(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[400]!, Colors.blue[600]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back! 👋',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ready to learn Korean words today?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Word Counter
                  const Text(
                    'Word 1 of 5',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.local_fire_department, color: Colors.orange, size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        '7 day streak!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Attendance Calendar
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.blue[600], size: 20),
                      const SizedBox(width: 8),
                                        Text(
                    'Study Streak Calendar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildAttendanceCalendar(),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Word Study by Numbers Section
            Text(
              'Study by Numbers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 16),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: _buildWordRangeButtons(context),
            ),

            const SizedBox(height: 24),

            // Progress Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Progress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildProgressItem('Words Learned', '247', Icons.school),
                      _buildProgressItem('Difficult Words', '23', Icons.close),
                      _buildProgressItem('Accuracy', '87%', Icons.analytics),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCalendar() {
    final List<String> dayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    final List<List<int>> weeks = [
      [29, 30, 31, 1, 2, 3, 4],
      [5, 6, 7, 8, 9, 10, 11],
      [12, 13, 14, 15, 16, 17, 18],
    ];
    final List<int> attendedDays = [1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    final List<int> missedDays = [8];
    final int today = 18;

    return Column(
      children: [
        // Day labels
        Row(
          children: dayLabels.map((label) => 
            Expanded(
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
        const SizedBox(height: 8),
        // Calendar grid
        ...weeks.map((week) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: week.map((day) {
                Color backgroundColor;
                Color textColor;
                
                if (day == today) {
                  backgroundColor = Colors.blue;
                  textColor = Colors.white;
                } else if (attendedDays.contains(day)) {
                  backgroundColor = Colors.green;
                  textColor = Colors.white;
                } else if (missedDays.contains(day)) {
                  backgroundColor = Colors.red[50]!;
                  textColor = Colors.red;
                } else {
                  backgroundColor = Colors.grey[100]!;
                  textColor = Colors.grey[400]!;
                }
                
                return Expanded(
                  child: Container(
                    height: 32,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: day == today ? [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        )
                      ] : null,
                    ),
                    child: Center(
                      child: Text(
                        day.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildWordRangeButtons(BuildContext context) {
    List<Widget> buttons = [];
    List<Color> colors = [
      Colors.blue, Colors.green, Colors.purple, Colors.orange,
      Colors.teal, Colors.red, Colors.indigo, Colors.pink,
      Colors.amber, Colors.cyan
    ];
    
    for (int i = 1; i <= 1000; i += 100) {
      int endRange = i + 99;
      String rangeText = '${i.toString().padLeft(3, '0')} - ${endRange.toString().padLeft(3, '0')}';
      Color buttonColor = colors[(i ~/ 100) % colors.length];
      
      buttons.add(
        _buildQuickActionCard(
          rangeText,
          '100 words',
          Icons.book,
          buttonColor,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FlashcardScreen(
                  startRange: i,
                  endRange: endRange,
                ),
              ),
            );
          },
        ),
      );
    }
    return buttons;
  }

  Widget _buildQuickActionCard(String title, String subtitle, IconData icon,
                               Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue[400], size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _showSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Settings'),
        content: const Text('Settings screen would open here with language preferences, notifications, etc.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

}

// Flashcard Screen
class FlashcardScreen extends StatefulWidget {
  final int? startRange;
  final int? endRange;
  
  const FlashcardScreen({super.key, this.startRange, this.endRange});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _flipAnimation;
  
  int currentWordIndex = 0;
  bool isFlipped = false;
  Set<int> favoriteWords = {}; // Track favorite words by index

  late List<Map<String, String>> words;

  @override
  void initState() {
    super.initState();
    words = _generateWords(widget.startRange ?? 1, widget.endRange ?? 100);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _flipAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<Map<String, String>> _generateWords(int startRange, int endRange) {
    // 기본 단어 데이터베이스 (실제로는 더 많은 단어가 있어야 함)
    List<Map<String, String>> allWords = [
      {'korean': '안녕하세요', 'pronunciation': '[an-nyeong-ha-se-yo]', 'english': 'Hello (formal)', 'example': '안녕하세요! 저는 민수입니다.', 'exampleEng': 'Hello! I am Minsu.'},
      {'korean': '감사합니다', 'pronunciation': '[gam-sa-ham-ni-da]', 'english': 'Thank you', 'example': '도와주셔서 감사합니다.', 'exampleEng': 'Thank you for helping me.'},
      {'korean': '죄송합니다', 'pronunciation': '[joe-song-ham-ni-da]', 'english': "I'm sorry", 'example': '늦어서 죄송합니다.', 'exampleEng': "I'm sorry for being late."},
      {'korean': '학교', 'pronunciation': '[hak-gyo]', 'english': 'School', 'example': '저는 학교에 갑니다.', 'exampleEng': 'I go to school.'},
      {'korean': '집', 'pronunciation': '[jip]', 'english': 'House/Home', 'example': '집에 가고 싶어요.', 'exampleEng': 'I want to go home.'},
      {'korean': '물', 'pronunciation': '[mul]', 'english': 'Water', 'example': '물을 마시고 싶어요.', 'exampleEng': 'I want to drink water.'},
      {'korean': '음식', 'pronunciation': '[eum-sik]', 'english': 'Food', 'example': '음식이 맛있어요.', 'exampleEng': 'The food is delicious.'},
      {'korean': '친구', 'pronunciation': '[chin-gu]', 'english': 'Friend', 'example': '제 친구입니다.', 'exampleEng': 'This is my friend.'},
      {'korean': '가족', 'pronunciation': '[ga-jok]', 'english': 'Family', 'example': '가족과 함께 있어요.', 'exampleEng': 'I am with my family.'},
      {'korean': '시간', 'pronunciation': '[si-gan]', 'english': 'Time', 'example': '시간이 없어요.', 'exampleEng': 'I don\'t have time.'},
      {'korean': '돈', 'pronunciation': '[don]', 'english': 'Money', 'example': '돈이 필요해요.', 'exampleEng': 'I need money.'},
      {'korean': '책', 'pronunciation': '[chaek]', 'english': 'Book', 'example': '책을 읽어요.', 'exampleEng': 'I read a book.'},
      {'korean': '영화', 'pronunciation': '[yeong-hwa]', 'english': 'Movie', 'example': '영화를 봐요.', 'exampleEng': 'I watch a movie.'},
      {'korean': '음악', 'pronunciation': '[eum-ak]', 'english': 'Music', 'example': '음악을 들어요.', 'exampleEng': 'I listen to music.'},
      {'korean': '운동', 'pronunciation': '[un-dong]', 'english': 'Exercise/Sports', 'example': '운동을 해요.', 'exampleEng': 'I exercise.'},
    ];

    // 부족한 단어는 번호로 생성 (실제 프로젝트에서는 DB에서 가져와야 함)
    List<Map<String, String>> generatedWords = [];
    
    for (int i = startRange; i <= endRange; i++) {
      if (i - startRange < allWords.length) {
        // 실제 단어 사용
        generatedWords.add(allWords[i - startRange]);
      } else {
        // 더미 단어 생성
        generatedWords.add({
          'korean': '단어$i',
          'pronunciation': '[dan-eo-$i]',
          'english': 'Word $i',
          'example': '이것은 단어 $i 입니다.',
          'exampleEng': 'This is word $i.'
        });
      }
    }
    
    return generatedWords;
  }

  void _flipCard() {
    if (!isFlipped) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  void _nextCard() {
    if (currentWordIndex < words.length - 1) {
      setState(() {
        currentWordIndex++;
        if (isFlipped) {
          _animationController.reverse();
          isFlipped = false;
        }
      });
    }
  }

  void _previousCard() {
    if (currentWordIndex > 0) {
      setState(() {
        currentWordIndex--;
        if (isFlipped) {
          _animationController.reverse();
          isFlipped = false;
        }
      });
    }
  }

  void _toggleFavorite() {
    setState(() {
      if (favoriteWords.contains(currentWordIndex)) {
        favoriteWords.remove(currentWordIndex);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Text('💔'),
                const SizedBox(width: 8),
                Text('"${words[currentWordIndex]['korean']}" removed from favorites'),
              ],
            ),
            backgroundColor: Colors.red[400],
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        favoriteWords.add(currentWordIndex);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Text('⭐'),
                const SizedBox(width: 8),
                Text('"${words[currentWordIndex]['korean']}" added to favorites!'),
              ],
            ),
            backgroundColor: Colors.amber[600],
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'VIEW',
              textColor: Colors.white,
              onPressed: () {
                // Navigate to favorites screen
              },
            ),
          ),
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final currentWord = words[currentWordIndex];
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text(widget.startRange != null && widget.endRange != null 
            ? 'Words ${widget.startRange!.toString().padLeft(3, '0')} - ${widget.endRange!.toString().padLeft(3, '0')}'
            : 'Flashcards'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              '${currentWordIndex + 1} / ${words.length}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [

          // Flashcard
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Stack(
                    children: [
                      // Main card content - clickable area
                      GestureDetector(
                        onTap: _flipCard,
                        child: Container(
                          width: 320,
                          height: 400,
                          margin: const EdgeInsets.all(20),
                          child: AnimatedBuilder(
                            animation: _flipAnimation,
                            builder: (context, child) {
                              final isShowingFront = _flipAnimation.value < 0.5;
                              return Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateY(_flipAnimation.value * 3.14159),
                                child: isShowingFront
                                    ? _buildFrontCard(currentWord)
                                    : Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.identity()..rotateY(3.14159),
                                        child: _buildBackCard(currentWord),
                                      ),
                              );
                            },
                          ),
                        ),
                      ),
                      // Favorite button positioned above card - separate from main card tap
                      Positioned(
                        top: 10,
                        left: 40,
                        child: GestureDetector(
                          onTap: _toggleFavorite,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.elasticOut,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: favoriteWords.contains(currentWordIndex)
                                  ? Colors.amber.withValues(alpha: 0.2)
                                  : Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: favoriteWords.contains(currentWordIndex)
                                  ? [
                                      BoxShadow(
                                        color: Colors.amber.withValues(alpha: 0.4),
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                      )
                                    ]
                                  : null,
                            ),
                            transform: Matrix4.identity()
                              ..scale(favoriteWords.contains(currentWordIndex) ? 1.2 : 1.0),
                            child: Icon(
                              favoriteWords.contains(currentWordIndex)
                                  ? Icons.star
                                  : Icons.star_border,
                              color: favoriteWords.contains(currentWordIndex)
                                  ? Colors.amber
                                  : Colors.white.withValues(alpha: 0.7),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Navigation Buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: currentWordIndex > 0 ? _previousCard : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back, size: 20),
                        SizedBox(width: 8),
                        Text('Before', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _nextCard,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Next', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrontCard(Map<String, String> word) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 32,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'TOPIK I',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  word['korean']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  word['pronunciation']!,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.touch_app, color: Colors.white.withValues(alpha: 0.8), size: 16),
                const SizedBox(width: 8),
                Text(
                  'Tap to see meaning',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard(Map<String, String> word) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFf093fb), Color(0xFFf5576c)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 32,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'TOPIK I',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    word['english']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Text(
                        word['example']!,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 16,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        word['exampleEng']!,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.touch_app, color: Colors.white.withValues(alpha: 0.8), size: 16),
                const SizedBox(width: 8),
                Text(
                  'Tap to flip back',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
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

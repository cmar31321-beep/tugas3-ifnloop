 import 'dart:io';
import 'dart:math';


// =====================================================
// SOAL 1 - MENENTUKAN NILAI HURUF
// =====================================================

class NilaiHuruf {
  void jalankan() {
    print('\n===== MENENTUKAN NILAI HURUF =====');

    stdout.write('Masukkan nilai (0-100): ');
    String input = stdin.readLineSync() ?? '';

    int? nilai = int.tryParse(input);

    if (nilai == null || nilai < 0 || nilai > 100) {
      print('Nilai tidak valid. Masukkan angka 0-100.');
      return;
    }

    String huruf;

    if (nilai >= 85) {
      huruf = 'A';
    } else if (nilai >= 70) {
      huruf = 'B';
    } else if (nilai >= 55) {
      huruf = 'C';
    } else {
      huruf = 'D';
    }

    print('Nilai angka : $nilai');
    print('Nilai huruf : $huruf');
  }
}


// =====================================================
// SOAL 2 - FIZZBUZZ
// =====================================================

class FizzBuzz {
  void jalankan() {
    print('\n===== FIZZBUZZ 1-20 =====');

    for (int i = 1; i <= 20; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        print('FizzBuzz');
      } else if (i % 3 == 0) {
        print('Fizz');
      } else if (i % 5 == 0) {
        print('Buzz');
      } else {
        print(i);
      }
    }
  }
}


// =====================================================
// SOAL 3 - KALKULATOR 5 ANGKA
// =====================================================

class Kalkulator {
  final List<double> angka = [];

  void inputAngka() {
    print('\n===== INPUT 5 ANGKA =====');

    for (int i = 1; i <= 5; i++) {
      while (true) {
        stdout.write('Masukkan angka ke-$i: ');

        String input = stdin.readLineSync() ?? '';
        double? nilai = double.tryParse(input);

        if (nilai != null) {
          angka.add(nilai);
          break;
        } else {
          print('Input tidak valid. Masukkan angka.');
        }
      }
    }
  }

  double hitungJumlah() {
    double jumlah = 0;

    for (double nilai in angka) {
      jumlah += nilai;
    }

    return jumlah;
  }

  double hitungRataRata() {
    return hitungJumlah() / angka.length;
  }

  double hitungMaksimum() {
    double maksimum = angka[0];

    for (double nilai in angka) {
      if (nilai > maksimum) {
        maksimum = nilai;
      }
    }

    return maksimum;
  }

  double hitungMinimum() {
    double minimum = angka[0];

    for (double nilai in angka) {
      if (nilai < minimum) {
        minimum = nilai;
      }
    }

    return minimum;
  }

  void jalankan() {
    angka.clear();

    inputAngka();

    print('\n===== HASIL PERHITUNGAN =====');
    print('Jumlah         : ${hitungJumlah()}');
    print('Rata-rata      : ${hitungRataRata()}');
    print('Nilai maksimum : ${hitungMaksimum()}');
    print('Nilai minimum  : ${hitungMinimum()}');
  }
}


// =====================================================
// SOAL 4 - GAME TEBAK ANGKA
// =====================================================

class TebakAngka {
  final Random random = Random();

  void jalankan() {
    print('\n===== GAME TEBAK ANGKA =====');
    print('Saya telah memilih angka dari 1 sampai 5.');

    int angkaRandom = random.nextInt(5) + 1;
    int? tebakan;

    do {
      stdout.write('Masukkan tebakan (1-5): ');

      String input = stdin.readLineSync() ?? '';
      tebakan = int.tryParse(input);

      if (tebakan == null || tebakan < 1 || tebakan > 5) {
        print('Masukkan angka antara 1 sampai 5.');
        tebakan = null;
      } else if (tebakan != angkaRandom) {
        print('Salah! Coba lagi.');
      }
    } while (tebakan != angkaRandom);

    print('Benar! Kamu berhasil menebak.');
    print('Angka yang benar adalah $angkaRandom.');
  }
}


// =====================================================
// CLASS UTAMA
// =====================================================

class Tugas2 {
  final NilaiHuruf nilaiHuruf = NilaiHuruf();
  final FizzBuzz fizzBuzz = FizzBuzz();
  final Kalkulator kalkulator = Kalkulator();
  final TebakAngka tebakAngka = TebakAngka();

  void tampilkanMenu() {
    print('\n======================================');
    print('           TUGAS 2 - DART OOP');
    print('======================================');
    print('1. Menentukan Nilai Huruf');
    print('2. FizzBuzz 1-20');
    print('3. Kalkulator 5 Angka');
    print('4. Game Tebak Angka');
    print('5. Keluar');
    print('======================================');
  }

  void jalankan() {
    while (true) {
      tampilkanMenu();

      stdout.write('Pilih menu (1-5): ');
      String pilihan = stdin.readLineSync() ?? '';

      switch (pilihan) {
        case '1':
          nilaiHuruf.jalankan();
          break;

        case '2':
          fizzBuzz.jalankan();
          break;

        case '3':
          kalkulator.jalankan();
          break;

        case '4':
          tebakAngka.jalankan();
          break;

        case '5':
          print('\nProgram selesai. Terima kasih!');
          return;

        default:
          print('\nPilihan tidak tersedia.');
      }

      stdout.write('\nTekan ENTER untuk kembali ke menu...');
      stdin.readLineSync();
    }
  }
}


// =====================================================
// MAIN
// =====================================================

void main() {
  Tugas2 aplikasi = Tugas2();
  aplikasi.jalankan();
}
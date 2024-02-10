import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Pengantar extends StatelessWidget {
  const Pengantar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pengantar'),
        ),
        body: SingleChildScrollView(child: Html(data: '''
                <p><em>Assalaamu&rsquo;alaikum Warahamatullahi Wabarakaatuh</em></p>
                <p style="text-align: justify;">Salam sehat sejahtera, semoga kita semua selalu sehat sepanjang masa dan dengan Rahmat Dia jualah aplikasi sederhana ini hadir untuk kita semua.</p>
                <p style="text-align: justify;">Agar dapat diketahui, semua ramuan dan resep yang ada dalam aplikasi ini disadur atau diambil dari berbagai sumber yang sebagian besarnya adalah resep-resep yang telah diberikan oleh seorang dokter Islam dr. Zaidul Akbar yang begitu terkenal dengan resep rempahnya Jurus Sehat Rasulullah.</p>
                <p style="text-align: justify;">Jika ada diantara kita yang merasa dirugikan dengan aplikasi ini, bisa dengan terbuka memberitahukan lewat email <a href="mailto:axlsoft.studio@gmail.com">axlsoft.studio@gmail.com</a> yang InsyaAllah akan segera saya tanggapi. Namun diharap akan kebesaran hatinya saja jika ternyata terdapat bahan-bahan yang dirasa punya hak cipta agar dapat digunakan didalam aplikasi ini.</p>
                <p style="text-align: justify;">Aplikasi ini dimonetisasi dengan maksud belajar, dan mencari motivasi untuk membuat aplikasi-aplikasi bermanfaat lainnya. insyaAllah</p>
                <p style="text-align: justify;"><strong><u>Penting:</u></strong></p>
                <p style="text-align: justify;">Perlu diingat bahwa semua ramuan ini diramu oleh orang-orang profesional dan berpengalaman. Namun jika ada ditemukan kekeliruan, bisa diberitahukan langsung melalui email. Selain itu, pembuat aplikasi hanyalah sebagai mediator dan tidak bertanggung jawab sama sekali terhadap keburukan-keburukan yang bisa saja ditimbulkan oleh resep-resep ini.</p>
                <p style="text-align: justify;"><strong><u>Pesan:</u></strong></p>
                <p style="text-align: justify;">Jangan berlebihan, itulah pesan dari dr Zaidul Akbar saat ditanya &ldquo;Apakah resep ini punya efek samping?&rdquo;. Karena apapun meski baik, tetap akan memberikan dampak buruk, jika dikonsumsi secara berlebihan</p>
                <p>Sekian</p>
                <p><em>Wassalaamu&rsquo;alaikum Warahamatullahi Wabarakaatuh</em></p>''')));
  }
}

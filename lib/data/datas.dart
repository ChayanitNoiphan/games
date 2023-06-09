import 'dart:math';

class data {
  List num = [];
  List word = [
    "กงเกวียนกำเกวียน",
    "กระดี่ได้น้ำ",
    "กระต่ายขาเดียว",
    "ขนมผสมน้ำยา",
    "ขวานผ่าซาก",
    "เข้าด่ายเข้าเข็ม",
    "เขียนเสือให้วัวกลัว",
    "คลุมถุงชน",
    "คางคกขึ้นวอ",
    "จับงูข้างหาง",
    "ชักใบให้เรือเสีย",
    "ชุบมือเปิบ",
    "ได้ดีขี่แพะไล่",
    "ตาบอดคลำช้าง",
    "ตาลยอดด้วน",
    "ถอยหลังเข้าคลอง",
    "น้ำลดตอผุด",
    "ปากหวานก้นเปรี้ยว",
    "ฝนตกไม่ทั่วฟ้า",
    "มะนาวไม่มีน้ำ",
    "ยื่นแก้วให้วานร",
    "ลูกขุนพลอยพยัก",
    "สุกเอาเผากิน",
    "หอกข้างแคร่",
    "เอาหูไปนา เอาตาไปไร่"
  ];
  List mean = [
    "ทำอะไรกับใครไว้ ย่อมได้รับผลกรรมนั้น",
    "ดีอกดีใจจนเกินงาม เนื้อตัวสั่น",
    "ยืนกรานไม่ยอมรับผิด",
    "ทั้งคู่ดีเหลวพอกัน",
    "พูดจาตรงๆ ไม่เกรงใจใคร",
    "กำลังคับขันกำลังสำคัญ ถ้ามีอะไรมาขัดจังหวะจะเสียอาการ",
    "หลอก ขู่ ให้ฝ่ายตรงข้ามเสียขวัญ",
    "การแต่งงาน ที่ต่างไม่ได้รักกัน โดนผู้ใหญ่บังคับ",
    "คนจนพอได้ดี แล้วลืมตัว",
    "ทำสิ่งที่เสี่ยงต่ออันตราย",
    "พูดหรือขวางให้การสนทนาออกนอกเรื่อง",
    "ฉวยเอาผลประโยชน์ของผู้อื่น โดยตัวเองไมได้ลงทุนลงแรง",
    "ไปซ้ำเติม เยาะเย้ยเมื่อคนอื่นเพลี่ยงพล้ำ",
    "คนที่รู้อะไรด้านเดียว แล้วเข้าใจแต่อย่างนั้น สิ่งนั้น",
    "คนที่ไม่มีหนทางทำมาหากินคนไม่มีบุตรสืบสกุล",
    "หวนกลับไปหาแบบเดิม ๆ ล้าสมัย",
    "เมื่อหมดอำนาจ ความชั่วที่ทำไว้ก็ปรากฎ",
    "พูดจาอ่อนหวาน แต่ไม่จริงใจ",
    "ให้หรือแจกจ่ายอะไรไม่ทั่วถึงกัน",
    "พูดห้วน ๆ",
    "เอาของมีค่าให้คนที่ไม่รู้จักค่าของสิ่งนั้น",
    "พวกประจบสอพลอ ผู้ที่คอยว่าตามผู้ใหญ่ เจ้านาย",
    "ทำลวก ๆ ทำพอเสร็จไปครั้ง ๆ หนึ่ง",
    "คนใกล้ชิดที่จะคอยทำร้ายเมื่อใดก็ได้",
    "แสร้งทำเป็นไม่รู้ไม่เห็น ไม่สนใจ"
  ];

  void RandomNumber() {
    var check = [];
    var ran = Random().nextInt(word.length);
    num.add(ran);
    check.add(ran);
    for (;;) {
      bool status = true;
      ran = Random().nextInt(word.length);
      for (int i = 0; i < check.length; i++) {
        if (ran == check[i]) {
          status = false;
          break;
        }
      }
      if (status) {
        num.add(ran);
        check.add(ran);
      }
      if (num.length == 4) break;
    }
  }

  String getWord(int index) {
    return word[index];
  }

  String getMean(int index) {
    return mean[index];
  }

  bool checkMatch(int left, String word) {
    if (mean[num[left]] == word) {
      return true;
    }
    return false;
  }

  List getWordlist() {
    List a = [];
    a.add(word[num[0]]);
    a.add(word[num[1]]);
    a.add(word[num[2]]);
    a.add(word[num[3]]);
    return a;
  }

  List getMeanlist() {
    List a = [];
    List check = [];
    var ran = Random().nextInt(4);
    a.add(mean[num[ran]]);
    check.add(ran);
    for (;;) {
      bool status = true;
      ran = Random().nextInt(4);
      for (int i = 0; i < check.length; i++) {
        if (ran == check[i]) {
          status = false;
          break;
        }
      }
      if (status) {
        a.add(mean[num[ran]]);
        check.add(ran);
      }
      if (a.length == 4) break;
    }
    return a;
  }
}

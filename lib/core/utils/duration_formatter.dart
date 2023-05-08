class DurationFormatter {
  static String arabic(Duration duration) {
    final days = duration.inDays;
    final months = (days / 30).floor();
    final years = (months / 12).floor();

    if (years > 0) {
      if (years == 1) {
        return 'سنة';
      } else if (years == 2) {
        return "سنتين";
      } else {
        return '$years سنين';
      }
    } else if (months > 0) {
      if (months == 1) {
        return 'شهر';
      } else if (months == 2) {
        return "شهرين";
      } else {
        return '$months شهور';
      }
    } else if (days > 0) {
      if (days == 1) {
        return 'يوم';
      } else if (days == 2) {
        return 'يومين';
      } else if (days < 11) {
        return '$days أيام';
      } else if (days < 20) {
        return '${days % 10} عشر أيام';
      } else if (days < 30) {
        return '${days % 20} عشرين يوم';
      } else {
        return '${days / 30} شهر';
      }
    } else {
      return 'اليوم';
    }
  }
}
enum BibleVersion {
  NVI,
  AA,
  ACF,
}

returnBibleVersionName(BibleVersion version) {
  String data = '';
  switch (version) {
    case BibleVersion.AA:
      data = 'aa';
      break;
    case BibleVersion.ACF:
      data = 'acf';
      break;
    case BibleVersion.NVI:
      data = 'nvi';
      break;
  }

  return data;
}

enum Feeling {
  amazed,
  amused,
  angry,
  annoyed,
  anxious,
  ashamed,
  brave,
  calm,
  confident,
  content,
  disappointed,
  discouraged,
  disgusted,
  drained,
  embarrassed,
  excited,
  frustrated,
  grateful,
  guilty,
  happy,
  hopeful,
  hopeless,
  indifferent,
  irritated,
  jealous,
  joyful,
  lonely,
  overwhelmed,
  passionate,
  peaceful,
  proud,
  relieved,
  sad,
  satisfied,
  scared,
  stressed,
  surprised,
  worried,
}

extension FeelingExtension on Feeling {
  String get name {
    switch (this) {
      case Feeling.amazed:
        return 'Amazed';
      case Feeling.amused:
        return 'Amused';
      case Feeling.angry:
        return 'Angry';
      case Feeling.annoyed:
        return 'Annoyed';
      case Feeling.anxious:
        return 'Anxious';
      case Feeling.ashamed:
        return 'Ashamed';
      case Feeling.brave:
        return 'Brave';
      case Feeling.calm:
        return 'Calm';
      case Feeling.confident:
        return 'Confident';
      case Feeling.content:
        return 'Content';
      case Feeling.disappointed:
        return 'Disappointed';
      case Feeling.discouraged:
        return 'Discouraged';
      case Feeling.disgusted:
        return 'Disgusted';
      case Feeling.drained:
        return 'Drained';
      case Feeling.embarrassed:
        return 'Embarrassed';
      case Feeling.excited:
        return 'Excited';
      case Feeling.frustrated:
        return 'Frustrated';
      case Feeling.grateful:
        return 'Grateful';
      case Feeling.guilty:
        return 'Guilty';
      case Feeling.happy:
        return 'Happy';
      case Feeling.hopeful:
        return 'Hopeful';
      case Feeling.hopeless:
        return 'Hopeless';
      case Feeling.indifferent:
        return 'Indifferent';
      case Feeling.irritated:
        return 'Irritated';
      case Feeling.jealous:
        return 'Jealous';
      case Feeling.joyful:
        return 'Joyful';
      case Feeling.lonely:
        return 'Lonely';
      case Feeling.overwhelmed:
        return 'Overwhelmed';
      case Feeling.passionate:
        return 'Passionate';
      case Feeling.peaceful:
        return 'Peaceful';
      case Feeling.proud:
        return 'Proud';
      case Feeling.relieved:
        return 'Relieved';
      case Feeling.sad:
        return 'Sad';
      case Feeling.satisfied:
        return 'Satisfied';
      case Feeling.scared:
        return 'Scared';
      case Feeling.stressed:
        return 'Stressed';
      case Feeling.surprised:
        return 'Surprised';
      case Feeling.worried:
        return 'Worried';
    }
  }
}

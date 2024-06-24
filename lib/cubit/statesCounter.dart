abstract class States {}

class InaitalStatNews extends States {}

class ConterChangStat extends States {
  ConterChangStat() {}
}

class InaitialNavigtoor extends States {}

class ChangNavigator extends States {}

class LodingBuissnsn extends States {}

class SicssBuissns extends States {}

class ErerrBuissns extends States {
  String? erorr;
  ErerrBuissns(this.erorr) {
    print(erorr);
  }
}

class LodingSports extends States {}

class SicssSports extends States {}

class ErerrSports extends States {
  String? erorr;
  ErerrSports(this.erorr) {
    print(erorr);
  }
}

class LodingScience extends States {}

class SicssScience extends States {}

class ErerrScience extends States {
  String? erorr;
  ErerrScience(this.erorr) {
    print(erorr);
  }
}

class LodingSearch extends States {}

class SicssSearch extends States {}

class ErerrSearch extends States {
  String? erorr;
  ErerrSearch(this.erorr) {
    print(erorr);
  }
}

class StateMode extends States {
  StateMode() {
    // AppNwes.get(context).ChangeMode();
  }
}

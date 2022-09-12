#!/bin/bash
#
# download all pdf files from wahl-o-mat website
#

WGET_OPTS="--no-verbose --no-clobber"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
[ -z "$SCRIPT_DIR" ] && echo "ERROR: Script directory could not be detected. Abort!" >&2 && exit 1

( ! which wget &>/dev/null) && echo "ERROR: Command \"wget\" not available. Abort!" >&2 && exit 1

# download
cd "$SCRIPT_DIR/pdf" || exit 1
wget $WGET_OPTS "https://www.wahl-o-mat.de/bw2011/PositionsvergleichBadenWuerttemberg2011.pdf" -O "PositionsvergleichBadenWuerttemberg2011.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/bw2021/PositionsVergleichBadenWuerttemberg2021.pdf" -O "PositionsVergleichBadenWuerttemberg2021.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/bayern2013/PositionsvergleichBayern2013.pdf" -O "PositionsvergleichBayern2013.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/bayern2018/PositionsvergleichBayern2018.pdf" -O "PositionsvergleichBayern2018.pdf"
wget $WGET_OPTS "https://web.archive.org/web/20111216080542/http://www.wahl-o-mat.de/berlin2011/PositionsvergleichBerlin2011.pdf" -O "PositionsvergleichBerlin2011.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/berlin2016/PositionsvergleichBerlin2016.pdf" -O "PositionsvergleichBerlin2016.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/berlin2021/PositionsVergleichBerlin2021.pdf" -O "PositionsvergleichBerlin2021.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/brandenburg2014/PositionsvergleichBrandenburg2014.pdf" -O "PositionsvergleichBrandenburg2014.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/brandenburg2019/PositionsvergleichBrandenburg2019.pdf" -O "PositionsvergleichBrandenburg2019.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/bremen2011/PositionsvergleichBremen2011.pdf" -O "PositionsvergleichBremen2011.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/bremen2015/PositionsvergleichBremen2015.pdf" -O "PositionsvergleichBremen2015.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/bremen2019/PositionsvergleichBremen2019.pdf" -O "PositionsvergleichBremen2019.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/bundestagswahl2013/PositionsvergleichBundestagswahl2013.pdf" -O "PositionsvergleichBundestagswahl2013.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/bundestagswahl2017/PositionsvergleichBundestagswahl2017.pdf" -O "PositionsvergleichBundestagswahl2017.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/bundestagswahl2021/PositionsVergleichBundestagswahl2021.pdf" -O "PositionsvergleichBundestagswahl2021.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/europawahl2014/PositionsvergleichEuropawahl2014.pdf" -O "PositionsvergleichEuropawahl2014.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/europawahl2019/PositionsvergleichEuropawahl2019.pdf" -O "PositionsvergleichEuropawahl2019.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/hamburg2011/PositionsvergleichHamburg2011.pdf" -O "PositionsvergleichHamburg2011.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/hamburg2015/PositionsvergleichHamburg2015.pdf" -O "PositionsvergleichHamburg2015.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/hamburg2020/PositionsvergleichHamburg2020.pdf" -O "PositionsvergleichHamburg2020.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/hessen2018/PositionsvergleichHessen2018.pdf" -O "PositionsvergleichHessen2018.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/mecklenburgvorpommern2021/PositionsVergleichMecklenburgVorpommern2021.pdf" -O "PositionsvergleichMecklenburgVorpommern2021.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/niedersachsen2013/PositionsvergleichNiedersachsen2013.pdf" -O "PositionsvergleichNiedersachsen2013.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/niedersachsen2022/PositionsVergleichNiedersachsen2022.pdf" -O "PositionsvergleichNiedersachsen2022.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/nrw2012/PositionsvergleichNordrheinWestfalen2012.pdf" -O "PositionsvergleichNordrheinWestfalen2012.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/nrw2017/PositionsvergleichNordrheinWestfalen2017.pdf" -O "PositionsvergleichNordrheinWestfalen2017.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/nrw2022/PositionsVergleichNordrheinWestfalen2022.pdf" -O "PositionsvergleichNordrheinWestfalen2022.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/rlp2011/PositionsvergleichRheinlandPfalz2011.pdf" -O "PositionsvergleichRheinlandPfalz2011.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/rlp2016/PositionsvergleichRheinlandPfalz2016.pdf" -O "PositionsvergleichRheinlandPfalz2016.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/rlp2021/PositionsVergleichRheinlandPfalz2021.pdf" -O "PositionsVergleichRheinlandPfalz2021.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/saarland2012/PositionsvergleichSaarland2012.pdf" -O "PositionsvergleichSaarland2012.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/saarland2017/PositionsvergleichSaarland2017.pdf" -O "PositionsvergleichSaarland2017.pdf"
wget $WGET_OPTS "https://archiv.wahl-o-mat.de/saarland2022/PositionsVergleichSaarland2022.pdf" -O "PositionsvergleichSaarland2022.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/sachsen2014/PositionsvergleichSachsen2014.pdf" -O "PositionsvergleichSachsen2014.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/sachsen2019/PositionsvergleichSachsen2019.pdf" -O "PositionsvergleichSachsen2019.pdf"
wget $WGET_OPTS "https://archiv.wahl-o-mat.de/sachsenanhalt2016/PositionsvergleichSachsenAnhalt2016.pdf" -O "PositionsvergleichSachsenAnhalt2016.pdf"
wget $WGET_OPTS "https://archiv.wahl-o-mat.de/sachsenanhalt2021/PositionsVergleichSachsenAnhalt2021.pdf" -O "PositionsvergleichSachsenAnhalt2021.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/schleswigholstein2012/PositionsvergleichSchleswigHolstein2012.pdf" -O "PositionsvergleichSchleswigHolstein2012.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/schleswigholstein2017/PositionsvergleichSchleswigHolstein2017.pdf" -O "PositionsvergleichSchleswigHolstein2017.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/schleswigholstein2022/PositionsVergleichSchleswigHolstein2022.pdf" -O "PositionsvergleichSchleswigHolstein2022.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/thueringen2014/PositionsvergleichThueringen2014.pdf" -O "PositionsvergleichThueringen2014.pdf"
wget $WGET_OPTS "https://www.wahl-o-mat.de/thueringen2019/PositionsvergleichThueringen2019.pdf" -O "PositionsvergleichThueringen2019.pdf"

# check if downloaded files have correct hash (have not been changed)
if ! sha256sum --quiet --strict --check pdf.sha256sum
then
    echo "ERROR: Checksum failed. Something seems odd. Please check the above messages!" >&2
    exit 1
fi

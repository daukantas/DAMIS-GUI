INSERT INTO `cluster` (`ClusterName`, `ClusterWorkloadHost`, `ClusterDescription`, `ClusterID`) VALUES
('MII Cluster', 'test', '&lt;p&gt;Distributed Computing cluster of Vilnius University Institute of Mathematics and Informatics.&lt;/p&gt;&lt;p&gt;Cluster home:&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://cluster.mii.lt/&quot; target=&quot;blank&quot;&gt;http://cluster.mii.lt/&lt;/a&gt;&lt;/p&gt;&lt;p&gt;Cluster workload:&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://cluster.mii.lt/ganglia/&quot; target=&quot;blank&quot;&gt;http://cluster.mii.lt/ganglia/&lt;/a&gt;&lt;/p&gt; ', 1),
('MIF VU SK2', 'test', '&lt;p&gt;Supercomputer of Vilnius University Faculty of Mathematics and Informatics.&lt;/p&gt;&lt;p&gt;Cluster home:&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://mif.vu.lt/cluster/&quot; target=&quot;blank&quot;&gt;http://mif.vu.lt/cluster/&lt;/a&gt;&lt;/p&gt;&lt;p&gt;Cluster workload:&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://k007.mif.vu.lt/ganglia2/&quot; target=&quot;blank&quot;&gt;http://k007.mif.vu.lt/ganglia2/&lt;/a&gt;&lt;/p&gt;', 2);

INSERT INTO `componenttype` (`ComponentType`, `ComponentTypeID`) VALUES
('Upload data', 1),
('Preprocessing', 2),
('Statistical primitives', 3),
('Dimension reduction', 4),
('Classification, grouping', 5),
('View results', 6);

INSERT INTO `parameterconnectiontype` (`ParameterConnectionType`, `ParameterConnectionTypeID`) VALUES
('INPUT_CONNECTION', 1),
('OUTPUT_CONNECTION', 2),
('INPUT_VALUE', 3);

INSERT INTO `component` (`ComponentName`, `ComponentIcon`, `ComponentWSDLRunHost`, `ComponentWSDLCallFunction`,
`ComponentDescription`, `ComponentAltDescription`, `ComponentLabelLT`, `ComponentLabelEN`, `ComponentID`, `ClusterID`,
`ComponentTypeID`, `FormType`) VALUES
('Upload new file', 'upload-file-ico-1.jpeg', '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 'NewFile'),
('Upload new file', 'upload-file-ico-1.jpeg', '', '', NULL, NULL, NULL, NULL, 2, 2, 1, 'NewFile'),
('Filter data', 'filter-data-ico.jpeg', '', '', NULL, NULL, NULL, NULL, 9, 1, 2, 'Filter'),
('Filter data', 'filter-data-ico.jpeg', '', '', NULL, NULL, NULL, NULL, 10, 2, 2, 'Filter');


INSERT INTO `parameter` (`ParameterName`, `ParameterIsRequired`, `ParameterDefault`, `ParameterDescription`, `ParameterLabelLT`, `ParameterLabelEN`, `ParameterID`, `ParameterTypeID`, `ParameterConnectionTypeID`, `ComponentID`) VALUES
('dataset', 0, NULL, NULL, NULL, NULL, 1, NULL, 2, 1),
('dataset', 0, NULL, NULL, NULL, NULL, 2, NULL, 2, 2),
('X', 0, NULL, NULL, NULL, NULL, 3, NULL, 1, 9),
('Y', 0, NULL, NULL, NULL, NULL, 4, NULL, 2, 9),
('X', 0, NULL, NULL, NULL, NULL, 5, NULL, 1, 10),
('Y', 0, NULL, NULL, NULL, NULL, 6, NULL, 2, 10),
('Result type', 1, NULL, NULL, NULL, NULL, 9, NULL, 3, 9),
('Z value', 1, NULL, NULL, NULL, NULL, 10, NULL, 3, 9),
('Attribute', 1, NULL, NULL, NULL, NULL, 11, NULL, 3, 9),
('Result type', 1, NULL, NULL, NULL, NULL, 12, NULL, 3, 10),
('Z value', 1, NULL, NULL, NULL, NULL, 13, NULL, 3, 10),
('Attribute', 1, NULL, NULL, NULL, NULL, 14, NULL, 3, 10);

INSERT INTO `experimentstatus` (`ExperimentStatus`, `ExperimentStatusID`) VALUES
	('SAVED', 1),
	('FINISHED', 2);

-- --------------------------------------------------------
-- help pages
-- --------------------------------------------------------

INSERT INTO `page` (`id`, `title`, `slug`, `text`, `position`, `groupName`, `created`, `updated`, `language`) VALUES
	(1, 'Help', 'help', '<h2>Duomenų įkėlimas</h2>\r\n<h4>Failo įkėlimas</h4>\r\n<p>Galimybė įkelti failą. Failus galima pateikti šiais formatais: tab, txt, csv, ARFF ir XML failai suarchyvuoti zip formatu. Reikalavimai duomenų failui: atskirų objektų požymių įverčiai pateikiami atskirose eilutėse, bei objekto požymių įverčiai eilutėje atskiriami tarpais arba specialiais simboliais.</p>\r\n<h4>Egzistuojantys failai</h4>\r\n<p>Galimybė pasinaudoti jau į sistemą įkeltais duomenų failais.</p>\r\n<h4>MIDAS failas</h4>\r\n<p>Galimybė pasinaudoti MIDAS archyvo viešais duomenų failais.</p>\r\n<h2>Pirminis apdorojimas</h2>\r\n<h4>Valymas | Duomenų valymas</h4>\r\n<p>Duomenų valymas – procesas, kuriuo metu yra užtikrinama, kad duomenys turi vientisą struktūrą ir yra tinkami apdorojimui. Duomenų valymas susideda iš dviejų dalių:</p>\r\n<ol>\r\n<li>Patikrinamas duomenų vektorių atributų duomenų tipų atitikimas meta informacijoje deklaruotiems duomenų tipams. Jeigu duomenys neturi meta informacijos, ji yra sugeneruojama, atlikus duomenų imties analizę. Šio patikrinimo metu aptiktos klaidos gali būti taisomos automatiškai arba pranešamos naudotojui. Taip iš duomenų yra pašalinamos surinkimo klaidos, pavyzdžiui ties skaičiumi įvestas nepageidaujamas simbolis.</li>\r\n<li>Trūkstamų reikšmių šalinimas. Trūkstamos reikšmės gali būti keičiamos standartine ar nurodyta reikšme arba įrašai su trūkstamomis reikšmėmis atmetami. Taip yra užtikrinama, kad visi duomenų įrašai turės reikšmes ir bus tinkami tolimesniam apdorojimui.</li>\r\n</ol>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Trūkstamų reikšmių šalinimas</strong> (boolean) – jei reikšmė „True“, užpildomos trūkstamos reikšmės. Kitaip, tiesiog atnaujinama failo meta informacija apie duomenų atitikimą tipams.</li>\r\n<li><strong>Duomenų tipų atitikimas</strong> (boolean) – Patikrinamas duomenų vektorių atributų duomenų tipų atitikimas meta informacijoje deklaruotiems duomenų tipams. Jei reikšmė „True“, automatiškai atnaujinami stulpelių tipai. Kitaip grąžinamas pranešimas apie tipų neatitikimus meta informacijai.</li>\r\n</ul>\r\n<h4>Filtravimas | Duomenų filtravimas</h4>\r\n<p>Duomenų filtravimas yra tam tikromis savybėmis pasižyminčių įrašų atmetimas iš nagrinėjamų įrašų aibės. Pavyzdžiui, galima atmesti atsiskyrėlius – stipriai nuo pagrindinės duomenų masės nutolusius ir prieštaraujančius jos tendencijoms vektorius.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Stulpelio numeris</strong> (int) – stulpelio, su kuriuo reikia atlikti skaičiavimus, indeksas.</li>\r\n<li><strong>Filtravimo tipas</strong> (string) – pasirenkamas filtro tipas {„z-factor“ | „quartile“}.</li>\r\n<li><strong>Rezultatas</strong> (string) – rezultato tipas : {„outliers“ | „non-outliers“}.</li>\r\n</ul>\r\n<h4>Skaidymas | Pradinės duomenų aibės skaidymas į smulkesnius poaibius</h4>\r\n<p>Duomenų skaidymas – pradinės duomenų aibės skaidymas į smulkesnius poaibius. Gautuosius poaibius galima apdoroti lygiagrečiai arba nagrinėti vieną iš jų, pavyzdžiui imtis gali atspindėti populiacijos dėsningumus.</p>\r\n<p>Duomenų aibės skaidymo galimi pavyzdžiai: 1. Iš eilės užpildyti kiekvieną poaibį. 2. Tolygiai pildyti visus poaibius. 3. Skaidyti į poaibius pagal įrašų atributų reikšmes.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Skaidymo tipas</strong> (string) – skaidymo metodo tipas: {„attr“ | „line“}. „attr“ – failas dalinamas pagal nurodyto atributo skirtingas reikšmes, „line“ – dalinama į lygias dalis.</li>\r\n<li><strong>Pagal požymį</strong> (int) – atributas, naudojamas skaidymui (naudojant pasirinkimą „attr“).</li>\r\n<li><strong>Poaibių skaičius</strong> (int) – atributas, nurodantis kiek failų suskaidyti (naudojant pasirinkimą „line“).</li>\r\n</ul>\r\n<h4>Transponavimas | Kategorinio atributo išskaidymas į kelis atributus</h4>\r\n<p>Duomenų transponavimas – kategorinio atributo išskaidymas į kelis atributus, skirtus jo subkategorijoms. Pavyzdžiui, kategorinį atributą galima išskaidyti į loginę reikšmę turinčius atributus, kurie žymėtų „True“, jeigu įrašas priklauso tą atributą atitinkančiai kategorijai ir „False“ – priešingu atveju.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Stulpelio numeris</strong> (int) – stulpelio, su kuriuo reikia atlikti skaičiavimus, indeksas.</li>\r\n</ul>\r\n<h4>Normavimas | Duomenų normavimas</h4>\r\n<p>Pradinių duomenų normavimui yra naudojamas transformavimo algoritmas „z-vertės normalizavimas“.</p>\r\n<p>Z-vertės normavimo algoritmu duomenys pakeičiami iš jų išvestomis reikšmėmis taip, kad jų vidurkis tampa 0, o dispersija – 1.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li>-</li>\r\n</ul>\r\n<h2>Statistiniai primityvai</h2>\r\n<h4>Statistiniai primityvai | Statistinių primityvų skaičiavimas</h4>\r\n<p>Duomenų statistiniai primityvai: min, max, vidurkis, standartinis nuokrypis, mediana.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li>-</li>\r\n</ul>\r\n<h2>Dimensijos mažinimas</h2>\r\n<h4>PCA | Pagrindinių komponenčių analizė</h4>\r\n<p>Pagrindinių komponenčių analizė (angl. principal component analysis, PCA) yra klasikinis statistikos metodas. Tai tiesinė duomenų transformacija, plačiai naudojama duomenų analizei kaip daugiamačių duomenų dimensijos mažinimo metodas.</p>\r\n<p>Pagrindinė pagrindinių komponenčių analizės idėja yra sumažinti duomenų dimensiją atliekant tiesinę transformaciją ir atsisakant dalies po transformacijos gautų naujų komponenčių, kurių dispersijos yra mažiausios. Iš pradžių ieškoma krypties, kuria dispersija yra didžiausia. Didžiausią dispersiją turinti kryptis vadinama pirmąja pagrindine komponente. Ji eina per duomenų centrinį tašką. Tai taškas, kurio komponentės yra analizuojamą duomenų aibę sudarančių taškų atskirų komponenčių vidurkiai. Visų taškų vidutinis atstumas iki šios tiesės yra minimalus, t. y., ši tiesė yra kiek galima arčiau visų duomenų taškų. Antrosios pagrindinės komponentės ašis taip pat turi eiti per duomenų centrinį tašką ir ji turi būti statmena pirmosios pagrindinės komponentės ašiai.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Dispersijos dalis</strong> (double) – dispersijos dalis, kurią norima išlaikyti.</li>\r\n</ul>\r\n<h4>SMACOF | SMACOF algoritmas</h4>\r\n<p>Tai vienas geriausių optimizavimo algoritmų, taikomų daugiamačių skalių paklaidos minimizavimui. Algoritmas yra paprastas, bet efektyvus, kadangi garantuoja paklaidos funkcijos konvergavimą į lokalų minimumą su tiesiniu konvergavimo greičiu.</p>\r\n<p>SMACOF algoritmui buvo pritaikytas Gauso Zeidelio metodas. Modifikacijos esmėnauji projekcijos taškai iteracinio proceso eigoje apskaičiuojami, remiantis jau prieš tai toje pačioje iteracijoje apskaičiuotais taškais. Tai reiškia, kad Gutmano transformacijos matrica perskaičiuojama po kiekvieno pakeisto taško. Nors tokio algoritmo konvergavimo greitis išauga, tačiau išauga ir laiko sąnaudos.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus iteracijų skaičius.</li>\r\n<li><strong>Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų</strong> (double) – Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų.</li>\r\n<li><strong>Zeidelio modifikacija</strong> (boolen) – Parametras, kuris nurodo taikyti arba netaikyti Zeidelio modifikaciją. reikšmė „True“, jei taikoma Zeidel modifikacija; jei nenurodyta kitaip, Zeidel modifikacija nebus taikoma.</li>\r\n</ul>\r\n<h4>DMA | Diagonalinio mažoravimo algoritmas</h4>\r\n<p>Diagonalinio mažoravimo algoritmas (DMA) yra SMACOF algoritmo modifikacija, kurioje naudojama paprastesnė mažoravimo funkcija. SMACOF – tai vienas geriausių optimizavimo algoritmų, taikomų daugiamačių skalių paklaidos minimizavimui. Modifikacija DMA skirta atvaizduoti didesnėms duomenų aibėms.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus iteracijų skaičius.</li>\r\n<li><strong>Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų</strong> (double) – Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų.</li>\r\n<li><strong>Kaimynų skaičius</strong> (int) – nurodomas kaimynų skaičius.</li>\r\n</ul>\r\n<h4>Relative MDS | Santykinių daugiamačių skalių algoritmas</h4>\r\n<p>Santykinių daugiamačių skalių algoritmas (angl. Relative MDS) skirtas didelių aibių bei naujų taškų priklausančių daugiamatei erdvei vizualizavimui, naudojant prieš tai apskaičiuotą bazinių taškų projekciją.</p>\r\n<p>Naudojant klasikinį daugiamačių skalių metodą, negalima atidėti naujo taško neperskaičiuojant visos turimos duomenų aibės projekcijos. Todėl naujų taškų atvaizdavimui gali būti naudojamas santykinių daugiamačių skalių algoritmas (SDS). Nors šis metodas nėra toks tikslus kaip SMACOF, tačiau jis gali atvaizduoti dideles aibes, tam pareikalaudamas mažai kompiuterio skaičiavimo resursų.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus iteracijų skaičius.</li>\r\n<li><strong>Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų</strong> (double) – Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų.</li>\r\n<li><strong>Bazinių objektų skaičius</strong> (int) – bazinių vektorių skaičius.</li>\r\n<li><strong>Strategija</strong> (int) – bazinių vektorių parinkimo strategija.</li>\r\n</ul>\r\n<h4>SAMANN | SAMANN algoritmas</h4>\r\n<p>SAMANN – specifinė „klaidos skleidimo atgal“ mokymo taisyklė, kuri leidžia įprastam tiesioginio skleidimo neuroniniam tinklui realizuoti Sammon‘o projekciją mokymo be mokytojo būdu. Sammon‘o projekcija yra netiesinis daugelio kintamųjų objektų atvaizdavimo žemesnio matavimo erdvėje metodas. Jo idėja: atvaizduoti daugiamačius vektorius mažesnio matavimo erdvėje išlaikant santykinai panašius atstumus tarp vektorių.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus neuroninio tinklo apmokymo iteracijų skaičius.</li>\r\n<li><strong>Apmokymo aibės dydis</strong> (int) – SAMANN neuroninio tinklo apmokymui naudojamų pradinės aibės X elementų skaičius.</li>\r\n<li><strong>Paslėptojo sluoksnio neuronų skaičius</strong> (int) – SAMANN neuroninio tinklo paslėptojo sluoksnio neuronų skaičius.</li>\r\n<li><strong>Mokymosi greičio parametras</strong> (double) – mokymosi greičio parametro reikšmė (iš intervalo 0,1–10).</li>\r\n</ul>\r\n<h4>SOM-MDS | Saviorganizuojančių neuroninių tinklų junginys su daugiamatėmis skalėmis</h4>\r\n<p>SOM žemėlapiai naudojami daugiamačiams duomenims vizualizuoti (t. y. rasti projekcijas mažesnės dimensijos erdvėje, įprastai plokštumoje) ir klasterizuoti. SOM tinklo tikslas – išlaikyti duomenų kaimyniškumus, t. y. taškai, esantys arti įėjimo vektorių erdvėje, turi būti atvaizduojami arti vieni kitų ir SOM žemėlapyje.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Eilučių skaičius</strong> (int) – Saviorganizuojančio neuroninio tinklo eilučių skaičius.</li>\r\n<li><strong>Stulpelių skaičius</strong> (int) – Saviorganizuojančio neuroninio tinklo stulpelių skaičius.</li>\r\n<li><strong>Mokymo epochų skaičius</strong> (int) – mokymo epochų skaičius.</li>\r\n<li><strong>MDS iteracijų skaičius</strong> (int) – MDS iteracijų skaičius.</li>\r\n</ul>\r\n<h2>Duomenų analizė</h2>\r\n<h4>SOM | Saviorganizuojantis neuroninis tinklas</h4>\r\n<p>SOM žemėlapiai naudojami ir daugiamačiams duomenims klasterizuoti ir juos vizualizuoti, t. y. rasti projekcijas mažesnės dimensijos erdvėje, įprastai plokštumoje. SOM tinklo tikslas – išlaikyti duomenų kaimyniškumus, t. y. taškai, esantys arti įėjimo vektorių erdvėje, turi būti atvaizduojami arti vieni kitų ir SOM žemėlapyje. Kartais gautus rezultatus sudėtinga interpretuoti, todėl jie papildomai analizuojami vienu iš daugiamačių duomenų projekcijos metodu. Tuo tikslu gali būti naudojamas daugiamačių skalių metodas (MDS). Vienas iš nuosekliojo junginio tikslų – pagerinti duomenų vizualizavimą, panaudojant saviorganizuojančius neuroninius tinklus. Tačiau pagrindinis nuosekliojo junginio tikslas – sumažinti skaičiavimo laiką, neprarandant vizualizavimo kokybės, atvaizduojant neuronus–nugalėtojus atitinkančius vektorius, gautus taikant SOM ir juos vizualizuojant MDS metodu, lyginant su visos duomenų aibės vizualizavimo laiku, taikant tik MDS metodą.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Eilučių skaičius</strong> (int) – Saviorganizuojančio neuroninio tinklo eilučių skaičius.</li>\r\n<li><strong>Stulpelių skaičius</strong> (int) – Saviorganizuojančio neuroninio tinklo stulpelių skaičius.</li>\r\n<li><strong>Mokymo epochų skaičius</strong> (int) – mokymo epochų skaičius.</li>\r\n</ul>\r\n<h4>MLP | Daugiasluoksnis perceptronas</h4>\r\n<p>Daugiasluoksnis perceptronas (DSP) (angl. Multilayer perceptron) yra tiesioginio sklidimo neuroninis tinklas, apmokomas klaidos sklidimo atgal (angl. error back-propagation) metodu. Daugiasluoksnis perceptronas taikomas klasifikavimo uždaviniams spręsti.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Paslėptų perceptronų skaičius</strong> (string) – sluoksnių perceptronų skaičius.</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus mokymo iteracijų skaičius.</li>\r\n<li><strong>Mokymo aibės dydis</strong> (int) – mokymo objektų skaičius.</li>\r\n<li><strong>Testavimo aibės dydis</strong> (int) – testavimo objektų skaičius.</li>\r\n<li><strong>Validavimo aibės dydis</strong> (int) – validavimo objektų skaičius.</li>\r\n</ul>\r\n<h4>C4.5 | C4.5 klasifikatorius</h4>\r\n<p>Sprendimų medžiu vadinamas medžio pavidalo klasifikatorius, priskiriantis klasėms daugiamačius vektorius, kurių požymiai gali būti tiek kategoriniai, tiek tolydieji kintamieji. Medį sudaro arba lapas, pažymėtas klasės numeriu, arba struktūra, apimanti su dviem ar daugiau pomedžių sujungtą sprendimo priėmimo mazgą. Pastarosios rūšies mazgai apibrėžiami testo pavidalu, o jų pomedžiai atitinka visas įmanomas šio testo baigtis.</p>\r\n<p>Duotas vektorius klasifikuojamas vykdant rekursyvų procesą, pradedamą nuo medžio šaknies. Jei dabartinis nagrinėjamas mazgas yra lapas, vektoriui priskiriamas su juo siejamas klasės numeris. Kita vertus, jeigu tai sprendimo priėmimo mazgas, vektoriui pritaikomas šio mazgo testas ir leidžiamasi vienu lygiu gilyn – į pomedį, atitinkantį gautąją testo baigtį. Procesas baigiamas pasiekus lapo mazgą, kitaip sakant, kai nustatoma vektoriaus priklausomybė klasei.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Pasikliovimo lygmuo</strong> (double) – pasikliovimo lygmuo, įvertinant klaidos tikimybės pasikliautinąjį intervalą.</li>\r\n<li><strong>Mokymo aibės dydis</strong> (int) – mokymo objektų skaičius.</li>\r\n<li><strong>Testavimo aibės dydis</strong> (int) – testavimo objektų skaičius.</li>\r\n</ul>\r\n<h4>K-means | k-vidurkių klasterizavimo metodas</h4>\r\n<p>K-vidurkių metodas yra grupavimo algoritmas, skirtas suskirstyti duomenų aibę į kompaktiškas grupes, esančias kuo toliau viena nuo kitos. Paprastai nurodomas parametras k, pasakantis į kiek grupių reikia padalinti vektorių aibę. Čia aptariamas kitas variantas, leidžiantis algoritmui pačiam nustatyti, koks grupių skaičius, nedidesnis už kMax, yra optimalus. Algoritmas veikia didindamas grupių skaičių k nuo 2 iki kMax ir kiekvienu atveju skaičiuodamas gauto padalijimo tinkamumo įvertį. Padalijimas, turėjęs geriausią įvertį, pateikiamas kaip algoritmo veikimo rezultatas.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus iteracijų skaičius.</li>\r\n<li><strong>Maksimalus klasterių skaičius</strong> (int) – maksimalus galimas grupių skaičius.</li>\r\n</ul>\r\n<h2>Rezultatų peržiūra</h2>\r\n<h4>Techninė informacija</h4>\r\n<p>Gautų rezultatų techninė informacija.</p>\r\n<h4>Duomenų grafinis vaizdavimas</h4>\r\n<p>Gautų rezultatų vaizdavimas.</p>', 1, 'help', '2014-03-17 16:21:54', '2014-03-17 16:21:54', 'en_US'),
	(2, 'FAQ', 'faq', '<div class="offset1 span9">\r\n<h2>Frequently Asked Questions</h2>\r\n<h4>How to use uploaded data file in experiment workflow?</h4>\r\n<p>Component "EXISTING DATA" is used for this purpose. Firstly you have to drag this component to the experiment workflow, double click on it and choose your uploaded file from dropdown menu. Now you can construct rest of your experiment.</p>\r\n<h4>How to see experiment results after experiment execution?</h4>\r\n<p>You have to join one of "VIEW RESULTS" component to the ending of your experiment workflow. When experiment finishes its execution "VIEW RESULTS" components become active, if you double click on them results will be displayed.</p>\r\n</div>', 2, 'help', '2014-03-17 16:22:46', '2014-03-17 16:22:46', 'en_US'),
	(3, 'Pagalba', 'pagalba', '<h2>Duomenų įkėlimas</h2>\r\n<h4>Failo įkėlimas</h4>\r\n<p>Galimybė įkelti failą. Failus galima pateikti šiais formatais: tab, txt, csv, ARFF ir XML failai suarchyvuoti zip formatu. Reikalavimai duomenų failui: atskirų objektų požymių įverčiai pateikiami atskirose eilutėse, bei objekto požymių įverčiai eilutėje atskiriami tarpais arba specialiais simboliais.</p>\r\n<h4>Egzistuojantys failai</h4>\r\n<p>Galimybė pasinaudoti jau į sistemą įkeltais duomenų failais.</p>\r\n<h4>MIDAS failas</h4>\r\n<p>Galimybė pasinaudoti MIDAS archyvo viešais duomenų failais.</p>\r\n<h2>Pirminis apdorojimas</h2>\r\n<h4>Valymas | Duomenų valymas</h4>\r\n<p>Duomenų valymas – procesas, kuriuo metu yra užtikrinama, kad duomenys turi vientisą struktūrą ir yra tinkami apdorojimui. Duomenų valymas susideda iš dviejų dalių:</p>\r\n<ol>\r\n<li>Patikrinamas duomenų vektorių atributų duomenų tipų atitikimas meta informacijoje deklaruotiems duomenų tipams. Jeigu duomenys neturi meta informacijos, ji yra sugeneruojama, atlikus duomenų imties analizę. Šio patikrinimo metu aptiktos klaidos gali būti taisomos automatiškai arba pranešamos naudotojui. Taip iš duomenų yra pašalinamos surinkimo klaidos, pavyzdžiui ties skaičiumi įvestas nepageidaujamas simbolis.</li>\r\n<li>Trūkstamų reikšmių šalinimas. Trūkstamos reikšmės gali būti keičiamos standartine ar nurodyta reikšme arba įrašai su trūkstamomis reikšmėmis atmetami. Taip yra užtikrinama, kad visi duomenų įrašai turės reikšmes ir bus tinkami tolimesniam apdorojimui.</li>\r\n</ol>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Trūkstamų reikšmių šalinimas</strong> (boolean) – jei reikšmė „True“, užpildomos trūkstamos reikšmės. Kitaip, tiesiog atnaujinama failo meta informacija apie duomenų atitikimą tipams.</li>\r\n<li><strong>Duomenų tipų atitikimas</strong> (boolean) – Patikrinamas duomenų vektorių atributų duomenų tipų atitikimas meta informacijoje deklaruotiems duomenų tipams. Jei reikšmė „True“, automatiškai atnaujinami stulpelių tipai. Kitaip grąžinamas pranešimas apie tipų neatitikimus meta informacijai.</li>\r\n</ul>\r\n<h4>Filtravimas | Duomenų filtravimas</h4>\r\n<p>Duomenų filtravimas yra tam tikromis savybėmis pasižyminčių įrašų atmetimas iš nagrinėjamų įrašų aibės. Pavyzdžiui, galima atmesti atsiskyrėlius – stipriai nuo pagrindinės duomenų masės nutolusius ir prieštaraujančius jos tendencijoms vektorius.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Stulpelio numeris</strong> (int) – stulpelio, su kuriuo reikia atlikti skaičiavimus, indeksas.</li>\r\n<li><strong>Filtravimo tipas</strong> (string) – pasirenkamas filtro tipas {„z-factor“ | „quartile“}.</li>\r\n<li><strong>Rezultatas</strong> (string) – rezultato tipas : {„outliers“ | „non-outliers“}.</li>\r\n</ul>\r\n<h4>Skaidymas | Pradinės duomenų aibės skaidymas į smulkesnius poaibius</h4>\r\n<p>Duomenų skaidymas – pradinės duomenų aibės skaidymas į smulkesnius poaibius. Gautuosius poaibius galima apdoroti lygiagrečiai arba nagrinėti vieną iš jų, pavyzdžiui imtis gali atspindėti populiacijos dėsningumus.</p>\r\n<p>Duomenų aibės skaidymo galimi pavyzdžiai: 1. Iš eilės užpildyti kiekvieną poaibį. 2. Tolygiai pildyti visus poaibius. 3. Skaidyti į poaibius pagal įrašų atributų reikšmes.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Skaidymo tipas</strong> (string) – skaidymo metodo tipas: {„attr“ | „line“}. „attr“ – failas dalinamas pagal nurodyto atributo skirtingas reikšmes, „line“ – dalinama į lygias dalis.</li>\r\n<li><strong>Pagal požymį</strong> (int) – atributas, naudojamas skaidymui (naudojant pasirinkimą „attr“).</li>\r\n<li><strong>Poaibių skaičius</strong> (int) – atributas, nurodantis kiek failų suskaidyti (naudojant pasirinkimą „line“).</li>\r\n</ul>\r\n<h4>Transponavimas | Kategorinio atributo išskaidymas į kelis atributus</h4>\r\n<p>Duomenų transponavimas – kategorinio atributo išskaidymas į kelis atributus, skirtus jo subkategorijoms. Pavyzdžiui, kategorinį atributą galima išskaidyti į loginę reikšmę turinčius atributus, kurie žymėtų „True“, jeigu įrašas priklauso tą atributą atitinkančiai kategorijai ir „False“ – priešingu atveju.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Stulpelio numeris</strong> (int) – stulpelio, su kuriuo reikia atlikti skaičiavimus, indeksas.</li>\r\n</ul>\r\n<h4>Normavimas | Duomenų normavimas</h4>\r\n<p>Pradinių duomenų normavimui yra naudojamas transformavimo algoritmas „z-vertės normalizavimas“.</p>\r\n<p>Z-vertės normavimo algoritmu duomenys pakeičiami iš jų išvestomis reikšmėmis taip, kad jų vidurkis tampa 0, o dispersija – 1.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li>-</li>\r\n</ul>\r\n<h2>Statistiniai primityvai</h2>\r\n<h4>Statistiniai primityvai | Statistinių primityvų skaičiavimas</h4>\r\n<p>Duomenų statistiniai primityvai: min, max, vidurkis, standartinis nuokrypis, mediana.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li>-</li>\r\n</ul>\r\n<h2>Dimensijos mažinimas</h2>\r\n<h4>PCA | Pagrindinių komponenčių analizė</h4>\r\n<p>Pagrindinių komponenčių analizė (angl. principal component analysis, PCA) yra klasikinis statistikos metodas. Tai tiesinė duomenų transformacija, plačiai naudojama duomenų analizei kaip daugiamačių duomenų dimensijos mažinimo metodas.</p>\r\n<p>Pagrindinė pagrindinių komponenčių analizės idėja yra sumažinti duomenų dimensiją atliekant tiesinę transformaciją ir atsisakant dalies po transformacijos gautų naujų komponenčių, kurių dispersijos yra mažiausios. Iš pradžių ieškoma krypties, kuria dispersija yra didžiausia. Didžiausią dispersiją turinti kryptis vadinama pirmąja pagrindine komponente. Ji eina per duomenų centrinį tašką. Tai taškas, kurio komponentės yra analizuojamą duomenų aibę sudarančių taškų atskirų komponenčių vidurkiai. Visų taškų vidutinis atstumas iki šios tiesės yra minimalus, t. y., ši tiesė yra kiek galima arčiau visų duomenų taškų. Antrosios pagrindinės komponentės ašis taip pat turi eiti per duomenų centrinį tašką ir ji turi būti statmena pirmosios pagrindinės komponentės ašiai.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Dispersijos dalis</strong> (double) – dispersijos dalis, kurią norima išlaikyti.</li>\r\n</ul>\r\n<h4>SMACOF | SMACOF algoritmas</h4>\r\n<p>Tai vienas geriausių optimizavimo algoritmų, taikomų daugiamačių skalių paklaidos minimizavimui. Algoritmas yra paprastas, bet efektyvus, kadangi garantuoja paklaidos funkcijos konvergavimą į lokalų minimumą su tiesiniu konvergavimo greičiu.</p>\r\n<p>SMACOF algoritmui buvo pritaikytas Gauso Zeidelio metodas. Modifikacijos esmėnauji projekcijos taškai iteracinio proceso eigoje apskaičiuojami, remiantis jau prieš tai toje pačioje iteracijoje apskaičiuotais taškais. Tai reiškia, kad Gutmano transformacijos matrica perskaičiuojama po kiekvieno pakeisto taško. Nors tokio algoritmo konvergavimo greitis išauga, tačiau išauga ir laiko sąnaudos.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus iteracijų skaičius.</li>\r\n<li><strong>Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų</strong> (double) – Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų.</li>\r\n<li><strong>Zeidelio modifikacija</strong> (boolen) – Parametras, kuris nurodo taikyti arba netaikyti Zeidelio modifikaciją. reikšmė „True“, jei taikoma Zeidel modifikacija; jei nenurodyta kitaip, Zeidel modifikacija nebus taikoma.</li>\r\n</ul>\r\n<h4>DMA | Diagonalinio mažoravimo algoritmas</h4>\r\n<p>Diagonalinio mažoravimo algoritmas (DMA) yra SMACOF algoritmo modifikacija, kurioje naudojama paprastesnė mažoravimo funkcija. SMACOF – tai vienas geriausių optimizavimo algoritmų, taikomų daugiamačių skalių paklaidos minimizavimui. Modifikacija DMA skirta atvaizduoti didesnėms duomenų aibėms.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus iteracijų skaičius.</li>\r\n<li><strong>Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų</strong> (double) – Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų.</li>\r\n<li><strong>Kaimynų skaičius</strong> (int) – nurodomas kaimynų skaičius.</li>\r\n</ul>\r\n<h4>Relative MDS | Santykinių daugiamačių skalių algoritmas</h4>\r\n<p>Santykinių daugiamačių skalių algoritmas (angl. Relative MDS) skirtas didelių aibių bei naujų taškų priklausančių daugiamatei erdvei vizualizavimui, naudojant prieš tai apskaičiuotą bazinių taškų projekciją.</p>\r\n<p>Naudojant klasikinį daugiamačių skalių metodą, negalima atidėti naujo taško neperskaičiuojant visos turimos duomenų aibės projekcijos. Todėl naujų taškų atvaizdavimui gali būti naudojamas santykinių daugiamačių skalių algoritmas (SDS). Nors šis metodas nėra toks tikslus kaip SMACOF, tačiau jis gali atvaizduoti dideles aibes, tam pareikalaudamas mažai kompiuterio skaičiavimo resursų.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus iteracijų skaičius.</li>\r\n<li><strong>Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų</strong> (double) – Skirtumas tarp paklaidų, gautų tarp gretimų iteracijų.</li>\r\n<li><strong>Bazinių objektų skaičius</strong> (int) – bazinių vektorių skaičius.</li>\r\n<li><strong>Strategija</strong> (int) – bazinių vektorių parinkimo strategija.</li>\r\n</ul>\r\n<h4>SAMANN | SAMANN algoritmas</h4>\r\n<p>SAMANN – specifinė „klaidos skleidimo atgal“ mokymo taisyklė, kuri leidžia įprastam tiesioginio skleidimo neuroniniam tinklui realizuoti Sammon‘o projekciją mokymo be mokytojo būdu. Sammon‘o projekcija yra netiesinis daugelio kintamųjų objektų atvaizdavimo žemesnio matavimo erdvėje metodas. Jo idėja: atvaizduoti daugiamačius vektorius mažesnio matavimo erdvėje išlaikant santykinai panašius atstumus tarp vektorių.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Projekcijos dimensija</strong> (int) – nurodoma sumažinta pradinių duomenų dimensija (projekcijos dimensija).</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus neuroninio tinklo apmokymo iteracijų skaičius.</li>\r\n<li><strong>Apmokymo aibės dydis</strong> (int) – SAMANN neuroninio tinklo apmokymui naudojamų pradinės aibės X elementų skaičius.</li>\r\n<li><strong>Paslėptojo sluoksnio neuronų skaičius</strong> (int) – SAMANN neuroninio tinklo paslėptojo sluoksnio neuronų skaičius.</li>\r\n<li><strong>Mokymosi greičio parametras</strong> (double) – mokymosi greičio parametro reikšmė (iš intervalo 0,1–10).</li>\r\n</ul>\r\n<h4>SOM-MDS | Saviorganizuojančių neuroninių tinklų junginys su daugiamatėmis skalėmis</h4>\r\n<p>SOM žemėlapiai naudojami daugiamačiams duomenims vizualizuoti (t. y. rasti projekcijas mažesnės dimensijos erdvėje, įprastai plokštumoje) ir klasterizuoti. SOM tinklo tikslas – išlaikyti duomenų kaimyniškumus, t. y. taškai, esantys arti įėjimo vektorių erdvėje, turi būti atvaizduojami arti vieni kitų ir SOM žemėlapyje.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Eilučių skaičius</strong> (int) – Saviorganizuojančio neuroninio tinklo eilučių skaičius.</li>\r\n<li><strong>Stulpelių skaičius</strong> (int) – Saviorganizuojančio neuroninio tinklo stulpelių skaičius.</li>\r\n<li><strong>Mokymo epochų skaičius</strong> (int) – mokymo epochų skaičius.</li>\r\n<li><strong>MDS iteracijų skaičius</strong> (int) – MDS iteracijų skaičius.</li>\r\n</ul>\r\n<h2>Duomenų analizė</h2>\r\n<h4>SOM | Saviorganizuojantis neuroninis tinklas</h4>\r\n<p>SOM žemėlapiai naudojami ir daugiamačiams duomenims klasterizuoti ir juos vizualizuoti, t. y. rasti projekcijas mažesnės dimensijos erdvėje, įprastai plokštumoje. SOM tinklo tikslas – išlaikyti duomenų kaimyniškumus, t. y. taškai, esantys arti įėjimo vektorių erdvėje, turi būti atvaizduojami arti vieni kitų ir SOM žemėlapyje. Kartais gautus rezultatus sudėtinga interpretuoti, todėl jie papildomai analizuojami vienu iš daugiamačių duomenų projekcijos metodu. Tuo tikslu gali būti naudojamas daugiamačių skalių metodas (MDS). Vienas iš nuosekliojo junginio tikslų – pagerinti duomenų vizualizavimą, panaudojant saviorganizuojančius neuroninius tinklus. Tačiau pagrindinis nuosekliojo junginio tikslas – sumažinti skaičiavimo laiką, neprarandant vizualizavimo kokybės, atvaizduojant neuronus–nugalėtojus atitinkančius vektorius, gautus taikant SOM ir juos vizualizuojant MDS metodu, lyginant su visos duomenų aibės vizualizavimo laiku, taikant tik MDS metodą.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Eilučių skaičius</strong> (int) – Saviorganizuojančio neuroninio tinklo eilučių skaičius.</li>\r\n<li><strong>Stulpelių skaičius</strong> (int) – Saviorganizuojančio neuroninio tinklo stulpelių skaičius.</li>\r\n<li><strong>Mokymo epochų skaičius</strong> (int) – mokymo epochų skaičius.</li>\r\n</ul>\r\n<h4>MLP | Daugiasluoksnis perceptronas</h4>\r\n<p>Daugiasluoksnis perceptronas (DSP) (angl. Multilayer perceptron) yra tiesioginio sklidimo neuroninis tinklas, apmokomas klaidos sklidimo atgal (angl. error back-propagation) metodu. Daugiasluoksnis perceptronas taikomas klasifikavimo uždaviniams spręsti.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Paslėptų perceptronų skaičius</strong> (string) – sluoksnių perceptronų skaičius.</li>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus mokymo iteracijų skaičius.</li>\r\n<li><strong>Mokymo aibės dydis</strong> (int) – mokymo objektų skaičius.</li>\r\n<li><strong>Testavimo aibės dydis</strong> (int) – testavimo objektų skaičius.</li>\r\n<li><strong>Validavimo aibės dydis</strong> (int) – validavimo objektų skaičius.</li>\r\n</ul>\r\n<h4>C4.5 | C4.5 klasifikatorius</h4>\r\n<p>Sprendimų medžiu vadinamas medžio pavidalo klasifikatorius, priskiriantis klasėms daugiamačius vektorius, kurių požymiai gali būti tiek kategoriniai, tiek tolydieji kintamieji. Medį sudaro arba lapas, pažymėtas klasės numeriu, arba struktūra, apimanti su dviem ar daugiau pomedžių sujungtą sprendimo priėmimo mazgą. Pastarosios rūšies mazgai apibrėžiami testo pavidalu, o jų pomedžiai atitinka visas įmanomas šio testo baigtis.</p>\r\n<p>Duotas vektorius klasifikuojamas vykdant rekursyvų procesą, pradedamą nuo medžio šaknies. Jei dabartinis nagrinėjamas mazgas yra lapas, vektoriui priskiriamas su juo siejamas klasės numeris. Kita vertus, jeigu tai sprendimo priėmimo mazgas, vektoriui pritaikomas šio mazgo testas ir leidžiamasi vienu lygiu gilyn – į pomedį, atitinkantį gautąją testo baigtį. Procesas baigiamas pasiekus lapo mazgą, kitaip sakant, kai nustatoma vektoriaus priklausomybė klasei.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Pasikliovimo lygmuo</strong> (double) – pasikliovimo lygmuo, įvertinant klaidos tikimybės pasikliautinąjį intervalą.</li>\r\n<li><strong>Mokymo aibės dydis</strong> (int) – mokymo objektų skaičius.</li>\r\n<li><strong>Testavimo aibės dydis</strong> (int) – testavimo objektų skaičius.</li>\r\n</ul>\r\n<h4>K-means | k-vidurkių klasterizavimo metodas</h4>\r\n<p>K-vidurkių metodas yra grupavimo algoritmas, skirtas suskirstyti duomenų aibę į kompaktiškas grupes, esančias kuo toliau viena nuo kitos. Paprastai nurodomas parametras k, pasakantis į kiek grupių reikia padalinti vektorių aibę. Čia aptariamas kitas variantas, leidžiantis algoritmui pačiam nustatyti, koks grupių skaičius, nedidesnis už kMax, yra optimalus. Algoritmas veikia didindamas grupių skaičių k nuo 2 iki kMax ir kiekvienu atveju skaičiuodamas gauto padalijimo tinkamumo įvertį. Padalijimas, turėjęs geriausią įvertį, pateikiamas kaip algoritmo veikimo rezultatas.</p>\r\n<p>Parametrai:</p>\r\n<ul>\r\n<li><strong>Maksimalus iteracijų skaičius</strong> (int) – maksimalus iteracijų skaičius.</li>\r\n<li><strong>Maksimalus klasterių skaičius</strong> (int) – maksimalus galimas grupių skaičius.</li>\r\n</ul>\r\n<h2>Rezultatų peržiūra</h2>\r\n<h4>Techninė informacija</h4>\r\n<p>Gautų rezultatų techninė informacija.</p>\r\n<h4>Duomenų grafinis vaizdavimas</h4>\r\n<p>Gautų rezultatų vaizdavimas.</p>', 3, 'help', '2014-03-17 17:00:54', '2014-03-18 09:30:47', 'lt_LT'),
	(4, 'DUK', 'duk', '<div class="offset1 span9">\r\n<h2>Dažnai užduodami klausimai</h2>\r\n<h4>Kaip eksperimente panaudoti prieš tai įkeltą duomenų failą?</h4>\r\n<p>Tam skirta "EXISTING DATA" komponentė. Pirmiausia šią komponentę nutempkite į eksperimento užduočių seką, du kartus paspaudę pasirinkite įkeltąjį failą, tada šią komponentę galite naudoti užduočių sekai sudaryti.</p>\r\n<h4>Kaip pamatyti eksperimento vykdymo rezultatus?</h4>\r\n<p>Prie eksperimento scenarijaus pabaigos reikia priejungti vieną iš rezultatų pavaizdavimo komponenčių. Kai eksperimentas yra įvykdomas, pavaizdavimo komponentės tampa aktyvios, ant jų paspaudus du kartus galima pamatyti vykdymo rezultatus.</p>\r\n</div>', 4, 'help', '2014-03-18 09:30:03', '2014-03-18 09:30:03', 'lt_LT');

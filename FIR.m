function y = FIR(x)
%FIR Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 11-Oct-2017 14:19:24

%#codegen

% To generate C/C++ code from this function use the codegen command. Type
% 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    % % Equiripple Lowpass filter designed using the FIRPM function.
    %
    % % All frequency values are in Hz.
    % Fs = 48000;  % Sampling Frequency
    %
    % Fpass = 1;               % Passband Frequency
    % Fstop = 100;             % Stopband Frequency
    % Dpass = 0.057501127785;  % Passband Ripple
    % Dstop = 0.0001;          % Stopband Attenuation
    % dens  = 20;              % Density Factor
    %
    % % Calculate the order from the parameters using FIRPMORD.
    % [N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);
    %
    % % Calculate the coefficients using the FIRPM function.
    % b  = firpm(N, Fo, Ao, W, {dens});
    
    Hd = dsp.FIRFilter( ...
        'Numerator', [0.000242939325330859 1.2476578315955e-05 ...
        1.28713885634693e-05 1.3161947354832e-05 1.35742621965159e-05 ...
        1.38801434535526e-05 1.43077481812957e-05 1.46244961920282e-05 ...
        1.50620873407891e-05 1.53816927929055e-05 1.58219023396755e-05 ...
        1.61352278532312e-05 1.65733624934434e-05 1.68774530998827e-05 ...
        1.73245139157135e-05 1.76374506258194e-05 1.81412350238671e-05 ...
        1.85098502517088e-05 1.91636655073119e-05 1.94622619847287e-05 ...
        1.97182048979831e-05 2.03285608058596e-05 2.07258589705332e-05 ...
        2.1192145620112e-05 2.16571659300704e-05 2.2119489259048e-05 ...
        2.26139408678409e-05 2.30825418231453e-05 2.35951069688686e-05 ...
        2.40687925729297e-05 2.45912100081425e-05 2.50694834083101e-05 ...
        2.56029840792089e-05 2.60979750284192e-05 2.66576937987053e-05 ...
        2.71873500008982e-05 2.77698981227385e-05 2.83014191561653e-05 ...
        2.88144082091161e-05 2.93922993381352e-05 3.00088130712269e-05 ...
        3.05225855460359e-05 3.11601762149496e-05 3.17050449700891e-05 ...
        3.23504670830413e-05 3.29149515868757e-05 3.35718274680782e-05 ...
        3.41502162637211e-05 3.48165266751776e-05 3.54067694805882e-05 ...
        3.608584019177e-05 3.66949094195035e-05 3.73964380304262e-05 ...
        3.80298583206333e-05 3.87485495406308e-05 3.93866360238444e-05 ...
        4.01013944123319e-05 4.07554849539475e-05 4.15322281517249e-05 ...
        4.21765287528008e-05 4.29482027696831e-05 4.36387815595945e-05 ...
        4.44178749941579e-05 4.51277984454342e-05 4.59234518232979e-05 ...
        4.66486239293325e-05 4.74582172242072e-05 4.81978349122609e-05 ...
        4.90238002753679e-05 4.97829752945802e-05 5.06308436610413e-05 ...
        5.14110584279761e-05 5.22755035707456e-05 5.30655590147496e-05 ...
        5.39399974619766e-05 5.47489350654584e-05 5.5657660974841e-05 ...
        5.64812280495787e-05 5.73826248425623e-05 5.82446711773658e-05 ...
        5.91660077896804e-05 6.00380553078378e-05 6.09825392251071e-05 ...
        6.18689872070725e-05 6.28301579973346e-05 6.37324709875865e-05 ...
        6.47119768107951e-05 6.56346394468171e-05 6.66357270932611e-05 ...
        6.75790799597334e-05 6.85972489719508e-05 6.95553654078904e-05 ...
        7.0588697092082e-05 7.15690920653274e-05 7.26277104895852e-05 ...
        7.3628034669031e-05 7.46912343113117e-05 7.57180820186763e-05 ...
        7.68128783315538e-05 7.78477621312455e-05 7.89662860997578e-05 ...
        8.00213090296881e-05 8.11562616367521e-05 8.22313390075926e-05 ...
        8.33857985930068e-05 8.44833756545495e-05 8.56597698916428e-05 ...
        8.67790628296992e-05 8.79740898206967e-05 8.91114681999509e-05 ...
        9.03252856827284e-05 9.14856999164659e-05 9.27231586286252e-05 ...
        9.39031543649556e-05 9.5154459202918e-05 9.63558009871868e-05 ...
        9.76393825008338e-05 9.8854842648361e-05 0.000100156029475768 ...
        0.000101398164853091 0.000102714701078134 0.000103978406145701 ...
        0.000105315714264185 0.000106602018248295 0.000107961523693108 ...
        0.000109269604710267 0.000110648925322953 0.000111976876104107 ...
        0.000113376926217 0.000114728091117334 0.000116151029670573 ...
        0.000117522297378009 0.000118963033796082 0.000120356632530259 ...
        0.000121825870588008 0.000123240560178574 0.000124724393880595 ...
        0.000126167488586284 0.00012767072322236 0.000129133666558731 ...
        0.00013066120351401 0.000132146567517189 0.000133697472382128 ...
        0.000135205313856246 0.000136777666173137 0.000138307348087318 ...
        0.000139902129398458 0.000141455814043292 0.000143073479118143 ...
        0.000144648638096386 0.000146286386488404 0.000147885686364511 ...
        0.00014954992792345 0.000151173017320293 0.000152853936447096 ...
        0.000154502598624427 0.00015620834733901 0.000157875101151302 ...
        0.000159606366835226 0.000161296820044029 0.000163050663089895 ...
        0.000164764686489316 0.000166540335068443 0.000168277453547943 ...
        0.000170076078510762 0.000171837368921794 0.000173658598809413 ...
        0.000175441888871961 0.000177284461365507 0.000179092300867099 ...
        0.000180960556987148 0.000182792063581773 0.000184679652884002 ...
        0.000186534303534993 0.000188448518317904 0.000190322685661067 ...
        0.000192260017427213 0.000194160605216262 0.000196119014529252 ...
        0.000198043777803609 0.000200024490774767 0.000201972742270157 ...
        0.000203976867157812 0.000205949122663957 0.000207975834153138 ...
        0.000209970367142337 0.000212019233854615 0.00021403836936055 ...
        0.000216112317706165 0.000218154921192702 0.000220249434408385 ...
        0.000222314898324486 0.000224434950878661 0.00022652253311235 ...
        0.000228663109871637 0.000230777938595293 0.000232940012371015 ...
        0.000235077463156085 0.000237263074187879 0.000239423286842746 ...
        0.000241632404301142 0.000243815982527414 0.000246047384357638 ...
        0.000248253117974417 0.000250506795137994 0.000252736678331051 ...
        0.000255014462438914 0.000257267334777757 0.000259565885642912 ...
        0.000261841511691292 0.000264164188167859 0.000266462712017211 ...
        0.000268805255506723 0.000271129012671836 0.00027349477628134 ...
        0.000275838926987565 0.000278228588631297 0.000280595271855616 ...
        0.000283007346325393 0.000285397056653525 0.000287830573635564 ...
        0.000290242237915003 0.000292697641945431 0.000295132762721923 ...
        0.000297611108899136 0.000300068397228194 0.000302567300406315 ...
        0.000305046737923767 0.000307568672070502 0.000310070217103964 ...
        0.000312611978459802 0.000315136137079153 0.000317701361075583 ...
        0.000320244973169158 0.000322832088884612 0.000325398675808243 ...
        0.000328005952232642 0.000330594636390835 0.000333222110338314 ...
        0.00033583164085446 0.000338479995362966 0.000341111494701416 ...
        0.000343781113345972 0.000346433234455454 0.000349122348029608 ...
        0.000351795274896764 0.000354505752100409 0.000357199237210772 ...
        0.000359928461033231 0.000362642381364216 0.000365393191704449 ...
        0.000368126219404889 0.000370895892685709 0.000373651241538362 ...
        0.000376439440834604 0.000379214375062751 0.00038202190246565 ...
        0.00038481563849476 0.000387642786745812 0.000390456542272393 ...
        0.000393303099783269 0.000396135647492843 0.000399000270970751 ...
        0.000401851954685135 0.000404736007175683 0.000407606508551993 ...
        0.000410507747592734 0.000413396761543481 0.000416317235570171 ...
        0.000419224335743685 0.000422161456470747 0.000425088478182749 ...
        0.000428043429618261 0.000430986778766891 0.000433959795722314 ...
        0.000436919956101297 0.000439910405825741 0.000442888612301246 ...
        0.000445896092073422 0.000448891001291761 0.000451914583759816 ...
        0.000454926469971752 0.000457967074002737 0.000460995436478952 ...
        0.000464051177406621 0.000467095623559562 0.000470168019495892 ...
        0.000473228308930612 0.000476315258840636 0.000479392089200751 ...
        0.000482495294358498 0.00048558562694271 0.000488703946086237 ...
        0.000491809478937118 0.000494941878670702 0.000498063054929024 ...
        0.000501209662623272 0.000504344890612371 0.000507505161304063 ...
        0.000510654642696733 0.000513829071934075 0.000516992134218846 ...
        0.0005201791359882 0.000523355418768345 0.000526556180104416 ...
        0.000529745466625793 0.000532958156915897 0.000536160571757694 ...
        0.000539386644939289 0.000542600201693712 0.000545837520598292 ...
        0.00054906412502784 0.000552312265312835 0.000555550931874122 ...
        0.000558810554540001 0.000562059852894398 0.000565330359230889 ...
        0.000568590677563227 0.000571872023098257 0.000575142549930657 ...
        0.000578433341995448 0.000581713784053881 0.000585014947277648 ...
        0.000588305112273911 0.000591614972095506 0.000594914630206976 ...
        0.000598234247781815 0.000601542134335057 0.000604869258142666 ...
        0.000608186654658884 0.000611521820411652 0.000614846742622649 ...
        0.000618190365657329 0.000621522267985023 0.000624873289388847 ...
        0.000628212858698697 0.000631570959434847 0.000634917123980656 ...
        0.000638281140543523 0.000641633654566793 0.000645004329067379 ...
        0.000648363008145264 0.000651738866260446 0.000655103246994158 ...
        0.000658485043010831 0.000661854160615251 0.000665239940513416 ...
        0.000668614411191282 0.000672005219956465 0.00067538294883437 ...
        0.000678778255286381 0.000682159715084967 0.000685558198186226 ...
        0.000688943804433353 0.000692345419485042 0.000695733686851065 ...
        0.000699137447116532 0.000702528121752438 0.000705934526022032 ...
        0.000709327401185436 0.000712735131779667 0.000716129618074405 ...
        0.000719539158928488 0.000722934427911942 0.000726343998480729 ...
        0.000729740273055552 0.000733150925286099 0.000736546533158958 ...
        0.000739956846239856 0.000743352670062889 0.000746761751068824 ...
        0.000750157333822341 0.000753565615886367 0.000756959358024403 ...
        0.000760365809770719 0.000763757629302292 0.000767162392098199 ...
        0.000770552046963947 0.000773953990343512 0.000777340890405161 ...
        0.000780740308988054 0.000784123766384526 0.000787518977676304 ...
        0.000790898960253516 0.000794290845316725 0.000797666145769679 ...
        0.000801052955130385 0.000804424251143739 0.00080780582633108 ...
        0.000811171869589831 0.00081454864936441 0.000817908329827868 ...
        0.000821278934012226 0.000824632451327587 0.00082799676731885 ...
        0.000831343622172406 0.000834700726111714 0.000838040355516045 ...
        0.000841390444797031 0.000844722241986809 0.000848063741871071 ...
        0.000851387406810137 0.000854721004900589 0.000858035575487208 ...
        0.000861359580049608 0.000864665406525453 0.000867980147989388 ...
        0.000871275708787001 0.000874581016340093 0.0008778660128118 ...
        0.000881160259623277 0.000884434869341462 0.000887718099615713 ...
        0.000890981403823753 0.000894252846741107 0.000897504346305128 ...
        0.000900764139196896 0.000904003356635832 0.000907250076200218 ...
        0.000910476487742452 0.000913710651713881 0.000916923442450649 ...
        0.000920143495968749 0.000923342836904252 0.000926549340776504 ...
        0.000929733851734801 0.000932925905240927 0.000936095782274137 ...
        0.000939272035669654 0.000942426997145055 0.000945587878473329 ...
        0.00094872676020431 0.000951871414108237 0.000954993917587449 ...
        0.000958122290971193 0.000961228072182398 0.000964338944674372 ...
        0.000967427344163686 0.000970521018295481 0.000973591333636471 ...
        0.000976666335268725 0.000979718618551879 0.000982775590724263 ...
        0.00098580870315081 0.000988846330748689 0.000991860435294447 ...
        0.000994877953976841 0.00099787222254097 0.00100087022758887 ...
        0.00100384371136598 0.00100682099866171 0.00100977368874914 ...
        0.00101273005835631 0.00101566155815716 0.00101859606174699 ...
        0.0010215057090255 0.00102441848651358 0.00102730567862227 ...
        0.00103019531078053 0.00103305999524485 0.00103592716811498 ...
        0.00103876843061727 0.00104161173116055 0.00104442956806187 ...
        0.00104724871567016 0.00105004202189531 0.0010528373484681 ...
        0.00105560575365289 0.00105837578959262 0.00106111933189708 ...
        0.00106386403400895 0.00106658202855115 0.00106930068380314 ...
        0.00107199254413367 0.00107468518722338 0.00107735043840539 ...
        0.00108001570415879 0.00108265411243256 0.00108529267617003 ...
        0.00108790352647002 0.00109051397337612 0.00109309717856252 ...
        0.00109567948954623 0.00109823394805104 0.00110078791809562 ...
        0.00110331373486663 0.00110583802927953 0.001108334969534 ...
        0.00111082989840141 0.001113297012735 0.00111576188524149 ...
        0.00111819879882047 0.00112063352947803 0.00112303991692518 ...
        0.00112544333004505 0.00112781876182495 0.00113019145393585 ...
        0.00113253540230571 0.0011348760345764 0.00113718841912482 ...
        0.00113949716885426 0.00114177702177873 0.00114405326768722 ...
        0.00114630083624077 0.00114854368175811 0.0011507584317209 ...
        0.00115296844820632 0.00115514953235042 0.00115732574556588 ...
        0.00115947310227873 0.00116161537118684 0.00116372870266492 ...
        0.00116583616777268 0.00116791494627036 0.00116998807954892 ...
        0.00117203190831185 0.00117406944165491 0.0011760782512019 ...
        0.00117808057898244 0.00118005351776576 0.0011820197978008 ...
        0.00118395703631449 0.00118588680228744 0.00118778762930459 ...
        0.00118968142464426 0.00119154544002864 0.00119340196760498 ...
        0.00119522922004756 0.00119704847521606 0.00119883852576056 ...
        0.00120061994503725 0.00120237233229926 0.00120411623424128 ...
        0.0012058307218868 0.00120753587956608 0.00120921233176788 ...
        0.00121087936144169 0.00121251710712281 0.00121414506240407 ...
        0.00121574418911329 0.00121733292006105 0.00121889270273397 ...
        0.00122044252822835 0.00122196302906093 0.00122347268865962 ...
        0.00122495378043821 0.00122642357269415 0.00122786463255214 ...
        0.00122929411460662 0.0012306949550346 0.00123208427587644 ...
        0.00123344483093838 0.00123479289177979 0.00123611286925184 ...
        0.00123742038692796 0.00123869935860891 0.00123996535174371 ...
        0.00124120339503505 0.00124242790764152 0.0012436243477871 ...
        0.00124480743425553 0.00124596257628818 0.00124710329690273 ...
        0.00124821675860745 0.00124931567866251 0.00125038681337058 ...
        0.00125144331209599 0.0012524722697114 0.00125348646745823 ...
        0.00125447320948931 0.00125544428881061 0.00125638837110314 ...
        0.0012573170209471 0.00125821825398902 0.0012591034869712 ...
        0.00125996201685052 0.00126080409928423 0.00126161930764674 ...
        0.00126241806645402 0.00126319036405842 0.00126394524669011 ...
        0.00126467414321987 0.00126538580212548 0.00126607093689757 ...
        0.00126673846281817 0.00126738014440801 0.00126800386904918 ...
        0.00126860196491831 0.00126918142753671 0.00126973547746407 ...
        0.0012702712350838 0.00127078128514704 0.0012712723642131 ...
        0.00127173855535371 0.00127218553764418 0.00127260735597024 ...
        0.00127300987228212 0.00127338773394506 0.00127374555016186 ...
        0.00127407899531153 0.00127439268104823 0.00127468173171823 ...
        0.0012749502589934 0.00127519512404184 0.00127541910564304 ...
        0.00127561954671967 0.00127579872222431 0.00127595452501304 ...
        0.00127608923044949 0.00127620060819862 0.00127628998675322 ...
        0.00127635692409729 0.00127640185504347 0.00127642403261696 ...
        0.00127642403261696 0.00127640185504347 0.00127635692409729 ...
        0.00127628998675322 0.00127620060819862 0.00127608923044949 ...
        0.00127595452501304 0.00127579872222431 0.00127561954671967 ...
        0.00127541910564304 0.00127519512404184 0.0012749502589934 ...
        0.00127468173171823 0.00127439268104823 0.00127407899531153 ...
        0.00127374555016186 0.00127338773394506 0.00127300987228212 ...
        0.00127260735597024 0.00127218553764418 0.00127173855535371 ...
        0.0012712723642131 0.00127078128514704 0.0012702712350838 ...
        0.00126973547746407 0.00126918142753671 0.00126860196491831 ...
        0.00126800386904918 0.00126738014440801 0.00126673846281817 ...
        0.00126607093689757 0.00126538580212548 0.00126467414321987 ...
        0.00126394524669011 0.00126319036405842 0.00126241806645402 ...
        0.00126161930764674 0.00126080409928423 0.00125996201685052 ...
        0.0012591034869712 0.00125821825398902 0.0012573170209471 ...
        0.00125638837110314 0.00125544428881061 0.00125447320948931 ...
        0.00125348646745823 0.0012524722697114 0.00125144331209599 ...
        0.00125038681337058 0.00124931567866251 0.00124821675860745 ...
        0.00124710329690273 0.00124596257628818 0.00124480743425553 ...
        0.0012436243477871 0.00124242790764152 0.00124120339503505 ...
        0.00123996535174371 0.00123869935860891 0.00123742038692796 ...
        0.00123611286925184 0.00123479289177979 0.00123344483093838 ...
        0.00123208427587644 0.0012306949550346 0.00122929411460662 ...
        0.00122786463255214 0.00122642357269415 0.00122495378043821 ...
        0.00122347268865962 0.00122196302906093 0.00122044252822835 ...
        0.00121889270273397 0.00121733292006105 0.00121574418911329 ...
        0.00121414506240407 0.00121251710712281 0.00121087936144169 ...
        0.00120921233176788 0.00120753587956608 0.0012058307218868 ...
        0.00120411623424128 0.00120237233229926 0.00120061994503725 ...
        0.00119883852576056 0.00119704847521606 0.00119522922004756 ...
        0.00119340196760498 0.00119154544002864 0.00118968142464426 ...
        0.00118778762930459 0.00118588680228744 0.00118395703631449 ...
        0.0011820197978008 0.00118005351776576 0.00117808057898244 ...
        0.0011760782512019 0.00117406944165491 0.00117203190831185 ...
        0.00116998807954892 0.00116791494627036 0.00116583616777268 ...
        0.00116372870266492 0.00116161537118684 0.00115947310227873 ...
        0.00115732574556588 0.00115514953235042 0.00115296844820632 ...
        0.0011507584317209 0.00114854368175811 0.00114630083624077 ...
        0.00114405326768722 0.00114177702177873 0.00113949716885426 ...
        0.00113718841912482 0.0011348760345764 0.00113253540230571 ...
        0.00113019145393585 0.00112781876182495 0.00112544333004505 ...
        0.00112303991692518 0.00112063352947803 0.00111819879882047 ...
        0.00111576188524149 0.001113297012735 0.00111082989840141 ...
        0.001108334969534 0.00110583802927953 0.00110331373486663 ...
        0.00110078791809562 0.00109823394805104 0.00109567948954623 ...
        0.00109309717856252 0.00109051397337612 0.00108790352647002 ...
        0.00108529267617003 0.00108265411243256 0.00108001570415879 ...
        0.00107735043840539 0.00107468518722338 0.00107199254413367 ...
        0.00106930068380314 0.00106658202855115 0.00106386403400895 ...
        0.00106111933189708 0.00105837578959262 0.00105560575365289 ...
        0.0010528373484681 0.00105004202189531 0.00104724871567016 ...
        0.00104442956806187 0.00104161173116055 0.00103876843061727 ...
        0.00103592716811498 0.00103305999524485 0.00103019531078053 ...
        0.00102730567862227 0.00102441848651358 0.0010215057090255 ...
        0.00101859606174699 0.00101566155815716 0.00101273005835631 ...
        0.00100977368874914 0.00100682099866171 0.00100384371136598 ...
        0.00100087022758887 0.00099787222254097 0.000994877953976841 ...
        0.000991860435294447 0.000988846330748689 0.00098580870315081 ...
        0.000982775590724263 0.000979718618551879 0.000976666335268725 ...
        0.000973591333636471 0.000970521018295481 0.000967427344163686 ...
        0.000964338944674372 0.000961228072182398 0.000958122290971193 ...
        0.000954993917587449 0.000951871414108237 0.00094872676020431 ...
        0.000945587878473329 0.000942426997145055 0.000939272035669654 ...
        0.000936095782274137 0.000932925905240927 0.000929733851734801 ...
        0.000926549340776504 0.000923342836904252 0.000920143495968749 ...
        0.000916923442450649 0.000913710651713881 0.000910476487742452 ...
        0.000907250076200218 0.000904003356635832 0.000900764139196896 ...
        0.000897504346305128 0.000894252846741107 0.000890981403823753 ...
        0.000887718099615713 0.000884434869341462 0.000881160259623277 ...
        0.0008778660128118 0.000874581016340093 0.000871275708787001 ...
        0.000867980147989388 0.000864665406525453 0.000861359580049608 ...
        0.000858035575487208 0.000854721004900589 0.000851387406810137 ...
        0.000848063741871071 0.000844722241986809 0.000841390444797031 ...
        0.000838040355516045 0.000834700726111714 0.000831343622172406 ...
        0.00082799676731885 0.000824632451327587 0.000821278934012226 ...
        0.000817908329827868 0.00081454864936441 0.000811171869589831 ...
        0.00080780582633108 0.000804424251143739 0.000801052955130385 ...
        0.000797666145769679 0.000794290845316725 0.000790898960253516 ...
        0.000787518977676304 0.000784123766384526 0.000780740308988054 ...
        0.000777340890405161 0.000773953990343512 0.000770552046963947 ...
        0.000767162392098199 0.000763757629302292 0.000760365809770719 ...
        0.000756959358024403 0.000753565615886367 0.000750157333822341 ...
        0.000746761751068824 0.000743352670062889 0.000739956846239856 ...
        0.000736546533158958 0.000733150925286099 0.000729740273055552 ...
        0.000726343998480729 0.000722934427911942 0.000719539158928488 ...
        0.000716129618074405 0.000712735131779667 0.000709327401185436 ...
        0.000705934526022032 0.000702528121752438 0.000699137447116532 ...
        0.000695733686851065 0.000692345419485042 0.000688943804433353 ...
        0.000685558198186226 0.000682159715084967 0.000678778255286381 ...
        0.00067538294883437 0.000672005219956465 0.000668614411191282 ...
        0.000665239940513416 0.000661854160615251 0.000658485043010831 ...
        0.000655103246994158 0.000651738866260446 0.000648363008145264 ...
        0.000645004329067379 0.000641633654566793 0.000638281140543523 ...
        0.000634917123980656 0.000631570959434847 0.000628212858698697 ...
        0.000624873289388847 0.000621522267985023 0.000618190365657329 ...
        0.000614846742622649 0.000611521820411652 0.000608186654658884 ...
        0.000604869258142666 0.000601542134335057 0.000598234247781815 ...
        0.000594914630206976 0.000591614972095506 0.000588305112273911 ...
        0.000585014947277648 0.000581713784053881 0.000578433341995448 ...
        0.000575142549930657 0.000571872023098257 0.000568590677563227 ...
        0.000565330359230889 0.000562059852894398 0.000558810554540001 ...
        0.000555550931874122 0.000552312265312835 0.00054906412502784 ...
        0.000545837520598292 0.000542600201693712 0.000539386644939289 ...
        0.000536160571757694 0.000532958156915897 0.000529745466625793 ...
        0.000526556180104416 0.000523355418768345 0.0005201791359882 ...
        0.000516992134218846 0.000513829071934075 0.000510654642696733 ...
        0.000507505161304063 0.000504344890612371 0.000501209662623272 ...
        0.000498063054929024 0.000494941878670702 0.000491809478937118 ...
        0.000488703946086237 0.00048558562694271 0.000482495294358498 ...
        0.000479392089200751 0.000476315258840636 0.000473228308930612 ...
        0.000470168019495892 0.000467095623559562 0.000464051177406621 ...
        0.000460995436478952 0.000457967074002737 0.000454926469971752 ...
        0.000451914583759816 0.000448891001291761 0.000445896092073422 ...
        0.000442888612301246 0.000439910405825741 0.000436919956101297 ...
        0.000433959795722314 0.000430986778766891 0.000428043429618261 ...
        0.000425088478182749 0.000422161456470747 0.000419224335743685 ...
        0.000416317235570171 0.000413396761543481 0.000410507747592734 ...
        0.000407606508551993 0.000404736007175683 0.000401851954685135 ...
        0.000399000270970751 0.000396135647492843 0.000393303099783269 ...
        0.000390456542272393 0.000387642786745812 0.00038481563849476 ...
        0.00038202190246565 0.000379214375062751 0.000376439440834604 ...
        0.000373651241538362 0.000370895892685709 0.000368126219404889 ...
        0.000365393191704449 0.000362642381364216 0.000359928461033231 ...
        0.000357199237210772 0.000354505752100409 0.000351795274896764 ...
        0.000349122348029608 0.000346433234455454 0.000343781113345972 ...
        0.000341111494701416 0.000338479995362966 0.00033583164085446 ...
        0.000333222110338314 0.000330594636390835 0.000328005952232642 ...
        0.000325398675808243 0.000322832088884612 0.000320244973169158 ...
        0.000317701361075583 0.000315136137079153 0.000312611978459802 ...
        0.000310070217103964 0.000307568672070502 0.000305046737923767 ...
        0.000302567300406315 0.000300068397228194 0.000297611108899136 ...
        0.000295132762721923 0.000292697641945431 0.000290242237915003 ...
        0.000287830573635564 0.000285397056653525 0.000283007346325393 ...
        0.000280595271855616 0.000278228588631297 0.000275838926987565 ...
        0.00027349477628134 0.000271129012671836 0.000268805255506723 ...
        0.000266462712017211 0.000264164188167859 0.000261841511691292 ...
        0.000259565885642912 0.000257267334777757 0.000255014462438914 ...
        0.000252736678331051 0.000250506795137994 0.000248253117974417 ...
        0.000246047384357638 0.000243815982527414 0.000241632404301142 ...
        0.000239423286842746 0.000237263074187879 0.000235077463156085 ...
        0.000232940012371015 0.000230777938595293 0.000228663109871637 ...
        0.00022652253311235 0.000224434950878661 0.000222314898324486 ...
        0.000220249434408385 0.000218154921192702 0.000216112317706165 ...
        0.00021403836936055 0.000212019233854615 0.000209970367142337 ...
        0.000207975834153138 0.000205949122663957 0.000203976867157812 ...
        0.000201972742270157 0.000200024490774767 0.000198043777803609 ...
        0.000196119014529252 0.000194160605216262 0.000192260017427213 ...
        0.000190322685661067 0.000188448518317904 0.000186534303534993 ...
        0.000184679652884002 0.000182792063581773 0.000180960556987148 ...
        0.000179092300867099 0.000177284461365507 0.000175441888871961 ...
        0.000173658598809413 0.000171837368921794 0.000170076078510762 ...
        0.000168277453547943 0.000166540335068443 0.000164764686489316 ...
        0.000163050663089895 0.000161296820044029 0.000159606366835226 ...
        0.000157875101151302 0.00015620834733901 0.000154502598624427 ...
        0.000152853936447096 0.000151173017320293 0.00014954992792345 ...
        0.000147885686364511 0.000146286386488404 0.000144648638096386 ...
        0.000143073479118143 0.000141455814043292 0.000139902129398458 ...
        0.000138307348087318 0.000136777666173137 0.000135205313856246 ...
        0.000133697472382128 0.000132146567517189 0.00013066120351401 ...
        0.000129133666558731 0.00012767072322236 0.000126167488586284 ...
        0.000124724393880595 0.000123240560178574 0.000121825870588008 ...
        0.000120356632530259 0.000118963033796082 0.000117522297378009 ...
        0.000116151029670573 0.000114728091117334 0.000113376926217 ...
        0.000111976876104107 0.000110648925322953 0.000109269604710267 ...
        0.000107961523693108 0.000106602018248295 0.000105315714264185 ...
        0.000103978406145701 0.000102714701078134 0.000101398164853091 ...
        0.000100156029475768 9.8854842648361e-05 9.76393825008338e-05 ...
        9.63558009871868e-05 9.5154459202918e-05 9.39031543649556e-05 ...
        9.27231586286252e-05 9.14856999164659e-05 9.03252856827284e-05 ...
        8.91114681999509e-05 8.79740898206967e-05 8.67790628296992e-05 ...
        8.56597698916428e-05 8.44833756545495e-05 8.33857985930068e-05 ...
        8.22313390075926e-05 8.11562616367521e-05 8.00213090296881e-05 ...
        7.89662860997578e-05 7.78477621312455e-05 7.68128783315538e-05 ...
        7.57180820186763e-05 7.46912343113117e-05 7.3628034669031e-05 ...
        7.26277104895852e-05 7.15690920653274e-05 7.0588697092082e-05 ...
        6.95553654078904e-05 6.85972489719508e-05 6.75790799597334e-05 ...
        6.66357270932611e-05 6.56346394468171e-05 6.47119768107951e-05 ...
        6.37324709875865e-05 6.28301579973346e-05 6.18689872070725e-05 ...
        6.09825392251071e-05 6.00380553078378e-05 5.91660077896804e-05 ...
        5.82446711773658e-05 5.73826248425623e-05 5.64812280495787e-05 ...
        5.5657660974841e-05 5.47489350654584e-05 5.39399974619766e-05 ...
        5.30655590147496e-05 5.22755035707456e-05 5.14110584279761e-05 ...
        5.06308436610413e-05 4.97829752945802e-05 4.90238002753679e-05 ...
        4.81978349122609e-05 4.74582172242072e-05 4.66486239293325e-05 ...
        4.59234518232979e-05 4.51277984454342e-05 4.44178749941579e-05 ...
        4.36387815595945e-05 4.29482027696831e-05 4.21765287528008e-05 ...
        4.15322281517249e-05 4.07554849539475e-05 4.01013944123319e-05 ...
        3.93866360238444e-05 3.87485495406308e-05 3.80298583206333e-05 ...
        3.73964380304262e-05 3.66949094195035e-05 3.608584019177e-05 ...
        3.54067694805882e-05 3.48165266751776e-05 3.41502162637211e-05 ...
        3.35718274680782e-05 3.29149515868757e-05 3.23504670830413e-05 ...
        3.17050449700891e-05 3.11601762149496e-05 3.05225855460359e-05 ...
        3.00088130712269e-05 2.93922993381352e-05 2.88144082091161e-05 ...
        2.83014191561653e-05 2.77698981227385e-05 2.71873500008982e-05 ...
        2.66576937987053e-05 2.60979750284192e-05 2.56029840792089e-05 ...
        2.50694834083101e-05 2.45912100081425e-05 2.40687925729297e-05 ...
        2.35951069688686e-05 2.30825418231453e-05 2.26139408678409e-05 ...
        2.2119489259048e-05 2.16571659300704e-05 2.1192145620112e-05 ...
        2.07258589705332e-05 2.03285608058596e-05 1.97182048979831e-05 ...
        1.94622619847287e-05 1.91636655073119e-05 1.85098502517088e-05 ...
        1.81412350238671e-05 1.76374506258194e-05 1.73245139157135e-05 ...
        1.68774530998827e-05 1.65733624934434e-05 1.61352278532312e-05 ...
        1.58219023396755e-05 1.53816927929055e-05 1.50620873407891e-05 ...
        1.46244961920282e-05 1.43077481812957e-05 1.38801434535526e-05 ...
        1.35742621965159e-05 1.3161947354832e-05 1.28713885634693e-05 ...
        1.2476578315955e-05 0.000242939325330859]);
end

y = step(Hd,double(x));
release(Hd);

% [EOF]
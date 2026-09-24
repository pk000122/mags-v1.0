local val = {
  Q = function(p1, p2, p3, p4)
local val2

    if p2 <= 66 then
      local val3 = { p1:l(p2, p3, p4) }
      local val4 = val3[2]

      if val3[1] ~= 56148 then
        return nil, val4
      else
        return 65402, val4
      end
    else
      if p2 ~= 83 then
        p4[9] = p1.V

        if not not p3[3718] then
          val2 = p3[3718]
        else

          val2 = -1684997208
            + ((p1.lb(p1.cb(p1.N[7] <= p2 and p3[23391] or p1.N[6]), p3[19230])) + p3[11771])

          p3[3718] = val2
        end

        return 65402, val2
      else

        return 65402, (p1:Y(p4, p2, p3))
      end
    end
  end, Bb = function(p5, p6, p7, p8) return (p8[1][29]()) - 7175, 63 end, Vb = function(p9) return end, v_ = function(p10, p11, p12) return { p12[1][34] }, p12[1][33] end, M_ = function(p13, p14, p15, p16, p17) return 107, p17[1][18][p15] end, S = function(p18, p19, p20, p21)
    p21[1] = unpack
    local o

    if not not p19[11771] then
      o = p19[11771]
    else
      o = p18:O(p19, p20)
    end

    return o
  end, R_ = function(p22, p23, p24, p25)
    p24[28] = p22.d
    local e

    if not p25[25455] then
      e = 58 + (p22.Yb(p22.wb((p22.lb(p25[23473])) + p25[19230])))
      p25[25455] = e
    else
      e = p22:E_(p25, p23)
    end

    return e
  end, c_ = function(p26, p27, p28, p29, p30, p31, p32, p33)
    local val5 = 29
    local val6, val7, val8

    while true do
      if not (val5 > 29) then
        val8 = p27 % 8
        val5 = 88
      else
        local val9 = { p26:Q_(val7, p28, val6, val5, p27, p29, val8) }
        val6 = val9[4]
        val5 = val9[2]
        val7 = val9[3]

        if val9[1] ~= 41025 then
        else
          break
        end
      end
    end

    return val6, val8, val7, val5
  end, lb = bit32.bor, J = bit32.lshift, W_ = function(p34, p35, p36, p37) return p35 / 4, 91 end, pb = function(p38)
    local val10 = {}
    local val11, val12 = p38:D(nil, val10, nil)
    local r = p38:r(val10, nil)
    local val13, val14 = p38:x(val10, p38:K(val12, val10), r, val11)
    local val15, val16 = p38:j(val11, val10, nil, (p38:p(val14, val11, val10, (p38:v(val10, val11, val13)))))
    local v43, val17 = p38:H_(nil, val11, p38:Z_(val16, val11, val10), val10)
    local val18 = 48
    local val19, val20

    while true do
      local val21
      val17, val20, val18, val21, val19 = p38:_b(val10, val20, val11, val17, val18, val19)

      if val21 == 6592 then
        break
      else
      end
    end

    local db = 103

    while true do
      if db < 49 then
        val10[30][8] = p38.k.countrz
        val10[30][9] = p38.H

        if not not val11[26302] then
          db = val11[26302]
        else
          val11[24325] = 12 + (p38.wb(
            p38.wb((p38.eb(val11[7340], db)) - val11[7340], val11[14850], p38.N[7]), val11[7340]
          ))

          db = -242107658 + (p38.Qb((p38.Qb(val11[3718], val11[16110])) + p38.N[6] + val11[8540], db))
          val11[26302] = db
        end
      else
        if db > 49 then
          val10[30][13] = p38.u

          if not val11[28699] then
            db = p38:Db(db, val11)
          else
            db = val11[28699]
          end
        else

          if db > 26 and db < 103 then
            val10[30][7] = p38.U
            break
          else
          end
        end
      end
    end

    local rb = 111
    local helper

    while true do
      if rb == 2 then
        if val10[25] ~= val17 then
          local val22 = 2

          while true do
            local val23
            val23, val22 = p38:fb(val22, val10)

            if val23 == 45193 then
              break
            else
            end
          end
        end

        val20 = val10[34](val20, val10[8])(
          val17, p38.E, helper, val19, val10[27], val10[24], val15, p38.N, val10[23], val10[34]
        )

        break
      else
        function helper(...)
          local val24 = ...
          local val25 = { val10[26], val10 }

          if val25[1] ~= val25[2][8] then
            ::L1894335::
            return val24[val24]
          else
            local val26 = -47

            while true do
              val26 = 123 + val26

              if not (val26 <= 214) then
                break
              end

              if val26 ~= 199 then
                if not (val25[2][36] < val25[2][34]) then
                else
                  val25[2][22] = 220
                end
              else
                return
              end
            end

            goto L1894335
          end
        end

        if not not val11[17568] then
          rb = val11[17568]
        else
          rb = p38:rb(val11, rb)
        end
      end
    end

    return val10[34](val20, val10[8])
  end, Ab = function(p39, p40, p41)
    p40[1][17] = p40[1][29]
    return p40[1][34]
  end, p = function(p42, p43, p44, p45, p46)
    local val27 = {}

    p45[18] = nil
    p45[19] = nil
    p45[20] = nil

    local q = 13

    while true do
      if q >= 13 then
        q = p42:q(p45, q, p44)
      else
        p45[20] = p42.F.move

        for i = 0, 255 do
          p42:L(i, val27, p43)
        end

        break
      end
    end

    local function helper2(val28)
      local val29 = { p45 }

      return val29[1][3](val29[1][3](val28, "z", "!!!!!"), ".....", val29[1][15]({}, {
        __index = function(object, key)
          local val30, val31, val32, val33, val34 = val29[1][16](key, 1, 5)

          local val35 = val29[1][9](">I4", val34 - 33 + (val33 - 33) * 85 + (val32 - 33) * 7225
            + (val31 - 33) * 614125 + (val30 - 33) * 52200625)

          object[key] = val35
          return val35
        end, }))
    end

    p45[21] = helper2(p45[17](
      "LPH+W]:'0!T*p#hZ7KL#%hdoD..O#/'-BizBik?8z!3uS)z#XGZqz!!!#V!_Yo<!HI!\"B6/3)hZ7?H!_Pi;!_Gc:!`VPE!G1-hGM`F#hZ@meBa4V<z!8dfZhZR:nCh;K*6poi4<jD]*zE'W:bF*)G:DJ.i-7c+5<hZ6Yi!rr<$zhZ6p<!H-cq9]#kIhZ67)!D_MQD;PCm6f.r`6YQl-z!!(mW@c%2SZ2ak)!!'%T5i2TUhZ[@oD/Ws!I/j6IzhZRG&@<-&cz!!!#V#'+cuBkDI$#QOi)zhZ4t-z!!\"]=hZ7n7!WW3#zhZmt<DffE0A`!McZ2am?s8W,V6/MlaF_tT!Eo-mqB`nD9z!8diq6f/#UH$!WT#'Fg&@:O*1\"a\"0^Ch;K*/jJ4r?XIAahZ?>9hZ8&\\!I<Q'F5I\"ChZ@7ShZ?hGhZ[@oD09[P#[^qKDf0&nFPdHe-m`CS.9ehB$=2Nn?XIo#E+Q<Tzi,:m<\"CcUoEo-n.hZdS/DI[*shZ61'\"D2@cAD[DYhZ7HK#&.srATDm,Lu]DMs8W-!hZ6#W!<<*\"zhZ75;!8dfOhZ?,3hZsMgz!!(m`?XI\\^GA1r*AU*)7Eb03qz!!#8LBa+P;z!8drs@<?!mBb^UJz!8dfWhZ7cT!?g8'?XI>XG2E=-hZ6C-!Get@z!$FPa!D;5M6f/)T?XmM\\Cu57[hZ7i)z!!!!ahZ[@oE,TsX!c:<^!GC9j@;,oEs8W-!s8TA)z!:W3eW;lnuzhZ7P-#ljr*zhZ6Me+q,r*s8W-!hZ?kHhZ6em$NL/,zhZRn,@r&@Mz!&QsHz!;rHSZ2ak)!!!!Q6f7MN$6UH6+<VdL+>#0L>7(][+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL/jL^20.JM*/hSb//hS7h+<VdL/hSb-/1N;$,:+[%5V<Bd+<VdL+<VdL+<VdL+<VdL+<VdL-n6>^+=o/o,:+W_-9sg]5UId*-nd5,0.84s,9nKZ,9nTb0.JG&/1r%f+<VdX0/\"_#/d`^D+<VdL+<VdL+<VdL+<VdL+>52e/gWbJ5X7S\"5X6VH+<W9b-9sg]-71&d-71uC5X7S\"-6jog/1rP-/hSb//h//45X6_M+<W3[/d`^D+<VdL+<VdL+<VdL+<VdV0-Dko5X7S\"5X7Ra+<W'Y/0H&X.OZVj5X7S\"5UId*.P*1p+<VdL+<VdL+<VdL/hAJ#,:+`f5X6YG+<W-b$6UH6+<VdL+<VdL+<VdL+<rE[00hcf5X7Ra+=\\]d+=nid0.ne/,:+Z`5X7R]-mh2E5X7S\"5X7S\"5X6PD/1rP-/hS\\.-9sg]5X7S\"5U[a-,mkb;+<VdL+<VdL+<VdL+<r!O,=\"LZ5X6eP5U@O*,:+rq-nHu%0.JM+0.JM*/2&D$5X7S\"5X7S\"5X7S\",sX^\\5X7S\"5X6PH,=\"LZ5X7R]/g)GI+<VdL+<VdL+<VdL+<W<[+=9?=5X7S\"5X6_D5U.C$-712h5X7S\",;1B/5X7Rf,pb/p,sX^\\5X7S\",qhMK-7CDf+=o&p/hSb!+=\\[&5X6P:.LI:@+<VdL+<VdL+<VmO+>,!+5X7S\"5X7S\"5X6kK-m_,D5X7RZ/g)8Z+=nj)5U/NZ-7U,j-9sg]5X6YI/gEVH5X6tL5X6VD5X7R]-nd,\"-7g8m/.*LB+<VdL+<VdT0-DA[-pT++-7(!(5X6YL/0HK/,:GfB5X6kC+<VdL+<VdO5X6tR-9rn#00hcf5X6kH,:,T?5X7R_+<VdL+=]WA5X7R]/0uSp+>+!D+<VdL+<Vd[+<Vm^/0dDF5UI^(0/\"P85X6tF,sX^\\-9sg]-nZVb+<W3^5X6_M.PE7o+=09<.NfiV,sX^\\5X7R\\+<VdL+<VdT5X6YE.P<>+,pk5O+<VdL+<VdL+>5B$5X6YI+<W'Z5X6PF+<Vd[5VF62.OIDG5X6P@5X6V?,q(/f5UIs'00hcf5X7R]/g)B(5X6P@5X7R],pbfA5X7S\"-7geu.R5X3$6UH6+<VdL+=/<d-9rdu/g`hK5U.C)5X7S\",pklB5UJ-:+<VdX0.85%.P)\\b/h\\P:5X7S\"5X7S\"5V+B3-n[/!5X6PD-9sg]-mL,m/hSb--6k!*0+&gE+<VdL+<Woq/g_nf/g`hK5UIs'+<Vd[-9sg]5X7S\"5X7S\"5X7S\"5UJ`],;1Gk5X7S\"5X7S\"5X6YI+<W't5X7S\"5X7S\"5X7Rf/3lHc5X6PH-7T?F+<VdL+<VdR-7gGh+>+uj+<VdL00hcf-nZVb/1<bK5X7R]0.8J,0/\"Ou+>5',5X7S\"5X7S\"5X7S\"5X6_?+=nj)5X7S\"5X7R]/0H?+5UIs65U\\8m+<VdL+<VdL/gVtl5U[a.5X7S\"-m1!)5X7S\"5VF6&+<VdV,sX^\\5X7S\"-8$i7-6Oia/0HPl5X7S\"5X6P:/gDhl-8-np5X7S\".NfiV.R66G0.J:u$6UH6+<VdL+<W9`0.nJ75X7S\"5X6kC+<W-\\5X6VJ/1*VI-7CDf+<VdX-m_,)-9sg]5X7S\"5X6_M.P)\\b00hcf5X7S\"5X6YI+<VdL+<Vsq5X7Re/d`^D+<VdL+<Wp!+>+s*5X7S\"5X7R_+<VdL+<VdZ+<VdT5X7S\"5X7S\"-m0WT+<VdL/h/7q-9sg]5X7S\"5X7S\"5UIm1+<W9i/h0+4+<Vd[5X6V</h[PS+<VdL+<VdL+@%D!/g`hK5X7S\"-8$D`+<VdL+<VdL+<VdZ0.&qL5UnB55X7S\"5X7R]/0HJn.P*1p+<VdZ/1N%p-nZf25U.Bt5Umm!/3lHH+=n`E+<VdL+<VdL+<VdL-7g8m5X7S\"5X6eA+<VdL+<VdL+<VdL+<VdL+<VdZ,=\"LZ5X7S\"5UnB45X7S\"5U\\0K5X7S\"5UIU),q(Ag+<VdL+>,!+,p4``$6UH6+<VdL+<VdL+<Vd[+=]WA5X7RZ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdQ5UJ*7,75P9+<VdL+<VdL+<VdL-n$2j-9sg]5Umm!+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL,=!S./0bKE+<VdL+<VdL+<VdL+<W9`/g)\\l5X7Rc+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+=KK%/hA4S+<VdL+<VdL+<VdL+<VdL+<Vm]+>+s*5Umm05X6tF+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<W=&-8$ht$6UH6+<VdL+<VdL+<VdL+<VdL+>,;i+<s,t/g)H*-7g\\m/0H&X+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd[5X6kQ0+&gE+<VdL+<VdL+<VdL+<VdL+<VdL.OZD^,=!P-+>+cb5X7S\"5UA'7+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL00hcR/h.2N+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd[0-DA`5UJ$).R66a5X7S\"5U[a'5UA'9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<s-:/0H>J+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VmY+>,!+5U.m(-pU$_5UJ*55X7S\"5X7S\",q^;i0.n@i+<VdL+<VdL+<VdL+<VdL.P<>\".P<&55V+$2$6UH6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+@%D!/gWbJ5U@s(/2&+u5X7S\"5X7S\"5X6kQ,sX^\\5X6V</g`hK5Umm$5UJ*9-9s%3.Ng$&5UJ*+.LI:@+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+>4i[.OIDG5X6VH+<VdV-mh2E5X6YK+<s-:5X7Ra+<s-:5U@O$5X6eA/1r%f+>5uF5X6eA-jh(>+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vdl,;()k,=\"LZ5X7R]-nHtn+<VdL+<VdL+<VdL+<VdL+<VdL+>,2p-m^3*5X7S\"-8$o!$6UH6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<W!Z/g)8Z/h\\M95X7S\"5X7S\"5X7S\"5X7S\"5X7S\"5X7S\"5X7S\"5X7S\"5U\\6--n#EF+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+=n`j.P;hd+<VdL+>,8t/1`>'/1`>)/hSb!+<VdL+<VdL+=o/j$47mu+<VdL+<Xrq/M.;:+<VdL+<VdLhZ7]%z!!\"]<Z2ak)!!!!V5i2ZbF^j5:@rH7,AU&<(FEqh:Z2ak)!!!!q5i2cYD..NrB\\rnSBfOuT@W-1$ARTJ^z!;MU?h[3^tFDl5BEbTE(Z2ak)!!!#g5dC@iz5=\"*-=@9@oz!\"_EQ$X[7XATV@&@:F%ahZ5Ih\"CGMPFPd7/?X[JUhZ[@oF*1sL#@ChPDId='hZmY0F`);;HJ\\aAhZ6lcz!!)LShZ?_DhZ@4RhZ0q^z!,t6]\"CbeWABi:\"!0!'D!a?\"B!Wi]c)A3*J$3C9*&de\\:!WiEn!YthP![>Gc3!(uNDZU8+3!o]gD@-FH+T`:m#<2bd)Ee-a!YkbX&nqCW!YpS&l3@(s)$16K'`oil#6Haa'`nL>'`\\=9Js-<=ec>ge>*/iR\"]nlY\"ka&\\@^6=B79XtGB3M8=f`Y@XmK<S+>58J6B3NC]d0WlXOTN&t='DR,JI,Ce!g3^m!gWig'jAui@V8l<\"R,th>#EZJ<s$)<!Ysu)!b+2oM$IL&>-S48\"]nm,\"Mk:D!Xo,F>582.B3O6qM$d<fOTiQ-='FPfYmFJ5Q377(!Wl7R=onaK>1iqE#?LtL!Yo2?\"(DC:Yl\\BI>+l2c#ZkK8\"p/oKXoSS=>3Q?m#ZkI:RK<S#R0mC+>%qGY!epdY(\"s1-![V%7\"_)+JW<&Ck<s#6&!Yo/GdK'GZq#k.0>+#M&B3OO%nHDut)4:S.!kna<'k.5r%Kfn&!Ff[C\\cH7N>+l\",B4:r5!F5b5!Ynmq!Ff\\F8b!'f@KHU*!jht0'j@:7@V8lD!m(^L@KOCR\"(Kpi@K]lF!Ff\\F_$.pe<s\"'W!Yo1$#\\!p?R0d>8>/:>F?ijL5&7P]u$Njjp\"(DC:\\H65Q!nIAR'j@jJq#a]%W<9++<ruk-\"!Uq-$\"@OV!jW8@@dsP0\"BoeSB*+%o!YkcGl3hT8Ym4`N>1j,U\"]kcb!b)fEC]Y>T@F5?^>4Dg-$!.3)$\">gp49?7$JHt->=0`59@NJ^($=[WLXT8J<>1!C\\B3N[dklb'kklHVE=(7=!![@c\\!<O!>\\HM^4='C.U$!1;u!g*Ue!]C)p.UiHZ>1!O`B*'kuA6QeP@V9/%#Qd0kI0(,baq%rs>-S9@B3N+Pq#XW$JH?urWWN<393TF=@V9-Ondbh3\\H?:D>0-nVB<hSJ!Y&>l!Ff\\Ff`Qd0<s%^i!Ynn<#@_=Tq?@!0>58D4B*-9Y!Yno'#$G#2nH[GD<rui_\"u]Ws@V8m'\"lTSc>)<=.\"BSdC\"0hl.@KNh9>ls?p!Yrj!q@9MC$j,2b!Yk\\F!47ml!hKGp'`s[&!Yn!^12$^j3`,q[3`,q[3`5\\Y3\\\"5mOU!oZ1-.I8Ta2i/)B(q/*'-DIDuqQl'd>pb(]kBQ'fmTA$3H4h!Ykbd_$;q$)F6=a1]eBn6BMR6!\\,Bt!X^\\'!]gs!!^__J3!'9c'`nFl6ScI_1(c8C1)h]/ec?ThQ2q%%+sI@6!X^Ct!\\tBn!]n.'3!+d7!Ykb<$69HT!`T4&&fhSd!`T4>_$;q$$6gJl.M>tf1;O2T!X8]@!]lGL3!(9J>4DnC,%q%C!<Nu;C]Y>;3\\kA73]\\/\\,Q\\]H3[-<\\3da<s('54#R0YVd!\\FHg_$<\"VBL+[?)?P9f'rh=e$L.j_!Z`-c!;hl]!WiF0!Wiul!YPPfWXu0<M@D?C\"9K;<\"9=RI\"9MU*'`q,3'`t65,&%+-!YkbN,&[Ma.NKB610+GX3]-s?.ObES_$;q$,Q\\\\f!WlsP!WjMH![9K?!WiQ-,/FLD!\\=BfJH6*E<WW=h;$$e#)$1Ep*<H9d1]d^[E]P+*D@/]E/cn`K(\"sD&++b(M\"#U6^$37K!\"9QjL!YkdV!<O!u\"sSX#<W\\:!!Yp7g,(]ks!p17\"'`uMYM?7%?!Wj9,!nm[4!aLTaf`K7r(BQJr'`nF<)<(Yu!Wq?^!Wl>Y!Wj!$!]0rn!p0ZL!cJ.'!^SdIRKE!^3!,fU_$;q$/HQYR)FA<Kd/loC$E4))\"B$.9D?@6I!Ykb<$8;gl#8..HT`l>;$Af!3\"=aHS+UZ$d1'@ZM!<NuCf`R*4\"H!3uM?.T%aT@V+\"I]af!<Q.#$_dZ4!eUNR!G&J:!WjMHIKC6n)IdRkd0==g$MapI\"9O#R'tODa)Ci<!edVZf!ep^W'ag'(=p/\"I>&F[u#@[f;>lk`r)DZ1;EB440klsHW!iuD('`trIH<^f6!Q\"j?$@rB'!<`IP!Yl($!I=kUW<%SO\"G-XmJcT`jr;cs7!ql]t'`ok:!Z_=DJc[b1Q4j<7aoV&6rY7$erX8iC$IK%B!<drZl2f$.56C*NRK6Xpnc@/>>QQ5R'a!@qEa/\\2!R_!R!Wq?^-N[!D'`nI%!@Is>!HMEHq>o\"F>QOut!@QS%l2cVS/conl(!6OY![.ou\"k!DS$=VWh\"Ngbn!SRPZdK'CN+Tg?u,$Y3/!R_!R!pTg/!F4=Z!Wksqg&[WC>QWmcdK*SS!nmZ&!keU9'`uYc!Yke5!KmIg!eLIl9F@a(M?3n^\"p,MHT`UAY\":EN]RK<VD!ZD,I!X8]@M?3h\\:&4klmL!e4p(3AgB`_TB'a\"44`WS[2jphG-!h'21$:FsX#m(hCNXGn'!fI)Z!b@`$U&q=r#6LV$Oo\\ehWWLlT>d=D4!_oBj!j3/Q!WiE@!_\\[XA=<Q$![.om#,2/%!aPjB!l=u`#Xe`k#Qb_B3e@DR!WmrT1]lM7!YqsB,4Yb8l2g/Nnc;[O\"sWU=<pB_N!V-72f`r_l!EK7s!Ykb\\iW1(Z!<V6]4g>)5l2aoe<<<p*!@%(8<pB_N!V-7il2`@!!DgE<l2flF!!4JK($Yhb!V-7iaTWmZ!ESIdl2gGV*!/h9'`t6;!Ykb<!Z;'6!oa5c!Wo(t;:u0uJc\\sS`XW%b!WiE@!p1!p'a\"=7iW3`p>QPWAZ3$0j>QVJ<RK?`o!WiEq!ic=5!F,]3!h'0q!kJH-!aM`,!WksqWWKa4>QV24U&nR$\\cS#r>cIi,!_Ngq!SRPW!d4V[!hoaR!aGf,!eLJY!Wo(t-N^:L\\cH%;PlUq$!WnMd-N]_<M?7#aU&sld>QOtq![e%L!YkcPM?7;iOogLB>QU>qiW39c9`c%2iW7I.>QOud!Ajj%iW1&$iW80E6it%(!Ykdj!m1RL!oa9M!aO.T!WksqQ2q%%!nm^m!aGfd!h'0qdK0IO8cmEB,$Y1D!Yr!B_#i$d\"M+Y#dK4'e!eCI%!X&Q/!YrQR6.,gIZ3&tedK0Qo!^Y69B*-K_,$Y3'!kJG<!oa9M!aO.T!WksqdK1Ut!gNcf'`u)X!Yr!BT`M_+\"L8*^#JpNFZ3$-jaoV\\IPlUq$aoUK&^'lUqU]^`6!Xdof*SLN,)CbgR!I@uP'(Q&D!]C)p!n%)n>QWU[aoP`Sq#TIU\"O[;P!_Ngq!QkEG!]C)pl2_M9.K]GIH<^LiJcZth!>6;#!nm\\#$Ub%K!Ykd+!R_!Z!nm\\'!F,[-g&X#3g&ZM)!jr%1'a!4r!Ykb<!Z;(!!Po\"#$>Jc+\":E6Rnc8k#\\H2O-\"H`d1Jc]!C!@!C&<e:C)!f@$b!eLKf#t+h/!YrQWg'7*V;5+B>&(2@&WX[qtJfG+);:5IJX9I#QaoMJD-3=n`aoRq3>QW=S_?!mC!m1Nk!^-T\"!m1PD!F,[-aoO=#X9AY?!oa6\\!F,[-iW1k;ecZ$h!hoar!F,[-U&m.Q7KO;+14fQJ!WmrT1]isD!Yq40nc@_N!!;Qo!Ykco!ic9+!Wn5\\1]mRZ!Yrue!r;pR!q$6o'`ueaRK6Xpg&]=s>QOuT!@IpQ!Ys,aJHQH\"!`f@;!n%+L!F,[-dK)0+Plq.'Ylc2%!`fAW#6GVA[/o7fB`c9T!Yl(<!TF+_`<>0$g&V0T-3=n`g&Z5!!oa7'!F,[-g&WQ&4TZ?\"I0(.7\"![::<j;`Nq>jXf!V-9f!E0%H!Ysu$l2gGV*0CFLnc;e^!U9^N!D!8M!Yt5+,5M=@ncA:^q>jLrq>m8o3!'0H!CMtO,4Yb8!`]::!pTg#!^m):!Ykb<!Z;(!!Po\"#$Fp6'!<`J#!<Nu;Q3.1'!qH@9>0-plq>jXf!V-9f!E0%(!YqsB,5M=@!WqWf6g=]_\"mQ+a!qHB.#<2e!!oa6!ncAOhnc8k#aTVG@\"RuL:Jc\\u(\"!WU(<e:C)!f@%X!f@'$\"ZQPbq>isG\"sSX#<j;`NM?6f[SH/d,!oa6s#<3'Y\"R6!j$CLqc!<`IH!Ykco!ic9+!Wn5\\1]kW'!Ykco!ic9+!Wn5\\1]jNW!YkdJ!g3Rh!l>#E!aNkL!Wl*-!Woe4D<_/I!s/f2L'%Jl$L%YU!X&Q+Jc\\:@!qH@ZOTm$+!EP<b,(]ks!pTe1>3Z.!#O2=c!qHB.#<2e@\"QBH#!Wr3!-OR*[JcZ&^Ta-GV\"9NEA'`s<siW3`pSHo93OTQfm!EK8m!<Nu;M?:'b>QX6r!YpRoZ2uaq!kJFg>QVbDM?7#a!kJF\\Z2q64\\cN+o!m(\\Q!Yk/+Z3%<56-0/5!jVkQ!aPjBJHI*R!`jmSM?8A2ErpppIRF7-#6GVA!Wj5@/%Pal_>s]>+T`\\d'`nHZ!@@lj!UU(Z![[s`_?$>2_#d]T!KdKC\"'<>?fa!'1<rtMd'`uVb!Yp:gN<'(f!o+(`'nQLp!Wi]1,Q\\^c\"![\"2<WY/\\(!Qg^U&m+P`!HJ[p&P6+!]'oE#m(j\\$j*.)1BL;Q($Yha#O2=c!qHB.#<2e_$/tu(!r;qt!F,[-q>iDSS-B$0!pTga#\"/NX#m(j9!Wmde!WiE@$Ma^s!X&Q;U&mR]\"p,MHq#R2k\"9KL9!^Hg]!g3Rh!ic;O>d=D4!_i`%!Ykd\"!d\\)QRK=+,!hoaR!aM`,!WjMH\"p,O&![8O4!g3VE$:FrS#6GVIq#SV>\"L8*G!m1QL!gNfg'aOpK%1s`u)'(:/oo]FZSd#62!gX#l'a!4r$>BRE!Wj)<rWFup!WiE@!]%Rs3!'.B*BF6'<!#D&#<2c1!Ym2*H3XKiEZG2oH6%;5!`T4&JcQmD!=AlX!WmBk!dY2I!YU(c*J+:n!`T4*!Ykb<M?+`T!=AlXH3+-P.WTh?!X8]@!j2V,'m]o_<!%AN6intB'e46M#6FsI*HD2_<!!\\Y*<JY2'a!4o!Yl=L!`T4&)BB_'!\\+6Q$=X&<!Z;%H$690\\&fh$B!YkbD;B5f?=rgcJ!`T4&@N>LS!Yo/O!\\+6Q;CMYS=rdYG@NAnZ!`T4&C)q$r!\\+6Q=t(q!=pG*9;B5f?=rdYK!Ynl?!`T4&@NAnb!\\+6Q;CMYS=rdYK!Ykb<@NAnZ!`T4&C)q$r!\\+6Q=t(q!=pG+8!Ykb<!Z;'\"!Wj)<&oo\"5!Wl=&Ei&n+!mUiK'`osbB`cie!Ykb`!Ykd>!A\\?j>lk`BeH.L?!\\=Bf!Xa5o!YU(c*J+:n!`T4*!YkbLM?+`T!=AlX!WmZs!rN'#'`o\"o*I7bg<!$;+'`o'VDZU9^#<2bd&fhSd!`T4>_$;q$2$+KoblL^\\!`D<D!a>*val400!*R*#<2c:!Ym0d![.V#5r\\p,nH:fQ6GWmd!X8]@!qcRLDZUPt*I7bg<-g$?DL23]!X]\":!Wj+B)o<9B&24.eEZK0%!`T4q!Ykb<!Z;'q!Wj)>*>K_8&cdQI\"9KnO'`oEX(%N'M%I+m:$5sh#!Wj9;!Wiug)?Ks`JHZ*!<Z2;h#CumW,$#Tp+pS/h!Ykbf!Yk_;\"our3\"9Okj!Ykcs!Wj,,#7;YU)Bu$Z/csl3!Ykc#,&%,0!<Nu[&cuVG&gCQ^FoiES!=E::>\"W6/!\\=Bf3XS2k_$<Rn5tVJVDNP0%3^HXN;JoB!>&FBG!Ynm2&dKUa;ANG&>&FC@!Ykb\\_$;q,!\\->71-%;q/0]!6!Wj5@&h7,f4TZ?\"+qe,^?31iC!Wj5@!WmBD!X^Ug5nX;%!ZE'\\+qe,^!ZEFX$6iLP\"p,MX,/+(1!^$N!!YQ\\^!jr%1'`p!CB`b+3!Ylp$#>u9+!`Do^aT5:;,Q]S\"'`o\"G*<KCW>QSA,>QOt)6NS#)'`oRW>QSaD'd?OR+<\"-U(+Le3=TX!Q($Yqe(\"r[j&j[i]!rN'#'i>;^<Z3.r/cldi'bUQl)Zngr!YkbL+rp_7&mPJn_$;q$3l)%\\!^6Z#aT4.P,Q]/F>QQ[C#<3=t3^!NK!Ykc'_$;q$XTC7r![8gli;s?9<[,Wj1)06[1,;,sAHESM9a)P?@1NA:OTY_,!YkbP!YkbH!Yq.@q?$L0Ac`#@0EM:_/-5kSEWI!Z!0`QK!j2P*'`t65!Yp;$Oot7n#m+!s>QOt)1]e-g'`nF<EWT-2>Z(V)<!#rD6in>0'`ql+A-*]:A-+hbA--WM'`oQl>QQCc\"ulZ>i<D7C![9u5UB)iT!g<X?A--!;'`nF<?4$bn$XF,0!t#/D!n%0V&qL6\"\"9NEA'`pK!'`\\UAS<=!V:').33Z;6)6AYn+!Wk,E!cA&S!^aF'3!'.:6cf?a12&-e1)p@5!Ykb<$690T&fh#l_$;q$L&h>j!Wji=OU<QfBEAf%*<HWN'o<5P12&-e1)p?.1*$EW&mPJh!YkbL1*$EW$=!X!i<D7C!]!+m.P_tF\"p,M@!\\.%K,,#<&$6grL!YQt'!\\ts)!]o!?3!+1''tOjC*U4Y@!`T49!sK8O#lsIX\"9PG(!Ykd.\"TfD?,&/,\"!bsOnp&P40![9ZG!WkD>!k&76'gZ\"i5s\\ru5r-F\\!X\\uC!Ykb\\8f[s78i-UX!s03'8eOEU;E@*16im\\srW3-93\\:C?!gX#l'`r\\b>QTKXC0Yc\\!_NN78mDE!E_um1EZG4-8mDFL!Ff;S!Wksq\"p,M@8obpRH=C+\\JcSbS!aYpC6#&/@!_RJR!dYJa!eLFk>]KlI8cf1u'`q!J*<LO*>QTKX3a?\\,!_NMX!Yo_W!_NMdEZG4-;Hs9T!Er`K!Wksq8obpRX8rA;!_RJR!dZn4!eLG>>]KlI8chV**<LOR>QTKX10ei$!_NOD!<Nu;,\"`jW!_P9NS,i[+dKlQViY>An,$Gug!a7D^6in)AS,iZu!_i_2.^f?Z$3Da['`olD\"?6Ga)FGDE!`T4J!Ylmt)CkO`$8PX+9`bY'Ac`\\K)Bp1'.LKG>\"U[\"c!_!/*!Wi]_!WiuT!ZDDNi<9Q4<WW=86NRl=*<IDl>QU`&!YkdF!<Nu;.QSRO64-u6#>-1+_$<jf=9:Yf'u:,Y,!j$M@ObJP+p'4q!^\\=;6:r7\";@6Y1/clah3[.`/1-uu_3_CCo;@6Y1AHEV*\"U\\F6!`NQ=![:5k'(l;-$3F`>'`oR?*<H:'1]i@5!Ykb\\8f[s78i-Ts!Yl&.\"YhT/.2a-L>nI)9OTY_,!YkbP!Yp:qdKT1E<!!7*'ab!DAf:^P:'(J@*?\"ttC]P+P!</)`!YthP!Y,8H!X8]@!WiF0!YYoO!Wiul!Wi^<RM(c&U)>ul!s\"RK\"9OSa!YkbT&fh#d)BAl'+rudI.OnI#18+e0!ZE7d!YQ[t![9*7!Y,8H!Wi]j!]#T83!).7\"#qJK!\\+6Q$6K<^$691'&fh$#!YkbD$690L$7l5k$690V!YlUT![.Uh5r\\oqaTFL(.LIm3$47dT<!!et%GD3t\"9N-9'aFe;4Y9)+,mXL/Ooti0!YkcS!YkbD.NJRG,$Y0N.OYo:.W,:h.T$6c+tG,E!_k-G)?g0V!YtM3&gC?X![:JC)BD3I-3=n`!YR0o5oKk=)B*Jp2$+Ko49?8_#KdY<$\"j?NM#dbc!1AuQ!_re3!_*5+_$;.s=<`k4+qZ\"K+rgq>.U)rY!Ym1/.WYY@^&^V'*Wd&X!ZE`o)AGR@D?:OS._u?L!fd9_'p9Q**pNo5.Zjrc&L&\\K>JUOg.O62f.T6BM.T+\"e.N2F*#;Qoo.Om2P_$;G>5lt$f'u:,!&m-??#9ja($6fiZ9`c%2.R?#q('54#%KZt=,m\"e_!\\.%I#QU9V\"9SQ)!YkcG,$Y0N=sjA\\,$\\Ra!\\-M<!\\+6Q1+@bT!]j@3!Wksq)Cca/1)aC!ec>ge!^\\)9!Wk,EJH5g5<WW=P6R!^(#6L1n!Ykbt,$Y19,$Y1A,$Y1I,$Y1Q,$Y0X!Yq+)!ZG)P)@?`>\"p,]D!]C)p!_OYA!`C4I65fnT!Wk,+JH5g5<W]E)!Yl=d$4\"BL!ZG)P)@?]NrWWE=!]hN1!^\\)9,\"a%^i;s'Y<[(F>=lBD`>#ng1,$@5V!\\+6Q1+@bT!]j?`V?-f6!^\\)9!Wk,EJH5g5<WW=P6R!^(#6O;q!Ym0d!_VDQ!\\.5#+u4$;joPT!C)R.'6373<!Wk,+JH5g5<W^8C!Ykb]$=jbN![4NH!ZG)@c2n%^!ZEO/!\\t[!!]hN1!cp\\=!os@`'u:%T)HIIh$3uCh!ZG)P)@?_K\"9KKB&fM)^!X8]@T`bE8<Y?;X#MB+Z)HIIh$3pXN!<Nuc!Wksq)Cca/1)aC!3[.fQ66[Bn,\"ceu8kKHmc2n%^!broa!cfJi!dZ%q!jr(2'`qhg>QSXa>QOt9-NZ^<'bVuO#6Fr.EZutg#N5mh10+H+10gd^!\\.7H!<P#W!_!/*!X^+l&fMr!\\HDsP<Y?;X#E]/k)HIIh$3pXg!Wj)<)Cca/1)aCA,!'TCA-*Jq!Wksq)Cca/1)aC!3[.f1Mus+r!_OYA!`C4I!a6dQ=onb)!f[6_'`p-/>QQr1>QR59>QRV$'d=i\"@nKWk>=(YK;Z[\"U6\\,7>3`[^3!_NM4.NJS%!YkbL+rr-7![.V#&mPJ>,!uDM.NJRG)I*?.!<O\"8\"p,]D&fM)^aT_eb<Y?;X#MB:_)HHnD!Yl=d$4!O4!ZG*j\"TflK&fMr!!^dl:!hB>n'`s$k!Yr!\\iYKBB<!3A)&R>qJV31r_?31iC<WX\"u#7;q+.RD&T#m+E7'ad5:#m(eB'`oj/>QOsV;'J%>*!.<F>QVV?!Ykb<&hjA*_$;q$,!e0imK!A(+u1&V![9C)!_re3!X]QF!\\=Bf&j[iNOTu4C,`r<E1*fmU.KBND!Yl%n&e4t;!Yl%t.T;H71,9c1#=9>B!X^\\f!X8]@!ZFC1!\\=Bf$9BY8OU!p.)A5Xt;iq;W8fEfs=rM&U$9DDn&kZC1)HpAI%K[Bn(8;bj*t\\iGV#^l(X8rA;!\"KP\")N5IC/*B.DQtn^*6Dm%iC%q4]U<#PP0baK:IHs,qD_6.G!7X50]Y9Y]BWF?_W9.CPb3M9;SJ`^;0AN[>=;4CdF5K91XDo<c_pPsos/I#O_)P2qz!!\"RcZ2al4jpcV!_6O%@O;tF^s1tu@z!$o@c!!\".`Xpjp<Z2ak)!!%OF^p3q?z:;F.8z!%>Xgz!!\"snZ2ak)!!%ON^p3q?!!!\"L>JRNEz^feIYz!.[ANZ2ak)!!%OE^p3q?z&AYROzJ6]mqz!!\"XeZ2ak)!!%OH^p3q?z3l&$$z^f%tR!!(q]q)eAfZ2ak)!!!!g^u$?s(D5u.INTtj,o.e>?t?#@07esfH)_Vr@DNT,@%+eH6a?[lz28HKtz!&MErz!!#X,Z2ak)!!!!)^p3q?z._r=iz!#WN/#Is%$o&6OAZ2ak)!!!#g^Tmh>5e_;Ho\"hU3!9!+\\'EH\"Uz!!\".Whc!slho(L?'mh\"_6D*\"lcM0[e3E;ZkXf\"p-VgXJ@H!e\"DA2^TsrEHkbYMoH[-%if;*ODIiRY@S<gf<E6)=tVj,UEDrUKFu-Yi5H><FUZ/HJ_ga7@%_2&pufc=$,><ITQREW,R('FG+&\"]>!9VI=TsgTWM?5?rS*ZU__g/9Y?%qQrI=;=n=t=L;h=&5Tk/fU#Ul[F%M*eTi`(KP.MeKgn'.%]u-T%#QilhD,/=JWNlL(z'Yq!Sz!%,Lez!!\"jkhb^7O\"rlV)lq@XS99A-CkO/[YJ80921iPBH0(KWl&Es.u4_][j`%7[jVXB+bb`m.Hj@fqq\"&^,I<SDjtY_;_TF(c28flsI'VX'sF4$)7tH8dP.p)p)%[AD\\3:oq3A3]`QP74*>(AZ8c_J<+ScXV+8SPnJs(d?ZHtG+Oj0!\"/8uq$Tnr:6acAn+$qiUej]A\"B#qJ(=G9LE6lGnIX9PMz!!!#7Z2ak)!!%OB^p3q?!!!\"L5esZ*z!)p\\j:VPSB0oAArQ>p&)$Co2N`I?AF!#\\+Pb+Z5m#YZa`_Wa7n\"0&_hFqq$iF?2IKIRGN#AgOWP.#Nh!@&\"JEDWitM;\"VI/4A<8m'-8(bhc2jE%'^/X-5Q.)d>Ao74[o?NML_,3r^n=k</Ac!l9]4!2hNP;%ec/;4S64r(B27LmcL?!af#OPn),FVMXG#\\CX.DST\"*2r4SZ=a>.\"OY`5'R%z!!\"4YZ2am?WM!/`_6O%@!!!\"L6bou-!!(SHoqfL1z!.[\\WZ2ak)!!%O=^p3q?z5JXQ)z!&24G<^q^p8HKm7?MP1)63Mh8*Tlbk=HRoQ!\\&OK5W%M!H;Wh>]-2'H5+Q/Y]V=tW-J[Hi^9(I&?iiSpW#OT6(7*tS[:*kkIbAYB\\u##DBEAt[J_.Wn;p2DmY%NfjOX+Buje5WJ!p`!.5BI5/9iUO@B@5)0L\"qr.S-8eKEBmA5gW-#:3RJ9L)$jcsYJ8OQ:HgAVW=[Z1eronM3/!nq&.Z2j(b^;Z_TN#]N04;FL&h>j!e(1c!d4V[!cA&SiY%sqg(kS.\"p,Mh!WiBP_#sK6<rrFQ7Ol4Vd/d;u!WmHnklK`D=\"47Q9bJ?G.KTYY.09RF#K?cG!WmBDOobtL&s<J$,8-sW&mtbbaTFL(/-6Od\"osRE\"9KnO'`oEX'`o-P'ahMYZ5ZdF\"p,M@\"p,M@!\\.V.M#l92<rrFQ7Oj5qBicbc!d#pV!T=&\\.KTZG!h'?$2rXq.$3C5@W<*]?![<0t3\"d,2.KTYY.09PX1]d^[EW?:DOHK_J-3=n`*Wd&X('55F%>#5P(aB(d!Ykb@!Ykb<.RkmRi<!(1!WmHnklJ<r=\"47Q9`h$i$9o/d\"p-\"^W<*]?!X8]@!X8]@!Wji[.S8:p=\"47QF=P*/_#[Ue!Wl't,1-HOEZ,!/!Wi]X!Wi]c!WiFD!!WF]Ooth5!YkbX!YkbP!Ys]*dM/tg:BC_%'`nR@'`nFd7Oj5qBicbc!WabWq#OPH!WmHnklK`D=\"47Q9`h$o\\cXl(@KJP&W<*]?![=$63\"d,2.KTYY.09PX1]d^[EW?:DMNS)D('53P%K[@H!WmBD\"p,Mh!WiBP+o).?.KTZn.X?jQ=\"47Q9`i0=q>iMfapnIt&ubpF?ihOo!]U5c!Yl=d!\\+6Q$7Q#X$8_eu!YkbV!Ys]-U)C6F9`P@tM37uC\"p,M@!\\.V.+kZou!Wji@.NrM-.KTZn.es+-!`piQ!_i^t$9,7!RKN\\\\!>;@5&mtbbq#WMW\"p,MP)?MAi!X^@X!X^ac!WmBD\"9K<q's\\FW(fLD=!/ZjA!bMKK!aYpC!X8]@!Wji@.cCDZ!EU`P!d#pF!KdFb.KTZG![=<>3\"d,2.KTYY.09PX1]d^[1]k5n$9&Tt!s0\\[W<*]?!Yb\\N\\dmEqaoqkK2$+Km\"ou],\"9P.s!Ykd&!s02=NWT=t!WiFD!X8]@!Wk,H1:[Hh=#'gYF>C*&+]gE#!_j:7)Ya=7!ZEls*!-iV\"p,M@!]\"1>_#jE5=#'gYF>=0E!EV#X!_ngeJH?Hs!](I\"$D@P7&cs9jA-rn]&d#cJ!Ykb@!Ykb<1.F%`!b#.c!WmI!R/si#=#'gY9`ds#A-sau(D=\"_![A?J!>5MJ$5u#.)TDhH!p0Lb'`nR@'`nFl@5>(iq#OPP!WmI!R00\\p=#'gY:!s3E!>9#H$PHtWM#n;&!keU9'`oluA-s1e&cs!bA--lT'`nR@'f#gl!AZC_!`oF)1.F$=;-,LS!d$2s\"$'F<!Wl't!Wl%&!WjMH4+[WH$BYE'&cr^ZA--QK'`oW^'`s'i!Ys,iap-!/>65!1'`nFl@5@?Sf`>/0!WmI!OTD-V=#'gY:$Mi_!_NM6!Yr!N!ZF'#,.R_6!\\+g7!bDEJ!!`L_OotiH!<Nu;L&h>j!e(1cdM8Jjl5X\"0D?:OS\"p,M@!\\.V.M#l92=\"47QF=ITB=\"47QF=QMUi;m\"0!Wl't'%$e@RKON1.KTYY.09PX1]d^[EWW6K$9&UO%g!sgW<*]?!\\=Bf!!W]/", 5
    ))

    p45[22] = nil

    return q
  end, D_ = function(p48, p49, p50, p51, p52, p53, p54, p55, p56, p57, p58, p59)
    local val36 = p55
    local val37 = p52
    local val38 = p54
    local val39 = p56

    repeat
      if val37 > 110 then
        val38 = p57[1][13](val36)
        break
      else

        if val37 < 117 and val37 > 11 then
          val39 = p57[1][13](val36)
          val37 = 117
        else
          if not (val37 < 110) then
          else
            val36, val37 = p48:m_(p57, val36, val37)
          end
        end

        goto L1348620
      end
    until false

    local val40 = p57[1][13](val36)
    local val41 = 48
    local val42, val43, val44, val45

    while true do
      val41 = 73 + val41

      if not (val41 <= 413) then
        break
      end

      local val46 = val41

      if val46 > 194 then
        val45, val42 = p48:C_(val45, val42, val46, p58, p57, val36)
      else
        if not (val46 <= 121) then
          val44 = p48:__(val36, p57, val44)
        else
          val43 = p57[1][13](val36)
        end
      end
    end

    return val36, val43, val42, val45, val40, val38, val37, val39, val44
  end, B_ = function(p60, p61, p62, p63)
    local val47 = 1
    local val48 = 0

    while true do
      local val49 = { p60:G_(p63, nil, val47, val48) }
      val47 = val49[1]
      val48 = val49[2]

      if val49[3] < 128 then
        break
      end
    end

    return val48, val47
  end, eb = bit32.lshift, g_ = function(p64, p65, p66, p67, p68, p69) return 19, p67 % 8, (p66[1][31]()) end, Ob = function(p70, p71, p72, p73, p74)
    local val50 = p73

    local function helper3()
      local val51 = { val50, val50[24], val50[25], val50[26], val50[30] }
      local val52, val53, val54, val55, val56 = p70:Fb(nil, nil, val51, nil, nil, nil)
      local val57, val58, val59 = p70:Ub(val55, val51, val52, val54, nil, val53, val56, nil)
      local tb = p70:tb(val57, val58, val51, val59)
      return p70.t(tb)
    end

    local val60

    if not p71[23018] then
      val60 = -11665319
        + (p70.ob(p70.Qb(p70.ob(p71[11771] + p71[12535], p71[19230]), p71[14309]), p71[30490]))

      p71[23018] = val60
    else
      val60 = p71[23018]
    end

    return helper3, val60
  end, wb = bit32.band, j = function(p75, p76, p77, p78, p79)
    p77[23] = nil
    local val61 = 39

    while true do
      local val62 = { p75:a(p76, p77, val61) }
      val61 = val62[2]

      if val62[1] == 38691 then
        break
      end
    end

    p77[24] = function()
      local val63 = { p77 }
      local val64 = 41
      local val65, val66

      while true do
        val66, val64, val65 = p75:M(val64, val65, val63)

        if val66 == 56075 then
          continue
        end

        if val66 == nil then
        else
          break
        end
      end

      return p75.t(val66)
    end

    p77[25] = {}

    p77[26] = function()
      local val67 = p75:I({ p77 })

      if val67 ~= nil then
        return p75.t(val67)
      else
        return
      end
    end

    p77[27] = nil
    p77[28] = nil

    return function()
      local val68 = { p77 }
      local val69 = 50
      local val70, val71

      while true do
        if val69 < 105 then
          val70, val71 = val68[1][2]("<I4", val68[1][21], val68[1][4])
          val69 = 105
        else
          if val69 > 50 then
            local x = p75:X(val70, val71, val68)
            return p75.t(x)
          end
        end
      end

      return
    end, val61
  end, U_ = function(p80, p81, p82) return p82[19987] end, Sb = function(p83, ...) return { ({ ... })[1]() } end, i_ = function(p84, p85, p86, p87) return p86[1][18][p85] end, _b = function(p88, p89, p90, p91, p92, p93, p94)
    local j = p93
local val72, val73

    if j == 48 then
      p89[34] = function(p95, p96, p97)
        local val74 = { p89, p89[30] }
        local val75 = p95[6]
        local val76 = p95[9]
        local val77 = p95[5]
        local val78 = p95[7]
        local val79 = p95[4]
        local val80 = p95[10]
        local val81 = p95[8]
        local val82 = p95[3]

        return function(...)
          local val83 = 1
          local val84 = val74[1][13](val75)
          local val85 = 0
          local val86 = 1
          local val87 = 1

local val88, val89, val90, val91, val92, val93, val94, val95, val96, val97, val98, val99, val100, val101, val102, val103, val104, val105, val106, val107, val108, val109, val110, val111, val112, val113, val114, val115, val116, val117, val118, val119

          while true do
            local val120 = val82[val83]

            if val120 < 59 then
              if val120 < 29 then
                if not (val120 < 14) then
                  if val120 < 21 then
                    if val120 >= 17 then
                      if val120 < 19 then
                        if val120 == 18 then
                          local val121 = nil
                          local val122 = nil
                          local val123 = nil
                          local val124 = nil
                          local val125 = 31

                          while true do
                            if val125 == 31 then
                              val124 = -4294967188

                              val125 = 96 + (val74[2][9](
                                (val74[2][10](val77[val83])) - val77[val83] + val125, val125, val120
                              ))
                            else
                              if val125 == 114 then
                                val115 = val74[2][9]
                                val116 = val74[2][6]
                                val123 = 0
                                val117 = val125 - val125 == val125

                                val118 = val117
                                val118 = val117 and val120

                                val119 = val118

                                val125 = 41
                                  + (val115(val116(val118 or val125, val125, val125), val125, val80[val83]))

                                ::L3603702::
                              else
                                if val125 == 41 then
                                  val122 = 4503599627370500

                                  val125 = 74
                                    + (((val74[2][7](val125 + val125)) > val120 and val125 or val80[val83])
                                      + val80[val83])
                                else
                                  if val125 == 116 then
                                    val123 = val123 * val122

                                    val125 = -7602109
                                      + ((val74[2][11](val74[2][12](val125, val120), val77[val83]))
                                          + val125
                                        - val125)
                                  else
                                    if val125 == 67 then
                                      val122 = val74[2]

                                      val125 = 69 + (val74[2][12](
                                        ((val74[2][6](val125)) > val125 and val77[val83] or val125) ~= val125 and val125 or val77[val83], val80[val83]
                                      ))
                                    else
                                      if val125 ~= 70 then
                                        goto L3603702
                                      else
                                        val121 = 6
                                        break
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end

                          local val126 = 88

                          while true do
                            if not (val126 >= 88) then
                              val121 = val74[2]
                              break
                            else
                              val122 = val122[val121]

                              val126 = 55
                                + (val74[2][7](val74[2][7](val74[2][13](val74[2][9](val126, val77[val83])))))
                            end
                          end

                          local val127 = nil
                          local val128 = val121[7]
                          local val129 = val80[val83]
                          local val130 = val74[2][8]
                          local val131 = 103

                          while true do
                            if val131 < 103 then
                              val127 = val82[val83]
                              break
                            else
                              val127 = val120
                              val129 = val129 + val127

                              val131 = -4293296101
                                + (val74[2][12](val74[2][6](val131 - val131 - val131), val120))
                            end
                          end

                          local val132 = val129 - val127
                          local val133 = 119
                          local val134 = val132 - val82[val83]

                          while true do

                            if val133 > 65 and val133 < 119 then
                              val128 = val128(val130)

                              val133 = -59
                                + ((val80[val83] + val133 - val80[val83] > val133 and val77[val83] or val133)
                                  + val120)
                            else
                              if val133 > 106 then
                                val130 = val130(val134)

                                val133 = -130
                                  + ((val74[2][6]((val74[2][7](val80[val83])) + val133)) + val133)
                              else
                                if not (val133 < 106) then
                                else
                                  val130 = val77[val83]
                                  break
                                end
                              end
                            end
                          end

                          local val135 = val128 - val130
                          local val136 = 12

                          while true do
                            if val136 > 30 then
                              val135 = val135 - val130
                              val130 = val80[val83]

                              val136 = -110
                                + ((val80[val83] + val80[val83] < val136 and val120 or val120) + val136
                                  - val80[val83])
                            else
                              if val136 < 30 then
                                val130 = val77[val83]

                                val136 = 111
                                  + ((val74[2][11](val74[2][13](val136), val77[val83])) - val77[val83]
                                        < val136
                                      and val136
                                    or val136)
                              else

                                if val136 > 12 and val136 < 123 then
                                  val122 = val122(val135, val130)
                                  break
                                end
                              end
                            end
                          end

                          local val137 = val123 + val122
                          local val138 = 14

                          while true do
                            if val138 > 36 then
                              val124 = val84

                              val138 = -2147483799
                                + ((val74[2][12](val138 + val80[val83], val80[val83])) + val138
                                  - val77[val83])
                            else

                              if val138 < 36 and val138 > 25 then
                                val137 = val81[val83]
                                val122 = val84

                                val138 = -16324 + ((val74[2][6](
                                  val74[2][14](val74[2][7](val77[val83]), val120), val77[val83], val80[val83]
                                )) - val138)
                              else

                                if val138 > 15 and val138 < 25 then
                                  val82[val83] = val124

                                  val138 = 92
                                    + ((val80[val83] - val138 < val120 and val80[val83] or val138)
                                      + val80[val83] + val120)
                                else
                                  if val138 < 15 then
                                    val124 = val124 + val137

                                    val138 = -10
                                      + ((val74[2][14](val77[val83], val138)) - val80[val83] + val138
                                        + val120)
                                  else

                                    if val138 > 21 and val138 < 34 then
                                      val135 = val77[val83]

                                      val138 = -10
                                        + ((val74[2][9](val120 + val80[val83])) + val138 + val77[val83])
                                    else

                                      if val138 > 14 and val138 < 21 then
                                        val137 = val80[val83]
                                        val124 = val124[val137]
                                        val138 = -29 + (val74[2][6](val138 + val138 + val138 + val120))
                                        ::L10739307::
                                      else

                                        if val138 < 112 and val138 > 34 then
                                          val122 = val122[val135]
                                          break
                                        else
                                          goto L10739307
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end

                          val124[val137] = val122
                        else
                          val84[val77[val83]] = val81[val83] ^ val84[val80[val83]]
                        end
                      else
                        if val120 == 20 then
                          val84[val77[val83]] = val81[val83] * val84[val80[val83]]
                        else
                          val84[val77[val83]] = script
                        end
                      end

                      ::L11380849::
                      ::L9722294::
                      ::L8936327::
                      ::L12483191::
                      ::L15102222::
                      val83 = val83 + 1
                    else
                      if not (val120 >= 15) then
                        if not (val84[val80[val83]] < val84[val77[val83]]) then
                          val83 = val79[val83]
                        end

                        ::L14876967::
                        goto L11380849
                      else
                        if val120 ~= 16 then
                          val84[val77[val83]] = workspace
                          goto L14876967
                        else
                          if val91 then
                            for v358, v359 in val91, nil, nil do
                              if not (v358 >= 1) then
                              else
                                v359[3] = v359
                                v359[1] = val84[v358]
                                v359[2] = 1

                                val91[v358] = nil
                              end
                            end
                          end

                          local val139 = val79[val83]
                          return val84[val139](val84[val139 + 1])
                        end
                      end
                    end
                  else
                    if val120 < 25 then
                      if val120 < 23 then
                        if val120 ~= 22 then
                          val83 = val79[val83]
                        else
                          val84[val79[val83]] = p96[val80[val83]][val84[val77[val83]]]
                        end
                      else
                        if val120 == 24 then
                          if val84[val80[val83]] == val81[val83] then
                          else
                            val83 = val77[val83]
                          end
                        else
                          val84[val80[val83]] = val81[val83] % val76[val83]
                        end
                      end
                    else
                      if not (val120 >= 27) then
                        if val120 ~= 26 then
                          val92 = val88[3]
                          val89 = val88[2]
                          val88 = val88[1]
                          val93 = val88[5]
                        else
                          val84[val77[val83]] = val84[val79[val83]] / val78[val83]
                        end
                      else
                        if val120 ~= 28 then
                          val84[val77[val83]] = -val84[val80[val83]]
                        else
                          val84[val79[val83]] = val84[val80[val83]] + val84[val77[val83]]
                        end
                      end
                    end

                    goto L9722294
                  end
                else
                  if not (val120 < 7) then
                    if val120 < 10 then
                      if not (val120 >= 8) then
                        val84[val80[val83]][val84[val79[val83]]] = val84[val77[val83]]
                      else
                        if val120 ~= 9 then
                          val84[val80[val83]] = val84[val79[val83]] <= val84[val77[val83]]
                        else
                          if not not (val81[val83] < val84[val80[val83]]) then
                          else
                            val83 = val77[val83]
                          end
                        end
                      end
                    else
                      if val120 < 12 then
                        if val120 == 11 then
                          val84[val77[val83]] = val84[val79[val83]] / val84[val80[val83]]
                        else
                          if val84[val80[val83]] then
                            val83 = val79[val83]
                          end
                        end
                      else
                        if val120 == 13 then
                          val84[val79[val83]] = pcall
                        else
                          val84[val80[val83]] = p88.bb
                        end
                      end
                    end
                  else
                    if val120 < 3 then
                      if not (val120 >= 1) then
                        if val84[val77[val83]] == val84[val79[val83]] then
                          val83 = val80[val83]
                        end
                      else
                        if val120 ~= 2 then
                          val84[val80[val83]] = val77
                        else
                          local val140 = p96[val77[val83]]
                          val84[val80[val83]] = val140[3][val140[2]]
                        end
                      end
                    else
                      if val120 >= 5 then
                        if val120 ~= 6 then
                          local val141 = p96[val79[val83]]
                          val141[3][val141[2]][val84[val77[val83]]] = val84[val80[val83]]
                        else
                          local val142 = val80[val83]
                          val74[1][20](val84, val142 + 1, val87, val79[val83] + 1, val84[val142])
                        end
                      else
                        if val120 ~= 4 then
                          val84[val80[val83]] = p88.yb
                        else
                          val84[val77[val83]] = val84[val80[val83]][val81[val83]]
                        end
                      end
                    end
                  end

                  goto L8936327
                end
              else
                if not (val120 >= 44) then
                  if not (val120 < 36) then
                    if val120 < 40 then
                      if not (val120 < 38) then
                        if val120 ~= 39 then
                          val84[val77[val83]] = val84
                        else
                          local val143 = val77[val83]
                          val84[val143] = val84[val143](val84[val143 + 1])
                          val87 = val143
                        end
                      else
                        if val120 == 37 then
                          val84[val79[val83]] = error
                        else
                          val84[val77[val83]] = val84[val79[val83]] % val78[val83]
                        end
                      end
                    else
                      if not (val120 < 42) then
                        if val120 == 43 then
                          local val144 = p96[val80[val83]]
                          val84[val77[val83]] = val144[3][val144[2]][val84[val79[val83]]]
                        else
                          local val145 = val80[val83]
                          local val146 = val79[val83]

                          if val146 ~= 0 then
                            val87 = val145 + val146 - 1
                          end

                          local val147 = val77[val83]

                          if val146 == 1 then
                            val112, val113 = val74[1][33](val84[val145]())
                          else
                            val112, val113 = val74[1][33](val84[val145](val74[1][14](val145 + 1, val87, val84)))
                          end

                          if val147 == 1 then
                            val87 = val145 - 1
                          else
                            if val147 == 0 then
                              val114 = val112 + val145 - 1
                              val87 = val114
                            else
                              val114 = val145 + val147 - 2
                              val87 = val114 + 1
                            end

                            local val148 = 0

                            for k = val145, val114 do
                              val148 = val148 + 1
                              val84[k] = val113[val148]
                            end
                          end
                        end
                      else
                        if val120 ~= 41 then
                          local val149 = val77[val83]
                          val84[val149](val84[val149 + 1])
                          val87 = val149 - 1
                        else
                          local val150 = val77[val83]
                          local val151 = { val74[1][14](val150 + 1, val87, val84) }
                          val87 = val150
                          val84[val150] = val84[val150](unpack(val151))
                        end
                      end
                    end
                  else
                    if val120 < 32 then
                      if val120 < 30 then
                        val84[val77[val83]] = p96[val79[val83]]
                      else
                        if val120 ~= 31 then
                          val84[val77[val83]] = p88.vb
                        else
                          local val152 = val77[val83]
                          val84[val152](val74[1][14](val152 + 1, val87, val84))
                          val87 = val152 - 1
                        end
                      end
                    else
                      if not (val120 < 34) then
                        if val120 == 35 then
                          val84[val80[val83]] = game
                        else
                          val84[val79[val83]] = p88.qb
                        end
                      else
                        if val120 ~= 33 then
                          val84[val79[val83]] = val74[1][5](val84[val77[val83]], val84[val80[val83]])
                        else
                          val84[val80[val83]] = {}
                        end
                      end
                    end
                  end

                  ::L13025397::
                  goto L12483191
                else
                  if not (val120 < 51) then
                    if val120 < 55 then
                      if not (val120 < 53) then
                        if val120 ~= 54 then
                          local val153 = val77[val83]
                          local val154 = 0
                          local val155 = val90 - val85 - 1

                          if val155 < 0 then
                            val155 = -1
                          end

                          for m = val153, val153 + val155 do
                            val84[m] = val94[val86 + val154]
                            val154 = val154 + 1
                          end

                          val87 = val153 + val155
                        else
                          val84[val79[val83]] = tostring
                        end
                      else
                        if val120 == 52 then
                          local val156 = val77[val83]
                          val84[val156]()
                          val87 = val156 - 1
                        else
                          local val157 = val77[val83]
                          local val158 = { val92() }

                          if val158[1] then
                            val84[val157 + 1] = val158[2]
                            val84[val157 + 2] = val158[3]
                            val83 = val80[val83]
                          end
                        end
                      end
                    else
                      if not (val120 >= 57) then
                        if val120 ~= 56 then
                          val84[val77[val83]] = loadstring
                        else
                          val84[val79[val83]] = val76[val83]
                        end
                      else
                        if val120 == 58 then
                          val84[val77[val83]] = p88.Pb
                        else
                          local val159 = nil
                          local val160 = 74
                          local val161 = nil
                          local val162 = nil
                          local val163 = nil
                          local val164 = nil

                          while true do
                            if not (val160 <= 12) then
                              if val160 > 33 then
                                val164 = 128

                                val160 = -41 + ((val74[2][8](val74[2][6](
                                  val160 ~= val120 and val160 or val160, val77[val83]
                                ))) + val160)
                              else
                                val159 = 0

                                val160 = -2214592499 + (val74[2][12](val74[2][14](
                                  val74[2][7](val74[2][13](val160)), val77[val83]
                                ), val77[val83]))
                              end
                            else
                              val162 = 4503599627370500
                              break
                            end
                          end

                          local val165 = nil
                          local val166 = nil
                          local val167 = val159 * val162
                          local val168 = 85
                          local val169 = val74[2]

                          while true do
                            if val168 < 79 then
                              val169 = val169[val166]
                              val166 = val74[2]

                              val168 = 76
                                + ((val74[2][13](val77[val83] + val168)) - val77[val83] > val77[val83]
                                    and val77[val83]
                                  or val168)
                            else
                              if val168 > 79 then
                                val108 = val74[2][8]
                                val166 = 9
                                val109 = val168 > val168

                                val110 = val109
                                val110 = val109 and val120

                                val111 = val110

                                val168 = 48 + (val108((val110 or val120) - val168 - val120))
                                ::L8870204::
                              else

                                if val168 > 48 and val168 < 85 then
                                  val161 = 10
                                  break
                                else
                                  goto L8870204
                                end
                              end
                            end
                          end

                          local val170 = 12
                          local val171 = val166[val161]
                          local val172 = val74[2]
                          local val173 = 5

                          while true do
                            if val173 < 32 then
                              val165 = 14

                              val173 = -4294965600
                                + (val74[2][15](val173 - val120 + val77[val83] - val77[val83], val173))
                            else
                              val172 = val172[val165]
                              break
                            end
                          end

                          local val174 = 106

                          while true do
                            if val174 == 106 then
                              val170 = val74[2]

                              val174 = -327 + (val74[2][15](
                                ((val74[2][11](val120, val77[val83])) < val77[val83] and val77[val83] or val174) - val120, val77[val83]
                              ))
                            else
                              if val174 == 65 then
                                val163 = 10
                                val170 = val170[val163]

                                val174 = -67108941 + (val74[2][10](val74[2][12](val74[2][12](
                                  val74[2][9](val174), val77[val83]
                                ), val77[val83]), val174, val120))

                                ::L13215905::
                              else
                                if val174 ~= 44 then
                                  goto L13215905
                                else
                                  val163 = val82[val83]
                                  break
                                end
                              end
                            end
                          end

                          local val175 = (val170(val163)) > val120
                          local val176 = 35

                          while true do
                            if val176 ~= 35 then
                              if not val175 then
                                val175 = val120
                              end

                              break
                            else
                              if not val175 then
                              else
                                val175 = val77[val83]
                              end

                              val176 = 38
                                + (((val74[2][12](val120 - val77[val83], val77[val83])) >= val77[val83]
                                      and val176
                                    or val77[val83])
                                  - val176)
                            end
                          end

                          local val177 = val74[2][val170](val175, val77[val83])
                          local val178 = 112

                          while true do
                            if val178 == 112 then
                              val172 = val172(val177, val77[val83])
                              val178 = 11 + (val74[2][8]((val74[2][8](val178 - val178)) + val178))
                              ::L10906476::
                            else
                              if val178 ~= 15 then
                                goto L10906476
                              else
                                val177 = val82[val83]
                                break
                              end
                            end
                          end

                          local val179 = val172 >= val177

                          if val179 then
                            val179 = val82[val83]
                          end

                          local val180 = 71

                          while true do
                            if val180 <= 71 then
                              if not (val180 <= 17) then
                                if not (val180 <= 60) then
                                  if not val179 then
                                    val179 = val77[val83]
                                  end

                                  val180 = -4294967102
                                    + (val74[2][7]((val74[2][6](val180 - val180)) <= val180 and val180
                                      or val77[val83]))
                                else
                                  val179 = val77[val83]

                                  val180 = -16
                                    + (val74[2][9](val74[2][6](val180 + val180 + val77[val83])))
                                end
                              else
                                val171 = val171(val179, val177)

                                val180 = 35 + ((val74[2][6](
                                  val74[2][10](val120, val180, val180), val77[val83], val180
                                )) - val180 - val180)
                              end
                            else
                              if val180 <= 85 then
                                if val180 ~= 78 then
                                  val167 = val167 + val169
                                  break
                                else
                                  val169 = val169 - val171

                                  val180 = 82
                                    + (((val74[2][9](val77[val83])) <= val77[val83] and val180 or val120)
                                        - val180
                                      + val77[val83])
                                end
                              else
                                if val180 ~= 122 then
                                  val169 = val169(val171, val179)
                                  val171 = val82[val83]

                                  val180 = -3677 + ((val74[2][15](val74[2][15](
                                    val120 > val180 and val180 or val120, val77[val83]
                                  ), val77[val83])) + val180)
                                else
                                  val177 = val77[val83]

                                  val180 = -109
                                    + ((val74[2][14](val74[2][8](val180 - val180), val77[val83])) + val180)
                                end
                              end
                            end
                          end

                          local val181 = 33
                          local val182 = val164 + val167

                          while true do
                            if val181 ~= 12 then
                              val82[val83] = val182

                              val181 = -309
                                + ((val74[2][15](val181, val77[val83])) - val77[val83] + val120
                                  + val77[val83])
                            else
                              val182 = val84
                              val167 = val77[val83]
                              break
                            end
                          end

                          val182[val167] = warn
                        end
                      end
                    end

                    ::L2727514::
                    goto L13025397
                  else
                    if not (val120 >= 47) then
                      if val120 >= 45 then
                        if val120 ~= 46 then
                          local val183 = nil
                          local val184 = 0
                          local val185 = 66
                          local val186 = nil
                          local val187 = nil

                          while true do
                            if val185 > 57 then
                              val186 = 4503599627370500

                              val185 = 55
                                + (val74[2][6]((val74[2][13](val185)) - val77[val83] >= val77[val83]
                                    and val77[val83]
                                  or val120))
                            else
                              val184 = val184 * val186
                              val186 = val74[2]
                              break
                            end
                          end

                          local val188 = nil
                          local val189 = 93
                          local val190 = nil

                          while true do
                            if val189 == 93 then
                              val187 = 12

                              val189 = -4045 + ((val74[2][11](
                                val74[2][6](val74[2][10](val77[val83]), val120, val189), val79[val83]
                              )) + val79[val83])
                            else
                              if val189 ~= 24 then
                              else
                                val186 = val186[val187]
                                break
                              end
                            end
                          end

                          local val191 = val74[2]
                          local val192 = 109

                          repeat
                            if val192 == 109 then
                              val188 = 8

                              val192 = -5
                                + ((val74[2][7]((val74[2][12](val192, val77[val83])) + val120)) >= val192
                                    and val192
                                  or val192)

                              goto L4489773
                            else
                              if val192 ~= 104 then
                                goto L4489773
                              else
                                val191 = val191[val188]
                                break
                              end
                            end
                          until false

                          local val193 = 84
                          local val194 = val74[2]
                          local val195 = 29

                          while true do
                            if val195 > 87 then
                              val194 = val194[val190]

                              val195 = -2684
                                + ((val74[2][11](val195, val79[val83])) - val195 + val195 - val120)

                              continue
                            end

                            if val195 < 74 and val195 > 29 then
                              val190 = val190[val183]
                              break
                            else

                              if val195 < 87 and val195 > 33 then
                                val183 = 7

                                val195 = 79
                                  + ((val74[2][13](val77[val83] == val195 and val79[val83] or val77[val83]))
                                    - val77[val83] - val195)
                              else

                                if val195 > 74 and val195 < 88 then
                                  val190 = val74[2]

                                  val195 = 28
                                    + ((val195 <= val79[val83] and val195 or val195) + val77[val83]
                                        + val77[val83]
                                      - val120)
                                else
                                  if not (val195 < 33) then
                                  else
                                    val190 = 13

                                    val195 = 88 + ((val74[2][9](
                                      val74[2][14](val195, val77[val83]), val77[val83], val120
                                    )) + val195 - val195)
                                  end
                                end
                              end
                            end
                          end

                          local val196 = nil
                          local val197 = 42

                          while true do
                            if val197 < 42 then
                              val196 = val77[val83]
                              val183 = val183 >= val196

                              val197 = 44 + (val74[2][15](
                                val74[2][13](val74[2][8](val74[2][8](val77[val83]))), val197
                              ))

                              ::L12369334::
                            else

                              if val197 > 1 and val197 < 91 then
                                val183 = val77[val83]

                                val197 = -41 + ((val74[2][6](
                                  (val197 > val120 and val77[val83] or val197) + val197, val79[val83], val120
                                )) < val197 and val77[val83] or val197)
                              else
                                if val197 > 108 then
                                  val196 = val79[val83]
                                  break
                                else

                                  if val197 < 126 and val197 > 91 then
                                    if val183 then
                                      val183 = val79[val83]
                                    end

                                    val197 = -17 + ((val74[2][8](val74[2][8](val74[2][15](
                                      val77[val83], val77[val83]
                                    )))) + val197)

                                    ::L9517756::
                                    goto L12369334
                                  else

                                    if not (val197 > 42 and val197 < 108) then
                                      goto L9517756
                                    else
                                      if not val183 then
                                        val183 = val79[val83]
                                      end

                                      val197 = 100 + ((val74[2][10](
                                        val197 < val77[val83] and val120 or val79[val83], val120, val197
                                      )) - val197 + val77[val83])
                                    end
                                  end
                                end
                              end
                            end
                          end

                          local val198 = val183 > val196

                          if not val198 then
                          else
                            val198 = val77[val83]
                          end

                          local val199 = 95

                          repeat
                            if val199 == 95 then
                              if not not val198 then
                              else
                                val198 = val82[val83]
                              end

                              val199 = 48
                                + ((val74[2][9](val120 - val199 - val199)) < val77[val83] and val199
                                  or val77[val83])

                              goto L11737393
                            else
                              if val199 ~= 50 then
                                goto L11737393
                              else
                                val196 = val79[val83]
                                val198 = val198 == val196
                                break
                              end
                            end
                          until false

                          if val198 then
                            val198 = val120
                          end

                          local val200 = 88

                          while true do
                            if val200 <= 74 then
                              val190 = val190(val198)
                              break
                            else
                              if not (val200 <= 87) then
                                if not not val198 then
                                else
                                  val198 = val120
                                end

                                val196 = val77[val83]

                                val200 = 57
                                  + (val74[2][13]((val74[2][12](val200 + val79[val83], val77[val83]))
                                        >= val200
                                      and val77[val83]
                                    or val77[val83]))
                              else
                                val198 = val198 + val196

                                val200 = 42 + (val74[2][8](val74[2][9](
                                  val200 - val79[val83] - val77[val83], val79[val83], val200
                                )))
                              end
                            end
                          end

                          local val201 = 88

                          while true do
                            if val201 > 87 then
                              val194 = val194(val190)

                              val201 = 86 + (val74[2][12](
                                val74[2][13](val74[2][15](val201 - val201, val77[val83])), val79[val83]
                              ))

                              continue
                            end

                            if val201 < 88 then
                              val191 = val191(val194)
                              break
                            else
                            end
                          end

                          local val202 = 54

                          while true do
                            if val202 == 54 then
                              val186 = val186(val191, val77[val83])
                              val103 = val74[2][7]
                              val104 = val74[2][13]
                              val105 = val202 < val79[val83]

                              val106 = val105
                              val106 = val105 and val202

                              val107 = val106

                              val202 = -4294967234 + (val103(val104((val106 or val202) - val202)))
                              ::L4182012::
                            else
                              if val202 == 29 then
                                val184 = val184 + val186

                                val202 = 59
                                  + (val74[2][13]((val74[2][15](val74[2][7](val202), val202))
                                        >= val79[val83]
                                      and val79[val83]
                                    or val120))

                                goto L4182012
                              else
                                if val202 == 88 then
                                  val193 = val193 + val184

                                  val202 = 78 + ((val74[2][10](val74[2][9](
                                    val74[2][14](val202, val77[val83]), val79[val83], val79[val83]
                                  ))) + val79[val83])

                                  goto L4182012
                                else
                                  if val202 == 87 then
                                    val82[val83] = val193
                                    break
                                  else
                                    goto L4182012
                                  end
                                end
                              end
                            end
                          end

                          local val203 = 95

                          while true do
                            if val203 == 95 then
                              val193 = val84
                              val184 = val79[val83]

                              val203 = 117
                                + ((val74[2][13](val74[2][14](val74[2][10](val120), val77[val83])))
                                  - val203)

                              continue
                            end

                            if val203 == 50 then
                              val186 = val84

                              val203 = 105 + (val74[2][14](val74[2][14](
                                val74[2][11](val203 - val203, val77[val83]), val77[val83]
                              ), val77[val83]))

                              continue
                            end

                            if val203 == 105 then
                              val191 = val77[val83]
                              break
                            else
                            end
                          end

                          local val204 = 119

                          repeat
                            if val204 == 119 then
                              val186 = val186[val191]

                              val204 = -4294967060
                                + ((val74[2][10](val74[2][7](val204), val79[val83], val204)) - val204
                                  - val79[val83])

                              goto L7109790
                            else
                              if val204 == 106 then
                                val193[val184] = val186
                                break
                              else
                                goto L7109790
                              end
                            end
                          until false
                        else
                          if val84[val80[val83]] == val84[val79[val83]] then
                          else
                            val83 = val77[val83]
                          end
                        end
                      else
                        local val205 = p96[val79[val83]]
                        val205[3][val205[2]] = val84[val77[val83]]
                      end

                      ::L2557072::
                      goto L2727514
                    else
                      if not (val120 < 49) then
                        if val120 == 50 then
                          val84[val79[val83]] = val84[val77[val83]] == val78[val83]
                        else
                          local val206 = val77[val83]
                          val84[val206](val74[1][14](val206 + 1, val206 + val79[val83] - 1, val84))
                          val87 = val206 - 1
                        end

                        ::L15221698::
                        goto L2557072
                      else
                        if val120 == 48 then
                          local val207 = { ... }

                          for n = 1, val77[val83] do
                            val84[n] = val207[n]
                          end

                          goto L15221698
                        else
                          if not val91 then
                          else
                            for v447, v448 in val91, nil, nil do
                              if v447 >= 1 then
                                v448[3] = v448
                                v448[1] = val84[v447]
                                v448[2] = 1

                                val91[v447] = nil
                              end
                            end
                          end

                          return val74[1][14](val79[val83], val87, val84)
                        end
                      end
                    end
                  end
                end
              end
            else
              if val120 < 88 then
                if not (val120 < 73) then
                  if val120 < 80 then
                    if not (val120 < 76) then
                      if not (val120 < 78) then
                        if val120 == 79 then
                          val84[val80[val83]] = val81[val83] + val84[val77[val83]]
                        else
                          val84[val80[val83]] = val94[val86]
                        end
                      else
                        if val120 ~= 77 then
                          val84[val79[val83]] = val74[1][13](val77[val83])
                        else
                          val84[val80[val83]] = nil
                        end
                      end
                    else
                      if not (val120 >= 74) then
                        val84[val77[val83]] = warn
                      else
                        if val120 == 75 then
                          val84[val77[val83]] = next
                        else
                          local val208 = val80[val83]
                          val84[val208](val84[val208 + 1], val84[val208 + 2])
                          val87 = val208 - 1
                        end
                      end
                    end

                    ::L14304628::
                    ::L5268957::
                    ::L3369653::
                    goto L15102222
                  else
                    if not (val120 < 84) then
                      if not (val120 >= 86) then
                        if val120 == 85 then
                          val84[val79[val83]] = select
                        else
                          val87 = val80[val83]
                          val84[val87] = val84[val87]()
                        end
                      else
                        if val120 ~= 87 then
                          val84[val77[val83]] = p96[val79[val83]][val78[val83]]
                        else
                          val84[val80[val83]][val81[val83]] = val76[val83]
                        end
                      end

                      ::L612181::
                      goto L14304628
                    else
                      if not (val120 >= 82) then
                        if val120 == 81 then
                          if not val91 then
                          else
                            for v450, v451 in val91, nil, nil do
                              if v450 >= 1 then
                                v451[3] = v451
                                v451[1] = val84[v450]
                                v451[2] = 1

                                val91[v450] = nil
                              end
                            end
                          end

                          return val84[val77[val83]]
                        else
                          for i6 = val79[val83], val80[val83] do
                            val84[i6] = nil
                          end

                          ::L12303038::
                          goto L612181
                        end
                      else
                        if val120 == 83 then
                          val84[val79[val83]] = val84[val80[val83]] - val84[val77[val83]]
                        else
                          val84[val79[val83]] = type
                        end

                        goto L12303038
                      end
                    end
                  end
                else
                  if val120 >= 66 then
                    if val120 < 69 then
                      if not (val120 >= 67) then
                        val84[val80[val83]] = val74[2][val77[val83]]
                      else
                        if val120 == 68 then
                          if not val84[val79[val83]] then
                            val83 = val77[val83]
                          end
                        else
                          local val209 = val77[val83]
                          val84[val209] = val84[val209](val84[val209 + 1], val84[val209 + 2])
                          val87 = val209
                        end
                      end
                    else
                      if not (val120 < 71) then
                        if val120 ~= 72 then
                          val84[val77[val83]] = p95
                        else
                          val84[val77[val83]] = val84[val79[val83]] ~= val84[val80[val83]]
                        end
                      else
                        if val120 == 70 then
                          val84[val77[val83]] = val82
                        else
                          val84[val80[val83]] = xpcall
                        end
                      end
                    end

                    ::L15033315::
                    goto L5268957
                  else
                    if not (val120 >= 62) then
                      if not (val120 >= 60) then
                        if val91 then
                          for v453, v454 in val91, nil, nil do
                            if not (v453 >= 1) then
                            else
                              v454[3] = v454
                              v454[1] = val84[v453]
                              v454[2] = 1

                              val91[v453] = nil
                            end
                          end
                        end

                        return val84[val77[val83]]()
                      else
                        if val120 == 61 then
                          val84[val77[val83]] = #val84[val80[val83]]
                        else
                          local val210 = nil
                          local val211 = nil
                          local val212 = 69
                          local val213 = nil
                          local val214 = nil
                          local val215 = nil

                          while true do
                            if val212 == 69 then
                              val214 = 0

                              val212 = -2147483545
                                + ((val74[2][7](val74[2][12](val74[2][6](val120), val77[val83])))
                                  + val79[val83])
                            else
                              if val212 == 96 then
                                val211 = 4503599627370500

                                val212 = 62
                                  + ((val212 - val77[val83] - val212 > val77[val83] and val120 or val80[val83])
                                    - val79[val83])
                              else
                                if val212 == 63 then
                                  val214 = val214 * val211

                                  val212 = 15 + (val74[2][8](val74[2][11](val74[2][13](val74[2][11](
                                    val80[val83], val77[val83]
                                  )), val77[val83])))
                                else
                                  if val212 ~= 18 then
                                  else
                                    val210 = 8
                                    val211 = val74[2]
                                    break
                                  end
                                end
                              end
                            end
                          end

                          local val216 = nil
                          local val217 = 91

                          while true do
                            if val217 == 126 then
                              val210 = val74[2]
                              break
                            else
                              val211 = val211[val210]

                              val217 = 22 + (val74[2][15](val74[2][13](val74[2][6](
                                val79[val83] - val79[val83], val120, val77[val83]
                              )), val80[val83]))
                            end
                          end

                          local val218 = val210[10]
                          local val219 = val74[2]
                          local val220 = 108

                          while true do
                            if val220 > 91 then
                              val219 = val219[7]
                              val213 = val74[2]
                              val100 = (val74[2][13](val79[val83])) - val220 == val80[val83]

                              val101 = val100
                              val101 = val100 and val220

                              val102 = val101

                              val220 = -18 + ((val101 or val220) + val79[val83])
                              ::L6339906::
                            else
                              if val220 < 108 then
                                val216 = 15
                                break
                              else
                                goto L6339906
                              end
                            end
                          end

                          local val221 = 120

                          while true do
                            if val221 <= 65 then
                              if not (val221 <= 44) then
                                val216 = val216 + val215
                                val221 = 44 + (val74[2][8](val221 + val79[val83] - val120 - val79[val83]))
                              else
                                val215 = val80[val83]
                                break
                              end
                            else
                              if not (val221 <= 106) then
                                if val221 == 119 then
                                  val216 = val79[val83]

                                  val221 = -13 + (val74[2][6](val74[2][8](val74[2][10](
                                    val74[2][6](val80[val83]), val221, val221
                                  )), val221, val80[val83]))
                                else
                                  val213 = val213[val216]
                                  val96 = val74[2][8]
                                  val97 = val77[val83] ~= val221

                                  val98 = val97
                                  val98 = val97 and val80[val83]

                                  val99 = val98

                                  val221 = 120 + ((val96(val98 or val221)) - val77[val83] + val79[val83])
                                  ::L14644890::
                                end
                              else
                                val215 = val82[val83]

                                val221 = 39
                                  + (val74[2][13]((val74[2][12](val120 + val80[val83], val79[val83]))
                                        < val221
                                      and val120
                                    or val221))

                                goto L14644890
                              end
                            end
                          end

                          local val222 = 25

                          while true do

                            if val222 < 51 and val222 > 25 then
                              val215 = val120

                              val222 = -421
                                + (val74[2][11](val120 - val79[val83] - val222 + val222, val77[val83]))
                            else
                              if val222 > 36 then
                                val216 = val216 - val215
                                break
                              else
                                if not (val222 < 36) then
                                else
                                  val216 = val216 + val215

                                  val222 = 9
                                    + ((val74[2][6](val222 + val120 > val222 and val222 or val222))
                                      + val80[val83])
                                end
                              end
                            end
                          end

                          local val223 = 96

                          while true do
                            if val223 ~= 96 then
                              val219 = val219(val213)
                              val213 = val77[val83]
                              break
                            else
                              val213 = val213(val216, val79[val83])

                              val223 = -33
                                + ((val74[2][14](val223 - val223 + val79[val83], val79[val83])) + val223)
                            end
                          end

                          local val224 = 116

                          while true do
                            if val224 > 109 then
                              val218 = val218(val219, val213, val79[val83])

                              val224 = -93
                                + ((val74[2][10](val224 + val224 + val224, val224, val120)) - val224)

                              ::L6160260::
                            else

                              if val224 < 109 and val224 > 67 then
                                val218 = val218 + val219

                                val224 = 39
                                  + (((val79[val83] < val224 and val120 or val80[val83]) < val224
                                              and val79[val83]
                                            or val80[val83])
                                          + val224
                                        == val79[val83]
                                      and val224
                                    or val224)

                                goto L6160260
                              else
                                if val224 < 70 then
                                  val219 = val120

                                  val224 = 69 + (val74[2][8](val74[2][14](
                                    val224 - val120 - val77[val83], val79[val83]
                                  )))
                                else

                                  if not (val224 < 116 and val224 > 70) then
                                    goto L6160260
                                  else
                                    val211 = val211(val218)
                                    break
                                  end
                                end
                              end
                            end
                          end

                          local val225 = val214 + val211
                          val82[val83] = 110 + val225
                          local val226 = 112

                          while true do
                            if val226 < 112 then
                              val218 = val79[val83]
                              val211 = val211[val218]
                              break
                            else
                              if val226 > 15 then
                                val225 = val77[val83]
                                val211 = val84

                                val226 = -96
                                  + ((val74[2][8](val74[2][13](val77[val83]))) - val80[val83] + val226)
                              end
                            end
                          end

                          local val227 = 91

                          while true do
                            if not (val227 >= 126) then
                              val218 = val84[val80[val83]]
                              val227 = 68 + ((val74[2][9](val120)) + val227 - val227 - val80[val83])
                            else
                              val211 = val211[val218]
                              break
                            end
                          end

                          val84[val225] = val211
                        end

                        goto L15033315
                      end
                    else
                      if not (val120 >= 64) then
                        if val120 == 63 then
                          val84[val77[val83]][val84[val79[val83]]] = val78[val83]
                        else
                          val84[val80[val83]] = unpack
                        end
                      else
                        if val120 == 65 then
                          val84[val79[val83]] = val84[val77[val83]] + val78[val83]
                        else
                          val74[2][val79[val83]] = val84[val77[val83]]
                        end
                      end

                      goto L15033315
                    end
                  end
                end
              else
                if val120 < 103 then
                  if not (val120 >= 95) then
                    if val120 >= 91 then
                      if val120 < 93 then
                        if val120 == 92 then
                          val84[val79[val83]] = val84[val77[val83]]
                        else
                          val84[val77[val83]] = val84[val80[val83]] % val84[val79[val83]]
                        end
                      else
                        if val120 == 94 then
                          val90, val94 = val74[1][33](...)
                        else
                          val84[val80[val83]] = p88.Lb
                        end
                      end
                    else
                      if val120 >= 89 then
                        if val120 == 90 then
                          local val228 = val79[val83]

                          val84[val228] = val84[val228](val74[1][14](
                            val228 + 1, val228 + val77[val83] - 1, val84
                          ))

                          val87 = val228
                        else
                          val84[val79[val83]] = val84[val80[val83]] .. val84[val77[val83]]
                        end
                      else
                        val84[val79[val83]] = val84[val77[val83]] - val78[val83]
                      end
                    end

                    ::L4662260::
                    ::L1904724::
                    goto L3369653
                  else
                    if val120 < 99 then
                      if not (val120 < 97) then
                        if val120 == 98 then
                          if val91 then
                            for v478, v479 in val91, nil, nil do
                              if not (v478 >= 1) then
                              else
                                v479[3] = v479
                                v479[1] = val84[v478]
                                v479[2] = 1

                                val91[v478] = nil
                              end
                            end
                          end

                          local val229 = val77[val83]
                          return val84[val229](val74[1][14](val229 + 1, val87, val84))
                        else
                          val84[val77[val83]] = val80
                          ::L2533775::
                          ::L1061040::
                          goto L4662260
                        end
                      else
                        if val120 ~= 96 then
                          local val230 = val80[val83]

                          val74[1][20](
                            val84, val230 + 1, val230 + val79[val83], val77[val83] + 1, val84[val230]
                          )
                        else
                          local val231 = val77[val83]
                          local val232 = val84[val80[val83]]

                          val84[val231 + 1] = val232
                          val84[val231] = val232[val81[val83]]
                        end

                        goto L2533775
                      end
                    else
                      if not (val120 >= 101) then
                        if val120 ~= 100 then
                          val84[val77[val83]] = val84[val80[val83]] ^ val84[val79[val83]]
                        else
                          local val233 = val81[val83]
                          local val234 = val233[2]
                          local val235 = #val234

                          local val236 = val235 > 0 and {}
                          val84[val77[val83]] = val74[1][34](val233, val236)

                          if val236 then
                            local val237 = 0

                            while true do
                              val237 = 1 + val237

                              if not (val235 >= val237) then
                                break
                              end

                              local val238 = val237
                              local val239 = val234[val238]
                              local val240 = val239[3]
                              local val241 = val239[2]

                              if val240 == 0 then
                                if not val91 then
                                  val91 = {}
                                end

                                local val242 = val91[val241]

                                if not val242 then
                                  val242 = { [2] = val241, [3] = val84 }
                                  val91[val241] = val242
                                end

                                val236[val238 - 1] = val242
                              else
                                if val240 == 1 then
                                  val236[val238 - 1] = val84[val241]
                                else
                                  val236[val238 - 1] = p96[val241]
                                end
                              end
                            end
                          end
                        end
                      else
                        if val120 == 102 then
                          val85 = val80[val83]
                          val90, val94 = val74[1][33](...)
                          local val243 = 0

                          while true do
                            val243 = 1 + val243

                            if not (val243 <= val85) then
                              break
                            end

                            local val244 = val243
                            val84[val244] = val94[val244]
                          end

                          val86 = val85 + 1
                        else
                          val84[val80[val83]] = not val84[val79[val83]]
                        end
                      end

                      goto L1061040
                    end
                  end
                else
                  if not (val120 >= 110) then
                    if val120 < 106 then
                      if val120 >= 104 then
                        if val120 == 105 then
                          val92 = val92 + val93

                          if val93 <= 0 then
                            val95 = val92 >= val89
                          else
                            val95 = val92 <= val89
                          end

                          if not val95 then
                          else
                            val84[val77[val83] + 3] = val92
                            val83 = val79[val83]
                          end
                        else
                          val84[val79[val83]] = val84[val77[val83]] * val78[val83]
                        end
                      else
                        val84[val80[val83]][val81[val83]] = val84[val77[val83]]
                      end

                      ::L4890144::
                      ::L3717609::
                      goto L1904724
                    else
                      if val120 >= 108 then
                        if val120 == 109 then
                          val88 = {
                            [2] = val89, [3] = val92, [1] = val88, [5] = val93, }

                          val87 = val80[val83]

                          local val245 = val74[1][28](function(...)
                            val74[1][6]()

                            for v499, v500 in ... do
                              val74[1][6](true, v499, v500)
                            end

                            return
                          end)

                          val245(val84[val87], val84[val87 + 1], val84[val87 + 2])

                          val92 = val245
                          val83 = val77[val83]
                          goto L4890144
                        else
                          if not val91 then
                          else
                            for v501, v502 in val91, nil, nil do
                              if not (v501 >= 1) then
                              else
                                v502[3] = v502
                                v502[1] = val84[v501]
                                v502[2] = 1

                                val91[v501] = nil
                              end
                            end
                          end

                          local val246 = val80[val83]
                          return val74[1][14](val246, val246 + val77[val83] - 2, val84)
                        end
                      else
                        if val120 == 107 then
                          val84[val77[val83]] = typeof
                        else
                          val84[val79[val83]] = val74[1][5](val84[val80[val83]], val76[val83])
                        end
                      end
                    end
                  else
                    if val120 >= 114 then
                      if not (val120 < 116) then
                        if val120 == 117 then
                          val84[val80[val83]] = assert
                        else
                          val84[val80[val83]] = val79
                        end

                        ::L3879788::
                        ::L5266112::
                        goto L3717609
                      else
                        if val120 ~= 115 then
                          break
                        else
                          val84[val80[val83]] = val84[val77[val83]] >= val84[val79[val83]]
                          goto L3879788
                        end
                      end
                    else
                      if not (val120 < 112) then
                        if val120 ~= 113 then
                          val84[val77[val83]] = val84[val80[val83]] * val84[val79[val83]]
                        else
                          val84[val79[val83]] = rawget
                        end
                      else
                        if val120 ~= 111 then
                          val84[val77[val83]] = val84[val79[val83]][val84[val80[val83]]]
                        else
                          val88 = {
                            [2] = val89, [3] = val92, [1] = val88, [5] = val93, }

                          local val247 = val77[val83]
                          val93 = val84[val247 + 2] + 0
                          val89 = val84[val247 + 1] + 0
                          val92 = val84[val247] - val93
                          val83 = val79[val83]
                        end
                      end

                      goto L5266112
                    end
                  end
                end
              end
            end
          end

          if val91 then
            for v505, v506 in val91, nil, nil do
              if not (v505 >= 1) then
              else
                v506[3] = v506
                v506[1] = val84[v505]
                v506[2] = 1

                val91[v505] = nil
              end
            end
          end

          return
        end
      end

      if not not p91[19987] then
        u = p88:U_(j, p91)
      else

        u = -467907098
          + ((p91[3718] >= p91[5165] and p88.N[2] or p91[26536]) - p91[5165] - p91[2048]
            - p91[19715])

        p91[19987] = u
      end

      return p92, p90, u, 57509, p94
    else
      if j == 79 then
        val73 = p88
        j = p88:J_(p91, p89, j)
        ::L13055216::
        return p92, p90, j, nil, p94
      else
        if j == 98 then
          p89[36] = function()
            local val248 = { p89, p89[30] }
            local val249, val250, val251, val252, val253 = p88:n_(val248, nil, nil, nil, nil, nil)
            local val254 = { p88:D_(nil, nil, nil, val249, nil, val251, val250, val252, val248, val253, nil) }
            local val255 = val254[2]
            local val256 = val254[9]
            local val257 = val254[4]
            local val258 = val254[5]

            local val259, v525 = p88:zb(
              val257, val254[6], val258, val248, val254[3], val253, val254[1], val256, val254[8], val255, (p88:r_(nil, val253, val257, val258, val255, val256))
            )

            if val259 == nil then
              return
            else
              return p88.t(val259)
            end
          end

          if not p91[12535] then
            gb = -3563199934 + (p88.wb(p88.N[4] + p91[25455] + p91[5165] - p91[31830]))
            p91[12535] = gb
          else
            gb = p88:Gb(p91, j)
          end

          return p92, p90, gb, 57509, p94
        else
          if j == 89 then
            local val260 = { p88:Ob(p91, j, p89, p92) }
            return val260[1], p90, val260[2], 57509, p94
          else
            if j == 100 then
              local val261 = { p88:Cb(p91, j, p94, p90, p92) }
              return p92, val261[2], val261[3], 57509, val261[1]
            else
              if j == 115 then
                p89[30][11] = p88.Qb

                if not not p91[7340] then
                  val72 = p91[7340]
                else

                  val72 = 46
                    + ((p88.lb(p91[14850])) + p91[7913] + p91[14850] < p91[25455] and p91[23391]
                      or p91[16110])

                  p91[7340] = val72
                end

                return p92, p90, val72, 57509, p94
              else
                if j == 54 then
                  p89[30][12] = p88.xb
                  return p92, p90, j, 6592, p94
                else
                  goto L13055216
                end
              end
            end
          end
        end
      end
    end
  end, ib = bit32.countlz, U = bit32.bnot, Y_ = function(p98, p99, p100, p101, p102) return 87, (p101 - p99) / 8 end, kb = function(p103, p104)
    p104[5][2] = p104[1][18]
    return
  end, Q_ = function(p105, p106, p107, p108, p109, p110, p111, p112)
    if not (p109 < 88) then
      local val262, val263
      val263, val262 = p105:Y_(p111, p109, p107, p108)
      return nil, val263, p106, val262
    else
      return 41025, p109, (p110 - p112) / 8, p108
    end
  end, A_ = function(p113, p114)
    p114[29] = function()
      local val264 = { p114 }
      local val265 = 99
      local val266, val267

      while true do
        val265 = 2 + val265

        if not (val265 <= 213) then
          break
        end

        local val268
        val267, val268, val266 = p113:T_(val266, val264, val265, val267)

        if val268 == 30647 then
        else
          if val268 ~= nil then
            return p113.t(val268)
          end
        end
      end

      return
    end

    return
  end, M = function(p115, p116, p117, p118)
    if p116 == 41 then
      return 56075, 116, (p118[1][16](p118[1][21], p118[1][4], p118[1][4]))
    else
      if p116 == 116 then
        p118[1][4] = p118[1][4] + 1
        return { p117 }, p116, p117
      else
        return nil, p116, p117
      end
    end
  end, h_ = function(p119, p120, p121, p122, p123)
    if p123[2] == p122 then
    else
      p121[p120] = p123[1][18][p122]
    end

    return
  end, F = table, u_ = function(p124, p125, p126, p127)

    p127[31] = function()
      local val269 = { p127, p127[24] }
      local val270 = val269[1][29]()
      local val271

      if val269[1][8] == val269[1][23] then
        local f = p124:F_(val269)

        if f == nil then
          ::L11497583::
          val271 = -12

          while true do
            val271 = 118 + val271

            if not (val271 <= 289) then
              break
            end

            local val272 = val271

            if val272 < 224 then
              if val270 >= val269[1][10] then
                local d = p124:d_(val269, val270)
                return p124.t(d)
              end
            else
              if val272 > 106 then
                return val270
              end
            end
          end

          return
        else
          return p124.t(f)
        end
      else
        goto L11497583
      end
    end

    local val273

    if not p125[14850] then

      val273 = -4294967323
        + ((p124.cb((p124.N[8] == p125[28978] and p125[19723] or p125[26536]) - p125[9959]))
          + p125[15440])

      p125[14850] = val273
    else
      val273 = p125[14850]
    end

    return val273
  end, z_ = function(p128, p129) return 87 end, c = function(p130, p131, p132) return p132[7913] end, x_ = function(p133, p134, p135, p136)
    p134[p136] = p135
    return
  end, Z = table.create, L = function(p137, p138, p139, fn)
    p139[p138] = fn(p138)
    return
  end, G_ = function(p140, p141, p142, p143, p144)
    local val274 = p144
    local z = 88
local val275

    while true do
      if z == 88 then
        z = p140:z_(z)
      else
        val275 = p141[1][16](p141[1][21], p141[1][4], p141[1][4])

        val274 = val274 + (val275 > 127 and val275 - 128 or val275) * p143
        break
      end
    end

    p141[1][4] = p141[1][4] + 1
    return p143 * 128, val274, val275
  end, m_ = function(p145, p146, p147, p148) return (p146[1][29]()) - 67830, 110 end, z = string.gsub, Nb = function(p149, p150, p151, p152)
    p151[1][19][p150] = p152
    return
  end, s_ = function(p153, p154, p155) return #p155[1][35] end, T = coroutine.yield, P = function(p156, p157, p158)

    local val276 = -4294967242 + (p156.Qb(p156.lb(
      (p156.N[2] >= p156.N[3] and p158 or p157[11771]) - p157[3718], p157[23348], p157[5165]
    ), p157[5165]))

    p157[26536] = val276
    return val276
  end, Rb = function(p159, p160, p161, p162, p163, p164)
    if not (p161 <= 198) then
      local eb = p159:Eb(p163, p161, p162)

      if eb == 20385 then
        return 43353
      else
        if eb ~= nil then
          return { p159.t(eb) }
        else
          return nil
        end
      end
    else
      if p161 == 198 then
        local val277 = 0

        while true do
          val277 = 1 + val277

          if not (val277 <= p164) then
            break
          end

          local val278 = val277
          local val279 = p162[1][29]()

          if p162[1][19][val279] then
            p160[val278] = p162[1][19][val279]
          else
            local val280 = nil
            local val281 = nil
            local val282 = 108

            while true do
              if val282 == 108 then
                val280, val282 = p159:W_(val279, val282, val280)
                ::L8962490::
              else
                if val282 == 91 then
                  val282 = 126
                  val281 = { [3] = val279 % 4, [2] = val280 - val280 % 1 }
                  goto L8962490
                else
                  if val282 ~= 126 then
                    goto L8962490
                  else
                    p159:Nb(val279, p162, val281)
                    break
                  end
                end
              end
            end

            p160[val278] = val281
          end
        end

        return 43353
      else
        p163[2] = p160
        return 43353
      end
    end
  end, db = function(p165, p166, p167, p168)
    p166[1][35] = p166[1][13](p168 * 3)

    for i7 = 1, p168 do
      p167[i7] = p166[1][36]()
    end

    return
  end, V = string.pack, q = function(p169, p170, p171, p172)
    p170[18] = p169.A
    p170[19] = p169.A

    local val283

    if not not p172[16110] then
      val283 = p172[16110]
    else
      val283 = -87 + (p169.ob((p169.Yb(p169.N[2] + p172[26536])) + p172[19723], p172[14309]))
      p172[16110] = val283
    end

    return val283
  end, Zb = function(p173, p174, p175, p176)
    p175[1][18][p176] = { [0] = p174 }
    return
  end, yb = bit32, H = bit32.band, m = bit32.rshift, q_ = function(p177, p178, p179, p180)
    p180[1][35][p178 + 3] = p179
    return
  end, ob = bit32.bxor, Db = function(p181, p182, p183)

    local val284 = 26 + (p181.gb(
      (p181.Yb(p183[28978] + p183[23391])) ~= p183[11771] and p183[12535] or p183[19230], p183[30490]
    ))

    p183[28699] = val284
    return val284
  end, n_ = function(p184, p185, p186, p187, p188, p189, p190)
    local val285 = { p184.A, p184.A, nil, nil, nil, nil, p184.A, nil, p184.A, nil, p184.A }
    val285[1] = p185[1][29]()
    return 11, nil, nil, nil, val285
  end, Cb = function(p191, p192, p193, p194, p195, p196)
    local element = p191

    local function helper4(...)

      local sb = element:Sb(...)
      return element.t(sb)
    end

    local val286 = p196()
    local val287

    if not p192[16449] then

      val287 = -1162522614
        + ((element.eb(p192[5165] - p192[9959] - element.N[2], p192[14309])) >= element.N[1] and element.N[7]
          or element.N[8])

      p192[16449] = val287
    else
      val287 = p192[16449]
    end

    return helper4, val286, val287
  end, Jb = function(p197, p198)
    p198[1][18] = p197.A
    return
  end, nb = function(p199, p200, p201)
    p200[1][35] = nil
    return 26
  end, sb = string.sub, zb = function(p202, p203, p204, p205, p206, p207, p208, p209, p210, p211, p212, p213)
    local val288 = p208
    val288[9] = p211

    local val289 = -15
    local val290, val291

    while true do
      val289 = 41 + val289

      if not (val289 <= 141) then
        break
      end

      local val292

      val292, val290, val288, val291 = p202:j_(
        p205, val289, p203, p211, p207, p204, p209, p210, p212, p206, val290, val291, p213, val288
      )

      if val292 == 8830 then
        break
      else
        if val292 ~= nil then
          return { p202.t(val292) }, val288
        end
      end
    end

    local val293 = 54

    while true do
      val293 = 72 + val293

      if not (448 >= val293) then
        break
      end

      local rb2 = p202:Rb(val290, val293, p206, val288, val291)

      if rb2 == 43353 then
      else
        if rb2 ~= nil then
          return { p202.t(rb2) }, val288
        end
      end
    end

    return nil, val288
  end, X_ = function(p214, p215, p216, p217, p218, p219)
    p216[p219 + 1] = p218
    p216[p219 + 2] = p215
    return 85
  end, N_ = function(p220, p221, p222)
    local val294 = 87 + ((p220.ib((p220.lb(p220.N[6])) + p222)) - p221[30490])
    p221[15440] = val294
    return val294
  end, s = function(p223, p224, p225, p226)
    local val295 = p226

    val295[12] = function(p227, p228, p229)
      local val296 = { val295 }

      if p227 > p228 then
        return
      else
        local val297 = p228 - p227 + 1

        if val297 >= 8 then
          return p229[p227], p229[p227 + 1], p229[p227 + 2], p229[p227 + 3], p229[p227 + 4], p229[p227 + 5], p229[p227 + 6], p229[p227 + 7], val296[1][12](p227 + 8, p228, p229)
        else
          if val297 >= 7 then
            return p229[p227], p229[p227 + 1], p229[p227 + 2], p229[p227 + 3], p229[p227 + 4], p229[p227 + 5], p229[p227 + 6], val296[1][12](p227 + 7, p228, p229)
          else
            if val297 >= 6 then
              return p229[p227], p229[p227 + 1], p229[p227 + 2], p229[p227 + 3], p229[p227 + 4], p229[p227 + 5], val296[1][12](p227 + 6, p228, p229)
            else
              if val297 >= 5 then
                return p229[p227], p229[p227 + 1], p229[p227 + 2], p229[p227 + 3], p229[p227 + 4], val296[1][12](p227 + 5, p228, p229)
              else
                if val297 >= 4 then
                  return p229[p227], p229[p227 + 1], p229[p227 + 2], p229[p227 + 3], val296[1][12](p227 + 4, p228, p229)
                else
                  if val297 >= 3 then
                    return p229[p227], p229[p227 + 1], p229[p227 + 2], val296[1][12](p227 + 3, p228, p229)
                  else
                    if val297 >= 2 then
                      return p229[p227], p229[p227 + 1], val296[1][12](p227 + 2, p228, p229)
                    else
                      return p229[p227], val296[1][12](p227 + 1, p228, p229)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    local p

    if not not p224[26536] then
      p = p224[26536]
    else
      p = p223:P(p224, p225)
    end

    return p
  end, Lb = string, X = function(p230, p231, p232, p233)
    p233[1][4] = p232
    return { p231 }
  end, bb = getmetatable, b = function(p234, p235, p236, p237)
    p236[16] = p234.R.byte
    local y

    if not not p235[19723] then
      y = p234:y(p235, p237)
    else
      y = p234:e(p237, p235)
    end

    return y
  end, rb = function(p238, p239, p240)

    local val298 = ((p238.xb(p239[28978], p239[24325])) > p238.N[1] and p240 or p239[23391])
      - p239[12535]

    p239[12159] = 300384318 + (val298 - p238.N[9])

    local val299 = -1162522753
      + ((p238.gb(p238.eb(p238.ib(p239[23473]), p239[30490]), p239[14850])) + p238.N[7])

    p239[17568] = val299
    return val299
  end, cb = bit32.bnot, E = function(...)
    local val300 = ...
    val300[val300] = nil
    return
  end, h = function(p241, p242) return { p242 } end, V_ = function(p243, p244, p245, p246)
    local val301 = p245
    local val302, val303

    if val301 == 97 then
      p246[27] = function()
        local val304 = { p246 }
        local val305, val306 = val304[1][2]("<d", val304[1][21], val304[1][4])
        local val307 = 115

        while true do
          local val308
          val308, val307 = p243:W(val305, val306, val304, val307)

          if val308 == 262 then
            continue
          end

          if val308 ~= nil then
            return p243.t(val308)
          else
          end
        end

        return
      end

      if not not p244[15440] then
        val303 = p244[15440]
      else
        val303 = p243:N_(p244, val301)
      end

      return 43558, val303
    else
      if val301 == 76 then
        val302 = p243
        val301 = p243:R_(val301, p246, p244)
        ::L4805264::
        return nil, val301
      else
        if val301 ~= 59 then
          goto L4805264
        else
          p243:A_(p246)
          return 47949, val301
        end
      end
    end
  end, t = unpack, ub = function(p247, p248, p249, p250, p251, p252)
    if p249[2] == p252 then
    else
      p247:db(p249, p250, p248)
    end

    return 74
  end, vb = math, O_ = function(p253, p254, p255)
    p255[10] = p254
    return
  end, Tb = function(p256, p257, p258, p259, p260)
    local val309 = p259

    if val309 == 69 then
      val309 = 96
      p260[1][19] = {}
      ::L3922425::
      return p257, p258, nil, val309
    else
      if val309 == 96 then
        local val310 = { p256:Bb(p258, val309, p260) }
        return p257, val310[1], 1978, val310[2]
      else
        if val309 == 63 then
          p260[1][18] = p260[1][13](p258)
          return p257, p258, 1978, 18
        else
          if val309 ~= 18 then
            goto L3922425
          else
            return (p260[2]()) ~= 0, p258, 29649, val309
          end
        end
      end
    end
  end, f = function(p261, p262, p263) return p263[19715] end, Pb = setmetatable, Ub = function(p264, p265, p266, p267, p268, p269, p270, p271, p272)
    local ub = 87
    local val311, val312

    while true do
      if ub == 87 then
        ub = p264:ub(p267, p266, p270, ub, p268)
      else
        if ub == 74 then
          val311 = #p266[1][35]
          val312 = -2

          while true do
            val312 = 3 + val312

            if not (val311 >= val312) then
              break
            end

            local val313 = val312
            p266[1][35][val313][p266[1][35][val313 + 1]] = p270[p266[1][35][val313 + 2]]
          end

          ub = 33
          ::L10193120::
        else
          if ub ~= 33 then
            goto L10193120
          else
            if not p271 then
            else
              local val314 = 2

              while true do
                val314 = 112 + val314

                if not (226 >= val314) then
                  break
                end

                local val315 = val314

                if val315 < 226 then
                  p264:kb(p266)
                else
                  if not (val315 > 114) then
                  else
                    p264:Hb(p270, p266)
                  end
                end
              end
            end

            break
          end
        end
      end
    end

    return 42, p270[p266[1][29]()], 40
  end, j_ = function(p273, p274, p275, p276, p277, p278, p279, p280, p281, p282, p283, p284, p285, p286, p287)
    local val316 = p287

    if not (p275 >= 67) then
      val316[3] = p279
      local val317 = 0

      while true do
        val317 = 1 + val317

        if not (val317 <= p280) then
          break
        end

        local val318 = val317
        local val319 = { p273:o_(nil, p283, nil, nil, nil, nil, nil, nil) }
        local val320 = val319[2]
        local val321 = val319[1]
        local val322 = val319[4]
        local val323, val324, val325, val326
        val326, val325, val324, val323 = p273:c_(val319[3], val319[7], val321, nil, nil, val319[5], nil)
        p279[val318] = val319[6]

        for i8 = 18, 475, 116 do
          if not (i8 > 134) then
            if i8 == 134 then
              p273:a_(p278, val318, val326)
              ::L5297452::
            else
              p274[val318] = val320
            end
          else
            local val327

            val327, val316 = p273:p_(
              p286, p282, p274, p281, i8, val322, val325, val320, p283, val318, p277, val316, val324
            )

            if val327 == 20544 then
              break
            else
              if val327 == nil then
                goto L5297452
              else
                return { p273.t(val327) }, p284, val316, p285
              end
            end
          end
        end

        if val321 == 1 then
          if p283[1][7] then
            local val328 = nil
            local val329 = nil
            local val330 = 60

            while true do
              if val330 == 60 then
                val330, val328 = p273:M_(val330, val326, val328, p283)
                ::L13254290::
              else
                if val330 == 107 then
                  val329 = #val328
                  val330 = 78
                else
                  if val330 == 78 then
                    val330 = p273:X_(val318, val328, val330, val316, val329)
                  else
                    if val330 == 85 then
                      val328[val329 + 3] = 7
                      break
                    else
                      goto L13254290
                    end
                  end
                end
              end
            end
          else
            p273:h_(val318, p276, val326, p283)
          end
        else
          if val321 == 4 then
            p278[val318] = val326
          else
            if val321 == 6 then
              p278[val318] = val318 + val326
            else
              if val321 == 5 then
                p278[val318] = val318 - val326
              else
                if val321 == 3 then
                  local val331 = 79
                  local val332 = nil

                  while true do
                    if val331 > 79 then
                      if p283[1][23] ~= p283[2] then
                        p283[1][35][val332 + 1] = p276
                        p283[1][35][val332 + 2] = val318
                      end

                      break
                    else
                      if val331 < 98 then
                        val331, val332 = p273:I_(val332, p283, val331)
                      end
                    end
                  end

                  p283[1][35][val332 + 3] = val326
                end
              end
            end
          end
        end
      end

      return nil, p284, val316, (p283[1][29]())
    else
      return 8830, (p283[1][13](p285)), val316, p285
    end
  end, r = function(p288, p289, p290)
    p289[6] = nil
    p289[7] = nil
    p289[8] = nil

    return nil
  end, d = coroutine.wrap, D = function(p291, p292, p293, p294)
    local val333 = {}

    p293[1] = nil
    p293[2] = nil
    p293[3] = nil

    local s = 75

    while true do
      if s == 75 then
        s = p291:S(val333, s, p293)
        ::L7878575::
      else
        if s == 46 then
          s = p291:_(s, p293, val333)
        else
          if s ~= 53 then
            goto L7878575
          else
            p293[3] = p291.z
            break
          end
        end
      end
    end

    p293[4] = nil
    p293[5] = nil

    return val333, s
  end, e_ = function(p295, p296, p297, p298, p299, p300)

    if not (p298 < 84) then
      if p296 == 174 then
        p300[1][35][p299 + 1] = p297
      end

      return nil, p299
    else

      return 13686, (p295:s_(p299, p300))
    end
  end, b_ = function(p301, p302, p303, p304, p305, p306)
    if not p303[1][7] then
      p306[p304] = p303[1][18][p305]
    else
      p301:y_(p305, p302, p303, p304)
    end

    return
  end, n = bit32.bor, t_ = function(p307, p308, p309, p310) return (p308[1][13](p309)) end, O = function(p311, p312, p313)
    local val334 = p311.N[5] >= p311.N[1]

    local val335 = -2910354402
      + ((p311.gb(val334 and p311.N[1] or p311.N[9], 8)) + p311.N[9] + p311.N[6])

    p312[11771] = val335
    return val335
  end, o_ = function(p314, p315, p316, p317, p318, p319, p320, p321, p322)
    local val336 = 68
    local val337 = p316[1][31]()
    local val338, val339, val340

    repeat
      if val336 == 83 then
        val338, val340 = p314:K_(val338, val337, val340, p316)
        break
      else
        val336, val339 = p314:f_(val336, p316, val339)
        goto L4933452
      end
    until false

    local val341 = 4
    local val342, val343, l

    while true do
      if not (val341 <= 4) then
        l = p314:l_(l, val339, val342)
        break
      else
        val341, val342, val343 = p314:g_(val342, p316, val339, val341, val343)
      end
    end

    return val340, l, val338, val342, val341, val343, val337
  end, B = string.char, mb = function(p323, p324)
    p324[1][19] = nil
    return
  end, p_ = function(p325, p326, p327, p328, p329, p330, p331, p332, p333, p334, p335, p336, p337, p338)
    local val344 = p337

    if p330 == 366 then
      local val345

      val345, val344 = p325:L_(
        p336, p334, val344, p332, p338, p333, p329, p331, p335, p328, p326, p327
      )

      if val345 == 29766 then
        return 20544, val344
      else
        if val345 ~= nil then
          return { p325.t(val345) }, val344
        else
          ::L10199921::
          return nil, val344
        end
      end
    else
      p327[p335] = p338
      goto L10199921
    end
  end, tb = function(p339, p340, p341, p342, p343)
    local nb = p343

    while true do
      if nb == 40 then
        nb = 103

        if p340 == 42 then
          p339:Jb(p342)
        end

        ::L10150757::
      else
        if nb == 103 then
          nb = p339:nb(p342, nb)
        else
          if nb ~= 26 then
            goto L10150757
          else
            p339:mb(p342)
            break
          end
        end
      end
    end

    return { p341 }, nb
  end, x = function(p344, p345, p346, p347, p348)
    local val346 = p347
    local val347 = p346

    while true do
      if val347 > 53 then
        local val348 = { p344:Q(val347, p348, p345) }
        val347 = val348[2]

        if val348[1] == 65402 then
        else
          ::L14491363::
        end
      else
        local val349
        val347, val349, val346 = p344:w(val347, p345, p348, val346)

        if val349 == 45337 then
          break
        else
          if val349 == 61474 then
          else
            goto L14491363
          end
        end
      end
    end

    p345[12] = nil
    p345[13] = nil

    return val347, val346
  end, e = function(p349, p350, p351)
    local val350 = -3723910750
      + (p349.lb(p349.N[8] + p349.N[4] - p349.N[3] + p351[11771], p349.N[4]))

    p351[19723] = val350
    return val350
  end, r_ = function(p352, p353, p354, p355, p356, p357, p358)
    p354[5] = p357
    p354[8] = p358
    p354[4] = p356
    p354[7] = p355

    return 174
  end, F_ = function(p359, p360)
    if p360[2] then
      return {}
    else
      return nil
    end
  end, Z_ = function(p361, p362, p363, p364)
    p364[29] = nil
    local val351 = 97

    while true do
      local val352
      val352, val351 = p361:V_(p363, val351, p364)

      if val352 == 47949 then
        break
      else
      end
    end

    p364[30] = {}
    p364[31] = nil

    return val351
  end, Eb = function(p365, p366, p367, p368)
    if not (p367 < 342) then
      return { p366 }
    else
      p366[6] = p368[1][29]()
      return 20385
    end
  end, P_ = function(p369, p370, p371, p372, p373, p374)
    if p373 < 212 then
      p371[1][35][p374 + 2] = p370
      return 55243
    else
      p371[1][35][p374 + 3] = p372
      return 51886
    end
  end, Gb = function(p375, p376, p377) return p376[12535] end, Y = function(p378, p379, p380, p381)
    p379[10] = 4503599627370500
    local val353

    if not p381[5165] then
      val353 = p378:o(p381, p380)
    else
      val353 = p381[5165]
    end

    return val353
  end, I_ = function(p382, p383, p384, p385) return 98, #p384[1][35] end, w_ = function(p386, p387, p388, p389, p390, p391)
    if not p387[1][7] then
      p388[p390] = p387[1][18][p391]
    else
      local val354 = nil
      local val355 = nil

      for i9 = 90, 294, 98 do
        if i9 == 188 then
          val354 = #val355
        else
          if i9 == 286 then
            val355[val354 + 1] = p389
            break
          else
            if i9 == 90 then
              val355 = p386:i_(p391, p387, val355)
            end
          end
        end
      end

      val355[val354 + 2] = p390
      val355[val354 + 3] = 9
    end

    return
  end, Qb = bit32.lrotate, I = function(p392, p393)
    local val356

    for i10 = 77, 233, 102 do
      if i10 == 179 then
        local h = p392:h(val356)
        return { p392.t(h) }
      else
        if i10 ~= 77 then
        else
          local val357 = { p393[1][2]("<i8", p393[1][21], p393[1][4]) }
          val356 = val357[1]
          p393[1][4] = val357[2]
        end
      end
    end

    return nil
  end, H_ = function(p394, p395, p396, p397, p398)

    p398[32] = nil
    p398[33] = nil

    local val358 = 92

    repeat
      if val358 > 92 then
        p398[33] = function(...)
          local val359 = { p398, p398[25] }
          local val360 = val359[1][11]("#", ...)

          if val360 == 0 then
            return val360, val359[2]
          else
            return val360, { ... }
          end
        end

        break
      else

        if val358 > 11 and val358 < 110 then
          val358 = p394:u_(p396, val358, p398)
        else
          if val358 < 92 then
            p398[32] = function()
              local val361 = p394:k_({ p398 })

              if val361 == nil then
                return
              else
                return p394.t(val361)
              end
            end

            if not p396[12665] then
              p396[11396] = 66 + (p394.Qb(p394.wb(
                (p394.ib(p396[31093])) + p394.N[4], p396[8540], p394.N[1]
              ), p396[14309]))

              val358 = 99
                + ((p394.Qb(p394.lb(p394.ob(p396[19723], p394.N[7])), p396[5165])) > p396[23348]
                    and p396[14850]
                  or p394.N[8])

              p396[12665] = val358
            else
              val358 = p396[12665]
            end
          end
        end

        goto L2907476
      end
    until false

    p398[34] = nil
    p398[35] = nil
    p398[36] = nil

    return val358, nil
  end, k = bit32, T_ = function(p399, p400, p401, p402, p403)
    if p402 == 101 then
      local val362 = { p399:B_(p400, p403, p401) }
      return val362[2], 30647, val362[1]
    else
      if p402 == 103 then
        return p403, { p400 }, p400
      else
        return p403, nil, p400
      end
    end
  end, v = function(p404, p405, p406, p407)
    p405[14] = nil
    local val363 = 46

    while true do
      if val363 > 16 then
        if not (val363 > 46) then
          val363 = p404:s(p406, val363, p405)
        else
          p405[13] = p404.Z

          if not p406[9959] then
            p406[30490] = 6
              + (p404.Yb((p404.xb(p404.N[8] + p406[23391], p406[14309])) - p406[26536]))

            p406[23473] = -1162522696
              + ((p404.xb(p406[2048], p406[14309])) - p406[26536] - p404.N[7] >= p406[23391]
                  and p404.N[3]
                or p404.N[7])

            val363 = 467907149 + (p406[11771] + p406[7913] + p406[5165] - p404.N[2] + p406[2048])
            p406[9959] = val363
          else
            val363 = p406[9959]
          end
        end
      else
        p405[14] = function(p408, p409, p410)
          local val364 = { p405 }
          local val365 = p408 or 1
          local val366 = p409 or #p410

          if not (val366 - val365 + 1 > 7997) then
            return val364[1][1](p410, val365, val366)
          else
            return val364[1][12](val365, val366, p410)
          end
        end

        break
      end
    end

    p405[15] = nil
    p405[16] = nil
    p405[17] = nil

    local b = 85

    while true do
      if b == 85 then
        p405[15] = p404.Pb

        if not not p406[8540] then
          b = p406[8540]
        else
          b = -163792 + (p404.Qb(
            p404.ob(p406[30490] - p406[11771] + p406[7913], p406[19715], p406[30490]), p406[30490]
          ))

          p406[8540] = b
        end
      else
        if b == 48 then
          b = p404:b(p406, p405, b)
        else
          if b == 79 then
            p405[17] = p404.sb
            break
          end
        end
      end
    end

    return b
  end, R = string, d_ = function(p411, p412, p413) return { p413 - p412[1][22] } end, A = nil, C = function(p414, p415, p416) return p415[19230] end, Fb = function(p417, p418, p419, p420, p421, p422, p423)
    local val367 = 69
local val368

    while true do
      local val369
      val368, ab, val369, val367 = p417:Tb(val368, ab, val367, p420)

      if val369 == 29649 then
        break
      else
      end
    end

    if p420[3] == p420[1][10] then
      ab = p417:Ab(p420, ab)
    end

    p420[1][7] = val368

    for i11 = 1, ab do
      local val370 = nil
      local val371 = nil

      for i12 = 86, 212, 63 do
        if i12 > 149 then
          ::L14538465::
        else

          if i12 < 212 and i12 > 86 then
            if not (val370 > 128) then
              local val372 = 50

              while true do
                if val372 < 105 then
                  val372 = 105

                  if val370 ~= 128 then
                    val371 = p420[4]()
                  else
                    val371 = (p420[2]()) == 1
                  end
                else
                  if val372 > 50 then
                    p417:Vb()
                    break
                  end
                end
              end
            else
              local val373 = 4

              repeat
                if val373 < 19 then
                  if not (val370 < 223) then
                    val371 = p420[1][32]()
                  else
                    val371 = p420[1][27]()
                  end

                  val373 = 19
                  goto L15538806
                else
                  if not (val373 > 4) then
                    goto L15538806
                  else
                    break
                  end
                end
              until false
            end
          else
            if i12 < 149 then
              val371 = nil
              val370 = p420[2]()
            else
              goto L14538465
            end
          end
        end
      end

      if not val368 then
        p420[1][18][i11] = val371
      else
        p417:Zb(val371, p420, i11)
      end
    end

    local val374 = (p420[1][29]()) - 58809
    return val374, (p420[1][13](val374)), ab, val367, val368
  end, L_ = function(p424, p425, p426, p427, p428, p429, p430, p431, p432, p433, p434, p435, p436)
    if p428 == 1 then
      p424:w_(p426, p425, p427, p433, p429)
    else
      if p428 == 4 then
        p424:x_(p436, p429, p433)
      else
        if p428 == 6 then
          p436[p433] = p433 + p429
        else
          if p428 == 5 then
            p436[p433] = p433 - p429
          else
            if p428 == 3 then
              local val375 = nil
              local val376 = -44

              while true do
                val376 = 64 + val376

                if not (312 >= val376) then
                  break
                end

                local val377 = val376

                if val377 > 84 then
                  local val378 = p424:P_(p433, p426, p429, val377, val375)

                  if val378 == 51886 then
                    break
                  else
                    if val378 == 55243 then
                    else
                      ::L5355855::
                    end
                  end
                else
                  local val379 = { p424:e_(p435, p425, val377, val375, p426) }
                  val375 = val379[2]

                  if val379[1] ~= 13686 then
                    goto L5355855
                  end
                end
              end
            end
          end
        end
      end
    end

    local val380

    if p432 == 1 then
      p424:b_(p427, p426, p433, p430, p431)
      ::L7354327::
      return 29766, p427
    else
      if p432 == 4 then
        p434[p433] = p430
        goto L7354327
      else
        if p432 == 6 then
          p434[p433] = p433 + p430
          goto L7354327
        else
          if p432 == 5 then
            p434[p433] = p433 - p430
            goto L7354327
          else
            if p432 == 3 then
              local val381 = #p426[1][35]

              if p426[1][17] == p427 then
                p426[1][32] = p426[1][34]
              end

              if p435 == 174 then
                val380 = 108

                while true do
                  if val380 == 108 then
                    val380 = 91
                    p426[1][35][val381 + 1] = p431
                  else
                    if val380 == 91 then
                      p426[1][35][val381 + 2] = p433
                      val380 = 126
                    else
                      if val380 == 126 then
                        p424:q_(val381, p430, p426)
                        break
                      end
                    end
                  end
                end

                ::L14615046::
                goto L7354327
              else
                local val382 = { p424:v_(p427, p426) }
                return { p424.t(val382[1]) }, val382[2]
              end
            else
              goto L14615046
            end
          end
        end
      end
    end
  end, _ = function(p438, p439, p440, p441)
    p440[2] = p438.R.unpack
    local c

    if not p441[19230] then

      c = -3748314680 + (p438.lb(
        (p438.ob(p441[11771] ~= p438.N[2] and p438.N[8] or p439, p439, p438.N[7])) ~= p438.N[8] and p438.N[4] or p438.N[3], p438.N[7], p438.N[5]
      ))

      p441[19230] = c
    else
      c = p438:C(p441, p439)
    end

    return c
  end, fb = function(p442, p443, p444)

    if p443 == 2 then
      p444[30][10] = p442.G
      return 338, 121
    else
      if p443 == 121 then

        return 338, (p442:Kb(p443, p444))
      else
        if p443 == 4 then
          p444[30][14] = p442.m
          return 45193, p443
        else
          return nil, p443
        end
      end
    end
  end, Hb = function(p445, p446, p447)
    p447[5][3] = p446
    return
  end, g = function(p448, p449, p450, p451)
    p451[7] = p448.A
    local val383

    if not p449[23348] then

      val383 = 57
        + (p448.Yb(p448.ob((p448.Qb(p448.N[8], p449[14309])) >= p449[2048] and p448.N[7] or p450)))

      p449[23348] = val383
    else
      val383 = p449[23348]
    end

    return val383
  end, l_ = function(p452, p453, p454, p455) return (p454 - p455) / 8 end, Kb = function(p456, p457, p458)
    p458[30][15] = p456.J
    p458[30][6] = p456.n
    return 4
  end, qb = table, k_ = function(p459, p460)
    local val384 = 61
    local val385 = p460[1][29]()

    while true do
      if val384 < 120 then
        p460[1][4] = p460[1][4] + val385
        val384 = 120
        continue
      end

      if not (val384 > 61) then
      else
        break
      end
    end

    return { p460[1][17](p460[1][21], p460[1][4] - val385, p460[1][4] - 1) }
  end, gb = bit32.rshift, w = function(p461, p462, p463, p464, p465)
local val386, val387

    if p462 > 22 then
      if p462 ~= 53 then

        return (p461:i(p462, p464, p463)), nil, p465
      else
        p463[4] = 1

        if not p464[14309] then
          val387 = -4 + (p461.cb((p461.Yb(p461.ib(p461.N[8]))) - p462))
          p464[14309] = val387
        else
          val387 = p464[14309]
        end

        return val387, 61474, p465
      end
    else
      if p462 > 16 then
        p463[11] = select
        return p462, 45337, p465
      else
        p463[5] = p461.G

        if not not p464[2048] then
          val386 = p464[2048]
        else
          p464[23391] = 2765485067 + (p464[11771] - p461.N[1] + p461.N[1] - p461.N[8] - p462)

          p464[28978] = -2765484939
            + ((p461.N[6] <= p461.N[7] and p461.N[9] or p461.N[5]) - p462 + p461.N[1]
                  ~= p461.N[3]
                and p461.N[8]
              or p462)

          val386 = -1684997181
            + (p461.ob(p461.cb(p461.wb(p461.N[9] == p461.N[6] and p464[14309] or p461.N[6]))))

          p464[2048] = val386
        end

        return val386, 61474, p461.B
      end
    end
  end, S_ = function(p466, p467, p468, p469, p470, p471, p472)
    local val388 = p472

    if p469 ~= 413 then
      val388 = p471[1][13](p467)
    else
      p466:O_(p470, p468)
    end

    return val388
  end, y = function(p473, p474, p475) return p474[19723] end, __ = function(p476, p477, p478, p479) return (p478[1][13](p477)) end, G = bit32.bxor, a_ = function(p480, p481, p482, p483)
    p481[p482] = p483
    return
  end, y_ = function(p484, p485, p486, p487, p488)
    local val389 = p487[1][18][p485]
    local val390 = #val389
    val389[val390 + 1] = p486
    local val391 = 122

    repeat
      if val391 > 17 then
        val391 = 17
        val389[val390 + 2] = p488
        goto L6172688
      else
        if val391 < 122 then
          val389[val390 + 3] = 8
          break
        else
          goto L6172688
        end
      end
    until false

    return
  end, xb = bit32.rrotate, i = function(p489, p490, p491, p492)
    p492[6] = p489.T
    local val392

    if not p491[7913] then

      val392 = -35250
        + ((p489.N[1] - p491[14309] - p489.N[6] ~= p490 and p491[14309] or p491[28978])
              == p489.N[5]
            and p491[23391]
          or p489.N[1])

      p491[7913] = val392
    else
      val392 = p489:c(p490, p491)
    end

    return val392
  end, f_ = function(p493, p494, p495, p496) return 83, (p495[1][31]()) end, J_ = function(p497, p498, p499, p500)
    p499[35] = nil
    local val393

    if not not p498[31830] then
      val393 = p498[31830]
    else
      p498[1981] = -2038302543
        + (p497.xb(p497.N[6] - p497.N[5] + p498[19987] + p497.N[8], p498[5165]))

      p498[9720] = 52
        + (((p497.eb(p497.lb(p498[28978], p498[3718], p498[25455]), p498[9959])) >= p497.N[2]
              and p498[19230]
            or p498[31093])
          - p498[25455])

      val393 = -70
        + ((p497.gb((p497.ob(p498[3718], p498[19230], p497.N[2])) - p498[14850], p498[5165]))
          + p498[23348])

      p498[31830] = val393
    end

    return val393
  end, u = bit32.countlz, K = function(p501, p502, p503)
    p503[9] = nil
    p503[10] = nil
    p503[11] = nil

    return 53
  end, l = function(p504, p505, p506, p507)
local val394

    if not (p505 < 66) then

      return 56148, (p504:g(p506, p505, p507))
    else
      p507[8] = {}

      if not p506[19715] then

        val394 = 11
          + ((p504.Qb(p504.N[7], p506[14309])) + p504.N[7] + p504.N[4] == p506[23391]
              and p506[11771]
            or p505)

        p506[19715] = val394
      else
        val394 = p504:f(p505, p506)
      end

      return 56148, val394
    end
  end, W = function(p508, p509, p510, p511, p512)
    if p512 == 115 then
      p511[1][4] = p510
      return 262, 54
    else
      if p512 == 54 then
        return { p509 }, p512
      else
        return nil, p512
      end
    end
  end, a = function(p513, p514, p515, p516)
local val395

    if p516 ~= 39 then
      p515[23] = function(p517)
        local val396 = { p515 }
        local val397 = -44

        while true do
          val397 = 44 + val397

          if not (val397 <= 44) then
            break
          end

          local val398 = val397

          if val398 > 0 then
            val396[1][4] = 1
          else
            if not (val398 < 44) then
            else
              val396[1][21] = p517
            end
          end
        end

        return
      end

      return 38691, p516
    else
      p515[22] = 9007199254741000

      if not not p514[31093] then
        val395 = p514[31093]
      else

        val395 = 137
          + ((p513.Yb((p513.Qb(p514[19230], p514[9959])) >= p513.N[2] and p514[5165] or p513.N[3]))
            - p514[2048])

        p514[31093] = val395
      end

      return nil, val395
    end
  end, Yb = bit32.countrz, N = {
    35316, 467907314, 2944650677, 3563200040, 1313378373, 2609970067, 1162522729, 2765485028, 300384244, }, o = function(p518, p519, p520)
    local val399 = -4294967250 + (p518.cb(p518.N[7] - p518.N[7] - p519[7913] + p519[28978]))
    p519[5165] = val399
    return val399
  end, E_ = function(p521, p522, p523) return p522[25455] end, K_ = function(p524, p525, p526, p527, p528) return (p528[1][31]()), p526 % 8 end, C_ = function(p529, p530, p531, p532, p533, p534, p535)
    local val400 = p530
    local t = p531

    if not (p532 <= 267) then
      val400 = p529:S_(p535, p533, p532, t, p534, val400)
    else
      t = p529:t_(p534, p535, t)
    end

    return val400, t
  end, }

return val:pb()(...)
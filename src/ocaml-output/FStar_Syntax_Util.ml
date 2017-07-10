open Prims
let qual_id: FStar_Ident.lident -> FStar_Ident.ident -> FStar_Ident.lident =
  fun lid  ->
    fun id  ->
      let uu____9 =
        FStar_Ident.lid_of_ids
          (FStar_List.append lid.FStar_Ident.ns [lid.FStar_Ident.ident; id]) in
      FStar_Ident.set_lid_range uu____9 id.FStar_Ident.idRange
let mk_discriminator: FStar_Ident.lident -> FStar_Ident.lident =
  fun lid  ->
    FStar_Ident.lid_of_ids
      (FStar_List.append lid.FStar_Ident.ns
         [FStar_Ident.mk_ident
            ((Prims.strcat FStar_Ident.reserved_prefix
                (Prims.strcat "is_"
                   (lid.FStar_Ident.ident).FStar_Ident.idText)),
              ((lid.FStar_Ident.ident).FStar_Ident.idRange))])
let is_name: FStar_Ident.lident -> Prims.bool =
  fun lid  ->
    let c =
      FStar_Util.char_at (lid.FStar_Ident.ident).FStar_Ident.idText
        (Prims.parse_int "0") in
    FStar_Util.is_upper c
let arg_of_non_null_binder uu____31 =
  match uu____31 with
  | (b,imp) ->
      let uu____36 = FStar_Syntax_Syntax.bv_to_name b in (uu____36, imp)
let args_of_non_null_binders:
  FStar_Syntax_Syntax.binders ->
    (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun binders  ->
    FStar_All.pipe_right binders
      (FStar_List.collect
         (fun b  ->
            let uu____52 = FStar_Syntax_Syntax.is_null_binder b in
            if uu____52
            then []
            else (let uu____59 = arg_of_non_null_binder b in [uu____59])))
let args_of_binders:
  FStar_Syntax_Syntax.binders ->
    ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
       FStar_Pervasives_Native.tuple2 Prims.list,(FStar_Syntax_Syntax.term,
                                                   FStar_Syntax_Syntax.aqual)
                                                   FStar_Pervasives_Native.tuple2
                                                   Prims.list)
      FStar_Pervasives_Native.tuple2
  =
  fun binders  ->
    let uu____74 =
      FStar_All.pipe_right binders
        (FStar_List.map
           (fun b  ->
              let uu____100 = FStar_Syntax_Syntax.is_null_binder b in
              if uu____100
              then
                let b1 =
                  let uu____110 =
                    FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                      (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort in
                  (uu____110, (FStar_Pervasives_Native.snd b)) in
                let uu____111 = arg_of_non_null_binder b1 in (b1, uu____111)
              else
                (let uu____119 = arg_of_non_null_binder b in (b, uu____119)))) in
    FStar_All.pipe_right uu____74 FStar_List.unzip
let name_binders:
  FStar_Syntax_Syntax.binder Prims.list ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun binders  ->
    FStar_All.pipe_right binders
      (FStar_List.mapi
         (fun i  ->
            fun b  ->
              let uu____168 = FStar_Syntax_Syntax.is_null_binder b in
              if uu____168
              then
                let uu____171 = b in
                match uu____171 with
                | (a,imp) ->
                    let b1 =
                      let uu____177 =
                        let uu____178 = FStar_Util.string_of_int i in
                        Prims.strcat "_" uu____178 in
                      FStar_Ident.id_of_text uu____177 in
                    let b2 =
                      {
                        FStar_Syntax_Syntax.ppname = b1;
                        FStar_Syntax_Syntax.index = (Prims.parse_int "0");
                        FStar_Syntax_Syntax.sort =
                          (a.FStar_Syntax_Syntax.sort)
                      } in
                    (b2, imp)
              else b))
let name_function_binders t =
  match t.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Tm_arrow (binders,comp) ->
      let uu____208 =
        let uu____211 =
          let uu____212 =
            let uu____220 = name_binders binders in (uu____220, comp) in
          FStar_Syntax_Syntax.Tm_arrow uu____212 in
        FStar_Syntax_Syntax.mk uu____211 in
      uu____208 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos
  | uu____237 -> t
let null_binders_of_tks:
  (FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun tks  ->
    FStar_All.pipe_right tks
      (FStar_List.map
         (fun uu____262  ->
            match uu____262 with
            | (t,imp) ->
                let uu____269 =
                  let uu____270 = FStar_Syntax_Syntax.null_binder t in
                  FStar_All.pipe_left FStar_Pervasives_Native.fst uu____270 in
                (uu____269, imp)))
let binders_of_tks:
  (FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun tks  ->
    FStar_All.pipe_right tks
      (FStar_List.map
         (fun uu____301  ->
            match uu____301 with
            | (t,imp) ->
                let uu____314 =
                  FStar_Syntax_Syntax.new_bv
                    (FStar_Pervasives_Native.Some (t.FStar_Syntax_Syntax.pos))
                    t in
                (uu____314, imp)))
let binders_of_freevars:
  FStar_Syntax_Syntax.bv FStar_Util.set ->
    FStar_Syntax_Syntax.binder Prims.list
  =
  fun fvs  ->
    let uu____322 = FStar_Util.set_elements fvs in
    FStar_All.pipe_right uu____322
      (FStar_List.map FStar_Syntax_Syntax.mk_binder)
let mk_subst s = [s]
let subst_of_list:
  FStar_Syntax_Syntax.binders ->
    FStar_Syntax_Syntax.args -> FStar_Syntax_Syntax.subst_t
  =
  fun formals  ->
    fun actuals  ->
      if (FStar_List.length formals) = (FStar_List.length actuals)
      then
        FStar_List.fold_right2
          (fun f  ->
             fun a  ->
               fun out  ->
                 (FStar_Syntax_Syntax.NT
                    ((FStar_Pervasives_Native.fst f),
                      (FStar_Pervasives_Native.fst a)))
                 :: out) formals actuals []
      else failwith "Ill-formed substitution"
let rename_binders:
  FStar_Syntax_Syntax.binders ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.subst_t
  =
  fun replace_xs  ->
    fun with_ys  ->
      if (FStar_List.length replace_xs) = (FStar_List.length with_ys)
      then
        FStar_List.map2
          (fun uu____414  ->
             fun uu____415  ->
               match (uu____414, uu____415) with
               | ((x,uu____425),(y,uu____427)) ->
                   let uu____432 =
                     let uu____437 = FStar_Syntax_Syntax.bv_to_name y in
                     (x, uu____437) in
                   FStar_Syntax_Syntax.NT uu____432) replace_xs with_ys
      else failwith "Ill-formed substitution"
let rec unmeta: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun e  ->
    let e1 = FStar_Syntax_Subst.compress e in
    match e1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_meta (e2,uu____445) -> unmeta e2
    | FStar_Syntax_Syntax.Tm_ascribed (e2,uu____451,uu____452) -> unmeta e2
    | uu____481 -> e1
let rec univ_kernel:
  FStar_Syntax_Syntax.universe ->
    (FStar_Syntax_Syntax.universe,Prims.int) FStar_Pervasives_Native.tuple2
  =
  fun u  ->
    match u with
    | FStar_Syntax_Syntax.U_unknown  -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_name uu____490 -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_unif uu____491 -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_zero  -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_succ u1 ->
        let uu____497 = univ_kernel u1 in
        (match uu____497 with | (k,n1) -> (k, (n1 + (Prims.parse_int "1"))))
    | FStar_Syntax_Syntax.U_max uu____504 ->
        failwith "Imposible: univ_kernel (U_max _)"
    | FStar_Syntax_Syntax.U_bvar uu____508 ->
        failwith "Imposible: univ_kernel (U_bvar _)"
let constant_univ_as_nat: FStar_Syntax_Syntax.universe -> Prims.int =
  fun u  ->
    let uu____515 = univ_kernel u in FStar_Pervasives_Native.snd uu____515
let rec compare_univs:
  FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe -> Prims.int =
  fun u1  ->
    fun u2  ->
      match (u1, u2) with
      | (FStar_Syntax_Syntax.U_bvar uu____526,uu____527) ->
          failwith "Impossible: compare_univs"
      | (uu____528,FStar_Syntax_Syntax.U_bvar uu____529) ->
          failwith "Impossible: compare_univs"
      | (FStar_Syntax_Syntax.U_unknown ,FStar_Syntax_Syntax.U_unknown ) ->
          Prims.parse_int "0"
      | (FStar_Syntax_Syntax.U_unknown ,uu____530) -> - (Prims.parse_int "1")
      | (uu____531,FStar_Syntax_Syntax.U_unknown ) -> Prims.parse_int "1"
      | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_zero ) ->
          Prims.parse_int "0"
      | (FStar_Syntax_Syntax.U_zero ,uu____532) -> - (Prims.parse_int "1")
      | (uu____533,FStar_Syntax_Syntax.U_zero ) -> Prims.parse_int "1"
      | (FStar_Syntax_Syntax.U_name u11,FStar_Syntax_Syntax.U_name u21) ->
          FStar_String.compare u11.FStar_Ident.idText u21.FStar_Ident.idText
      | (FStar_Syntax_Syntax.U_name uu____536,FStar_Syntax_Syntax.U_unif
         uu____537) -> - (Prims.parse_int "1")
      | (FStar_Syntax_Syntax.U_unif uu____542,FStar_Syntax_Syntax.U_name
         uu____543) -> Prims.parse_int "1"
      | (FStar_Syntax_Syntax.U_unif u11,FStar_Syntax_Syntax.U_unif u21) ->
          let uu____558 = FStar_Syntax_Unionfind.univ_uvar_id u11 in
          let uu____559 = FStar_Syntax_Unionfind.univ_uvar_id u21 in
          uu____558 - uu____559
      | (FStar_Syntax_Syntax.U_max us1,FStar_Syntax_Syntax.U_max us2) ->
          let n1 = FStar_List.length us1 in
          let n2 = FStar_List.length us2 in
          if n1 <> n2
          then n1 - n2
          else
            (let copt =
               let uu____591 = FStar_List.zip us1 us2 in
               FStar_Util.find_map uu____591
                 (fun uu____601  ->
                    match uu____601 with
                    | (u11,u21) ->
                        let c = compare_univs u11 u21 in
                        if c <> (Prims.parse_int "0")
                        then FStar_Pervasives_Native.Some c
                        else FStar_Pervasives_Native.None) in
             match copt with
             | FStar_Pervasives_Native.None  -> Prims.parse_int "0"
             | FStar_Pervasives_Native.Some c -> c)
      | (FStar_Syntax_Syntax.U_max uu____611,uu____612) ->
          - (Prims.parse_int "1")
      | (uu____614,FStar_Syntax_Syntax.U_max uu____615) ->
          Prims.parse_int "1"
      | uu____617 ->
          let uu____620 = univ_kernel u1 in
          (match uu____620 with
           | (k1,n1) ->
               let uu____625 = univ_kernel u2 in
               (match uu____625 with
                | (k2,n2) ->
                    let r = compare_univs k1 k2 in
                    if r = (Prims.parse_int "0") then n1 - n2 else r))
let eq_univs:
  FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe -> Prims.bool
  =
  fun u1  ->
    fun u2  ->
      let uu____640 = compare_univs u1 u2 in
      uu____640 = (Prims.parse_int "0")
let ml_comp:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax ->
    FStar_Range.range -> FStar_Syntax_Syntax.comp
  =
  fun t  ->
    fun r  ->
      FStar_Syntax_Syntax.mk_Comp
        {
          FStar_Syntax_Syntax.comp_univs = [FStar_Syntax_Syntax.U_zero];
          FStar_Syntax_Syntax.effect_name =
            (FStar_Ident.set_lid_range FStar_Parser_Const.effect_ML_lid r);
          FStar_Syntax_Syntax.result_typ = t;
          FStar_Syntax_Syntax.effect_args = [];
          FStar_Syntax_Syntax.flags = [FStar_Syntax_Syntax.MLEFFECT]
        }
let comp_effect_name c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Comp c1 -> c1.FStar_Syntax_Syntax.effect_name
  | FStar_Syntax_Syntax.Total uu____671 -> FStar_Parser_Const.effect_Tot_lid
  | FStar_Syntax_Syntax.GTotal uu____677 ->
      FStar_Parser_Const.effect_GTot_lid
let comp_flags c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total uu____697 -> [FStar_Syntax_Syntax.TOTAL]
  | FStar_Syntax_Syntax.GTotal uu____703 -> [FStar_Syntax_Syntax.SOMETRIVIAL]
  | FStar_Syntax_Syntax.Comp ct -> ct.FStar_Syntax_Syntax.flags
let comp_set_flags:
  FStar_Syntax_Syntax.comp ->
    FStar_Syntax_Syntax.cflags Prims.list ->
      (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax
  =
  fun c  ->
    fun f  ->
      let comp_to_comp_typ c1 =
        match c1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Comp c2 -> c2
        | FStar_Syntax_Syntax.Total (t,u_opt) ->
            let uu____735 =
              let uu____736 = FStar_Util.map_opt u_opt (fun x  -> [x]) in
              FStar_Util.dflt [] uu____736 in
            {
              FStar_Syntax_Syntax.comp_univs = uu____735;
              FStar_Syntax_Syntax.effect_name = (comp_effect_name c1);
              FStar_Syntax_Syntax.result_typ = t;
              FStar_Syntax_Syntax.effect_args = [];
              FStar_Syntax_Syntax.flags = (comp_flags c1)
            }
        | FStar_Syntax_Syntax.GTotal (t,u_opt) ->
            let uu____755 =
              let uu____756 = FStar_Util.map_opt u_opt (fun x  -> [x]) in
              FStar_Util.dflt [] uu____756 in
            {
              FStar_Syntax_Syntax.comp_univs = uu____755;
              FStar_Syntax_Syntax.effect_name = (comp_effect_name c1);
              FStar_Syntax_Syntax.result_typ = t;
              FStar_Syntax_Syntax.effect_args = [];
              FStar_Syntax_Syntax.flags = (comp_flags c1)
            } in
      let uu___170_767 = c in
      let uu____768 =
        let uu____769 =
          let uu___171_770 = comp_to_comp_typ c in
          {
            FStar_Syntax_Syntax.comp_univs =
              (uu___171_770.FStar_Syntax_Syntax.comp_univs);
            FStar_Syntax_Syntax.effect_name =
              (uu___171_770.FStar_Syntax_Syntax.effect_name);
            FStar_Syntax_Syntax.result_typ =
              (uu___171_770.FStar_Syntax_Syntax.result_typ);
            FStar_Syntax_Syntax.effect_args =
              (uu___171_770.FStar_Syntax_Syntax.effect_args);
            FStar_Syntax_Syntax.flags = f
          } in
        FStar_Syntax_Syntax.Comp uu____769 in
      {
        FStar_Syntax_Syntax.n = uu____768;
        FStar_Syntax_Syntax.tk = (uu___170_767.FStar_Syntax_Syntax.tk);
        FStar_Syntax_Syntax.pos = (uu___170_767.FStar_Syntax_Syntax.pos)
      }
let comp_to_comp_typ:
  FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp_typ =
  fun c  ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Comp c1 -> c1
    | FStar_Syntax_Syntax.Total (t,FStar_Pervasives_Native.Some u) ->
        {
          FStar_Syntax_Syntax.comp_univs = [u];
          FStar_Syntax_Syntax.effect_name = (comp_effect_name c);
          FStar_Syntax_Syntax.result_typ = t;
          FStar_Syntax_Syntax.effect_args = [];
          FStar_Syntax_Syntax.flags = (comp_flags c)
        }
    | FStar_Syntax_Syntax.GTotal (t,FStar_Pervasives_Native.Some u) ->
        {
          FStar_Syntax_Syntax.comp_univs = [u];
          FStar_Syntax_Syntax.effect_name = (comp_effect_name c);
          FStar_Syntax_Syntax.result_typ = t;
          FStar_Syntax_Syntax.effect_args = [];
          FStar_Syntax_Syntax.flags = (comp_flags c)
        }
    | uu____800 ->
        failwith "Assertion failed: Computation type without universe"
let is_named_tot c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Comp c1 ->
      FStar_Ident.lid_equals c1.FStar_Syntax_Syntax.effect_name
        FStar_Parser_Const.effect_Tot_lid
  | FStar_Syntax_Syntax.Total uu____815 -> true
  | FStar_Syntax_Syntax.GTotal uu____821 -> false
let is_total_comp c =
  (FStar_Ident.lid_equals (comp_effect_name c)
     FStar_Parser_Const.effect_Tot_lid)
    ||
    (FStar_All.pipe_right (comp_flags c)
       (FStar_Util.for_some
          (fun uu___158_842  ->
             match uu___158_842 with
             | FStar_Syntax_Syntax.TOTAL  -> true
             | FStar_Syntax_Syntax.RETURN  -> true
             | uu____843 -> false)))
let is_total_lcomp: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun c  ->
    (FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name
       FStar_Parser_Const.effect_Tot_lid)
      ||
      (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags
         (FStar_Util.for_some
            (fun uu___159_850  ->
               match uu___159_850 with
               | FStar_Syntax_Syntax.TOTAL  -> true
               | FStar_Syntax_Syntax.RETURN  -> true
               | uu____851 -> false)))
let is_tot_or_gtot_lcomp: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun c  ->
    ((FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name
        FStar_Parser_Const.effect_Tot_lid)
       ||
       (FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name
          FStar_Parser_Const.effect_GTot_lid))
      ||
      (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags
         (FStar_Util.for_some
            (fun uu___160_858  ->
               match uu___160_858 with
               | FStar_Syntax_Syntax.TOTAL  -> true
               | FStar_Syntax_Syntax.RETURN  -> true
               | uu____859 -> false)))
let is_partial_return c =
  FStar_All.pipe_right (comp_flags c)
    (FStar_Util.for_some
       (fun uu___161_875  ->
          match uu___161_875 with
          | FStar_Syntax_Syntax.RETURN  -> true
          | FStar_Syntax_Syntax.PARTIAL_RETURN  -> true
          | uu____876 -> false))
let is_lcomp_partial_return: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun c  ->
    FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags
      (FStar_Util.for_some
         (fun uu___162_883  ->
            match uu___162_883 with
            | FStar_Syntax_Syntax.RETURN  -> true
            | FStar_Syntax_Syntax.PARTIAL_RETURN  -> true
            | uu____884 -> false))
let is_tot_or_gtot_comp c =
  (is_total_comp c) ||
    (FStar_Ident.lid_equals FStar_Parser_Const.effect_GTot_lid
       (comp_effect_name c))
let is_pure_effect: FStar_Ident.lident -> Prims.bool =
  fun l  ->
    ((FStar_Ident.lid_equals l FStar_Parser_Const.effect_Tot_lid) ||
       (FStar_Ident.lid_equals l FStar_Parser_Const.effect_PURE_lid))
      || (FStar_Ident.lid_equals l FStar_Parser_Const.effect_Pure_lid)
let is_pure_comp c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total uu____915 -> true
  | FStar_Syntax_Syntax.GTotal uu____921 -> false
  | FStar_Syntax_Syntax.Comp ct ->
      ((is_total_comp c) ||
         (is_pure_effect ct.FStar_Syntax_Syntax.effect_name))
        ||
        (FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags
           (FStar_Util.for_some
              (fun uu___163_930  ->
                 match uu___163_930 with
                 | FStar_Syntax_Syntax.LEMMA  -> true
                 | uu____931 -> false)))
let is_ghost_effect: FStar_Ident.lident -> Prims.bool =
  fun l  ->
    ((FStar_Ident.lid_equals FStar_Parser_Const.effect_GTot_lid l) ||
       (FStar_Ident.lid_equals FStar_Parser_Const.effect_GHOST_lid l))
      || (FStar_Ident.lid_equals FStar_Parser_Const.effect_Ghost_lid l)
let is_pure_or_ghost_comp c =
  (is_pure_comp c) || (is_ghost_effect (comp_effect_name c))
let is_pure_lcomp: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun lc  ->
    ((is_total_lcomp lc) || (is_pure_effect lc.FStar_Syntax_Syntax.eff_name))
      ||
      (FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags
         (FStar_Util.for_some
            (fun uu___164_955  ->
               match uu___164_955 with
               | FStar_Syntax_Syntax.LEMMA  -> true
               | uu____956 -> false)))
let is_pure_or_ghost_lcomp: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun lc  ->
    (is_pure_lcomp lc) || (is_ghost_effect lc.FStar_Syntax_Syntax.eff_name)
let is_pure_or_ghost_function: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____965 =
      let uu____966 = FStar_Syntax_Subst.compress t in
      uu____966.FStar_Syntax_Syntax.n in
    match uu____965 with
    | FStar_Syntax_Syntax.Tm_arrow (uu____969,c) -> is_pure_or_ghost_comp c
    | uu____981 -> true
let is_lemma_comp c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Comp ct ->
      FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
        FStar_Parser_Const.effect_Lemma_lid
  | uu____996 -> false
let is_lemma: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1001 =
      let uu____1002 = FStar_Syntax_Subst.compress t in
      uu____1002.FStar_Syntax_Syntax.n in
    match uu____1001 with
    | FStar_Syntax_Syntax.Tm_arrow (uu____1005,c) -> is_lemma_comp c
    | uu____1017 -> false
let head_and_args:
  FStar_Syntax_Syntax.term ->
    ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
       FStar_Syntax_Syntax.syntax,((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
                                     FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
                                    FStar_Pervasives_Native.tuple2 Prims.list)
      FStar_Pervasives_Native.tuple2
  =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_app (head1,args) -> (head1, args)
    | uu____1064 -> (t1, [])
let rec head_and_args':
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.term,((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
                                 FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
                                FStar_Pervasives_Native.tuple2 Prims.list)
      FStar_Pervasives_Native.tuple2
  =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_app (head1,args) ->
        let uu____1109 = head_and_args' head1 in
        (match uu____1109 with
         | (head2,args') -> (head2, (FStar_List.append args' args)))
    | uu____1145 -> (t1, [])
let un_uinst: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_uinst (t2,uu____1161) ->
        FStar_Syntax_Subst.compress t2
    | uu____1166 -> t1
let is_smt_lemma: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1171 =
      let uu____1172 = FStar_Syntax_Subst.compress t in
      uu____1172.FStar_Syntax_Syntax.n in
    match uu____1171 with
    | FStar_Syntax_Syntax.Tm_arrow (uu____1175,c) ->
        (match c.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.Comp ct when
             FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
               FStar_Parser_Const.effect_Lemma_lid
             ->
             (match ct.FStar_Syntax_Syntax.effect_args with
              | _req::_ens::(pats,uu____1191)::uu____1192 ->
                  let pats' = unmeta pats in
                  let uu____1223 = head_and_args pats' in
                  (match uu____1223 with
                   | (head1,uu____1234) ->
                       let uu____1249 =
                         let uu____1250 = un_uinst head1 in
                         uu____1250.FStar_Syntax_Syntax.n in
                       (match uu____1249 with
                        | FStar_Syntax_Syntax.Tm_fvar fv ->
                            FStar_Syntax_Syntax.fv_eq_lid fv
                              FStar_Parser_Const.cons_lid
                        | uu____1254 -> false))
              | uu____1255 -> false)
         | uu____1261 -> false)
    | uu____1262 -> false
let is_ml_comp c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Comp c1 ->
      (FStar_Ident.lid_equals c1.FStar_Syntax_Syntax.effect_name
         FStar_Parser_Const.effect_ML_lid)
        ||
        (FStar_All.pipe_right c1.FStar_Syntax_Syntax.flags
           (FStar_Util.for_some
              (fun uu___165_1279  ->
                 match uu___165_1279 with
                 | FStar_Syntax_Syntax.MLEFFECT  -> true
                 | uu____1280 -> false)))
  | uu____1281 -> false
let comp_result c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total (t,uu____1298) -> t
  | FStar_Syntax_Syntax.GTotal (t,uu____1306) -> t
  | FStar_Syntax_Syntax.Comp ct -> ct.FStar_Syntax_Syntax.result_typ
let set_result_typ c t =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total uu____1333 -> FStar_Syntax_Syntax.mk_Total t
  | FStar_Syntax_Syntax.GTotal uu____1339 -> FStar_Syntax_Syntax.mk_GTotal t
  | FStar_Syntax_Syntax.Comp ct ->
      FStar_Syntax_Syntax.mk_Comp
        (let uu___172_1348 = ct in
         {
           FStar_Syntax_Syntax.comp_univs =
             (uu___172_1348.FStar_Syntax_Syntax.comp_univs);
           FStar_Syntax_Syntax.effect_name =
             (uu___172_1348.FStar_Syntax_Syntax.effect_name);
           FStar_Syntax_Syntax.result_typ = t;
           FStar_Syntax_Syntax.effect_args =
             (uu___172_1348.FStar_Syntax_Syntax.effect_args);
           FStar_Syntax_Syntax.flags =
             (uu___172_1348.FStar_Syntax_Syntax.flags)
         })
let is_trivial_wp c =
  FStar_All.pipe_right (comp_flags c)
    (FStar_Util.for_some
       (fun uu___166_1364  ->
          match uu___166_1364 with
          | FStar_Syntax_Syntax.TOTAL  -> true
          | FStar_Syntax_Syntax.RETURN  -> true
          | uu____1365 -> false))
let primops: FStar_Ident.lident Prims.list =
  [FStar_Parser_Const.op_Eq;
  FStar_Parser_Const.op_notEq;
  FStar_Parser_Const.op_LT;
  FStar_Parser_Const.op_LTE;
  FStar_Parser_Const.op_GT;
  FStar_Parser_Const.op_GTE;
  FStar_Parser_Const.op_Subtraction;
  FStar_Parser_Const.op_Minus;
  FStar_Parser_Const.op_Addition;
  FStar_Parser_Const.op_Multiply;
  FStar_Parser_Const.op_Division;
  FStar_Parser_Const.op_Modulus;
  FStar_Parser_Const.op_And;
  FStar_Parser_Const.op_Or;
  FStar_Parser_Const.op_Negation]
let is_primop_lid: FStar_Ident.lident -> Prims.bool =
  fun l  ->
    FStar_All.pipe_right primops
      (FStar_Util.for_some (FStar_Ident.lid_equals l))
let is_primop f =
  match f.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Tm_fvar fv ->
      is_primop_lid (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
  | uu____1386 -> false
let rec unascribe: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun e  ->
    let e1 = FStar_Syntax_Subst.compress e in
    match e1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_ascribed (e2,uu____1393,uu____1394) ->
        unascribe e2
    | uu____1423 -> e1
let rec ascribe t k =
  match t.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Tm_ascribed (t',uu____1468,uu____1469) ->
      ascribe t' k
  | uu____1498 ->
      FStar_Syntax_Syntax.mk
        (FStar_Syntax_Syntax.Tm_ascribed (t, k, FStar_Pervasives_Native.None))
        FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos
type eq_result =
  | Equal
  | NotEqual
  | Unknown
let uu___is_Equal: eq_result -> Prims.bool =
  fun projectee  ->
    match projectee with | Equal  -> true | uu____1521 -> false
let uu___is_NotEqual: eq_result -> Prims.bool =
  fun projectee  ->
    match projectee with | NotEqual  -> true | uu____1526 -> false
let uu___is_Unknown: eq_result -> Prims.bool =
  fun projectee  ->
    match projectee with | Unknown  -> true | uu____1531 -> false
let rec eq_tm:
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term -> eq_result =
  fun t1  ->
    fun t2  ->
      let canon_app t =
        let uu____1552 =
          let uu____1560 = unascribe t in head_and_args' uu____1560 in
        match uu____1552 with
        | (hd1,args) ->
            FStar_Syntax_Syntax.mk_Tm_app hd1 args
              FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos in
      let t11 = canon_app t1 in
      let t21 = canon_app t2 in
      let equal_if uu___167_1586 = if uu___167_1586 then Equal else Unknown in
      let equal_iff uu___168_1591 = if uu___168_1591 then Equal else NotEqual in
      let eq_and f g = match f with | Equal  -> g () | uu____1605 -> Unknown in
      let eq_inj f g =
        match (f, g) with
        | (Equal ,Equal ) -> Equal
        | (NotEqual ,uu____1613) -> NotEqual
        | (uu____1614,NotEqual ) -> NotEqual
        | (Unknown ,uu____1615) -> Unknown
        | (uu____1616,Unknown ) -> Unknown in
      match ((t11.FStar_Syntax_Syntax.n), (t21.FStar_Syntax_Syntax.n)) with
      | (FStar_Syntax_Syntax.Tm_name a,FStar_Syntax_Syntax.Tm_name b) ->
          equal_if (FStar_Syntax_Syntax.bv_eq a b)
      | (FStar_Syntax_Syntax.Tm_fvar f,FStar_Syntax_Syntax.Tm_fvar g) ->
          let uu____1621 = FStar_Syntax_Syntax.fv_eq f g in
          equal_if uu____1621
      | (FStar_Syntax_Syntax.Tm_uinst (f,us),FStar_Syntax_Syntax.Tm_uinst
         (g,vs)) ->
          let uu____1634 = eq_tm f g in
          eq_and uu____1634
            (fun uu____1637  ->
               let uu____1638 = eq_univs_list us vs in equal_if uu____1638)
      | (FStar_Syntax_Syntax.Tm_constant c,FStar_Syntax_Syntax.Tm_constant d)
          ->
          let uu____1641 = FStar_Const.eq_const c d in equal_iff uu____1641
      | (FStar_Syntax_Syntax.Tm_uvar
         (u1,uu____1643),FStar_Syntax_Syntax.Tm_uvar (u2,uu____1645)) ->
          let uu____1678 = FStar_Syntax_Unionfind.equiv u1 u2 in
          equal_if uu____1678
      | (FStar_Syntax_Syntax.Tm_app (h1,args1),FStar_Syntax_Syntax.Tm_app
         (h2,args2)) ->
          let uu____1711 =
            let uu____1714 =
              let uu____1715 = un_uinst h1 in
              uu____1715.FStar_Syntax_Syntax.n in
            let uu____1718 =
              let uu____1719 = un_uinst h2 in
              uu____1719.FStar_Syntax_Syntax.n in
            (uu____1714, uu____1718) in
          (match uu____1711 with
           | (FStar_Syntax_Syntax.Tm_fvar f1,FStar_Syntax_Syntax.Tm_fvar f2)
               when
               (f1.FStar_Syntax_Syntax.fv_qual =
                  (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor))
                 &&
                 (f2.FStar_Syntax_Syntax.fv_qual =
                    (FStar_Pervasives_Native.Some
                       FStar_Syntax_Syntax.Data_ctor))
               ->
               let uu____1726 = FStar_Syntax_Syntax.fv_eq f1 f2 in
               if uu____1726
               then
                 let uu____1729 = FStar_List.zip args1 args2 in
                 FStar_All.pipe_left
                   (FStar_List.fold_left
                      (fun acc  ->
                         fun uu____1767  ->
                           match uu____1767 with
                           | ((a1,q1),(a2,q2)) ->
                               let uu____1784 = eq_tm a1 a2 in
                               eq_inj acc uu____1784) Equal) uu____1729
               else NotEqual
           | uu____1786 ->
               let uu____1789 = eq_tm h1 h2 in
               eq_and uu____1789 (fun uu____1791  -> eq_args args1 args2))
      | (FStar_Syntax_Syntax.Tm_type u,FStar_Syntax_Syntax.Tm_type v1) ->
          let uu____1794 = eq_univs u v1 in equal_if uu____1794
      | (FStar_Syntax_Syntax.Tm_meta (t12,uu____1796),uu____1797) ->
          eq_tm t12 t21
      | (uu____1802,FStar_Syntax_Syntax.Tm_meta (t22,uu____1804)) ->
          eq_tm t11 t22
      | uu____1809 -> Unknown
and eq_args:
  FStar_Syntax_Syntax.args -> FStar_Syntax_Syntax.args -> eq_result =
  fun a1  ->
    fun a2  ->
      match (a1, a2) with
      | ([],[]) -> Equal
      | ((a,uu____1833)::a11,(b,uu____1836)::b1) ->
          let uu____1874 = eq_tm a b in
          (match uu____1874 with
           | Equal  -> eq_args a11 b1
           | uu____1875 -> Unknown)
      | uu____1876 -> Unknown
and eq_univs_list:
  FStar_Syntax_Syntax.universes ->
    FStar_Syntax_Syntax.universes -> Prims.bool
  =
  fun us  ->
    fun vs  ->
      ((FStar_List.length us) = (FStar_List.length vs)) &&
        (FStar_List.forall2 eq_univs us vs)
let rec unrefine: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_refine (x,uu____1895) ->
        unrefine x.FStar_Syntax_Syntax.sort
    | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____1901,uu____1902) ->
        unrefine t2
    | uu____1931 -> t1
let rec is_unit: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1936 =
      let uu____1937 = unrefine t in uu____1937.FStar_Syntax_Syntax.n in
    match uu____1936 with
    | FStar_Syntax_Syntax.Tm_type uu____1940 -> true
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) ||
          (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid)
    | FStar_Syntax_Syntax.Tm_uinst (t1,uu____1943) -> is_unit t1
    | uu____1948 -> false
let rec non_informative: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1953 =
      let uu____1954 = unrefine t in uu____1954.FStar_Syntax_Syntax.n in
    match uu____1953 with
    | FStar_Syntax_Syntax.Tm_type uu____1957 -> true
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        ((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) ||
           (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid))
          || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.erased_lid)
    | FStar_Syntax_Syntax.Tm_app (head1,uu____1960) -> non_informative head1
    | FStar_Syntax_Syntax.Tm_uinst (t1,uu____1976) -> non_informative t1
    | FStar_Syntax_Syntax.Tm_arrow (uu____1981,c) ->
        (is_tot_or_gtot_comp c) && (non_informative (comp_result c))
    | uu____1993 -> false
let is_fun: FStar_Syntax_Syntax.term -> Prims.bool =
  fun e  ->
    let uu____1998 =
      let uu____1999 = FStar_Syntax_Subst.compress e in
      uu____1999.FStar_Syntax_Syntax.n in
    match uu____1998 with
    | FStar_Syntax_Syntax.Tm_abs uu____2002 -> true
    | uu____2012 -> false
let is_function_typ: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____2017 =
      let uu____2018 = FStar_Syntax_Subst.compress t in
      uu____2018.FStar_Syntax_Syntax.n in
    match uu____2017 with
    | FStar_Syntax_Syntax.Tm_arrow uu____2021 -> true
    | uu____2029 -> false
let rec pre_typ: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_refine (x,uu____2036) ->
        pre_typ x.FStar_Syntax_Syntax.sort
    | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____2042,uu____2043) ->
        pre_typ t2
    | uu____2072 -> t1
let destruct:
  FStar_Syntax_Syntax.term ->
    FStar_Ident.lident ->
      ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
         FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
        FStar_Pervasives_Native.tuple2 Prims.list
        FStar_Pervasives_Native.option
  =
  fun typ  ->
    fun lid  ->
      let typ1 = FStar_Syntax_Subst.compress typ in
      let uu____2088 =
        let uu____2089 = un_uinst typ1 in uu____2089.FStar_Syntax_Syntax.n in
      match uu____2088 with
      | FStar_Syntax_Syntax.Tm_app (head1,args) ->
          let head2 = un_uinst head1 in
          (match head2.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_fvar tc when
               FStar_Syntax_Syntax.fv_eq_lid tc lid ->
               FStar_Pervasives_Native.Some args
           | uu____2127 -> FStar_Pervasives_Native.None)
      | FStar_Syntax_Syntax.Tm_fvar tc when
          FStar_Syntax_Syntax.fv_eq_lid tc lid ->
          FStar_Pervasives_Native.Some []
      | uu____2143 -> FStar_Pervasives_Native.None
let lids_of_sigelt:
  FStar_Syntax_Syntax.sigelt -> FStar_Ident.lident Prims.list =
  fun se  ->
    match se.FStar_Syntax_Syntax.sigel with
    | FStar_Syntax_Syntax.Sig_let (uu____2155,lids) -> lids
    | FStar_Syntax_Syntax.Sig_bundle (uu____2159,lids) -> lids
    | FStar_Syntax_Syntax.Sig_inductive_typ
        (lid,uu____2166,uu____2167,uu____2168,uu____2169,uu____2170) -> 
        [lid]
    | FStar_Syntax_Syntax.Sig_effect_abbrev
        (lid,uu____2176,uu____2177,uu____2178,uu____2179) -> [lid]
    | FStar_Syntax_Syntax.Sig_datacon
        (lid,uu____2183,uu____2184,uu____2185,uu____2186,uu____2187) -> 
        [lid]
    | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____2191,uu____2192) ->
        [lid]
    | FStar_Syntax_Syntax.Sig_assume (lid,uu____2194,uu____2195) -> [lid]
    | FStar_Syntax_Syntax.Sig_new_effect_for_free n1 ->
        [n1.FStar_Syntax_Syntax.mname]
    | FStar_Syntax_Syntax.Sig_new_effect n1 -> [n1.FStar_Syntax_Syntax.mname]
    | FStar_Syntax_Syntax.Sig_sub_effect uu____2198 -> []
    | FStar_Syntax_Syntax.Sig_pragma uu____2199 -> []
    | FStar_Syntax_Syntax.Sig_main uu____2200 -> []
let lid_of_sigelt:
  FStar_Syntax_Syntax.sigelt ->
    FStar_Ident.lident FStar_Pervasives_Native.option
  =
  fun se  ->
    match lids_of_sigelt se with
    | l::[] -> FStar_Pervasives_Native.Some l
    | uu____2209 -> FStar_Pervasives_Native.None
let quals_of_sigelt:
  FStar_Syntax_Syntax.sigelt -> FStar_Syntax_Syntax.qualifier Prims.list =
  fun x  -> x.FStar_Syntax_Syntax.sigquals
let range_of_sigelt: FStar_Syntax_Syntax.sigelt -> FStar_Range.range =
  fun x  -> x.FStar_Syntax_Syntax.sigrng
let range_of_lb uu___169_2236 =
  match uu___169_2236 with
  | (FStar_Util.Inl x,uu____2243,uu____2244) ->
      FStar_Syntax_Syntax.range_of_bv x
  | (FStar_Util.Inr l,uu____2248,uu____2249) -> FStar_Ident.range_of_lid l
let range_of_arg uu____2270 =
  match uu____2270 with | (hd1,uu____2276) -> hd1.FStar_Syntax_Syntax.pos
let range_of_args args r =
  FStar_All.pipe_right args
    (FStar_List.fold_left
       (fun r1  -> fun a  -> FStar_Range.union_ranges r1 (range_of_arg a)) r)
let mk_app f args =
  let r = range_of_args args f.FStar_Syntax_Syntax.pos in
  FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (f, args))
    FStar_Pervasives_Native.None r
let mk_data l args =
  match args with
  | [] ->
      let uu____2403 =
        let uu____2406 =
          let uu____2407 =
            let uu____2412 =
              FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant
                (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor) in
            (uu____2412,
              (FStar_Syntax_Syntax.Meta_desugared
                 FStar_Syntax_Syntax.Data_app)) in
          FStar_Syntax_Syntax.Tm_meta uu____2407 in
        FStar_Syntax_Syntax.mk uu____2406 in
      uu____2403 FStar_Pervasives_Native.None (FStar_Ident.range_of_lid l)
  | uu____2421 ->
      let e =
        let uu____2430 =
          FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant
            (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor) in
        mk_app uu____2430 args in
      FStar_Syntax_Syntax.mk
        (FStar_Syntax_Syntax.Tm_meta
           (e,
             (FStar_Syntax_Syntax.Meta_desugared FStar_Syntax_Syntax.Data_app)))
        FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
let mangle_field_name: FStar_Ident.ident -> FStar_Ident.ident =
  fun x  ->
    FStar_Ident.mk_ident
      ((Prims.strcat "__fname__" x.FStar_Ident.idText),
        (x.FStar_Ident.idRange))
let unmangle_field_name: FStar_Ident.ident -> FStar_Ident.ident =
  fun x  ->
    if FStar_Util.starts_with x.FStar_Ident.idText "__fname__"
    then
      let uu____2447 =
        let uu____2450 =
          FStar_Util.substring_from x.FStar_Ident.idText
            (Prims.parse_int "9") in
        (uu____2450, (x.FStar_Ident.idRange)) in
      FStar_Ident.mk_ident uu____2447
    else x
let field_projector_prefix: Prims.string = "__proj__"
let field_projector_sep: Prims.string = "__item__"
let field_projector_contains_constructor: Prims.string -> Prims.bool =
  fun s  -> FStar_Util.starts_with s field_projector_prefix
let mk_field_projector_name_from_string:
  Prims.string -> Prims.string -> Prims.string =
  fun constr  ->
    fun field  ->
      Prims.strcat field_projector_prefix
        (Prims.strcat constr (Prims.strcat field_projector_sep field))
let mk_field_projector_name_from_ident:
  FStar_Ident.lident -> FStar_Ident.ident -> FStar_Ident.lident =
  fun lid  ->
    fun i  ->
      let j = unmangle_field_name i in
      let jtext = j.FStar_Ident.idText in
      let newi =
        if field_projector_contains_constructor jtext
        then j
        else
          FStar_Ident.mk_ident
            ((mk_field_projector_name_from_string
                (lid.FStar_Ident.ident).FStar_Ident.idText jtext),
              (i.FStar_Ident.idRange)) in
      FStar_Ident.lid_of_ids (FStar_List.append lid.FStar_Ident.ns [newi])
let mk_field_projector_name:
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.bv ->
      Prims.int ->
        (FStar_Ident.lident,FStar_Syntax_Syntax.bv)
          FStar_Pervasives_Native.tuple2
  =
  fun lid  ->
    fun x  ->
      fun i  ->
        let nm =
          let uu____2491 = FStar_Syntax_Syntax.is_null_bv x in
          if uu____2491
          then
            let uu____2492 =
              let uu____2495 =
                let uu____2496 = FStar_Util.string_of_int i in
                Prims.strcat "_" uu____2496 in
              let uu____2497 = FStar_Syntax_Syntax.range_of_bv x in
              (uu____2495, uu____2497) in
            FStar_Ident.mk_ident uu____2492
          else x.FStar_Syntax_Syntax.ppname in
        let y =
          let uu___173_2500 = x in
          {
            FStar_Syntax_Syntax.ppname = nm;
            FStar_Syntax_Syntax.index =
              (uu___173_2500.FStar_Syntax_Syntax.index);
            FStar_Syntax_Syntax.sort =
              (uu___173_2500.FStar_Syntax_Syntax.sort)
          } in
        let uu____2501 = mk_field_projector_name_from_ident lid nm in
        (uu____2501, y)
let set_uvar:
  FStar_Syntax_Syntax.uvar -> FStar_Syntax_Syntax.term -> Prims.unit =
  fun uv  ->
    fun t  ->
      let uu____2510 = FStar_Syntax_Unionfind.find uv in
      match uu____2510 with
      | FStar_Pervasives_Native.Some uu____2512 ->
          let uu____2513 =
            let uu____2514 =
              let uu____2515 = FStar_Syntax_Unionfind.uvar_id uv in
              FStar_All.pipe_left FStar_Util.string_of_int uu____2515 in
            FStar_Util.format1 "Changing a fixed uvar! ?%s\n" uu____2514 in
          failwith uu____2513
      | uu____2516 -> FStar_Syntax_Unionfind.change uv t
let qualifier_equal:
  FStar_Syntax_Syntax.qualifier ->
    FStar_Syntax_Syntax.qualifier -> Prims.bool
  =
  fun q1  ->
    fun q2  ->
      match (q1, q2) with
      | (FStar_Syntax_Syntax.Discriminator
         l1,FStar_Syntax_Syntax.Discriminator l2) ->
          FStar_Ident.lid_equals l1 l2
      | (FStar_Syntax_Syntax.Projector
         (l1a,l1b),FStar_Syntax_Syntax.Projector (l2a,l2b)) ->
          (FStar_Ident.lid_equals l1a l2a) &&
            (l1b.FStar_Ident.idText = l2b.FStar_Ident.idText)
      | (FStar_Syntax_Syntax.RecordType
         (ns1,f1),FStar_Syntax_Syntax.RecordType (ns2,f2)) ->
          ((((FStar_List.length ns1) = (FStar_List.length ns2)) &&
              (FStar_List.forall2
                 (fun x1  ->
                    fun x2  -> x1.FStar_Ident.idText = x2.FStar_Ident.idText)
                 f1 f2))
             && ((FStar_List.length f1) = (FStar_List.length f2)))
            &&
            (FStar_List.forall2
               (fun x1  ->
                  fun x2  -> x1.FStar_Ident.idText = x2.FStar_Ident.idText)
               f1 f2)
      | (FStar_Syntax_Syntax.RecordConstructor
         (ns1,f1),FStar_Syntax_Syntax.RecordConstructor (ns2,f2)) ->
          ((((FStar_List.length ns1) = (FStar_List.length ns2)) &&
              (FStar_List.forall2
                 (fun x1  ->
                    fun x2  -> x1.FStar_Ident.idText = x2.FStar_Ident.idText)
                 f1 f2))
             && ((FStar_List.length f1) = (FStar_List.length f2)))
            &&
            (FStar_List.forall2
               (fun x1  ->
                  fun x2  -> x1.FStar_Ident.idText = x2.FStar_Ident.idText)
               f1 f2)
      | uu____2604 -> q1 = q2
let abs:
  FStar_Syntax_Syntax.binders ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.term
  =
  fun bs  ->
    fun t  ->
      fun lopt  ->
        let close_lopt lopt1 =
          match lopt1 with
          | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
          | FStar_Pervasives_Native.Some rc ->
              let uu____2630 =
                let uu___174_2631 = rc in
                let uu____2632 =
                  FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                    (FStar_Syntax_Subst.close bs) in
                {
                  FStar_Syntax_Syntax.residual_effect =
                    (uu___174_2631.FStar_Syntax_Syntax.residual_effect);
                  FStar_Syntax_Syntax.residual_typ = uu____2632;
                  FStar_Syntax_Syntax.residual_flags =
                    (uu___174_2631.FStar_Syntax_Syntax.residual_flags)
                } in
              FStar_Pervasives_Native.Some uu____2630 in
        match bs with
        | [] -> t
        | uu____2640 ->
            let body =
              let uu____2642 = FStar_Syntax_Subst.close bs t in
              FStar_Syntax_Subst.compress uu____2642 in
            (match ((body.FStar_Syntax_Syntax.n), lopt) with
             | (FStar_Syntax_Syntax.Tm_abs
                (bs',t1,lopt'),FStar_Pervasives_Native.None ) ->
                 let uu____2660 =
                   let uu____2663 =
                     let uu____2664 =
                       let uu____2674 =
                         let uu____2678 = FStar_Syntax_Subst.close_binders bs in
                         FStar_List.append uu____2678 bs' in
                       let uu____2684 = close_lopt lopt' in
                       (uu____2674, t1, uu____2684) in
                     FStar_Syntax_Syntax.Tm_abs uu____2664 in
                   FStar_Syntax_Syntax.mk uu____2663 in
                 uu____2660 FStar_Pervasives_Native.None
                   t1.FStar_Syntax_Syntax.pos
             | uu____2700 ->
                 let uu____2704 =
                   let uu____2707 =
                     let uu____2708 =
                       let uu____2718 = FStar_Syntax_Subst.close_binders bs in
                       let uu____2719 = close_lopt lopt in
                       (uu____2718, body, uu____2719) in
                     FStar_Syntax_Syntax.Tm_abs uu____2708 in
                   FStar_Syntax_Syntax.mk uu____2707 in
                 uu____2704 FStar_Pervasives_Native.None
                   t.FStar_Syntax_Syntax.pos)
let arrow:
  (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  =
  fun bs  ->
    fun c  ->
      match bs with
      | [] -> comp_result c
      | uu____2754 ->
          let uu____2758 =
            let uu____2761 =
              let uu____2762 =
                let uu____2770 = FStar_Syntax_Subst.close_binders bs in
                let uu____2771 = FStar_Syntax_Subst.close_comp bs c in
                (uu____2770, uu____2771) in
              FStar_Syntax_Syntax.Tm_arrow uu____2762 in
            FStar_Syntax_Syntax.mk uu____2761 in
          uu____2758 FStar_Pervasives_Native.None c.FStar_Syntax_Syntax.pos
let flat_arrow:
  (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  =
  fun bs  ->
    fun c  ->
      let t = arrow bs c in
      let uu____2803 =
        let uu____2804 = FStar_Syntax_Subst.compress t in
        uu____2804.FStar_Syntax_Syntax.n in
      match uu____2803 with
      | FStar_Syntax_Syntax.Tm_arrow (bs1,c1) ->
          (match c1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Total (tres,uu____2824) ->
               let uu____2831 =
                 let uu____2832 = FStar_Syntax_Subst.compress tres in
                 uu____2832.FStar_Syntax_Syntax.n in
               (match uu____2831 with
                | FStar_Syntax_Syntax.Tm_arrow (bs',c') ->
                    let uu____2849 = FStar_ST.read t.FStar_Syntax_Syntax.tk in
                    FStar_Syntax_Syntax.mk
                      (FStar_Syntax_Syntax.Tm_arrow
                         ((FStar_List.append bs1 bs'), c')) uu____2849
                      t.FStar_Syntax_Syntax.pos
                | uu____2865 -> t)
           | uu____2866 -> t)
      | uu____2867 -> t
let refine:
  FStar_Syntax_Syntax.bv ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  =
  fun b  ->
    fun t  ->
      let uu____2878 =
        FStar_ST.read (b.FStar_Syntax_Syntax.sort).FStar_Syntax_Syntax.tk in
      let uu____2883 =
        let uu____2884 = FStar_Syntax_Syntax.range_of_bv b in
        FStar_Range.union_ranges uu____2884 t.FStar_Syntax_Syntax.pos in
      let uu____2885 =
        let uu____2888 =
          let uu____2889 =
            let uu____2894 =
              let uu____2895 =
                let uu____2896 = FStar_Syntax_Syntax.mk_binder b in
                [uu____2896] in
              FStar_Syntax_Subst.close uu____2895 t in
            (b, uu____2894) in
          FStar_Syntax_Syntax.Tm_refine uu____2889 in
        FStar_Syntax_Syntax.mk uu____2888 in
      uu____2885 uu____2878 uu____2883
let branch: FStar_Syntax_Syntax.branch -> FStar_Syntax_Syntax.branch =
  fun b  -> FStar_Syntax_Subst.close_branch b
let rec arrow_formals_comp:
  FStar_Syntax_Syntax.term ->
    ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
       FStar_Pervasives_Native.tuple2 Prims.list,FStar_Syntax_Syntax.comp)
      FStar_Pervasives_Native.tuple2
  =
  fun k  ->
    let k1 = FStar_Syntax_Subst.compress k in
    match k1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
        let uu____2936 = FStar_Syntax_Subst.open_comp bs c in
        (match uu____2936 with
         | (bs1,c1) ->
             let uu____2946 = is_tot_or_gtot_comp c1 in
             if uu____2946
             then
               let uu____2952 = arrow_formals_comp (comp_result c1) in
               (match uu____2952 with
                | (bs',k2) -> ((FStar_List.append bs1 bs'), k2))
             else (bs1, c1))
    | uu____2977 ->
        let uu____2978 = FStar_Syntax_Syntax.mk_Total k1 in ([], uu____2978)
let rec arrow_formals:
  FStar_Syntax_Syntax.term ->
    ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
       FStar_Pervasives_Native.tuple2 Prims.list,(FStar_Syntax_Syntax.term',
                                                   FStar_Syntax_Syntax.term')
                                                   FStar_Syntax_Syntax.syntax)
      FStar_Pervasives_Native.tuple2
  =
  fun k  ->
    let uu____2995 = arrow_formals_comp k in
    match uu____2995 with | (bs,c) -> (bs, (comp_result c))
let abs_formals:
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.binders,FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.residual_comp
                                                            FStar_Pervasives_Native.option)
      FStar_Pervasives_Native.tuple3
  =
  fun t  ->
    let subst_lcomp_opt s l =
      match l with
      | FStar_Pervasives_Native.Some rc ->
          let uu____3043 =
            let uu___175_3044 = rc in
            let uu____3045 =
              FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                (FStar_Syntax_Subst.subst s) in
            {
              FStar_Syntax_Syntax.residual_effect =
                (uu___175_3044.FStar_Syntax_Syntax.residual_effect);
              FStar_Syntax_Syntax.residual_typ = uu____3045;
              FStar_Syntax_Syntax.residual_flags =
                (uu___175_3044.FStar_Syntax_Syntax.residual_flags)
            } in
          FStar_Pervasives_Native.Some uu____3043
      | uu____3051 -> l in
    let rec aux t1 abs_body_lcomp =
      let uu____3069 =
        let uu____3070 =
          let uu____3073 = FStar_Syntax_Subst.compress t1 in
          FStar_All.pipe_left unascribe uu____3073 in
        uu____3070.FStar_Syntax_Syntax.n in
      match uu____3069 with
      | FStar_Syntax_Syntax.Tm_abs (bs,t2,what) ->
          let uu____3096 = aux t2 what in
          (match uu____3096 with
           | (bs',t3,what1) -> ((FStar_List.append bs bs'), t3, what1))
      | uu____3128 -> ([], t1, abs_body_lcomp) in
    let uu____3135 = aux t FStar_Pervasives_Native.None in
    match uu____3135 with
    | (bs,t1,abs_body_lcomp) ->
        let uu____3158 = FStar_Syntax_Subst.open_term' bs t1 in
        (match uu____3158 with
         | (bs1,t2,opening) ->
             let abs_body_lcomp1 = subst_lcomp_opt opening abs_body_lcomp in
             (bs1, t2, abs_body_lcomp1))
let mk_letbinding:
  (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.fv) FStar_Util.either ->
    FStar_Syntax_Syntax.univ_name Prims.list ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax ->
        FStar_Ident.lident ->
          (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
            FStar_Syntax_Syntax.syntax -> FStar_Syntax_Syntax.letbinding
  =
  fun lbname  ->
    fun univ_vars  ->
      fun typ  ->
        fun eff  ->
          fun def  ->
            {
              FStar_Syntax_Syntax.lbname = lbname;
              FStar_Syntax_Syntax.lbunivs = univ_vars;
              FStar_Syntax_Syntax.lbtyp = typ;
              FStar_Syntax_Syntax.lbeff = eff;
              FStar_Syntax_Syntax.lbdef = def
            }
let close_univs_and_mk_letbinding:
  FStar_Syntax_Syntax.fv Prims.list FStar_Pervasives_Native.option ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.fv) FStar_Util.either ->
      FStar_Ident.ident Prims.list ->
        FStar_Syntax_Syntax.term ->
          FStar_Ident.lident ->
            FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.letbinding
  =
  fun recs  ->
    fun lbname  ->
      fun univ_vars  ->
        fun typ  ->
          fun eff  ->
            fun def  ->
              let def1 =
                match (recs, univ_vars) with
                | (FStar_Pervasives_Native.None ,uu____3244) -> def
                | (uu____3250,[]) -> def
                | (FStar_Pervasives_Native.Some fvs,uu____3257) ->
                    let universes =
                      FStar_All.pipe_right univ_vars
                        (FStar_List.map
                           (fun _0_26  -> FStar_Syntax_Syntax.U_name _0_26)) in
                    let inst1 =
                      FStar_All.pipe_right fvs
                        (FStar_List.map
                           (fun fv  ->
                              (((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v),
                                universes))) in
                    FStar_Syntax_InstFV.instantiate inst1 def in
              let typ1 = FStar_Syntax_Subst.close_univ_vars univ_vars typ in
              let def2 = FStar_Syntax_Subst.close_univ_vars univ_vars def1 in
              mk_letbinding lbname univ_vars typ1 eff def2
let open_univ_vars_binders_and_comp:
  FStar_Syntax_Syntax.univ_names ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list ->
      FStar_Syntax_Syntax.comp ->
        (FStar_Syntax_Syntax.univ_names,(FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
                                          FStar_Pervasives_Native.tuple2
                                          Prims.list,FStar_Syntax_Syntax.comp)
          FStar_Pervasives_Native.tuple3
  =
  fun uvs  ->
    fun binders  ->
      fun c  ->
        match binders with
        | [] ->
            let uu____3318 = FStar_Syntax_Subst.open_univ_vars_comp uvs c in
            (match uu____3318 with | (uvs1,c1) -> (uvs1, [], c1))
        | uu____3334 ->
            let t' = arrow binders c in
            let uu____3341 = FStar_Syntax_Subst.open_univ_vars uvs t' in
            (match uu____3341 with
             | (uvs1,t'1) ->
                 let uu____3352 =
                   let uu____3353 = FStar_Syntax_Subst.compress t'1 in
                   uu____3353.FStar_Syntax_Syntax.n in
                 (match uu____3352 with
                  | FStar_Syntax_Syntax.Tm_arrow (binders1,c1) ->
                      (uvs1, binders1, c1)
                  | uu____3379 -> failwith "Impossible"))
let is_tuple_constructor: FStar_Syntax_Syntax.typ -> Prims.bool =
  fun t  ->
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Parser_Const.is_tuple_constructor_string
          ((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v).FStar_Ident.str
    | uu____3391 -> false
let is_dtuple_constructor: FStar_Syntax_Syntax.typ -> Prims.bool =
  fun t  ->
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Parser_Const.is_dtuple_constructor_lid
          (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
    | uu____3397 -> false
let is_lid_equality: FStar_Ident.lident -> Prims.bool =
  fun x  -> FStar_Ident.lid_equals x FStar_Parser_Const.eq2_lid
let is_forall: FStar_Ident.lident -> Prims.bool =
  fun lid  -> FStar_Ident.lid_equals lid FStar_Parser_Const.forall_lid
let is_exists: FStar_Ident.lident -> Prims.bool =
  fun lid  -> FStar_Ident.lid_equals lid FStar_Parser_Const.exists_lid
let is_qlid: FStar_Ident.lident -> Prims.bool =
  fun lid  -> (is_forall lid) || (is_exists lid)
let is_equality:
  FStar_Ident.lident FStar_Syntax_Syntax.withinfo_t -> Prims.bool =
  fun x  -> is_lid_equality x.FStar_Syntax_Syntax.v
let lid_is_connective: FStar_Ident.lident -> Prims.bool =
  let lst =
    [FStar_Parser_Const.and_lid;
    FStar_Parser_Const.or_lid;
    FStar_Parser_Const.not_lid;
    FStar_Parser_Const.iff_lid;
    FStar_Parser_Const.imp_lid] in
  fun lid  -> FStar_Util.for_some (FStar_Ident.lid_equals lid) lst
let is_constructor:
  FStar_Syntax_Syntax.term -> FStar_Ident.lident -> Prims.bool =
  fun t  ->
    fun lid  ->
      let uu____3434 =
        let uu____3435 = pre_typ t in uu____3435.FStar_Syntax_Syntax.n in
      match uu____3434 with
      | FStar_Syntax_Syntax.Tm_fvar tc ->
          FStar_Ident.lid_equals
            (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v lid
      | uu____3439 -> false
let rec is_constructed_typ:
  FStar_Syntax_Syntax.term -> FStar_Ident.lident -> Prims.bool =
  fun t  ->
    fun lid  ->
      let uu____3448 =
        let uu____3449 = pre_typ t in uu____3449.FStar_Syntax_Syntax.n in
      match uu____3448 with
      | FStar_Syntax_Syntax.Tm_fvar uu____3452 -> is_constructor t lid
      | FStar_Syntax_Syntax.Tm_app (t1,uu____3454) ->
          is_constructed_typ t1 lid
      | uu____3469 -> false
let rec get_tycon:
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun t  ->
    let t1 = pre_typ t in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_bvar uu____3477 ->
        FStar_Pervasives_Native.Some t1
    | FStar_Syntax_Syntax.Tm_name uu____3478 ->
        FStar_Pervasives_Native.Some t1
    | FStar_Syntax_Syntax.Tm_fvar uu____3479 ->
        FStar_Pervasives_Native.Some t1
    | FStar_Syntax_Syntax.Tm_app (t2,uu____3481) -> get_tycon t2
    | uu____3496 -> FStar_Pervasives_Native.None
let is_interpreted: FStar_Ident.lident -> Prims.bool =
  fun l  ->
    let theory_syms =
      [FStar_Parser_Const.op_Eq;
      FStar_Parser_Const.op_notEq;
      FStar_Parser_Const.op_LT;
      FStar_Parser_Const.op_LTE;
      FStar_Parser_Const.op_GT;
      FStar_Parser_Const.op_GTE;
      FStar_Parser_Const.op_Subtraction;
      FStar_Parser_Const.op_Minus;
      FStar_Parser_Const.op_Addition;
      FStar_Parser_Const.op_Multiply;
      FStar_Parser_Const.op_Division;
      FStar_Parser_Const.op_Modulus;
      FStar_Parser_Const.op_And;
      FStar_Parser_Const.op_Or;
      FStar_Parser_Const.op_Negation] in
    FStar_Util.for_some (FStar_Ident.lid_equals l) theory_syms
let is_fstar_tactics_embed: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____3507 =
      let uu____3508 = un_uinst t in uu____3508.FStar_Syntax_Syntax.n in
    match uu____3507 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Syntax_Syntax.fv_eq_lid fv
          FStar_Parser_Const.fstar_refl_embed_lid
    | uu____3512 -> false
let is_fstar_tactics_by_tactic: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____3517 =
      let uu____3518 = un_uinst t in uu____3518.FStar_Syntax_Syntax.n in
    match uu____3517 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.by_tactic_lid
    | uu____3522 -> false
let ktype:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax
  =
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_type FStar_Syntax_Syntax.U_unknown)
    FStar_Pervasives_Native.None FStar_Range.dummyRange
let ktype0:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax
  =
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_type FStar_Syntax_Syntax.U_zero)
    FStar_Pervasives_Native.None FStar_Range.dummyRange
let type_u:
  Prims.unit ->
    ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
       FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.universe)
      FStar_Pervasives_Native.tuple2
  =
  fun uu____3540  ->
    let u =
      let uu____3544 = FStar_Syntax_Unionfind.univ_fresh () in
      FStar_All.pipe_left (fun _0_27  -> FStar_Syntax_Syntax.U_unif _0_27)
        uu____3544 in
    let uu____3553 =
      FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type u)
        FStar_Pervasives_Native.None FStar_Range.dummyRange in
    (uu____3553, u)
let exp_true_bool:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax
  =
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool true))
    FStar_Pervasives_Native.None FStar_Range.dummyRange
let exp_false_bool:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax
  =
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool false))
    FStar_Pervasives_Native.None FStar_Range.dummyRange
let exp_unit:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax
  =
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_constant FStar_Const.Const_unit)
    FStar_Pervasives_Native.None FStar_Range.dummyRange
let exp_int:
  Prims.string ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax
  =
  fun s  ->
    FStar_Syntax_Syntax.mk
      (FStar_Syntax_Syntax.Tm_constant
         (FStar_Const.Const_int (s, FStar_Pervasives_Native.None)))
      FStar_Pervasives_Native.None FStar_Range.dummyRange
let exp_string:
  Prims.string ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax
  =
  fun s  ->
    FStar_Syntax_Syntax.mk
      (FStar_Syntax_Syntax.Tm_constant
         (FStar_Const.Const_string
            ((FStar_Util.unicode_of_string s), FStar_Range.dummyRange)))
      FStar_Pervasives_Native.None FStar_Range.dummyRange
let fvar_const: FStar_Ident.lident -> FStar_Syntax_Syntax.term =
  fun l  ->
    FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant
      FStar_Pervasives_Native.None
let tand: FStar_Syntax_Syntax.term = fvar_const FStar_Parser_Const.and_lid
let tor: FStar_Syntax_Syntax.term = fvar_const FStar_Parser_Const.or_lid
let timp: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Parser_Const.imp_lid
    (FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "1"))
    FStar_Pervasives_Native.None
let tiff: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Parser_Const.iff_lid
    (FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "2"))
    FStar_Pervasives_Native.None
let t_bool: FStar_Syntax_Syntax.term = fvar_const FStar_Parser_Const.bool_lid
let t_false: FStar_Syntax_Syntax.term =
  fvar_const FStar_Parser_Const.false_lid
let t_true: FStar_Syntax_Syntax.term = fvar_const FStar_Parser_Const.true_lid
let b2t_v: FStar_Syntax_Syntax.term = fvar_const FStar_Parser_Const.b2t_lid
let t_not: FStar_Syntax_Syntax.term = fvar_const FStar_Parser_Const.not_lid
let mk_conj_opt:
  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option
  =
  fun phi1  ->
    fun phi2  ->
      match phi1 with
      | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.Some phi2
      | FStar_Pervasives_Native.Some phi11 ->
          let uu____3619 =
            let uu____3622 =
              FStar_Range.union_ranges phi11.FStar_Syntax_Syntax.pos
                phi2.FStar_Syntax_Syntax.pos in
            let uu____3623 =
              let uu____3626 =
                let uu____3627 =
                  let uu____3637 =
                    let uu____3639 = FStar_Syntax_Syntax.as_arg phi11 in
                    let uu____3640 =
                      let uu____3642 = FStar_Syntax_Syntax.as_arg phi2 in
                      [uu____3642] in
                    uu____3639 :: uu____3640 in
                  (tand, uu____3637) in
                FStar_Syntax_Syntax.Tm_app uu____3627 in
              FStar_Syntax_Syntax.mk uu____3626 in
            uu____3623 FStar_Pervasives_Native.None uu____3622 in
          FStar_Pervasives_Native.Some uu____3619
let mk_binop op_t phi1 phi2 =
  let uu____3681 =
    FStar_Range.union_ranges phi1.FStar_Syntax_Syntax.pos
      phi2.FStar_Syntax_Syntax.pos in
  let uu____3682 =
    let uu____3685 =
      let uu____3686 =
        let uu____3696 =
          let uu____3698 = FStar_Syntax_Syntax.as_arg phi1 in
          let uu____3699 =
            let uu____3701 = FStar_Syntax_Syntax.as_arg phi2 in [uu____3701] in
          uu____3698 :: uu____3699 in
        (op_t, uu____3696) in
      FStar_Syntax_Syntax.Tm_app uu____3686 in
    FStar_Syntax_Syntax.mk uu____3685 in
  uu____3682 FStar_Pervasives_Native.None uu____3681
let mk_neg phi =
  let uu____3724 =
    let uu____3727 =
      let uu____3728 =
        let uu____3738 =
          let uu____3740 = FStar_Syntax_Syntax.as_arg phi in [uu____3740] in
        (t_not, uu____3738) in
      FStar_Syntax_Syntax.Tm_app uu____3728 in
    FStar_Syntax_Syntax.mk uu____3727 in
  uu____3724 FStar_Pervasives_Native.None phi.FStar_Syntax_Syntax.pos
let mk_conj phi1 phi2 = mk_binop tand phi1 phi2
let mk_conj_l:
  FStar_Syntax_Syntax.term Prims.list -> FStar_Syntax_Syntax.term =
  fun phi  ->
    match phi with
    | [] ->
        FStar_Syntax_Syntax.fvar FStar_Parser_Const.true_lid
          FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None
    | hd1::tl1 -> FStar_List.fold_right mk_conj tl1 hd1
let mk_disj phi1 phi2 = mk_binop tor phi1 phi2
let mk_disj_l:
  FStar_Syntax_Syntax.term Prims.list -> FStar_Syntax_Syntax.term =
  fun phi  ->
    match phi with
    | [] -> t_false
    | hd1::tl1 -> FStar_List.fold_right mk_disj tl1 hd1
let mk_imp:
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  = fun phi1  -> fun phi2  -> mk_binop timp phi1 phi2
let mk_iff:
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  = fun phi1  -> fun phi2  -> mk_binop tiff phi1 phi2
let b2t e =
  let uu____3829 =
    let uu____3832 =
      let uu____3833 =
        let uu____3843 =
          let uu____3845 = FStar_Syntax_Syntax.as_arg e in [uu____3845] in
        (b2t_v, uu____3843) in
      FStar_Syntax_Syntax.Tm_app uu____3833 in
    FStar_Syntax_Syntax.mk uu____3832 in
  uu____3829 FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
let teq: FStar_Syntax_Syntax.term = fvar_const FStar_Parser_Const.eq2_lid
let mk_untyped_eq2 e1 e2 =
  let uu____3872 =
    FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos
      e2.FStar_Syntax_Syntax.pos in
  let uu____3873 =
    let uu____3876 =
      let uu____3877 =
        let uu____3887 =
          let uu____3889 = FStar_Syntax_Syntax.as_arg e1 in
          let uu____3890 =
            let uu____3892 = FStar_Syntax_Syntax.as_arg e2 in [uu____3892] in
          uu____3889 :: uu____3890 in
        (teq, uu____3887) in
      FStar_Syntax_Syntax.Tm_app uu____3877 in
    FStar_Syntax_Syntax.mk uu____3876 in
  uu____3873 FStar_Pervasives_Native.None uu____3872
let mk_eq2:
  FStar_Syntax_Syntax.universe ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.term ->
          (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
            FStar_Syntax_Syntax.syntax
  =
  fun u  ->
    fun t  ->
      fun e1  ->
        fun e2  ->
          let eq_inst = FStar_Syntax_Syntax.mk_Tm_uinst teq [u] in
          let uu____3919 =
            FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos
              e2.FStar_Syntax_Syntax.pos in
          let uu____3920 =
            let uu____3923 =
              let uu____3924 =
                let uu____3934 =
                  let uu____3936 = FStar_Syntax_Syntax.iarg t in
                  let uu____3937 =
                    let uu____3939 = FStar_Syntax_Syntax.as_arg e1 in
                    let uu____3940 =
                      let uu____3942 = FStar_Syntax_Syntax.as_arg e2 in
                      [uu____3942] in
                    uu____3939 :: uu____3940 in
                  uu____3936 :: uu____3937 in
                (eq_inst, uu____3934) in
              FStar_Syntax_Syntax.Tm_app uu____3924 in
            FStar_Syntax_Syntax.mk uu____3923 in
          uu____3920 FStar_Pervasives_Native.None uu____3919
let mk_has_type t x t' =
  let t_has_type = fvar_const FStar_Parser_Const.has_type_lid in
  let t_has_type1 =
    FStar_Syntax_Syntax.mk
      (FStar_Syntax_Syntax.Tm_uinst
         (t_has_type,
           [FStar_Syntax_Syntax.U_zero; FStar_Syntax_Syntax.U_zero]))
      FStar_Pervasives_Native.None FStar_Range.dummyRange in
  let uu____3984 =
    let uu____3987 =
      let uu____3988 =
        let uu____3998 =
          let uu____4000 = FStar_Syntax_Syntax.iarg t in
          let uu____4001 =
            let uu____4003 = FStar_Syntax_Syntax.as_arg x in
            let uu____4004 =
              let uu____4006 = FStar_Syntax_Syntax.as_arg t' in [uu____4006] in
            uu____4003 :: uu____4004 in
          uu____4000 :: uu____4001 in
        (t_has_type1, uu____3998) in
      FStar_Syntax_Syntax.Tm_app uu____3988 in
    FStar_Syntax_Syntax.mk uu____3987 in
  uu____3984 FStar_Pervasives_Native.None FStar_Range.dummyRange
let lex_t: FStar_Syntax_Syntax.term = fvar_const FStar_Parser_Const.lex_t_lid
let lex_top:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax
  =
  let uu____4020 =
    let uu____4023 =
      let uu____4024 =
        let uu____4029 =
          FStar_Syntax_Syntax.fvar FStar_Parser_Const.lextop_lid
            FStar_Syntax_Syntax.Delta_constant
            (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor) in
        (uu____4029, [FStar_Syntax_Syntax.U_zero]) in
      FStar_Syntax_Syntax.Tm_uinst uu____4024 in
    FStar_Syntax_Syntax.mk uu____4023 in
  uu____4020 FStar_Pervasives_Native.None FStar_Range.dummyRange
let lex_pair: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Parser_Const.lexcons_lid
    FStar_Syntax_Syntax.Delta_constant
    (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor)
let tforall: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Parser_Const.forall_lid
    (FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "1"))
    FStar_Pervasives_Native.None
let t_haseq: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Parser_Const.haseq_lid
    FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None
let lcomp_of_comp:
  (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.lcomp
  =
  fun c0  ->
    let uu____4047 =
      match c0.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Total uu____4054 ->
          (FStar_Parser_Const.effect_Tot_lid, [FStar_Syntax_Syntax.TOTAL])
      | FStar_Syntax_Syntax.GTotal uu____4061 ->
          (FStar_Parser_Const.effect_GTot_lid,
            [FStar_Syntax_Syntax.SOMETRIVIAL])
      | FStar_Syntax_Syntax.Comp c ->
          ((c.FStar_Syntax_Syntax.effect_name),
            (c.FStar_Syntax_Syntax.flags)) in
    match uu____4047 with
    | (eff_name,flags) ->
        {
          FStar_Syntax_Syntax.eff_name = eff_name;
          FStar_Syntax_Syntax.res_typ = (comp_result c0);
          FStar_Syntax_Syntax.cflags = flags;
          FStar_Syntax_Syntax.comp = ((fun uu____4075  -> c0))
        }
let mk_residual_comp:
  FStar_Ident.lident ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.cflags Prims.list ->
        FStar_Syntax_Syntax.residual_comp
  =
  fun l  ->
    fun t  ->
      fun f  ->
        {
          FStar_Syntax_Syntax.residual_effect = l;
          FStar_Syntax_Syntax.residual_typ = t;
          FStar_Syntax_Syntax.residual_flags = f
        }
let residual_tot:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax -> FStar_Syntax_Syntax.residual_comp
  =
  fun t  ->
    {
      FStar_Syntax_Syntax.residual_effect = FStar_Parser_Const.effect_Tot_lid;
      FStar_Syntax_Syntax.residual_typ = (FStar_Pervasives_Native.Some t);
      FStar_Syntax_Syntax.residual_flags = [FStar_Syntax_Syntax.TOTAL]
    }
let residual_comp_of_comp:
  FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.residual_comp =
  fun c  ->
    {
      FStar_Syntax_Syntax.residual_effect = (comp_effect_name c);
      FStar_Syntax_Syntax.residual_typ =
        (FStar_Pervasives_Native.Some (comp_result c));
      FStar_Syntax_Syntax.residual_flags = (comp_flags c)
    }
let residual_comp_of_lcomp:
  FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.residual_comp =
  fun lc  ->
    {
      FStar_Syntax_Syntax.residual_effect = (lc.FStar_Syntax_Syntax.eff_name);
      FStar_Syntax_Syntax.residual_typ =
        (FStar_Pervasives_Native.Some (lc.FStar_Syntax_Syntax.res_typ));
      FStar_Syntax_Syntax.residual_flags = (lc.FStar_Syntax_Syntax.cflags)
    }
let mk_forall_aux fa x body =
  let uu____4145 =
    let uu____4148 =
      let uu____4149 =
        let uu____4159 =
          let uu____4161 =
            FStar_Syntax_Syntax.iarg x.FStar_Syntax_Syntax.sort in
          let uu____4162 =
            let uu____4164 =
              let uu____4165 =
                let uu____4166 =
                  let uu____4167 = FStar_Syntax_Syntax.mk_binder x in
                  [uu____4167] in
                abs uu____4166 body
                  (FStar_Pervasives_Native.Some (residual_tot ktype0)) in
              FStar_Syntax_Syntax.as_arg uu____4165 in
            [uu____4164] in
          uu____4161 :: uu____4162 in
        (fa, uu____4159) in
      FStar_Syntax_Syntax.Tm_app uu____4149 in
    FStar_Syntax_Syntax.mk uu____4148 in
  uu____4145 FStar_Pervasives_Native.None FStar_Range.dummyRange
let mk_forall_no_univ:
  FStar_Syntax_Syntax.bv ->
    FStar_Syntax_Syntax.typ ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  = fun x  -> fun body  -> mk_forall_aux tforall x body
let mk_forall:
  FStar_Syntax_Syntax.universe ->
    FStar_Syntax_Syntax.bv ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
          FStar_Syntax_Syntax.syntax
  =
  fun u  ->
    fun x  ->
      fun body  ->
        let tforall1 = FStar_Syntax_Syntax.mk_Tm_uinst tforall [u] in
        mk_forall_aux tforall1 x body
let close_forall_no_univs:
  FStar_Syntax_Syntax.binder Prims.list ->
    FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ
  =
  fun bs  ->
    fun f  ->
      FStar_List.fold_right
        (fun b  ->
           fun f1  ->
             let uu____4215 = FStar_Syntax_Syntax.is_null_binder b in
             if uu____4215
             then f1
             else mk_forall_no_univ (FStar_Pervasives_Native.fst b) f1) bs f
let rec is_wild_pat:
  FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t -> Prims.bool =
  fun p  ->
    match p.FStar_Syntax_Syntax.v with
    | FStar_Syntax_Syntax.Pat_wild uu____4223 -> true
    | uu____4224 -> false
let if_then_else b t1 t2 =
  let then_branch =
    let uu____4270 =
      FStar_Syntax_Syntax.withinfo
        (FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool true))
        t1.FStar_Syntax_Syntax.pos in
    (uu____4270, FStar_Pervasives_Native.None, t1) in
  let else_branch =
    let uu____4290 =
      FStar_Syntax_Syntax.withinfo
        (FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool false))
        t2.FStar_Syntax_Syntax.pos in
    (uu____4290, FStar_Pervasives_Native.None, t2) in
  let uu____4300 =
    let uu____4301 =
      FStar_Range.union_ranges t1.FStar_Syntax_Syntax.pos
        t2.FStar_Syntax_Syntax.pos in
    FStar_Range.union_ranges b.FStar_Syntax_Syntax.pos uu____4301 in
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_match (b, [then_branch; else_branch]))
    FStar_Pervasives_Native.None uu____4300
let mk_squash p =
  let sq =
    FStar_Syntax_Syntax.fvar FStar_Parser_Const.squash_lid
      (FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "1"))
      FStar_Pervasives_Native.None in
  let uu____4357 =
    FStar_Syntax_Syntax.mk_Tm_uinst sq [FStar_Syntax_Syntax.U_zero] in
  let uu____4360 =
    let uu____4366 = FStar_Syntax_Syntax.as_arg p in [uu____4366] in
  mk_app uu____4357 uu____4360
let un_squash:
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option
  =
  fun t  ->
    let uu____4374 = head_and_args t in
    match uu____4374 with
    | (head1,args) ->
        let uu____4403 =
          let uu____4411 =
            let uu____4412 = un_uinst head1 in
            uu____4412.FStar_Syntax_Syntax.n in
          (uu____4411, args) in
        (match uu____4403 with
         | (FStar_Syntax_Syntax.Tm_fvar fv,(p,uu____4425)::[]) when
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid
             -> FStar_Pervasives_Native.Some p
         | (FStar_Syntax_Syntax.Tm_refine (b,p),[]) ->
             (match (b.FStar_Syntax_Syntax.sort).FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_fvar fv when
                  FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.unit_lid
                  ->
                  let uu____4464 =
                    let uu____4467 =
                      let uu____4468 = FStar_Syntax_Syntax.mk_binder b in
                      [uu____4468] in
                    FStar_Syntax_Subst.open_term uu____4467 p in
                  (match uu____4464 with
                   | (bs,p1) ->
                       let b1 =
                         match bs with
                         | b1::[] -> b1
                         | uu____4486 -> failwith "impossible" in
                       let uu____4489 =
                         let uu____4490 = FStar_Syntax_Free.names p1 in
                         FStar_Util.set_mem (FStar_Pervasives_Native.fst b1)
                           uu____4490 in
                       if uu____4489
                       then FStar_Pervasives_Native.None
                       else FStar_Pervasives_Native.Some p1)
              | uu____4498 -> FStar_Pervasives_Native.None)
         | uu____4501 -> FStar_Pervasives_Native.None)
let arrow_one:
  FStar_Syntax_Syntax.typ ->
    (FStar_Syntax_Syntax.binder,FStar_Syntax_Syntax.comp)
      FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option
  =
  fun t  ->
    let uu____4521 =
      let uu____4522 = FStar_Syntax_Subst.compress t in
      uu____4522.FStar_Syntax_Syntax.n in
    match uu____4521 with
    | FStar_Syntax_Syntax.Tm_arrow ([],c) ->
        failwith "fatal: empty binders on arrow?"
    | FStar_Syntax_Syntax.Tm_arrow (b::[],c) ->
        FStar_Pervasives_Native.Some (b, c)
    | FStar_Syntax_Syntax.Tm_arrow (b::bs,c) ->
        let uu____4583 =
          let uu____4588 =
            let uu____4589 = arrow bs c in
            FStar_Syntax_Syntax.mk_Total uu____4589 in
          (b, uu____4588) in
        FStar_Pervasives_Native.Some uu____4583
    | uu____4596 -> FStar_Pervasives_Native.None
let is_free_in:
  FStar_Syntax_Syntax.bv -> FStar_Syntax_Syntax.term -> Prims.bool =
  fun bv  ->
    fun t  ->
      let uu____4607 = FStar_Syntax_Free.names t in
      FStar_Util.set_mem bv uu____4607
type qpats = FStar_Syntax_Syntax.args Prims.list
type connective =
  | QAll of (FStar_Syntax_Syntax.binders,qpats,FStar_Syntax_Syntax.typ)
  FStar_Pervasives_Native.tuple3
  | QEx of (FStar_Syntax_Syntax.binders,qpats,FStar_Syntax_Syntax.typ)
  FStar_Pervasives_Native.tuple3
  | BaseConn of (FStar_Ident.lident,FStar_Syntax_Syntax.args)
  FStar_Pervasives_Native.tuple2
let uu___is_QAll: connective -> Prims.bool =
  fun projectee  ->
    match projectee with | QAll _0 -> true | uu____4638 -> false
let __proj__QAll__item___0:
  connective ->
    (FStar_Syntax_Syntax.binders,qpats,FStar_Syntax_Syntax.typ)
      FStar_Pervasives_Native.tuple3
  = fun projectee  -> match projectee with | QAll _0 -> _0
let uu___is_QEx: connective -> Prims.bool =
  fun projectee  ->
    match projectee with | QEx _0 -> true | uu____4664 -> false
let __proj__QEx__item___0:
  connective ->
    (FStar_Syntax_Syntax.binders,qpats,FStar_Syntax_Syntax.typ)
      FStar_Pervasives_Native.tuple3
  = fun projectee  -> match projectee with | QEx _0 -> _0
let uu___is_BaseConn: connective -> Prims.bool =
  fun projectee  ->
    match projectee with | BaseConn _0 -> true | uu____4689 -> false
let __proj__BaseConn__item___0:
  connective ->
    (FStar_Ident.lident,FStar_Syntax_Syntax.args)
      FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | BaseConn _0 -> _0
let destruct_typ_as_formula:
  FStar_Syntax_Syntax.term -> connective FStar_Pervasives_Native.option =
  fun f  ->
    let rec unmeta_monadic f1 =
      let f2 = FStar_Syntax_Subst.compress f1 in
      match f2.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_meta
          (t,FStar_Syntax_Syntax.Meta_monadic uu____4716) -> unmeta_monadic t
      | FStar_Syntax_Syntax.Tm_meta
          (t,FStar_Syntax_Syntax.Meta_monadic_lift uu____4726) ->
          unmeta_monadic t
      | uu____4736 -> f2 in
    let destruct_base_conn f1 =
      let connectives =
        [(FStar_Parser_Const.true_lid, (Prims.parse_int "0"));
        (FStar_Parser_Const.false_lid, (Prims.parse_int "0"));
        (FStar_Parser_Const.and_lid, (Prims.parse_int "2"));
        (FStar_Parser_Const.or_lid, (Prims.parse_int "2"));
        (FStar_Parser_Const.imp_lid, (Prims.parse_int "2"));
        (FStar_Parser_Const.iff_lid, (Prims.parse_int "2"));
        (FStar_Parser_Const.ite_lid, (Prims.parse_int "3"));
        (FStar_Parser_Const.not_lid, (Prims.parse_int "1"));
        (FStar_Parser_Const.eq2_lid, (Prims.parse_int "3"));
        (FStar_Parser_Const.eq2_lid, (Prims.parse_int "2"));
        (FStar_Parser_Const.eq3_lid, (Prims.parse_int "4"));
        (FStar_Parser_Const.eq3_lid, (Prims.parse_int "2"))] in
      let aux f2 uu____4781 =
        match uu____4781 with
        | (lid,arity) ->
            let uu____4787 =
              let uu____4797 = unmeta_monadic f2 in head_and_args uu____4797 in
            (match uu____4787 with
             | (t,args) ->
                 let t1 = un_uinst t in
                 let uu____4816 =
                   (is_constructor t1 lid) &&
                     ((FStar_List.length args) = arity) in
                 if uu____4816
                 then FStar_Pervasives_Native.Some (BaseConn (lid, args))
                 else FStar_Pervasives_Native.None) in
      FStar_Util.find_map connectives (aux f1) in
    let patterns t =
      let t1 = FStar_Syntax_Subst.compress t in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_meta
          (t2,FStar_Syntax_Syntax.Meta_pattern pats) ->
          let uu____4871 = FStar_Syntax_Subst.compress t2 in
          (pats, uu____4871)
      | uu____4878 ->
          let uu____4879 = FStar_Syntax_Subst.compress t1 in ([], uu____4879) in
    let destruct_q_conn t =
      let is_q fa fv =
        if fa
        then is_forall (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
        else is_exists (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
      let flat t1 =
        let uu____4913 = head_and_args t1 in
        match uu____4913 with
        | (t2,args) ->
            let uu____4944 = un_uinst t2 in
            let uu____4945 =
              FStar_All.pipe_right args
                (FStar_List.map
                   (fun uu____4965  ->
                      match uu____4965 with
                      | (t3,imp) ->
                          let uu____4972 = unascribe t3 in (uu____4972, imp))) in
            (uu____4944, uu____4945) in
      let rec aux qopt out t1 =
        let uu____4995 = let uu____5004 = flat t1 in (qopt, uu____5004) in
        match uu____4995 with
        | (FStar_Pervasives_Native.Some
           fa,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
                 FStar_Syntax_Syntax.tk = uu____5019;
                 FStar_Syntax_Syntax.pos = uu____5020;_},({
                                                            FStar_Syntax_Syntax.n
                                                              =
                                                              FStar_Syntax_Syntax.Tm_abs
                                                              (b::[],t2,uu____5023);
                                                            FStar_Syntax_Syntax.tk
                                                              = uu____5024;
                                                            FStar_Syntax_Syntax.pos
                                                              = uu____5025;_},uu____5026)::[]))
            when is_q fa tc -> aux qopt (b :: out) t2
        | (FStar_Pervasives_Native.Some
           fa,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
                 FStar_Syntax_Syntax.tk = uu____5075;
                 FStar_Syntax_Syntax.pos = uu____5076;_},uu____5077::
               ({
                  FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs
                    (b::[],t2,uu____5080);
                  FStar_Syntax_Syntax.tk = uu____5081;
                  FStar_Syntax_Syntax.pos = uu____5082;_},uu____5083)::[]))
            when is_q fa tc -> aux qopt (b :: out) t2
        | (FStar_Pervasives_Native.None
           ,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
               FStar_Syntax_Syntax.tk = uu____5139;
               FStar_Syntax_Syntax.pos = uu____5140;_},({
                                                          FStar_Syntax_Syntax.n
                                                            =
                                                            FStar_Syntax_Syntax.Tm_abs
                                                            (b::[],t2,uu____5143);
                                                          FStar_Syntax_Syntax.tk
                                                            = uu____5144;
                                                          FStar_Syntax_Syntax.pos
                                                            = uu____5145;_},uu____5146)::[]))
            when
            is_qlid (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v ->
            aux
              (FStar_Pervasives_Native.Some
                 (is_forall
                    (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v))
              (b :: out) t2
        | (FStar_Pervasives_Native.None
           ,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
               FStar_Syntax_Syntax.tk = uu____5194;
               FStar_Syntax_Syntax.pos = uu____5195;_},uu____5196::({
                                                                    FStar_Syntax_Syntax.n
                                                                    =
                                                                    FStar_Syntax_Syntax.Tm_abs
                                                                    (b::[],t2,uu____5199);
                                                                    FStar_Syntax_Syntax.tk
                                                                    =
                                                                    uu____5200;
                                                                    FStar_Syntax_Syntax.pos
                                                                    =
                                                                    uu____5201;_},uu____5202)::[]))
            when
            is_qlid (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v ->
            aux
              (FStar_Pervasives_Native.Some
                 (is_forall
                    (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v))
              (b :: out) t2
        | (FStar_Pervasives_Native.Some b,uu____5258) ->
            let bs = FStar_List.rev out in
            let uu____5276 = FStar_Syntax_Subst.open_term bs t1 in
            (match uu____5276 with
             | (bs1,t2) ->
                 let uu____5282 = patterns t2 in
                 (match uu____5282 with
                  | (pats,body) ->
                      if b
                      then
                        FStar_Pervasives_Native.Some (QAll (bs1, pats, body))
                      else
                        FStar_Pervasives_Native.Some (QEx (bs1, pats, body))))
        | uu____5320 -> FStar_Pervasives_Native.None in
      aux FStar_Pervasives_Native.None [] t in
    let u_connectives =
      [(FStar_Parser_Const.true_lid, FStar_Parser_Const.c_true_lid,
         (Prims.parse_int "0"));
      (FStar_Parser_Const.false_lid, FStar_Parser_Const.c_false_lid,
        (Prims.parse_int "0"));
      (FStar_Parser_Const.and_lid, FStar_Parser_Const.c_and_lid,
        (Prims.parse_int "2"));
      (FStar_Parser_Const.or_lid, FStar_Parser_Const.c_or_lid,
        (Prims.parse_int "2"))] in
    let destruct_sq_base_conn t =
      let uu____5356 = un_squash t in
      FStar_Util.bind_opt uu____5356
        (fun t1  ->
           let uu____5371 = head_and_args' t1 in
           match uu____5371 with
           | (hd1,args) ->
               let uu____5392 =
                 let uu____5395 =
                   let uu____5396 = un_uinst hd1 in
                   uu____5396.FStar_Syntax_Syntax.n in
                 (uu____5395, (FStar_List.length args)) in
               (match uu____5392 with
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_28) when
                    (_0_28 = (Prims.parse_int "2")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.c_and_lid)
                    ->
                    FStar_Pervasives_Native.Some
                      (BaseConn (FStar_Parser_Const.and_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_29) when
                    (_0_29 = (Prims.parse_int "2")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.c_or_lid)
                    ->
                    FStar_Pervasives_Native.Some
                      (BaseConn (FStar_Parser_Const.or_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_30) when
                    (_0_30 = (Prims.parse_int "2")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.c_eq2_lid)
                    ->
                    FStar_Pervasives_Native.Some
                      (BaseConn (FStar_Parser_Const.eq2_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_31) when
                    (_0_31 = (Prims.parse_int "3")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.c_eq2_lid)
                    ->
                    FStar_Pervasives_Native.Some
                      (BaseConn (FStar_Parser_Const.eq2_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_32) when
                    (_0_32 = (Prims.parse_int "2")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.c_eq3_lid)
                    ->
                    FStar_Pervasives_Native.Some
                      (BaseConn (FStar_Parser_Const.eq3_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_33) when
                    (_0_33 = (Prims.parse_int "4")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.c_eq3_lid)
                    ->
                    FStar_Pervasives_Native.Some
                      (BaseConn (FStar_Parser_Const.eq3_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_34) when
                    (_0_34 = (Prims.parse_int "0")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.c_true_lid)
                    ->
                    FStar_Pervasives_Native.Some
                      (BaseConn (FStar_Parser_Const.true_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_35) when
                    (_0_35 = (Prims.parse_int "0")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.c_false_lid)
                    ->
                    FStar_Pervasives_Native.Some
                      (BaseConn (FStar_Parser_Const.false_lid, args))
                | uu____5456 -> FStar_Pervasives_Native.None)) in
    let rec destruct_sq_forall t =
      let uu____5473 = un_squash t in
      FStar_Util.bind_opt uu____5473
        (fun t1  ->
           let uu____5487 = arrow_one t1 in
           match uu____5487 with
           | FStar_Pervasives_Native.Some (b,c) ->
               let uu____5496 =
                 let uu____5497 = is_tot_or_gtot_comp c in
                 Prims.op_Negation uu____5497 in
               if uu____5496
               then FStar_Pervasives_Native.None
               else
                 (let q =
                    let uu____5503 = comp_to_comp_typ c in
                    uu____5503.FStar_Syntax_Syntax.result_typ in
                  let uu____5504 = FStar_Syntax_Subst.open_term [b] q in
                  match uu____5504 with
                  | (bs,q1) ->
                      let b1 =
                        match bs with
                        | b1::[] -> b1
                        | uu____5522 -> failwith "impossible" in
                      let uu____5525 =
                        is_free_in (FStar_Pervasives_Native.fst b1) q1 in
                      if uu____5525
                      then
                        let uu____5527 = patterns q1 in
                        (match uu____5527 with
                         | (pats,q2) ->
                             FStar_All.pipe_left maybe_collect
                               (FStar_Pervasives_Native.Some
                                  (QAll ([b1], pats, q2))))
                      else
                        (let uu____5567 =
                           let uu____5568 =
                             let uu____5571 =
                               let uu____5573 =
                                 FStar_Syntax_Syntax.as_arg
                                   (FStar_Pervasives_Native.fst b1).FStar_Syntax_Syntax.sort in
                               let uu____5574 =
                                 let uu____5576 =
                                   FStar_Syntax_Syntax.as_arg q1 in
                                 [uu____5576] in
                               uu____5573 :: uu____5574 in
                             (FStar_Parser_Const.imp_lid, uu____5571) in
                           BaseConn uu____5568 in
                         FStar_Pervasives_Native.Some uu____5567))
           | uu____5578 -> FStar_Pervasives_Native.None)
    and destruct_sq_exists t =
      let uu____5583 = un_squash t in
      FStar_Util.bind_opt uu____5583
        (fun t1  ->
           let uu____5613 = head_and_args' t1 in
           match uu____5613 with
           | (hd1,args) ->
               let uu____5634 =
                 let uu____5642 =
                   let uu____5643 = un_uinst hd1 in
                   uu____5643.FStar_Syntax_Syntax.n in
                 (uu____5642, args) in
               (match uu____5634 with
                | (FStar_Syntax_Syntax.Tm_fvar
                   fv,(a1,uu____5654)::(a2,uu____5656)::[]) when
                    FStar_Syntax_Syntax.fv_eq_lid fv
                      FStar_Parser_Const.dtuple2_lid
                    ->
                    let uu____5682 =
                      let uu____5683 = FStar_Syntax_Subst.compress a2 in
                      uu____5683.FStar_Syntax_Syntax.n in
                    (match uu____5682 with
                     | FStar_Syntax_Syntax.Tm_abs (b::[],q,uu____5689) ->
                         let uu____5705 = FStar_Syntax_Subst.open_term [b] q in
                         (match uu____5705 with
                          | (bs,q1) ->
                              let b1 =
                                match bs with
                                | b1::[] -> b1
                                | uu____5727 -> failwith "impossible" in
                              let uu____5730 = patterns q1 in
                              (match uu____5730 with
                               | (pats,q2) ->
                                   FStar_All.pipe_left maybe_collect
                                     (FStar_Pervasives_Native.Some
                                        (QEx ([b1], pats, q2)))))
                     | uu____5769 -> FStar_Pervasives_Native.None)
                | uu____5770 -> FStar_Pervasives_Native.None))
    and maybe_collect f1 =
      match f1 with
      | FStar_Pervasives_Native.Some (QAll (bs,pats,phi)) ->
          let uu____5784 = destruct_sq_forall phi in
          (match uu____5784 with
           | FStar_Pervasives_Native.Some (QAll (bs',pats',psi)) ->
               FStar_All.pipe_left
                 (fun _0_36  -> FStar_Pervasives_Native.Some _0_36)
                 (QAll
                    ((FStar_List.append bs bs'),
                      (FStar_List.append pats pats'), psi))
           | uu____5797 -> f1)
      | FStar_Pervasives_Native.Some (QEx (bs,pats,phi)) ->
          let uu____5802 = destruct_sq_exists phi in
          (match uu____5802 with
           | FStar_Pervasives_Native.Some (QEx (bs',pats',psi)) ->
               FStar_All.pipe_left
                 (fun _0_37  -> FStar_Pervasives_Native.Some _0_37)
                 (QEx
                    ((FStar_List.append bs bs'),
                      (FStar_List.append pats pats'), psi))
           | uu____5815 -> f1)
      | uu____5817 -> f1 in
    let phi = unmeta_monadic f in
    let uu____5820 = destruct_base_conn phi in
    FStar_Util.catch_opt uu____5820
      (fun uu____5824  ->
         let uu____5825 = destruct_q_conn phi in
         FStar_Util.catch_opt uu____5825
           (fun uu____5829  ->
              let uu____5830 = destruct_sq_base_conn phi in
              FStar_Util.catch_opt uu____5830
                (fun uu____5834  ->
                   let uu____5835 = destruct_sq_forall phi in
                   FStar_Util.catch_opt uu____5835
                     (fun uu____5839  ->
                        let uu____5840 = destruct_sq_exists phi in
                        FStar_Util.catch_opt uu____5840
                          (fun uu____5843  -> FStar_Pervasives_Native.None)))))
let action_as_lb:
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.action -> FStar_Syntax_Syntax.sigelt
  =
  fun eff_lid  ->
    fun a  ->
      let lb =
        let uu____5853 =
          let uu____5856 =
            FStar_Syntax_Syntax.lid_as_fv a.FStar_Syntax_Syntax.action_name
              FStar_Syntax_Syntax.Delta_equational
              FStar_Pervasives_Native.None in
          FStar_Util.Inr uu____5856 in
        let uu____5857 =
          let uu____5858 =
            FStar_Syntax_Syntax.mk_Total a.FStar_Syntax_Syntax.action_typ in
          arrow a.FStar_Syntax_Syntax.action_params uu____5858 in
        let uu____5861 =
          abs a.FStar_Syntax_Syntax.action_params
            a.FStar_Syntax_Syntax.action_defn FStar_Pervasives_Native.None in
        close_univs_and_mk_letbinding FStar_Pervasives_Native.None uu____5853
          a.FStar_Syntax_Syntax.action_univs uu____5857
          FStar_Parser_Const.effect_Tot_lid uu____5861 in
      {
        FStar_Syntax_Syntax.sigel =
          (FStar_Syntax_Syntax.Sig_let
             ((false, [lb]), [a.FStar_Syntax_Syntax.action_name]));
        FStar_Syntax_Syntax.sigrng =
          ((a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos);
        FStar_Syntax_Syntax.sigquals =
          [FStar_Syntax_Syntax.Visible_default;
          FStar_Syntax_Syntax.Action eff_lid];
        FStar_Syntax_Syntax.sigmeta = FStar_Syntax_Syntax.default_sigmeta;
        FStar_Syntax_Syntax.sigattrs = []
      }
let mk_reify t =
  let reify_ =
    FStar_Syntax_Syntax.mk
      (FStar_Syntax_Syntax.Tm_constant FStar_Const.Const_reify)
      FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos in
  let uu____5890 =
    let uu____5893 =
      let uu____5894 =
        let uu____5904 =
          let uu____5906 = FStar_Syntax_Syntax.as_arg t in [uu____5906] in
        (reify_, uu____5904) in
      FStar_Syntax_Syntax.Tm_app uu____5894 in
    FStar_Syntax_Syntax.mk uu____5893 in
  uu____5890 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos
let rec delta_qualifier:
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.delta_depth =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____5923 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_fvar fv -> fv.FStar_Syntax_Syntax.fv_delta
    | FStar_Syntax_Syntax.Tm_bvar uu____5939 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_name uu____5940 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_match uu____5941 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_uvar uu____5956 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_unknown  -> FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_type uu____5967 ->
        FStar_Syntax_Syntax.Delta_constant
    | FStar_Syntax_Syntax.Tm_constant uu____5968 ->
        FStar_Syntax_Syntax.Delta_constant
    | FStar_Syntax_Syntax.Tm_arrow uu____5969 ->
        FStar_Syntax_Syntax.Delta_constant
    | FStar_Syntax_Syntax.Tm_uinst (t2,uu____5978) -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_refine
        ({ FStar_Syntax_Syntax.ppname = uu____5983;
           FStar_Syntax_Syntax.index = uu____5984;
           FStar_Syntax_Syntax.sort = t2;_},uu____5986)
        -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_meta (t2,uu____5994) -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____6000,uu____6001) ->
        delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_app (t2,uu____6031) -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_abs (uu____6046,t2,uu____6048) ->
        delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_let (uu____6061,t2) -> delta_qualifier t2
let rec incr_delta_depth:
  FStar_Syntax_Syntax.delta_depth -> FStar_Syntax_Syntax.delta_depth =
  fun d  ->
    match d with
    | FStar_Syntax_Syntax.Delta_equational  -> d
    | FStar_Syntax_Syntax.Delta_constant  ->
        FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "1")
    | FStar_Syntax_Syntax.Delta_defined_at_level i ->
        FStar_Syntax_Syntax.Delta_defined_at_level
          (i + (Prims.parse_int "1"))
    | FStar_Syntax_Syntax.Delta_abstract d1 -> incr_delta_depth d1
let incr_delta_qualifier:
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.delta_depth =
  fun t  -> let uu____6083 = delta_qualifier t in incr_delta_depth uu____6083
let is_unknown: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____6088 =
      let uu____6089 = FStar_Syntax_Subst.compress t in
      uu____6089.FStar_Syntax_Syntax.n in
    match uu____6088 with
    | FStar_Syntax_Syntax.Tm_unknown  -> true
    | uu____6092 -> false
let rec list_elements:
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.term Prims.list FStar_Pervasives_Native.option
  =
  fun e  ->
    let uu____6101 = let uu____6111 = unmeta e in head_and_args uu____6111 in
    match uu____6101 with
    | (head1,args) ->
        let uu____6130 =
          let uu____6138 =
            let uu____6139 = un_uinst head1 in
            uu____6139.FStar_Syntax_Syntax.n in
          (uu____6138, args) in
        (match uu____6130 with
         | (FStar_Syntax_Syntax.Tm_fvar fv,uu____6150) when
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.nil_lid ->
             FStar_Pervasives_Native.Some []
         | (FStar_Syntax_Syntax.Tm_fvar
            fv,uu____6163::(hd1,uu____6165)::(tl1,uu____6167)::[]) when
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.cons_lid ->
             let uu____6201 =
               let uu____6205 =
                 let uu____6209 = list_elements tl1 in
                 FStar_Util.must uu____6209 in
               hd1 :: uu____6205 in
             FStar_Pervasives_Native.Some uu____6201
         | uu____6218 -> FStar_Pervasives_Native.None)
let rec apply_last f l =
  match l with
  | [] -> failwith "apply_last: got empty list"
  | a::[] -> let uu____6252 = f a in [uu____6252]
  | x::xs -> let uu____6256 = apply_last f xs in x :: uu____6256
let dm4f_lid:
  FStar_Syntax_Syntax.eff_decl -> Prims.string -> FStar_Ident.lident =
  fun ed  ->
    fun name  ->
      let p = FStar_Ident.path_of_lid ed.FStar_Syntax_Syntax.mname in
      let p' =
        apply_last
          (fun s  ->
             Prims.strcat "_dm4f_" (Prims.strcat s (Prims.strcat "_" name)))
          p in
      FStar_Ident.lid_of_path p' FStar_Range.dummyRange
let rec mk_list:
  FStar_Syntax_Syntax.term ->
    FStar_Range.range ->
      FStar_Syntax_Syntax.term Prims.list -> FStar_Syntax_Syntax.term
  =
  fun typ  ->
    fun rng  ->
      fun l  ->
        let ctor l1 =
          let uu____6292 =
            let uu____6295 =
              let uu____6296 =
                FStar_Syntax_Syntax.lid_as_fv l1
                  FStar_Syntax_Syntax.Delta_constant
                  (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor) in
              FStar_Syntax_Syntax.Tm_fvar uu____6296 in
            FStar_Syntax_Syntax.mk uu____6295 in
          uu____6292 FStar_Pervasives_Native.None rng in
        let cons1 args pos =
          let uu____6314 =
            let uu____6315 =
              let uu____6316 = ctor FStar_Parser_Const.cons_lid in
              FStar_Syntax_Syntax.mk_Tm_uinst uu____6316
                [FStar_Syntax_Syntax.U_zero] in
            FStar_Syntax_Syntax.mk_Tm_app uu____6315 args in
          uu____6314 FStar_Pervasives_Native.None pos in
        let nil args pos =
          let uu____6330 =
            let uu____6331 =
              let uu____6332 = ctor FStar_Parser_Const.nil_lid in
              FStar_Syntax_Syntax.mk_Tm_uinst uu____6332
                [FStar_Syntax_Syntax.U_zero] in
            FStar_Syntax_Syntax.mk_Tm_app uu____6331 args in
          uu____6330 FStar_Pervasives_Native.None pos in
        let uu____6337 =
          let uu____6338 =
            let uu____6339 = FStar_Syntax_Syntax.iarg typ in [uu____6339] in
          nil uu____6338 rng in
        FStar_List.fold_right
          (fun t  ->
             fun a  ->
               let uu____6345 =
                 let uu____6346 = FStar_Syntax_Syntax.iarg typ in
                 let uu____6347 =
                   let uu____6349 = FStar_Syntax_Syntax.as_arg t in
                   let uu____6350 =
                     let uu____6352 = FStar_Syntax_Syntax.as_arg a in
                     [uu____6352] in
                   uu____6349 :: uu____6350 in
                 uu____6346 :: uu____6347 in
               cons1 uu____6345 t.FStar_Syntax_Syntax.pos) l uu____6337
let uvar_from_id id t =
  let uu____6370 =
    let uu____6373 =
      let uu____6374 =
        let uu____6385 = FStar_Syntax_Unionfind.from_id id in (uu____6385, t) in
      FStar_Syntax_Syntax.Tm_uvar uu____6374 in
    FStar_Syntax_Syntax.mk uu____6373 in
  uu____6370 FStar_Pervasives_Native.None FStar_Range.dummyRange
let rec eqlist eq1 xs ys =
  match (xs, ys) with
  | ([],[]) -> true
  | (x::xs1,y::ys1) -> (eq1 x y) && (eqlist eq1 xs1 ys1)
  | uu____6441 -> false
let eqsum e1 e2 x y =
  match (x, y) with
  | (FStar_Util.Inl x1,FStar_Util.Inl y1) -> e1 x1 y1
  | (FStar_Util.Inr x1,FStar_Util.Inr y1) -> e2 x1 y1
  | uu____6520 -> false
let eqprod e1 e2 x y =
  match (x, y) with | ((x1,x2),(y1,y2)) -> (e1 x1 y1) && (e2 x2 y2)
let eqopt e x y =
  match (x, y) with
  | (FStar_Pervasives_Native.Some x1,FStar_Pervasives_Native.Some y1) ->
      e x1 y1
  | uu____6638 -> false
let rec term_eq:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax -> Prims.bool
  =
  fun t1  ->
    fun t2  ->
      let canon_app t =
        match t.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_app uu____6733 ->
            let uu____6743 = head_and_args' t in
            (match uu____6743 with
             | (hd1,args) ->
                 let uu___176_6765 = t in
                 {
                   FStar_Syntax_Syntax.n =
                     (FStar_Syntax_Syntax.Tm_app (hd1, args));
                   FStar_Syntax_Syntax.tk =
                     (uu___176_6765.FStar_Syntax_Syntax.tk);
                   FStar_Syntax_Syntax.pos =
                     (uu___176_6765.FStar_Syntax_Syntax.pos)
                 })
        | uu____6775 -> t in
      let t11 = canon_app t1 in
      let t21 = canon_app t2 in
      match ((t11.FStar_Syntax_Syntax.n), (t21.FStar_Syntax_Syntax.n)) with
      | (FStar_Syntax_Syntax.Tm_bvar x,FStar_Syntax_Syntax.Tm_bvar y) ->
          x.FStar_Syntax_Syntax.index = y.FStar_Syntax_Syntax.index
      | (FStar_Syntax_Syntax.Tm_name x,FStar_Syntax_Syntax.Tm_name y) ->
          FStar_Syntax_Syntax.bv_eq x y
      | (FStar_Syntax_Syntax.Tm_fvar x,FStar_Syntax_Syntax.Tm_fvar y) ->
          FStar_Syntax_Syntax.fv_eq x y
      | (FStar_Syntax_Syntax.Tm_uinst (t12,us1),FStar_Syntax_Syntax.Tm_uinst
         (t22,us2)) -> (eqlist eq_univs us1 us2) && (term_eq t12 t22)
      | (FStar_Syntax_Syntax.Tm_constant x,FStar_Syntax_Syntax.Tm_constant y)
          -> x = y
      | (FStar_Syntax_Syntax.Tm_type x,FStar_Syntax_Syntax.Tm_type y) ->
          x = y
      | (FStar_Syntax_Syntax.Tm_abs (b1,t12,k1),FStar_Syntax_Syntax.Tm_abs
         (b2,t22,k2)) -> (eqlist binder_eq b1 b2) && (term_eq t12 t22)
      | (FStar_Syntax_Syntax.Tm_app (f1,a1),FStar_Syntax_Syntax.Tm_app
         (f2,a2)) -> (term_eq f1 f2) && (eqlist arg_eq a1 a2)
      | (FStar_Syntax_Syntax.Tm_arrow (b1,c1),FStar_Syntax_Syntax.Tm_arrow
         (b2,c2)) -> (eqlist binder_eq b1 b2) && (comp_eq c1 c2)
      | (FStar_Syntax_Syntax.Tm_refine (b1,t12),FStar_Syntax_Syntax.Tm_refine
         (b2,t22)) -> (FStar_Syntax_Syntax.bv_eq b1 b2) && (term_eq t12 t22)
      | (FStar_Syntax_Syntax.Tm_match (t12,bs1),FStar_Syntax_Syntax.Tm_match
         (t22,bs2)) -> (term_eq t12 t22) && (eqlist branch_eq bs1 bs2)
      | (uu____6971,uu____6972) -> false
and arg_eq:
  ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
     FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 ->
    ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
       FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 -> Prims.bool
  =
  fun a1  -> fun a2  -> eqprod term_eq (fun q1  -> fun q2  -> q1 = q2) a1 a2
and binder_eq:
  (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 -> Prims.bool
  =
  fun b1  ->
    fun b2  ->
      eqprod
        (fun b11  ->
           fun b21  ->
             term_eq b11.FStar_Syntax_Syntax.sort
               b21.FStar_Syntax_Syntax.sort) (fun q1  -> fun q2  -> q1 = q2)
        b1 b2
and lcomp_eq:
  FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun c1  -> fun c2  -> false
and residual_eq:
  FStar_Syntax_Syntax.residual_comp ->
    FStar_Syntax_Syntax.residual_comp -> Prims.bool
  = fun r1  -> fun r2  -> false
and comp_eq:
  (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
    (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
      Prims.bool
  =
  fun c1  ->
    fun c2  ->
      match ((c1.FStar_Syntax_Syntax.n), (c2.FStar_Syntax_Syntax.n)) with
      | (FStar_Syntax_Syntax.Total (t1,u1),FStar_Syntax_Syntax.Total (t2,u2))
          -> term_eq t1 t2
      | (FStar_Syntax_Syntax.GTotal (t1,u1),FStar_Syntax_Syntax.GTotal
         (t2,u2)) -> term_eq t1 t2
      | (FStar_Syntax_Syntax.Comp c11,FStar_Syntax_Syntax.Comp c21) ->
          ((((c11.FStar_Syntax_Syntax.comp_univs =
                c21.FStar_Syntax_Syntax.comp_univs)
               &&
               (c11.FStar_Syntax_Syntax.effect_name =
                  c21.FStar_Syntax_Syntax.effect_name))
              &&
              (term_eq c11.FStar_Syntax_Syntax.result_typ
                 c21.FStar_Syntax_Syntax.result_typ))
             &&
             (eqlist arg_eq c11.FStar_Syntax_Syntax.effect_args
                c21.FStar_Syntax_Syntax.effect_args))
            &&
            (eq_flags c11.FStar_Syntax_Syntax.flags
               c21.FStar_Syntax_Syntax.flags)
      | (uu____7051,uu____7052) -> false
and eq_flags:
  FStar_Syntax_Syntax.cflags Prims.list ->
    FStar_Syntax_Syntax.cflags Prims.list -> Prims.bool
  = fun f1  -> fun f2  -> false
and branch_eq:
  (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t,(FStar_Syntax_Syntax.term',
                                                             FStar_Syntax_Syntax.term')
                                                             FStar_Syntax_Syntax.syntax
                                                             FStar_Pervasives_Native.option,
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax)
    FStar_Pervasives_Native.tuple3 ->
    (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t,(FStar_Syntax_Syntax.term',
                                                               FStar_Syntax_Syntax.term')
                                                               FStar_Syntax_Syntax.syntax
                                                               FStar_Pervasives_Native.option,
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax)
      FStar_Pervasives_Native.tuple3 -> Prims.bool
  =
  fun uu____7057  ->
    fun uu____7058  ->
      match (uu____7057, uu____7058) with | ((p1,w1,t1),(p2,w2,t2)) -> false
let rec bottom_fold:
  (FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun f  ->
    fun t  ->
      let ff = bottom_fold f in
      let tn =
        let uu____7160 = FStar_Syntax_Subst.compress t in
        uu____7160.FStar_Syntax_Syntax.n in
      let tn1 =
        match tn with
        | FStar_Syntax_Syntax.Tm_app (f1,args) ->
            let uu____7180 =
              let uu____7190 = ff f1 in
              let uu____7191 =
                FStar_List.map
                  (fun uu____7203  ->
                     match uu____7203 with
                     | (a,q) -> let uu____7210 = ff a in (uu____7210, q))
                  args in
              (uu____7190, uu____7191) in
            FStar_Syntax_Syntax.Tm_app uu____7180
        | FStar_Syntax_Syntax.Tm_abs (bs,t1,k) ->
            let uu____7229 = FStar_Syntax_Subst.open_term bs t1 in
            (match uu____7229 with
             | (bs1,t') ->
                 let t'' = ff t' in
                 let uu____7235 =
                   let uu____7245 = FStar_Syntax_Subst.close bs1 t'' in
                   (bs1, uu____7245, k) in
                 FStar_Syntax_Syntax.Tm_abs uu____7235)
        | FStar_Syntax_Syntax.Tm_arrow (bs,k) -> tn
        | FStar_Syntax_Syntax.Tm_uinst (t1,us) ->
            let uu____7265 = let uu____7270 = ff t1 in (uu____7270, us) in
            FStar_Syntax_Syntax.Tm_uinst uu____7265
        | uu____7271 -> tn in
      f
        (let uu___177_7274 = t in
         {
           FStar_Syntax_Syntax.n = tn1;
           FStar_Syntax_Syntax.tk = (uu___177_7274.FStar_Syntax_Syntax.tk);
           FStar_Syntax_Syntax.pos = (uu___177_7274.FStar_Syntax_Syntax.pos)
         })
let rec sizeof: FStar_Syntax_Syntax.term -> Prims.int =
  fun t  ->
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____7281 ->
        let uu____7296 =
          let uu____7297 = FStar_Syntax_Subst.compress t in sizeof uu____7297 in
        (Prims.parse_int "1") + uu____7296
    | FStar_Syntax_Syntax.Tm_bvar bv ->
        let uu____7299 = sizeof bv.FStar_Syntax_Syntax.sort in
        (Prims.parse_int "1") + uu____7299
    | FStar_Syntax_Syntax.Tm_name bv ->
        let uu____7301 = sizeof bv.FStar_Syntax_Syntax.sort in
        (Prims.parse_int "1") + uu____7301
    | FStar_Syntax_Syntax.Tm_uinst (t1,us) ->
        let uu____7308 = sizeof t1 in (FStar_List.length us) + uu____7308
    | FStar_Syntax_Syntax.Tm_abs (bs,t1,uu____7317) ->
        let uu____7330 = sizeof t1 in
        let uu____7331 =
          FStar_List.fold_left
            (fun acc  ->
               fun uu____7340  ->
                 match uu____7340 with
                 | (bv,uu____7344) ->
                     let uu____7345 = sizeof bv.FStar_Syntax_Syntax.sort in
                     acc + uu____7345) (Prims.parse_int "0") bs in
        uu____7330 + uu____7331
    | FStar_Syntax_Syntax.Tm_app (hd1,args) ->
        let uu____7362 = sizeof hd1 in
        let uu____7363 =
          FStar_List.fold_left
            (fun acc  ->
               fun uu____7372  ->
                 match uu____7372 with
                 | (arg,uu____7376) ->
                     let uu____7377 = sizeof arg in acc + uu____7377)
            (Prims.parse_int "0") args in
        uu____7362 + uu____7363
    | uu____7378 -> Prims.parse_int "1"
let is_synth_by_tactic: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____7383 =
      let uu____7384 = un_uinst t in uu____7384.FStar_Syntax_Syntax.n in
    match uu____7383 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.synth_lid
    | uu____7388 -> false
let mk_alien b s r =
  let uu____7412 =
    let uu____7415 =
      let uu____7416 =
        let uu____7421 =
          let uu____7422 =
            let uu____7425 = FStar_Dyn.mkdyn b in (uu____7425, s) in
          FStar_Syntax_Syntax.Meta_alien uu____7422 in
        (FStar_Syntax_Syntax.tun, uu____7421) in
      FStar_Syntax_Syntax.Tm_meta uu____7416 in
    FStar_Syntax_Syntax.mk uu____7415 in
  uu____7412 FStar_Pervasives_Native.None
    (match r with
     | FStar_Pervasives_Native.Some r1 -> r1
     | FStar_Pervasives_Native.None  -> FStar_Range.dummyRange)
let un_alien: FStar_Syntax_Syntax.term -> FStar_Dyn.dyn =
  fun t  ->
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_meta
        (uu____7442,FStar_Syntax_Syntax.Meta_alien (blob,uu____7444)) -> blob
    | uu____7449 -> failwith "Something paranormal occurred"
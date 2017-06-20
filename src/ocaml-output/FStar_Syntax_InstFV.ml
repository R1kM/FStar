open Prims
type inst_t = (FStar_Ident.lident * FStar_Syntax_Syntax.universes) Prims.list
let mk t s =
  let uu____31 = FStar_ST.read t.FStar_Syntax_Syntax.tk  in
  FStar_Syntax_Syntax.mk s uu____31 t.FStar_Syntax_Syntax.pos 
let rec inst :
  (FStar_Syntax_Syntax.term ->
     FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.term)
    -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun s  ->
    fun t  ->
      let t1 = FStar_Syntax_Subst.compress t  in
      let mk1 = mk t1  in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_delayed uu____118 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_name uu____133 -> t1
      | FStar_Syntax_Syntax.Tm_uvar uu____134 -> t1
      | FStar_Syntax_Syntax.Tm_uvar uu____143 -> t1
      | FStar_Syntax_Syntax.Tm_type uu____152 -> t1
      | FStar_Syntax_Syntax.Tm_bvar uu____153 -> t1
      | FStar_Syntax_Syntax.Tm_constant uu____154 -> t1
      | FStar_Syntax_Syntax.Tm_unknown  -> t1
      | FStar_Syntax_Syntax.Tm_uinst uu____155 -> t1
      | FStar_Syntax_Syntax.Tm_fvar fv -> s t1 fv
      | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
          let bs1 = inst_binders s bs  in
          let body1 = inst s body  in
          let uu____178 =
            let uu____179 =
              let uu____189 = inst_lcomp_opt s lopt  in
              (bs1, body1, uu____189)  in
            FStar_Syntax_Syntax.Tm_abs uu____179  in
          mk1 uu____178
      | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
          let bs1 = inst_binders s bs  in
          let c1 = inst_comp s c  in
          mk1 (FStar_Syntax_Syntax.Tm_arrow (bs1, c1))
      | FStar_Syntax_Syntax.Tm_refine (bv,t2) ->
          let bv1 =
            let uu___157_217 = bv  in
            let uu____218 = inst s bv.FStar_Syntax_Syntax.sort  in
            {
              FStar_Syntax_Syntax.ppname =
                (uu___157_217.FStar_Syntax_Syntax.ppname);
              FStar_Syntax_Syntax.index =
                (uu___157_217.FStar_Syntax_Syntax.index);
              FStar_Syntax_Syntax.sort = uu____218
            }  in
          let t3 = inst s t2  in
          mk1 (FStar_Syntax_Syntax.Tm_refine (bv1, t3))
      | FStar_Syntax_Syntax.Tm_app (t2,args) ->
          let uu____238 =
            let uu____239 =
              let uu____249 = inst s t2  in
              let uu____250 = inst_args s args  in (uu____249, uu____250)  in
            FStar_Syntax_Syntax.Tm_app uu____239  in
          mk1 uu____238
      | FStar_Syntax_Syntax.Tm_match (t2,pats) ->
          let pats1 =
            FStar_All.pipe_right pats
              (FStar_List.map
                 (fun uu____327  ->
                    match uu____327 with
                    | (p,wopt,t3) ->
                        let wopt1 =
                          match wopt with
                          | None  -> None
                          | Some w ->
                              let uu____353 = inst s w  in Some uu____353
                           in
                        let t4 = inst s t3  in (p, wopt1, t4)))
             in
          let uu____358 =
            let uu____359 = let uu____375 = inst s t2  in (uu____375, pats1)
               in
            FStar_Syntax_Syntax.Tm_match uu____359  in
          mk1 uu____358
      | FStar_Syntax_Syntax.Tm_ascribed (t11,asc,f) ->
          let inst_asc uu____431 =
            match uu____431 with
            | (annot,topt) ->
                let topt1 = FStar_Util.map_opt topt (inst s)  in
                let annot1 =
                  match annot with
                  | FStar_Util.Inl t2 ->
                      let uu____472 = inst s t2  in FStar_Util.Inl uu____472
                  | FStar_Util.Inr c ->
                      let uu____480 = inst_comp s c  in
                      FStar_Util.Inr uu____480
                   in
                (annot1, topt1)
             in
          let uu____490 =
            let uu____491 =
              let uu____509 = inst s t11  in
              let uu____510 = inst_asc asc  in (uu____509, uu____510, f)  in
            FStar_Syntax_Syntax.Tm_ascribed uu____491  in
          mk1 uu____490
      | FStar_Syntax_Syntax.Tm_let (lbs,t2) ->
          let lbs1 =
            let uu____542 =
              FStar_All.pipe_right (snd lbs)
                (FStar_List.map
                   (fun lb  ->
                      let uu___158_548 = lb  in
                      let uu____549 = inst s lb.FStar_Syntax_Syntax.lbtyp  in
                      let uu____552 = inst s lb.FStar_Syntax_Syntax.lbdef  in
                      {
                        FStar_Syntax_Syntax.lbname =
                          (uu___158_548.FStar_Syntax_Syntax.lbname);
                        FStar_Syntax_Syntax.lbunivs =
                          (uu___158_548.FStar_Syntax_Syntax.lbunivs);
                        FStar_Syntax_Syntax.lbtyp = uu____549;
                        FStar_Syntax_Syntax.lbeff =
                          (uu___158_548.FStar_Syntax_Syntax.lbeff);
                        FStar_Syntax_Syntax.lbdef = uu____552
                      }))
               in
            ((fst lbs), uu____542)  in
          let uu____557 =
            let uu____558 = let uu____566 = inst s t2  in (lbs1, uu____566)
               in
            FStar_Syntax_Syntax.Tm_let uu____558  in
          mk1 uu____557
      | FStar_Syntax_Syntax.Tm_meta
          (t2,FStar_Syntax_Syntax.Meta_pattern args) ->
          let uu____582 =
            let uu____583 =
              let uu____588 = inst s t2  in
              let uu____589 =
                let uu____590 =
                  FStar_All.pipe_right args (FStar_List.map (inst_args s))
                   in
                FStar_Syntax_Syntax.Meta_pattern uu____590  in
              (uu____588, uu____589)  in
            FStar_Syntax_Syntax.Tm_meta uu____583  in
          mk1 uu____582
      | FStar_Syntax_Syntax.Tm_meta
          (t2,FStar_Syntax_Syntax.Meta_monadic (m,t')) ->
          let uu____630 =
            let uu____631 =
              let uu____636 = inst s t2  in
              let uu____637 =
                let uu____638 = let uu____643 = inst s t'  in (m, uu____643)
                   in
                FStar_Syntax_Syntax.Meta_monadic uu____638  in
              (uu____636, uu____637)  in
            FStar_Syntax_Syntax.Tm_meta uu____631  in
          mk1 uu____630
      | FStar_Syntax_Syntax.Tm_meta (t2,tag) ->
          let uu____650 =
            let uu____651 = let uu____656 = inst s t2  in (uu____656, tag)
               in
            FStar_Syntax_Syntax.Tm_meta uu____651  in
          mk1 uu____650

and inst_binders :
  (FStar_Syntax_Syntax.term ->
     FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.term)
    ->
    FStar_Syntax_Syntax.binders ->
      (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list
  =
  fun s  ->
    fun bs  ->
      FStar_All.pipe_right bs
        (FStar_List.map
           (fun uu____670  ->
              match uu____670 with
              | (x,imp) ->
                  let uu____677 =
                    let uu___159_678 = x  in
                    let uu____679 = inst s x.FStar_Syntax_Syntax.sort  in
                    {
                      FStar_Syntax_Syntax.ppname =
                        (uu___159_678.FStar_Syntax_Syntax.ppname);
                      FStar_Syntax_Syntax.index =
                        (uu___159_678.FStar_Syntax_Syntax.index);
                      FStar_Syntax_Syntax.sort = uu____679
                    }  in
                  (uu____677, imp)))

and inst_args :
  (FStar_Syntax_Syntax.term ->
     FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.term)
    ->
    ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list ->
      (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual) Prims.list
  =
  fun s  ->
    fun args  ->
      FStar_All.pipe_right args
        (FStar_List.map
           (fun uu____705  ->
              match uu____705 with
              | (a,imp) -> let uu____712 = inst s a  in (uu____712, imp)))

and inst_comp :
  (FStar_Syntax_Syntax.term ->
     FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.term)
    ->
    (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.comp
  =
  fun s  ->
    fun c  ->
      match c.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Total (t,uopt) ->
          let uu____731 = inst s t  in
          FStar_Syntax_Syntax.mk_Total' uu____731 uopt
      | FStar_Syntax_Syntax.GTotal (t,uopt) ->
          let uu____740 = inst s t  in
          FStar_Syntax_Syntax.mk_GTotal' uu____740 uopt
      | FStar_Syntax_Syntax.Comp ct ->
          let ct1 =
            let uu___160_743 = ct  in
            let uu____744 = inst s ct.FStar_Syntax_Syntax.result_typ  in
            let uu____747 = inst_args s ct.FStar_Syntax_Syntax.effect_args
               in
            let uu____753 =
              FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags
                (FStar_List.map
                   (fun uu___156_757  ->
                      match uu___156_757 with
                      | FStar_Syntax_Syntax.DECREASES t ->
                          let uu____761 = inst s t  in
                          FStar_Syntax_Syntax.DECREASES uu____761
                      | f -> f))
               in
            {
              FStar_Syntax_Syntax.comp_univs =
                (uu___160_743.FStar_Syntax_Syntax.comp_univs);
              FStar_Syntax_Syntax.effect_name =
                (uu___160_743.FStar_Syntax_Syntax.effect_name);
              FStar_Syntax_Syntax.result_typ = uu____744;
              FStar_Syntax_Syntax.effect_args = uu____747;
              FStar_Syntax_Syntax.flags = uu____753
            }  in
          FStar_Syntax_Syntax.mk_Comp ct1

and inst_lcomp_opt :
  (FStar_Syntax_Syntax.term ->
     FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.term)
    ->
    FStar_Syntax_Syntax.residual_comp option ->
      FStar_Syntax_Syntax.residual_comp option
  =
  fun s  ->
    fun l  ->
      match l with
      | None  -> None
      | Some rc ->
          let uu____774 =
            let uu___161_775 = rc  in
            let uu____776 =
              FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ (inst s)
               in
            {
              FStar_Syntax_Syntax.residual_effect =
                (uu___161_775.FStar_Syntax_Syntax.residual_effect);
              FStar_Syntax_Syntax.residual_typ = uu____776;
              FStar_Syntax_Syntax.residual_flags =
                (uu___161_775.FStar_Syntax_Syntax.residual_flags)
            }  in
          Some uu____774

let instantiate :
  inst_t -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun i  ->
    fun t  ->
      match i with
      | [] -> t
      | uu____792 ->
          let inst_fv t1 fv =
            let uu____800 =
              FStar_Util.find_opt
                (fun uu____806  ->
                   match uu____806 with
                   | (x,uu____810) ->
                       FStar_Ident.lid_equals x
                         (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v)
                i
               in
            match uu____800 with
            | None  -> t1
            | Some (uu____817,us) ->
                mk t1 (FStar_Syntax_Syntax.Tm_uinst (t1, us))
             in
          inst inst_fv t
  
open Prims
type local_binding =
  (FStar_Ident.ident * FStar_Syntax_Syntax.bv * Prims.bool)
type rec_binding =
  (FStar_Ident.ident * FStar_Ident.lid * FStar_Syntax_Syntax.delta_depth)
type module_abbrev = (FStar_Ident.ident * FStar_Ident.lident)
type open_kind =
  | Open_module 
  | Open_namespace 
let uu___is_Open_module : open_kind -> Prims.bool =
  fun projectee  ->
    match projectee with | Open_module  -> true | uu____13 -> false
  
let uu___is_Open_namespace : open_kind -> Prims.bool =
  fun projectee  ->
    match projectee with | Open_namespace  -> true | uu____18 -> false
  
type open_module_or_namespace = (FStar_Ident.lident * open_kind)
type record_or_dc =
  {
  typename: FStar_Ident.lident ;
  constrname: FStar_Ident.ident ;
  parms: FStar_Syntax_Syntax.binders ;
  fields: (FStar_Ident.ident * FStar_Syntax_Syntax.typ) Prims.list ;
  is_private_or_abstract: Prims.bool ;
  is_record: Prims.bool }
let __proj__Mkrecord_or_dc__item__typename :
  record_or_dc -> FStar_Ident.lident =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__typename
  
let __proj__Mkrecord_or_dc__item__constrname :
  record_or_dc -> FStar_Ident.ident =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__constrname
  
let __proj__Mkrecord_or_dc__item__parms :
  record_or_dc -> FStar_Syntax_Syntax.binders =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__parms
  
let __proj__Mkrecord_or_dc__item__fields :
  record_or_dc -> (FStar_Ident.ident * FStar_Syntax_Syntax.typ) Prims.list =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__fields
  
let __proj__Mkrecord_or_dc__item__is_private_or_abstract :
  record_or_dc -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__is_private_or_abstract
  
let __proj__Mkrecord_or_dc__item__is_record : record_or_dc -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__is_record
  
type scope_mod =
  | Local_binding of local_binding 
  | Rec_binding of rec_binding 
  | Module_abbrev of module_abbrev 
  | Open_module_or_namespace of open_module_or_namespace 
  | Top_level_def of FStar_Ident.ident 
  | Record_or_dc of record_or_dc 
let uu___is_Local_binding : scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Local_binding _0 -> true | uu____161 -> false
  
let __proj__Local_binding__item___0 : scope_mod -> local_binding =
  fun projectee  -> match projectee with | Local_binding _0 -> _0 
let uu___is_Rec_binding : scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Rec_binding _0 -> true | uu____175 -> false
  
let __proj__Rec_binding__item___0 : scope_mod -> rec_binding =
  fun projectee  -> match projectee with | Rec_binding _0 -> _0 
let uu___is_Module_abbrev : scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Module_abbrev _0 -> true | uu____189 -> false
  
let __proj__Module_abbrev__item___0 : scope_mod -> module_abbrev =
  fun projectee  -> match projectee with | Module_abbrev _0 -> _0 
let uu___is_Open_module_or_namespace : scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with
    | Open_module_or_namespace _0 -> true
    | uu____203 -> false
  
let __proj__Open_module_or_namespace__item___0 :
  scope_mod -> open_module_or_namespace =
  fun projectee  -> match projectee with | Open_module_or_namespace _0 -> _0 
let uu___is_Top_level_def : scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Top_level_def _0 -> true | uu____217 -> false
  
let __proj__Top_level_def__item___0 : scope_mod -> FStar_Ident.ident =
  fun projectee  -> match projectee with | Top_level_def _0 -> _0 
let uu___is_Record_or_dc : scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Record_or_dc _0 -> true | uu____231 -> false
  
let __proj__Record_or_dc__item___0 : scope_mod -> record_or_dc =
  fun projectee  -> match projectee with | Record_or_dc _0 -> _0 
type string_set = Prims.string FStar_Util.set
type exported_id_kind =
  | Exported_id_term_type 
  | Exported_id_field 
let uu___is_Exported_id_term_type : exported_id_kind -> Prims.bool =
  fun projectee  ->
    match projectee with
    | Exported_id_term_type  -> true
    | uu____245 -> false
  
let uu___is_Exported_id_field : exported_id_kind -> Prims.bool =
  fun projectee  ->
    match projectee with | Exported_id_field  -> true | uu____250 -> false
  
type exported_id_set = exported_id_kind -> string_set FStar_ST.ref
type env =
  {
  curmodule: FStar_Ident.lident option ;
  curmonad: FStar_Ident.ident option ;
  modules: (FStar_Ident.lident * FStar_Syntax_Syntax.modul) Prims.list ;
  scope_mods: scope_mod Prims.list ;
  exported_ids: exported_id_set FStar_Util.smap ;
  trans_exported_ids: exported_id_set FStar_Util.smap ;
  includes: FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap ;
  sigaccum: FStar_Syntax_Syntax.sigelts ;
  sigmap: (FStar_Syntax_Syntax.sigelt * Prims.bool) FStar_Util.smap ;
  iface: Prims.bool ;
  admitted_iface: Prims.bool ;
  expect_typ: Prims.bool ;
  docs: FStar_Parser_AST.fsdoc FStar_Util.smap ;
  remaining_iface_decls:
    (FStar_Ident.lident * FStar_Parser_AST.decl Prims.list) Prims.list ;
  syntax_only: Prims.bool }
let __proj__Mkenv__item__curmodule : env -> FStar_Ident.lident option =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__curmodule
  
let __proj__Mkenv__item__curmonad : env -> FStar_Ident.ident option =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__curmonad
  
let __proj__Mkenv__item__modules :
  env -> (FStar_Ident.lident * FStar_Syntax_Syntax.modul) Prims.list =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__modules
  
let __proj__Mkenv__item__scope_mods : env -> scope_mod Prims.list =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__scope_mods
  
let __proj__Mkenv__item__exported_ids :
  env -> exported_id_set FStar_Util.smap =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__exported_ids
  
let __proj__Mkenv__item__trans_exported_ids :
  env -> exported_id_set FStar_Util.smap =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__trans_exported_ids
  
let __proj__Mkenv__item__includes :
  env -> FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__includes
  
let __proj__Mkenv__item__sigaccum : env -> FStar_Syntax_Syntax.sigelts =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__sigaccum
  
let __proj__Mkenv__item__sigmap :
  env -> (FStar_Syntax_Syntax.sigelt * Prims.bool) FStar_Util.smap =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__sigmap
  
let __proj__Mkenv__item__iface : env -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__iface
  
let __proj__Mkenv__item__admitted_iface : env -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__admitted_iface
  
let __proj__Mkenv__item__expect_typ : env -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__expect_typ
  
let __proj__Mkenv__item__docs : env -> FStar_Parser_AST.fsdoc FStar_Util.smap
  =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__docs
  
let __proj__Mkenv__item__remaining_iface_decls :
  env -> (FStar_Ident.lident * FStar_Parser_AST.decl Prims.list) Prims.list =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} ->
        __fname__remaining_iface_decls
  
let __proj__Mkenv__item__syntax_only : env -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only;_} -> __fname__syntax_only
  
type foundname =
  | Term_name of (FStar_Syntax_Syntax.typ * Prims.bool) 
  | Eff_name of (FStar_Syntax_Syntax.sigelt * FStar_Ident.lident) 
let uu___is_Term_name : foundname -> Prims.bool =
  fun projectee  ->
    match projectee with | Term_name _0 -> true | uu____962 -> false
  
let __proj__Term_name__item___0 :
  foundname -> (FStar_Syntax_Syntax.typ * Prims.bool) =
  fun projectee  -> match projectee with | Term_name _0 -> _0 
let uu___is_Eff_name : foundname -> Prims.bool =
  fun projectee  ->
    match projectee with | Eff_name _0 -> true | uu____984 -> false
  
let __proj__Eff_name__item___0 :
  foundname -> (FStar_Syntax_Syntax.sigelt * FStar_Ident.lident) =
  fun projectee  -> match projectee with | Eff_name _0 -> _0 
let set_iface : env -> Prims.bool -> env =
  fun env  ->
    fun b  ->
      let uu___174_1007 = env  in
      {
        curmodule = (uu___174_1007.curmodule);
        curmonad = (uu___174_1007.curmonad);
        modules = (uu___174_1007.modules);
        scope_mods = (uu___174_1007.scope_mods);
        exported_ids = (uu___174_1007.exported_ids);
        trans_exported_ids = (uu___174_1007.trans_exported_ids);
        includes = (uu___174_1007.includes);
        sigaccum = (uu___174_1007.sigaccum);
        sigmap = (uu___174_1007.sigmap);
        iface = b;
        admitted_iface = (uu___174_1007.admitted_iface);
        expect_typ = (uu___174_1007.expect_typ);
        docs = (uu___174_1007.docs);
        remaining_iface_decls = (uu___174_1007.remaining_iface_decls);
        syntax_only = (uu___174_1007.syntax_only)
      }
  
let iface : env -> Prims.bool = fun e  -> e.iface 
let set_admitted_iface : env -> Prims.bool -> env =
  fun e  ->
    fun b  ->
      let uu___175_1020 = e  in
      {
        curmodule = (uu___175_1020.curmodule);
        curmonad = (uu___175_1020.curmonad);
        modules = (uu___175_1020.modules);
        scope_mods = (uu___175_1020.scope_mods);
        exported_ids = (uu___175_1020.exported_ids);
        trans_exported_ids = (uu___175_1020.trans_exported_ids);
        includes = (uu___175_1020.includes);
        sigaccum = (uu___175_1020.sigaccum);
        sigmap = (uu___175_1020.sigmap);
        iface = (uu___175_1020.iface);
        admitted_iface = b;
        expect_typ = (uu___175_1020.expect_typ);
        docs = (uu___175_1020.docs);
        remaining_iface_decls = (uu___175_1020.remaining_iface_decls);
        syntax_only = (uu___175_1020.syntax_only)
      }
  
let admitted_iface : env -> Prims.bool = fun e  -> e.admitted_iface 
let set_expect_typ : env -> Prims.bool -> env =
  fun e  ->
    fun b  ->
      let uu___176_1033 = e  in
      {
        curmodule = (uu___176_1033.curmodule);
        curmonad = (uu___176_1033.curmonad);
        modules = (uu___176_1033.modules);
        scope_mods = (uu___176_1033.scope_mods);
        exported_ids = (uu___176_1033.exported_ids);
        trans_exported_ids = (uu___176_1033.trans_exported_ids);
        includes = (uu___176_1033.includes);
        sigaccum = (uu___176_1033.sigaccum);
        sigmap = (uu___176_1033.sigmap);
        iface = (uu___176_1033.iface);
        admitted_iface = (uu___176_1033.admitted_iface);
        expect_typ = b;
        docs = (uu___176_1033.docs);
        remaining_iface_decls = (uu___176_1033.remaining_iface_decls);
        syntax_only = (uu___176_1033.syntax_only)
      }
  
let expect_typ : env -> Prims.bool = fun e  -> e.expect_typ 
let all_exported_id_kinds : exported_id_kind Prims.list =
  [Exported_id_field; Exported_id_term_type] 
let transitive_exported_ids :
  env -> FStar_Ident.lident -> Prims.string Prims.list =
  fun env  ->
    fun lid  ->
      let module_name = FStar_Ident.string_of_lid lid  in
      let uu____1049 =
        FStar_Util.smap_try_find env.trans_exported_ids module_name  in
      match uu____1049 with
      | None  -> []
      | Some exported_id_set ->
          let uu____1053 =
            let uu____1054 = exported_id_set Exported_id_term_type  in
            FStar_ST.read uu____1054  in
          FStar_All.pipe_right uu____1053 FStar_Util.set_elements
  
let open_modules :
  env -> (FStar_Ident.lident * FStar_Syntax_Syntax.modul) Prims.list =
  fun e  -> e.modules 
let set_current_module : env -> FStar_Ident.lident -> env =
  fun e  ->
    fun l  ->
      let uu___177_1075 = e  in
      {
        curmodule = (Some l);
        curmonad = (uu___177_1075.curmonad);
        modules = (uu___177_1075.modules);
        scope_mods = (uu___177_1075.scope_mods);
        exported_ids = (uu___177_1075.exported_ids);
        trans_exported_ids = (uu___177_1075.trans_exported_ids);
        includes = (uu___177_1075.includes);
        sigaccum = (uu___177_1075.sigaccum);
        sigmap = (uu___177_1075.sigmap);
        iface = (uu___177_1075.iface);
        admitted_iface = (uu___177_1075.admitted_iface);
        expect_typ = (uu___177_1075.expect_typ);
        docs = (uu___177_1075.docs);
        remaining_iface_decls = (uu___177_1075.remaining_iface_decls);
        syntax_only = (uu___177_1075.syntax_only)
      }
  
let current_module : env -> FStar_Ident.lident =
  fun env  ->
    match env.curmodule with
    | None  -> failwith "Unset current module"
    | Some m -> m
  
let iface_decls :
  env -> FStar_Ident.lident -> FStar_Parser_AST.decl Prims.list option =
  fun env  ->
    fun l  ->
      let uu____1091 =
        FStar_All.pipe_right env.remaining_iface_decls
          (FStar_List.tryFind
             (fun uu____1107  ->
                match uu____1107 with
                | (m,uu____1112) -> FStar_Ident.lid_equals l m))
         in
      match uu____1091 with
      | None  -> None
      | Some (uu____1121,decls) -> Some decls
  
let set_iface_decls :
  env -> FStar_Ident.lident -> FStar_Parser_AST.decl Prims.list -> env =
  fun env  ->
    fun l  ->
      fun ds  ->
        let uu____1143 =
          FStar_List.partition
            (fun uu____1157  ->
               match uu____1157 with
               | (m,uu____1162) -> FStar_Ident.lid_equals l m)
            env.remaining_iface_decls
           in
        match uu____1143 with
        | (uu____1165,rest) ->
            let uu___178_1183 = env  in
            {
              curmodule = (uu___178_1183.curmodule);
              curmonad = (uu___178_1183.curmonad);
              modules = (uu___178_1183.modules);
              scope_mods = (uu___178_1183.scope_mods);
              exported_ids = (uu___178_1183.exported_ids);
              trans_exported_ids = (uu___178_1183.trans_exported_ids);
              includes = (uu___178_1183.includes);
              sigaccum = (uu___178_1183.sigaccum);
              sigmap = (uu___178_1183.sigmap);
              iface = (uu___178_1183.iface);
              admitted_iface = (uu___178_1183.admitted_iface);
              expect_typ = (uu___178_1183.expect_typ);
              docs = (uu___178_1183.docs);
              remaining_iface_decls = ((l, ds) :: rest);
              syntax_only = (uu___178_1183.syntax_only)
            }
  
let qual : FStar_Ident.lident -> FStar_Ident.ident -> FStar_Ident.lident =
  FStar_Syntax_Util.qual_id 
let qualify : env -> FStar_Ident.ident -> FStar_Ident.lident =
  fun env  ->
    fun id  ->
      match env.curmonad with
      | None  -> let uu____1202 = current_module env  in qual uu____1202 id
      | Some monad ->
          let uu____1204 =
            let uu____1205 = current_module env  in qual uu____1205 monad  in
          FStar_Syntax_Util.mk_field_projector_name_from_ident uu____1204 id
  
let syntax_only : env -> Prims.bool = fun env  -> env.syntax_only 
let set_syntax_only : env -> Prims.bool -> env =
  fun env  ->
    fun b  ->
      let uu___179_1218 = env  in
      {
        curmodule = (uu___179_1218.curmodule);
        curmonad = (uu___179_1218.curmonad);
        modules = (uu___179_1218.modules);
        scope_mods = (uu___179_1218.scope_mods);
        exported_ids = (uu___179_1218.exported_ids);
        trans_exported_ids = (uu___179_1218.trans_exported_ids);
        includes = (uu___179_1218.includes);
        sigaccum = (uu___179_1218.sigaccum);
        sigmap = (uu___179_1218.sigmap);
        iface = (uu___179_1218.iface);
        admitted_iface = (uu___179_1218.admitted_iface);
        expect_typ = (uu___179_1218.expect_typ);
        docs = (uu___179_1218.docs);
        remaining_iface_decls = (uu___179_1218.remaining_iface_decls);
        syntax_only = b
      }
  
let new_sigmap uu____1228 = FStar_Util.smap_create (Prims.parse_int "100") 
let empty_env : Prims.unit -> env =
  fun uu____1232  ->
    let uu____1233 = new_sigmap ()  in
    let uu____1235 = new_sigmap ()  in
    let uu____1237 = new_sigmap ()  in
    let uu____1243 = new_sigmap ()  in
    let uu____1249 = new_sigmap ()  in
    {
      curmodule = None;
      curmonad = None;
      modules = [];
      scope_mods = [];
      exported_ids = uu____1233;
      trans_exported_ids = uu____1235;
      includes = uu____1237;
      sigaccum = [];
      sigmap = uu____1243;
      iface = false;
      admitted_iface = false;
      expect_typ = false;
      docs = uu____1249;
      remaining_iface_decls = [];
      syntax_only = false
    }
  
let sigmap : env -> (FStar_Syntax_Syntax.sigelt * Prims.bool) FStar_Util.smap
  = fun env  -> env.sigmap 
let has_all_in_scope : env -> Prims.bool =
  fun env  ->
    FStar_List.existsb
      (fun uu____1269  ->
         match uu____1269 with
         | (m,uu____1273) ->
             FStar_Ident.lid_equals m FStar_Parser_Const.all_lid) env.modules
  
let set_bv_range :
  FStar_Syntax_Syntax.bv -> FStar_Range.range -> FStar_Syntax_Syntax.bv =
  fun bv  ->
    fun r  ->
      let id =
        let uu___180_1283 = bv.FStar_Syntax_Syntax.ppname  in
        {
          FStar_Ident.idText = (uu___180_1283.FStar_Ident.idText);
          FStar_Ident.idRange = r
        }  in
      let uu___181_1284 = bv  in
      {
        FStar_Syntax_Syntax.ppname = id;
        FStar_Syntax_Syntax.index = (uu___181_1284.FStar_Syntax_Syntax.index);
        FStar_Syntax_Syntax.sort = (uu___181_1284.FStar_Syntax_Syntax.sort)
      }
  
let bv_to_name :
  FStar_Syntax_Syntax.bv -> FStar_Range.range -> FStar_Syntax_Syntax.term =
  fun bv  -> fun r  -> FStar_Syntax_Syntax.bv_to_name (set_bv_range bv r) 
let unmangleMap :
  (Prims.string * Prims.string * FStar_Syntax_Syntax.delta_depth *
    FStar_Syntax_Syntax.fv_qual option) Prims.list
  =
  [("op_ColonColon", "Cons", FStar_Syntax_Syntax.Delta_constant,
     (Some FStar_Syntax_Syntax.Data_ctor));
  ("not", "op_Negation", FStar_Syntax_Syntax.Delta_equational, None)] 
let unmangleOpName :
  FStar_Ident.ident -> (FStar_Syntax_Syntax.term * Prims.bool) option =
  fun id  ->
    let t =
      FStar_Util.find_map unmangleMap
        (fun uu____1333  ->
           match uu____1333 with
           | (x,y,dd,dq) ->
               if id.FStar_Ident.idText = x
               then
                 let uu____1347 =
                   let uu____1348 =
                     FStar_Ident.lid_of_path ["Prims"; y]
                       id.FStar_Ident.idRange
                      in
                   FStar_Syntax_Syntax.fvar uu____1348 dd dq  in
                 Some uu____1347
               else None)
       in
    match t with | Some v1 -> Some (v1, false) | None  -> None
  
type 'a cont_t =
  | Cont_ok of 'a 
  | Cont_fail 
  | Cont_ignore 
let uu___is_Cont_ok projectee =
  match projectee with | Cont_ok _0 -> true | uu____1381 -> false 
let __proj__Cont_ok__item___0 projectee =
  match projectee with | Cont_ok _0 -> _0 
let uu___is_Cont_fail projectee =
  match projectee with | Cont_fail  -> true | uu____1409 -> false 
let uu___is_Cont_ignore projectee =
  match projectee with | Cont_ignore  -> true | uu____1422 -> false 
let option_of_cont k_ignore uu___147_1444 =
  match uu___147_1444 with
  | Cont_ok a -> Some a
  | Cont_fail  -> None
  | Cont_ignore  -> k_ignore () 
let find_in_record ns id record cont =
  let typename' =
    FStar_Ident.lid_of_ids
      (FStar_List.append ns [(record.typename).FStar_Ident.ident])
     in
  if FStar_Ident.lid_equals typename' record.typename
  then
    let fname =
      FStar_Ident.lid_of_ids
        (FStar_List.append (record.typename).FStar_Ident.ns [id])
       in
    let find1 =
      FStar_Util.find_map record.fields
        (fun uu____1494  ->
           match uu____1494 with
           | (f,uu____1499) ->
               if id.FStar_Ident.idText = f.FStar_Ident.idText
               then Some record
               else None)
       in
    match find1 with | Some r -> cont r | None  -> Cont_ignore
  else Cont_ignore 
let get_exported_id_set : env -> Prims.string -> exported_id_set option =
  fun e  -> fun mname  -> FStar_Util.smap_try_find e.exported_ids mname 
let get_trans_exported_id_set : env -> Prims.string -> exported_id_set option
  =
  fun e  -> fun mname  -> FStar_Util.smap_try_find e.trans_exported_ids mname 
let string_of_exported_id_kind : exported_id_kind -> Prims.string =
  fun uu___148_1540  ->
    match uu___148_1540 with
    | Exported_id_field  -> "field"
    | Exported_id_term_type  -> "term/type"
  
let find_in_module_with_includes eikind find_in_module find_in_module_default
  env ns id =
  let idstr = id.FStar_Ident.idText  in
  let rec aux uu___149_1596 =
    match uu___149_1596 with
    | [] -> find_in_module_default
    | modul::q ->
        let mname = modul.FStar_Ident.str  in
        let not_shadowed =
          let uu____1604 = get_exported_id_set env mname  in
          match uu____1604 with
          | None  -> true
          | Some mex ->
              let mexports =
                let uu____1620 = mex eikind  in FStar_ST.read uu____1620  in
              FStar_Util.set_mem idstr mexports
           in
        let mincludes =
          let uu____1627 = FStar_Util.smap_try_find env.includes mname  in
          match uu____1627 with
          | None  -> []
          | Some minc -> FStar_ST.read minc  in
        let look_into =
          if not_shadowed
          then let uu____1647 = qual modul id  in find_in_module uu____1647
          else Cont_ignore  in
        (match look_into with
         | Cont_ignore  -> aux (FStar_List.append mincludes q)
         | uu____1650 -> look_into)
     in
  aux [ns] 
let is_exported_id_field : exported_id_kind -> Prims.bool =
  fun uu___150_1655  ->
    match uu___150_1655 with
    | Exported_id_field  -> true
    | uu____1656 -> false
  
let try_lookup_id'' env id eikind k_local_binding k_rec_binding k_record
  find_in_module lookup_default_id =
  let check_local_binding_id uu___151_1754 =
    match uu___151_1754 with
    | (id',uu____1756,uu____1757) ->
        id'.FStar_Ident.idText = id.FStar_Ident.idText
     in
  let check_rec_binding_id uu___152_1761 =
    match uu___152_1761 with
    | (id',uu____1763,uu____1764) ->
        id'.FStar_Ident.idText = id.FStar_Ident.idText
     in
  let curmod_ns =
    let uu____1767 = current_module env  in FStar_Ident.ids_of_lid uu____1767
     in
  let proc uu___153_1772 =
    match uu___153_1772 with
    | Local_binding l when check_local_binding_id l -> k_local_binding l
    | Rec_binding r when check_rec_binding_id r -> k_rec_binding r
    | Open_module_or_namespace (ns,uu____1777) ->
        find_in_module_with_includes eikind find_in_module Cont_ignore env ns
          id
    | Top_level_def id' when id'.FStar_Ident.idText = id.FStar_Ident.idText
        -> lookup_default_id Cont_ignore id
    | Record_or_dc r when is_exported_id_field eikind ->
        let uu____1780 = FStar_Ident.lid_of_ids curmod_ns  in
        find_in_module_with_includes Exported_id_field
          (fun lid  ->
             let id1 = lid.FStar_Ident.ident  in
             find_in_record lid.FStar_Ident.ns id1 r k_record) Cont_ignore
          env uu____1780 id
    | uu____1783 -> Cont_ignore  in
  let rec aux uu___154_1789 =
    match uu___154_1789 with
    | a::q ->
        let uu____1795 = proc a  in
        option_of_cont (fun uu____1797  -> aux q) uu____1795
    | [] ->
        let uu____1798 = lookup_default_id Cont_fail id  in
        option_of_cont (fun uu____1800  -> None) uu____1798
     in
  aux env.scope_mods 
let found_local_binding r uu____1823 =
  match uu____1823 with
  | (id',x,mut) -> let uu____1830 = bv_to_name x r  in (uu____1830, mut) 
let find_in_module env lid k_global_def k_not_found =
  let uu____1872 = FStar_Util.smap_try_find (sigmap env) lid.FStar_Ident.str
     in
  match uu____1872 with
  | Some sb -> k_global_def lid sb
  | None  -> k_not_found 
let try_lookup_id :
  env -> FStar_Ident.ident -> (FStar_Syntax_Syntax.term * Prims.bool) option
  =
  fun env  ->
    fun id  ->
      let uu____1896 = unmangleOpName id  in
      match uu____1896 with
      | Some f -> Some f
      | uu____1910 ->
          try_lookup_id'' env id Exported_id_term_type
            (fun r  ->
               let uu____1917 = found_local_binding id.FStar_Ident.idRange r
                  in
               Cont_ok uu____1917) (fun uu____1922  -> Cont_fail)
            (fun uu____1925  -> Cont_ignore)
            (fun i  ->
               find_in_module env i
                 (fun uu____1932  -> fun uu____1933  -> Cont_fail)
                 Cont_ignore)
            (fun uu____1940  -> fun uu____1941  -> Cont_fail)
  
let lookup_default_id env id k_global_def k_not_found =
  let find_in_monad =
    match env.curmonad with
    | Some uu____1998 ->
        let lid = qualify env id  in
        let uu____2000 =
          FStar_Util.smap_try_find (sigmap env) lid.FStar_Ident.str  in
        (match uu____2000 with
         | Some r -> let uu____2013 = k_global_def lid r  in Some uu____2013
         | None  -> None)
    | None  -> None  in
  match find_in_monad with
  | Some v1 -> v1
  | None  ->
      let lid = let uu____2026 = current_module env  in qual uu____2026 id
         in
      find_in_module env lid k_global_def k_not_found
  
let module_is_defined : env -> FStar_Ident.lident -> Prims.bool =
  fun env  ->
    fun lid  ->
      (match env.curmodule with
       | None  -> false
       | Some m ->
           let uu____2037 = current_module env  in
           FStar_Ident.lid_equals lid uu____2037)
        ||
        (FStar_List.existsb (fun x  -> FStar_Ident.lid_equals lid (fst x))
           env.modules)
  
let resolve_module_name :
  env -> FStar_Ident.lident -> Prims.bool -> FStar_Ident.lident option =
  fun env  ->
    fun lid  ->
      fun honor_ns  ->
        let nslen = FStar_List.length lid.FStar_Ident.ns  in
        let rec aux uu___155_2065 =
          match uu___155_2065 with
          | [] ->
              let uu____2068 = module_is_defined env lid  in
              if uu____2068 then Some lid else None
          | (Open_module_or_namespace (ns,Open_namespace ))::q when honor_ns
              ->
              let new_lid =
                let uu____2075 =
                  let uu____2077 = FStar_Ident.path_of_lid ns  in
                  let uu____2079 = FStar_Ident.path_of_lid lid  in
                  FStar_List.append uu____2077 uu____2079  in
                FStar_Ident.lid_of_path uu____2075
                  (FStar_Ident.range_of_lid lid)
                 in
              let uu____2081 = module_is_defined env new_lid  in
              if uu____2081 then Some new_lid else aux q
          | (Module_abbrev (name,modul))::uu____2086 when
              (nslen = (Prims.parse_int "0")) &&
                (name.FStar_Ident.idText =
                   (lid.FStar_Ident.ident).FStar_Ident.idText)
              -> Some modul
          | uu____2092::q -> aux q  in
        aux env.scope_mods
  
let fail_if_curmodule :
  env -> FStar_Ident.lident -> FStar_Ident.lident -> Prims.unit =
  fun env  ->
    fun ns_original  ->
      fun ns_resolved  ->
        let uu____2107 =
          let uu____2108 = current_module env  in
          FStar_Ident.lid_equals ns_resolved uu____2108  in
        if uu____2107
        then
          (if FStar_Ident.lid_equals ns_resolved FStar_Syntax_Const.prims_lid
           then ()
           else
             (let uu____2110 =
                let uu____2111 =
                  let uu____2114 =
                    FStar_Util.format1
                      "Reference %s to current module is forbidden (see GitHub issue #451)"
                      ns_original.FStar_Ident.str
                     in
                  (uu____2114, (FStar_Ident.range_of_lid ns_original))  in
                FStar_Errors.Error uu____2111  in
              raise uu____2110))
        else ()
  
let fail_if_qualified_by_curmodule : env -> FStar_Ident.lident -> Prims.unit
  =
  fun env  ->
    fun lid  ->
      match lid.FStar_Ident.ns with
      | [] -> ()
      | uu____2124 ->
          let modul_orig = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
          let uu____2127 = resolve_module_name env modul_orig true  in
          (match uu____2127 with
           | Some modul_res -> fail_if_curmodule env modul_orig modul_res
           | uu____2130 -> ())
  
let namespace_is_open : env -> FStar_Ident.lident -> Prims.bool =
  fun env  ->
    fun lid  ->
      FStar_List.existsb
        (fun uu___156_2140  ->
           match uu___156_2140 with
           | Open_module_or_namespace (ns,Open_namespace ) ->
               FStar_Ident.lid_equals lid ns
           | uu____2142 -> false) env.scope_mods
  
let shorten_module_path :
  env ->
    FStar_Ident.ident Prims.list ->
      Prims.bool ->
        (FStar_Ident.ident Prims.list * FStar_Ident.ident Prims.list)
  =
  fun env  ->
    fun ids  ->
      fun is_full_path  ->
        let rec aux revns id =
          let lid = FStar_Ident.lid_of_ns_and_id (FStar_List.rev revns) id
             in
          if namespace_is_open env lid
          then Some ((FStar_List.rev (id :: revns)), [])
          else
            (match revns with
             | [] -> None
             | ns_last_id::rev_ns_prefix ->
                 let uu____2200 = aux rev_ns_prefix ns_last_id  in
                 FStar_All.pipe_right uu____2200
                   (FStar_Util.map_option
                      (fun uu____2224  ->
                         match uu____2224 with
                         | (stripped_ids,rev_kept_ids) ->
                             (stripped_ids, (id :: rev_kept_ids)))))
           in
        let uu____2241 =
          is_full_path &&
            (let uu____2242 = FStar_Ident.lid_of_ids ids  in
             module_is_defined env uu____2242)
           in
        if uu____2241
        then (ids, [])
        else
          (match FStar_List.rev ids with
           | [] -> ([], [])
           | ns_last_id::ns_rev_prefix ->
               let uu____2259 = aux ns_rev_prefix ns_last_id  in
               (match uu____2259 with
                | None  -> ([], ids)
                | Some (stripped_ids,rev_kept_ids) ->
                    (stripped_ids, (FStar_List.rev rev_kept_ids))))
  
let shorten_lid : env -> FStar_Ident.lid -> FStar_Ident.lid =
  fun env  ->
    fun lid  ->
      let uu____2295 = shorten_module_path env lid.FStar_Ident.ns true  in
      match uu____2295 with
      | (uu____2300,short) ->
          FStar_Ident.lid_of_ns_and_id short lid.FStar_Ident.ident
  
let resolve_in_open_namespaces'' env lid eikind k_local_binding k_rec_binding
  k_record f_module l_default =
  match lid.FStar_Ident.ns with
  | uu____2400::uu____2401 ->
      let uu____2403 =
        let uu____2405 =
          let uu____2406 = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
          FStar_Ident.set_lid_range uu____2406 (FStar_Ident.range_of_lid lid)
           in
        resolve_module_name env uu____2405 true  in
      (match uu____2403 with
       | None  -> None
       | Some modul ->
           let uu____2409 =
             find_in_module_with_includes eikind f_module Cont_fail env modul
               lid.FStar_Ident.ident
              in
           option_of_cont (fun uu____2411  -> None) uu____2409)
  | [] ->
      try_lookup_id'' env lid.FStar_Ident.ident eikind k_local_binding
        k_rec_binding k_record f_module l_default
  
let cont_of_option k_none uu___157_2429 =
  match uu___157_2429 with | Some v1 -> Cont_ok v1 | None  -> k_none 
let resolve_in_open_namespaces' env lid k_local_binding k_rec_binding
  k_global_def =
  let k_global_def' k lid1 def =
    let uu____2514 = k_global_def lid1 def  in cont_of_option k uu____2514
     in
  let f_module lid' =
    let k = Cont_ignore  in find_in_module env lid' (k_global_def' k) k  in
  let l_default k i = lookup_default_id env i (k_global_def' k) k  in
  resolve_in_open_namespaces'' env lid Exported_id_term_type
    (fun l  ->
       let uu____2535 = k_local_binding l  in
       cont_of_option Cont_fail uu____2535)
    (fun r  ->
       let uu____2538 = k_rec_binding r  in
       cont_of_option Cont_fail uu____2538) (fun uu____2540  -> Cont_ignore)
    f_module l_default
  
let fv_qual_of_se :
  FStar_Syntax_Syntax.sigelt -> FStar_Syntax_Syntax.fv_qual option =
  fun se  ->
    match se.FStar_Syntax_Syntax.sigel with
    | FStar_Syntax_Syntax.Sig_datacon
        (uu____2547,uu____2548,uu____2549,l,uu____2551,uu____2552) ->
        let qopt =
          FStar_Util.find_map se.FStar_Syntax_Syntax.sigquals
            (fun uu___158_2557  ->
               match uu___158_2557 with
               | FStar_Syntax_Syntax.RecordConstructor (uu____2559,fs) ->
                   Some (FStar_Syntax_Syntax.Record_ctor (l, fs))
               | uu____2566 -> None)
           in
        (match qopt with
         | None  -> Some FStar_Syntax_Syntax.Data_ctor
         | x -> x)
    | FStar_Syntax_Syntax.Sig_declare_typ (uu____2570,uu____2571,uu____2572)
        -> None
    | uu____2573 -> None
  
let lb_fv :
  FStar_Syntax_Syntax.letbinding Prims.list ->
    FStar_Ident.lident -> FStar_Syntax_Syntax.fv
  =
  fun lbs  ->
    fun lid  ->
      let uu____2584 =
        FStar_Util.find_map lbs
          (fun lb  ->
             let fv = FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
             let uu____2588 = FStar_Syntax_Syntax.fv_eq_lid fv lid  in
             if uu____2588 then Some fv else None)
         in
      FStar_All.pipe_right uu____2584 FStar_Util.must
  
let ns_of_lid_equals : FStar_Ident.lident -> FStar_Ident.lident -> Prims.bool
  =
  fun lid  ->
    fun ns  ->
      ((FStar_List.length lid.FStar_Ident.ns) =
         (FStar_List.length (FStar_Ident.ids_of_lid ns)))
        &&
        (let uu____2608 = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
         FStar_Ident.lid_equals uu____2608 ns)
  
let try_lookup_name :
  Prims.bool -> Prims.bool -> env -> FStar_Ident.lident -> foundname option =
  fun any_val  ->
    fun exclude_interf  ->
      fun env  ->
        fun lid  ->
          let occurrence_range = FStar_Ident.range_of_lid lid  in
          let k_global_def source_lid uu___162_2637 =
            match uu___162_2637 with
            | (uu____2641,true ) when exclude_interf -> None
            | (se,uu____2643) ->
                (match se.FStar_Syntax_Syntax.sigel with
                 | FStar_Syntax_Syntax.Sig_inductive_typ uu____2645 ->
                     let uu____2654 =
                       let uu____2655 =
                         let uu____2658 =
                           FStar_Syntax_Syntax.fvar source_lid
                             FStar_Syntax_Syntax.Delta_constant None
                            in
                         (uu____2658, false)  in
                       Term_name uu____2655  in
                     Some uu____2654
                 | FStar_Syntax_Syntax.Sig_datacon uu____2659 ->
                     let uu____2667 =
                       let uu____2668 =
                         let uu____2671 =
                           let uu____2672 = fv_qual_of_se se  in
                           FStar_Syntax_Syntax.fvar source_lid
                             FStar_Syntax_Syntax.Delta_constant uu____2672
                            in
                         (uu____2671, false)  in
                       Term_name uu____2668  in
                     Some uu____2667
                 | FStar_Syntax_Syntax.Sig_let ((uu____2674,lbs),uu____2676)
                     ->
                     let fv = lb_fv lbs source_lid  in
                     let uu____2685 =
                       let uu____2686 =
                         let uu____2689 =
                           FStar_Syntax_Syntax.fvar source_lid
                             fv.FStar_Syntax_Syntax.fv_delta
                             fv.FStar_Syntax_Syntax.fv_qual
                            in
                         (uu____2689, false)  in
                       Term_name uu____2686  in
                     Some uu____2685
                 | FStar_Syntax_Syntax.Sig_declare_typ
                     (lid1,uu____2691,uu____2692) ->
                     let quals = se.FStar_Syntax_Syntax.sigquals  in
                     let uu____2695 =
                       any_val ||
                         (FStar_All.pipe_right quals
                            (FStar_Util.for_some
                               (fun uu___159_2697  ->
                                  match uu___159_2697 with
                                  | FStar_Syntax_Syntax.Assumption  -> true
                                  | uu____2698 -> false)))
                        in
                     if uu____2695
                     then
                       let lid2 =
                         FStar_Ident.set_lid_range lid1
                           (FStar_Ident.range_of_lid source_lid)
                          in
                       let dd =
                         let uu____2702 =
                           (FStar_Syntax_Util.is_primop_lid lid2) ||
                             (FStar_All.pipe_right quals
                                (FStar_Util.for_some
                                   (fun uu___160_2704  ->
                                      match uu___160_2704 with
                                      | FStar_Syntax_Syntax.Projector
                                          uu____2705 -> true
                                      | FStar_Syntax_Syntax.Discriminator
                                          uu____2708 -> true
                                      | uu____2709 -> false)))
                            in
                         if uu____2702
                         then FStar_Syntax_Syntax.Delta_equational
                         else FStar_Syntax_Syntax.Delta_constant  in
                       let uu____2711 =
                         FStar_Util.find_map quals
                           (fun uu___161_2713  ->
                              match uu___161_2713 with
                              | FStar_Syntax_Syntax.Reflectable refl_monad ->
                                  Some refl_monad
                              | uu____2716 -> None)
                          in
                       (match uu____2711 with
                        | Some refl_monad ->
                            let refl_const =
                              FStar_Syntax_Syntax.mk
                                (FStar_Syntax_Syntax.Tm_constant
                                   (FStar_Const.Const_reflect refl_monad))
                                None occurrence_range
                               in
                            Some (Term_name (refl_const, false))
                        | uu____2728 ->
                            let uu____2730 =
                              let uu____2731 =
                                let uu____2734 =
                                  let uu____2735 = fv_qual_of_se se  in
                                  FStar_Syntax_Syntax.fvar lid2 dd uu____2735
                                   in
                                (uu____2734, false)  in
                              Term_name uu____2731  in
                            Some uu____2730)
                     else None
                 | FStar_Syntax_Syntax.Sig_new_effect_for_free ne ->
                     Some
                       (Eff_name
                          (se,
                            (FStar_Ident.set_lid_range
                               ne.FStar_Syntax_Syntax.mname
                               (FStar_Ident.range_of_lid source_lid))))
                 | FStar_Syntax_Syntax.Sig_new_effect ne ->
                     Some
                       (Eff_name
                          (se,
                            (FStar_Ident.set_lid_range
                               ne.FStar_Syntax_Syntax.mname
                               (FStar_Ident.range_of_lid source_lid))))
                 | FStar_Syntax_Syntax.Sig_effect_abbrev uu____2740 ->
                     Some (Eff_name (se, source_lid))
                 | uu____2747 -> None)
             in
          let k_local_binding r =
            let uu____2759 =
              let uu____2760 =
                found_local_binding (FStar_Ident.range_of_lid lid) r  in
              Term_name uu____2760  in
            Some uu____2759  in
          let k_rec_binding uu____2770 =
            match uu____2770 with
            | (id,l,dd) ->
                let uu____2778 =
                  let uu____2779 =
                    let uu____2782 =
                      FStar_Syntax_Syntax.fvar
                        (FStar_Ident.set_lid_range l
                           (FStar_Ident.range_of_lid lid)) dd None
                       in
                    (uu____2782, false)  in
                  Term_name uu____2779  in
                Some uu____2778
             in
          let found_unmangled =
            match lid.FStar_Ident.ns with
            | [] ->
                let uu____2786 = unmangleOpName lid.FStar_Ident.ident  in
                (match uu____2786 with
                 | Some f -> Some (Term_name f)
                 | uu____2796 -> None)
            | uu____2800 -> None  in
          match found_unmangled with
          | None  ->
              resolve_in_open_namespaces' env lid k_local_binding
                k_rec_binding k_global_def
          | x -> x
  
let try_lookup_effect_name' :
  Prims.bool ->
    env ->
      FStar_Ident.lident ->
        (FStar_Syntax_Syntax.sigelt * FStar_Ident.lident) option
  =
  fun exclude_interf  ->
    fun env  ->
      fun lid  ->
        let uu____2823 = try_lookup_name true exclude_interf env lid  in
        match uu____2823 with
        | Some (Eff_name (o,l)) -> Some (o, l)
        | uu____2832 -> None
  
let try_lookup_effect_name :
  env -> FStar_Ident.lident -> FStar_Ident.lident option =
  fun env  ->
    fun l  ->
      let uu____2845 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l  in
      match uu____2845 with | Some (o,l1) -> Some l1 | uu____2854 -> None
  
let try_lookup_effect_name_and_attributes :
  env ->
    FStar_Ident.lident ->
      (FStar_Ident.lident * FStar_Syntax_Syntax.cflags Prims.list) option
  =
  fun env  ->
    fun l  ->
      let uu____2870 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l  in
      match uu____2870 with
      | Some
          ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect
               ne;
             FStar_Syntax_Syntax.sigrng = uu____2879;
             FStar_Syntax_Syntax.sigquals = uu____2880;
             FStar_Syntax_Syntax.sigmeta = uu____2881;
             FStar_Syntax_Syntax.sigattrs = uu____2882;_},l1)
          -> Some (l1, (ne.FStar_Syntax_Syntax.cattributes))
      | Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_new_effect_for_free ne;
             FStar_Syntax_Syntax.sigrng = uu____2893;
             FStar_Syntax_Syntax.sigquals = uu____2894;
             FStar_Syntax_Syntax.sigmeta = uu____2895;
             FStar_Syntax_Syntax.sigattrs = uu____2896;_},l1)
          -> Some (l1, (ne.FStar_Syntax_Syntax.cattributes))
      | Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_effect_abbrev
               (uu____2906,uu____2907,uu____2908,uu____2909,cattributes);
             FStar_Syntax_Syntax.sigrng = uu____2911;
             FStar_Syntax_Syntax.sigquals = uu____2912;
             FStar_Syntax_Syntax.sigmeta = uu____2913;
             FStar_Syntax_Syntax.sigattrs = uu____2914;_},l1)
          -> Some (l1, cattributes)
      | uu____2926 -> None
  
let try_lookup_effect_defn :
  env -> FStar_Ident.lident -> FStar_Syntax_Syntax.eff_decl option =
  fun env  ->
    fun l  ->
      let uu____2942 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l  in
      match uu____2942 with
      | Some
          ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect
               ne;
             FStar_Syntax_Syntax.sigrng = uu____2948;
             FStar_Syntax_Syntax.sigquals = uu____2949;
             FStar_Syntax_Syntax.sigmeta = uu____2950;
             FStar_Syntax_Syntax.sigattrs = uu____2951;_},uu____2952)
          -> Some ne
      | Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_new_effect_for_free ne;
             FStar_Syntax_Syntax.sigrng = uu____2958;
             FStar_Syntax_Syntax.sigquals = uu____2959;
             FStar_Syntax_Syntax.sigmeta = uu____2960;
             FStar_Syntax_Syntax.sigattrs = uu____2961;_},uu____2962)
          -> Some ne
      | uu____2967 -> None
  
let is_effect_name : env -> FStar_Ident.lident -> Prims.bool =
  fun env  ->
    fun lid  ->
      let uu____2979 = try_lookup_effect_name env lid  in
      match uu____2979 with | None  -> false | Some uu____2981 -> true
  
let try_lookup_root_effect_name :
  env -> FStar_Ident.lident -> FStar_Ident.lident option =
  fun env  ->
    fun l  ->
      let uu____2991 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l  in
      match uu____2991 with
      | Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_effect_abbrev
               (l',uu____2997,uu____2998,uu____2999,uu____3000);
             FStar_Syntax_Syntax.sigrng = uu____3001;
             FStar_Syntax_Syntax.sigquals = uu____3002;
             FStar_Syntax_Syntax.sigmeta = uu____3003;
             FStar_Syntax_Syntax.sigattrs = uu____3004;_},uu____3005)
          ->
          let rec aux new_name =
            let uu____3017 =
              FStar_Util.smap_try_find (sigmap env) new_name.FStar_Ident.str
               in
            match uu____3017 with
            | None  -> None
            | Some (s,uu____3027) ->
                (match s.FStar_Syntax_Syntax.sigel with
                 | FStar_Syntax_Syntax.Sig_new_effect_for_free ne ->
                     Some
                       (FStar_Ident.set_lid_range
                          ne.FStar_Syntax_Syntax.mname
                          (FStar_Ident.range_of_lid l))
                 | FStar_Syntax_Syntax.Sig_new_effect ne ->
                     Some
                       (FStar_Ident.set_lid_range
                          ne.FStar_Syntax_Syntax.mname
                          (FStar_Ident.range_of_lid l))
                 | FStar_Syntax_Syntax.Sig_effect_abbrev
                     (uu____3033,uu____3034,uu____3035,cmp,uu____3037) ->
                     let l'' = FStar_Syntax_Util.comp_effect_name cmp  in
                     aux l''
                 | uu____3041 -> None)
             in
          aux l'
      | Some (uu____3042,l') -> Some l'
      | uu____3046 -> None
  
let lookup_letbinding_quals :
  env -> FStar_Ident.lident -> FStar_Syntax_Syntax.qualifier Prims.list =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___163_3069 =
        match uu___163_3069 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ
               (uu____3074,uu____3075,uu____3076);
             FStar_Syntax_Syntax.sigrng = uu____3077;
             FStar_Syntax_Syntax.sigquals = quals;
             FStar_Syntax_Syntax.sigmeta = uu____3079;
             FStar_Syntax_Syntax.sigattrs = uu____3080;_},uu____3081)
            -> Some quals
        | uu____3085 -> None  in
      let uu____3089 =
        resolve_in_open_namespaces' env lid (fun uu____3093  -> None)
          (fun uu____3095  -> None) k_global_def
         in
      match uu____3089 with | Some quals -> quals | uu____3101 -> []
  
let try_lookup_module :
  env -> Prims.string Prims.list -> FStar_Syntax_Syntax.modul option =
  fun env  ->
    fun path  ->
      let uu____3115 =
        FStar_List.tryFind
          (fun uu____3121  ->
             match uu____3121 with
             | (mlid,modul) ->
                 let uu____3126 = FStar_Ident.path_of_lid mlid  in
                 uu____3126 = path) env.modules
         in
      match uu____3115 with
      | Some (uu____3130,modul) -> Some modul
      | None  -> None
  
let try_lookup_let :
  env -> FStar_Ident.lident -> FStar_Syntax_Syntax.term option =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___164_3154 =
        match uu___164_3154 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let
               ((uu____3158,lbs),uu____3160);
             FStar_Syntax_Syntax.sigrng = uu____3161;
             FStar_Syntax_Syntax.sigquals = uu____3162;
             FStar_Syntax_Syntax.sigmeta = uu____3163;
             FStar_Syntax_Syntax.sigattrs = uu____3164;_},uu____3165)
            ->
            let fv = lb_fv lbs lid1  in
            let uu____3176 =
              FStar_Syntax_Syntax.fvar lid1 fv.FStar_Syntax_Syntax.fv_delta
                fv.FStar_Syntax_Syntax.fv_qual
               in
            Some uu____3176
        | uu____3177 -> None  in
      resolve_in_open_namespaces' env lid (fun uu____3180  -> None)
        (fun uu____3181  -> None) k_global_def
  
let try_lookup_definition :
  env ->
    FStar_Ident.lident ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax option
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___165_3202 =
        match uu___165_3202 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let
               (lbs,uu____3209);
             FStar_Syntax_Syntax.sigrng = uu____3210;
             FStar_Syntax_Syntax.sigquals = uu____3211;
             FStar_Syntax_Syntax.sigmeta = uu____3212;
             FStar_Syntax_Syntax.sigattrs = uu____3213;_},uu____3214)
            ->
            FStar_Util.find_map (snd lbs)
              (fun lb  ->
                 match lb.FStar_Syntax_Syntax.lbname with
                 | FStar_Util.Inr fv when
                     FStar_Syntax_Syntax.fv_eq_lid fv lid1 ->
                     Some (lb.FStar_Syntax_Syntax.lbdef)
                 | uu____3229 -> None)
        | uu____3234 -> None  in
      resolve_in_open_namespaces' env lid (fun uu____3241  -> None)
        (fun uu____3244  -> None) k_global_def
  
let empty_include_smap :
  FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap = new_sigmap () 
let empty_exported_id_smap : exported_id_set FStar_Util.smap = new_sigmap () 
let try_lookup_lid' :
  Prims.bool ->
    Prims.bool ->
      env ->
        FStar_Ident.lident -> (FStar_Syntax_Syntax.term * Prims.bool) option
  =
  fun any_val  ->
    fun exclude_interf  ->
      fun env  ->
        fun lid  ->
          let uu____3275 = try_lookup_name any_val exclude_interf env lid  in
          match uu____3275 with
          | Some (Term_name (e,mut)) -> Some (e, mut)
          | uu____3284 -> None
  
let try_lookup_lid :
  env -> FStar_Ident.lident -> (FStar_Syntax_Syntax.term * Prims.bool) option
  = fun env  -> fun l  -> try_lookup_lid' env.iface false env l 
let resolve_to_fully_qualified_name :
  env -> FStar_Ident.lident -> FStar_Ident.lident option =
  fun env  ->
    fun l  ->
      let uu____3308 = try_lookup_lid env l  in
      match uu____3308 with
      | None  -> None
      | Some (e,uu____3316) ->
          let uu____3319 =
            let uu____3320 = FStar_Syntax_Subst.compress e  in
            uu____3320.FStar_Syntax_Syntax.n  in
          (match uu____3319 with
           | FStar_Syntax_Syntax.Tm_fvar fv ->
               Some ((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v)
           | uu____3329 -> None)
  
let try_lookup_lid_no_resolve :
  env -> FStar_Ident.lident -> (FStar_Syntax_Syntax.term * Prims.bool) option
  =
  fun env  ->
    fun l  ->
      let env' =
        let uu___182_3342 = env  in
        {
          curmodule = (uu___182_3342.curmodule);
          curmonad = (uu___182_3342.curmonad);
          modules = (uu___182_3342.modules);
          scope_mods = [];
          exported_ids = empty_exported_id_smap;
          trans_exported_ids = (uu___182_3342.trans_exported_ids);
          includes = empty_include_smap;
          sigaccum = (uu___182_3342.sigaccum);
          sigmap = (uu___182_3342.sigmap);
          iface = (uu___182_3342.iface);
          admitted_iface = (uu___182_3342.admitted_iface);
          expect_typ = (uu___182_3342.expect_typ);
          docs = (uu___182_3342.docs);
          remaining_iface_decls = (uu___182_3342.remaining_iface_decls);
          syntax_only = (uu___182_3342.syntax_only)
        }  in
      try_lookup_lid env' l
  
let try_lookup_doc : env -> FStar_Ident.lid -> FStar_Parser_AST.fsdoc option
  = fun env  -> fun l  -> FStar_Util.smap_try_find env.docs l.FStar_Ident.str 
let try_lookup_datacon :
  env -> FStar_Ident.lident -> FStar_Syntax_Syntax.fv option =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___167_3370 =
        match uu___167_3370 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ
               (uu____3374,uu____3375,uu____3376);
             FStar_Syntax_Syntax.sigrng = uu____3377;
             FStar_Syntax_Syntax.sigquals = quals;
             FStar_Syntax_Syntax.sigmeta = uu____3379;
             FStar_Syntax_Syntax.sigattrs = uu____3380;_},uu____3381)
            ->
            let uu____3384 =
              FStar_All.pipe_right quals
                (FStar_Util.for_some
                   (fun uu___166_3386  ->
                      match uu___166_3386 with
                      | FStar_Syntax_Syntax.Assumption  -> true
                      | uu____3387 -> false))
               in
            if uu____3384
            then
              let uu____3389 =
                FStar_Syntax_Syntax.lid_as_fv lid1
                  FStar_Syntax_Syntax.Delta_constant None
                 in
              Some uu____3389
            else None
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon
               uu____3391;
             FStar_Syntax_Syntax.sigrng = uu____3392;
             FStar_Syntax_Syntax.sigquals = uu____3393;
             FStar_Syntax_Syntax.sigmeta = uu____3394;
             FStar_Syntax_Syntax.sigattrs = uu____3395;_},uu____3396)
            ->
            let uu____3406 =
              FStar_Syntax_Syntax.lid_as_fv lid1
                FStar_Syntax_Syntax.Delta_constant
                (Some FStar_Syntax_Syntax.Data_ctor)
               in
            Some uu____3406
        | uu____3407 -> None  in
      resolve_in_open_namespaces' env lid (fun uu____3410  -> None)
        (fun uu____3411  -> None) k_global_def
  
let find_all_datacons :
  env -> FStar_Ident.lident -> FStar_Ident.lident Prims.list option =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___168_3432 =
        match uu___168_3432 with
        | ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_inductive_typ
               (uu____3437,uu____3438,uu____3439,uu____3440,datas,uu____3442);
             FStar_Syntax_Syntax.sigrng = uu____3443;
             FStar_Syntax_Syntax.sigquals = uu____3444;
             FStar_Syntax_Syntax.sigmeta = uu____3445;
             FStar_Syntax_Syntax.sigattrs = uu____3446;_},uu____3447)
            -> Some datas
        | uu____3455 -> None  in
      resolve_in_open_namespaces' env lid (fun uu____3460  -> None)
        (fun uu____3462  -> None) k_global_def
  
let record_cache_aux_with_filter :
  (((Prims.unit -> Prims.unit) * (Prims.unit -> Prims.unit) *
    (Prims.unit -> record_or_dc Prims.list) * (record_or_dc -> Prims.unit) *
    (Prims.unit -> Prims.unit)) * (Prims.unit -> Prims.unit))
  =
  let record_cache = FStar_Util.mk_ref [[]]  in
  let push1 uu____3496 =
    let uu____3497 =
      let uu____3500 =
        let uu____3502 = FStar_ST.read record_cache  in
        FStar_List.hd uu____3502  in
      let uu____3510 = FStar_ST.read record_cache  in uu____3500 ::
        uu____3510
       in
    FStar_ST.write record_cache uu____3497  in
  let pop1 uu____3525 =
    let uu____3526 =
      let uu____3529 = FStar_ST.read record_cache  in
      FStar_List.tl uu____3529  in
    FStar_ST.write record_cache uu____3526  in
  let peek1 uu____3545 =
    let uu____3546 = FStar_ST.read record_cache  in FStar_List.hd uu____3546
     in
  let insert r =
    let uu____3558 =
      let uu____3561 = let uu____3563 = peek1 ()  in r :: uu____3563  in
      let uu____3565 =
        let uu____3568 = FStar_ST.read record_cache  in
        FStar_List.tl uu____3568  in
      uu____3561 :: uu____3565  in
    FStar_ST.write record_cache uu____3558  in
  let commit1 uu____3584 =
    let uu____3585 = FStar_ST.read record_cache  in
    match uu____3585 with
    | hd1::uu____3593::tl1 -> FStar_ST.write record_cache (hd1 :: tl1)
    | uu____3606 -> failwith "Impossible"  in
  let filter1 uu____3612 =
    let rc = peek1 ()  in
    pop1 ();
    (match () with
     | () ->
         let filtered =
           FStar_List.filter
             (fun r  -> Prims.op_Negation r.is_private_or_abstract) rc
            in
         let uu____3619 =
           let uu____3622 = FStar_ST.read record_cache  in filtered ::
             uu____3622
            in
         FStar_ST.write record_cache uu____3619)
     in
  let aux = (push1, pop1, peek1, insert, commit1)  in (aux, filter1) 
let record_cache_aux :
  ((Prims.unit -> Prims.unit) * (Prims.unit -> Prims.unit) *
    (Prims.unit -> record_or_dc Prims.list) * (record_or_dc -> Prims.unit) *
    (Prims.unit -> Prims.unit))
  =
  let uu____3696 = record_cache_aux_with_filter  in
  match uu____3696 with | (aux,uu____3734) -> aux 
let filter_record_cache : Prims.unit -> Prims.unit =
  let uu____3774 = record_cache_aux_with_filter  in
  match uu____3774 with | (uu____3797,filter1) -> filter1 
let push_record_cache : Prims.unit -> Prims.unit =
  let uu____3838 = record_cache_aux  in
  match uu____3838 with
  | (push1,uu____3858,uu____3859,uu____3860,uu____3861) -> push1 
let pop_record_cache : Prims.unit -> Prims.unit =
  let uu____3887 = record_cache_aux  in
  match uu____3887 with
  | (uu____3906,pop1,uu____3908,uu____3909,uu____3910) -> pop1 
let peek_record_cache : Prims.unit -> record_or_dc Prims.list =
  let uu____3937 = record_cache_aux  in
  match uu____3937 with
  | (uu____3957,uu____3958,peek1,uu____3960,uu____3961) -> peek1 
let insert_record_cache : record_or_dc -> Prims.unit =
  let uu____3987 = record_cache_aux  in
  match uu____3987 with
  | (uu____4006,uu____4007,uu____4008,insert,uu____4010) -> insert 
let commit_record_cache : Prims.unit -> Prims.unit =
  let uu____4036 = record_cache_aux  in
  match uu____4036 with
  | (uu____4055,uu____4056,uu____4057,uu____4058,commit1) -> commit1 
let extract_record :
  env ->
    scope_mod Prims.list FStar_ST.ref ->
      FStar_Syntax_Syntax.sigelt -> Prims.unit
  =
  fun e  ->
    fun new_globs  ->
      fun se  ->
        match se.FStar_Syntax_Syntax.sigel with
        | FStar_Syntax_Syntax.Sig_bundle (sigs,uu____4101) ->
            let is_record =
              FStar_Util.for_some
                (fun uu___169_4110  ->
                   match uu___169_4110 with
                   | FStar_Syntax_Syntax.RecordType uu____4111 -> true
                   | FStar_Syntax_Syntax.RecordConstructor uu____4116 -> true
                   | uu____4121 -> false)
               in
            let find_dc dc =
              FStar_All.pipe_right sigs
                (FStar_Util.find_opt
                   (fun uu___170_4129  ->
                      match uu___170_4129 with
                      | {
                          FStar_Syntax_Syntax.sigel =
                            FStar_Syntax_Syntax.Sig_datacon
                            (lid,uu____4131,uu____4132,uu____4133,uu____4134,uu____4135);
                          FStar_Syntax_Syntax.sigrng = uu____4136;
                          FStar_Syntax_Syntax.sigquals = uu____4137;
                          FStar_Syntax_Syntax.sigmeta = uu____4138;
                          FStar_Syntax_Syntax.sigattrs = uu____4139;_} ->
                          FStar_Ident.lid_equals dc lid
                      | uu____4144 -> false))
               in
            FStar_All.pipe_right sigs
              (FStar_List.iter
                 (fun uu___171_4146  ->
                    match uu___171_4146 with
                    | {
                        FStar_Syntax_Syntax.sigel =
                          FStar_Syntax_Syntax.Sig_inductive_typ
                          (typename,univs1,parms,uu____4150,uu____4151,dc::[]);
                        FStar_Syntax_Syntax.sigrng = uu____4153;
                        FStar_Syntax_Syntax.sigquals = typename_quals;
                        FStar_Syntax_Syntax.sigmeta = uu____4155;
                        FStar_Syntax_Syntax.sigattrs = uu____4156;_} ->
                        let uu____4162 =
                          let uu____4163 = find_dc dc  in
                          FStar_All.pipe_left FStar_Util.must uu____4163  in
                        (match uu____4162 with
                         | {
                             FStar_Syntax_Syntax.sigel =
                               FStar_Syntax_Syntax.Sig_datacon
                               (constrname,uu____4167,t,uu____4169,uu____4170,uu____4171);
                             FStar_Syntax_Syntax.sigrng = uu____4172;
                             FStar_Syntax_Syntax.sigquals = uu____4173;
                             FStar_Syntax_Syntax.sigmeta = uu____4174;
                             FStar_Syntax_Syntax.sigattrs = uu____4175;_} ->
                             let uu____4180 =
                               FStar_Syntax_Util.arrow_formals t  in
                             (match uu____4180 with
                              | (formals,uu____4189) ->
                                  let is_rec = is_record typename_quals  in
                                  let formals' =
                                    FStar_All.pipe_right formals
                                      (FStar_List.collect
                                         (fun uu____4215  ->
                                            match uu____4215 with
                                            | (x,q) ->
                                                let uu____4223 =
                                                  (FStar_Syntax_Syntax.is_null_bv
                                                     x)
                                                    ||
                                                    (is_rec &&
                                                       (FStar_Syntax_Syntax.is_implicit
                                                          q))
                                                   in
                                                if uu____4223
                                                then []
                                                else [(x, q)]))
                                     in
                                  let fields' =
                                    FStar_All.pipe_right formals'
                                      (FStar_List.map
                                         (fun uu____4254  ->
                                            match uu____4254 with
                                            | (x,q) ->
                                                let uu____4263 =
                                                  if is_rec
                                                  then
                                                    FStar_Syntax_Util.unmangle_field_name
                                                      x.FStar_Syntax_Syntax.ppname
                                                  else
                                                    x.FStar_Syntax_Syntax.ppname
                                                   in
                                                (uu____4263,
                                                  (x.FStar_Syntax_Syntax.sort))))
                                     in
                                  let fields = fields'  in
                                  let record =
                                    {
                                      typename;
                                      constrname =
                                        (constrname.FStar_Ident.ident);
                                      parms;
                                      fields;
                                      is_private_or_abstract =
                                        ((FStar_List.contains
                                            FStar_Syntax_Syntax.Private
                                            typename_quals)
                                           ||
                                           (FStar_List.contains
                                              FStar_Syntax_Syntax.Abstract
                                              typename_quals));
                                      is_record = is_rec
                                    }  in
                                  ((let uu____4275 =
                                      let uu____4277 =
                                        FStar_ST.read new_globs  in
                                      (Record_or_dc record) :: uu____4277  in
                                    FStar_ST.write new_globs uu____4275);
                                   (match () with
                                    | () ->
                                        ((let add_field uu____4293 =
                                            match uu____4293 with
                                            | (id,uu____4299) ->
                                                let modul =
                                                  let uu____4305 =
                                                    FStar_Ident.lid_of_ids
                                                      constrname.FStar_Ident.ns
                                                     in
                                                  uu____4305.FStar_Ident.str
                                                   in
                                                let uu____4306 =
                                                  get_exported_id_set e modul
                                                   in
                                                (match uu____4306 with
                                                 | Some my_ex ->
                                                     let my_exported_ids =
                                                       my_ex
                                                         Exported_id_field
                                                        in
                                                     ((let uu____4322 =
                                                         let uu____4323 =
                                                           FStar_ST.read
                                                             my_exported_ids
                                                            in
                                                         FStar_Util.set_add
                                                           id.FStar_Ident.idText
                                                           uu____4323
                                                          in
                                                       FStar_ST.write
                                                         my_exported_ids
                                                         uu____4322);
                                                      (match () with
                                                       | () ->
                                                           let projname =
                                                             let uu____4330 =
                                                               let uu____4331
                                                                 =
                                                                 FStar_Syntax_Util.mk_field_projector_name_from_ident
                                                                   constrname
                                                                   id
                                                                  in
                                                               uu____4331.FStar_Ident.ident
                                                                in
                                                             uu____4330.FStar_Ident.idText
                                                              in
                                                           let uu____4333 =
                                                             let uu____4334 =
                                                               FStar_ST.read
                                                                 my_exported_ids
                                                                in
                                                             FStar_Util.set_add
                                                               projname
                                                               uu____4334
                                                              in
                                                           FStar_ST.write
                                                             my_exported_ids
                                                             uu____4333))
                                                 | None  -> ())
                                             in
                                          FStar_List.iter add_field fields');
                                         (match () with
                                          | () -> insert_record_cache record)))))
                         | uu____4347 -> ())
                    | uu____4348 -> ()))
        | uu____4349 -> ()
  
let try_lookup_record_or_dc_by_field_name :
  env -> FStar_Ident.lident -> record_or_dc option =
  fun env  ->
    fun fieldname  ->
      let find_in_cache fieldname1 =
        let uu____4364 =
          ((fieldname1.FStar_Ident.ns), (fieldname1.FStar_Ident.ident))  in
        match uu____4364 with
        | (ns,id) ->
            let uu____4374 = peek_record_cache ()  in
            FStar_Util.find_map uu____4374
              (fun record  ->
                 let uu____4377 =
                   find_in_record ns id record (fun r  -> Cont_ok r)  in
                 option_of_cont (fun uu____4380  -> None) uu____4377)
         in
      resolve_in_open_namespaces'' env fieldname Exported_id_field
        (fun uu____4381  -> Cont_ignore) (fun uu____4382  -> Cont_ignore)
        (fun r  -> Cont_ok r)
        (fun fn  ->
           let uu____4385 = find_in_cache fn  in
           cont_of_option Cont_ignore uu____4385)
        (fun k  -> fun uu____4388  -> k)
  
let try_lookup_record_by_field_name :
  env -> FStar_Ident.lident -> record_or_dc option =
  fun env  ->
    fun fieldname  ->
      let uu____4399 = try_lookup_record_or_dc_by_field_name env fieldname
         in
      match uu____4399 with
      | Some r when r.is_record -> Some r
      | uu____4403 -> None
  
let belongs_to_record :
  env -> FStar_Ident.lident -> record_or_dc -> Prims.bool =
  fun env  ->
    fun lid  ->
      fun record  ->
        let uu____4417 = try_lookup_record_by_field_name env lid  in
        match uu____4417 with
        | Some record' when
            let uu____4420 =
              let uu____4421 =
                FStar_Ident.path_of_ns (record.typename).FStar_Ident.ns  in
              FStar_Ident.text_of_path uu____4421  in
            let uu____4423 =
              let uu____4424 =
                FStar_Ident.path_of_ns (record'.typename).FStar_Ident.ns  in
              FStar_Ident.text_of_path uu____4424  in
            uu____4420 = uu____4423 ->
            let uu____4426 =
              find_in_record (record.typename).FStar_Ident.ns
                lid.FStar_Ident.ident record (fun uu____4428  -> Cont_ok ())
               in
            (match uu____4426 with
             | Cont_ok uu____4429 -> true
             | uu____4430 -> false)
        | uu____4432 -> false
  
let try_lookup_dc_by_field_name :
  env -> FStar_Ident.lident -> (FStar_Ident.lident * Prims.bool) option =
  fun env  ->
    fun fieldname  ->
      let uu____4445 = try_lookup_record_or_dc_by_field_name env fieldname
         in
      match uu____4445 with
      | Some r ->
          let uu____4451 =
            let uu____4454 =
              let uu____4455 =
                FStar_Ident.lid_of_ids
                  (FStar_List.append (r.typename).FStar_Ident.ns
                     [r.constrname])
                 in
              FStar_Ident.set_lid_range uu____4455
                (FStar_Ident.range_of_lid fieldname)
               in
            (uu____4454, (r.is_record))  in
          Some uu____4451
      | uu____4458 -> None
  
let string_set_ref_new :
  Prims.unit -> Prims.string FStar_Util.set FStar_ST.ref =
  fun uu____4468  ->
    let uu____4469 =
      FStar_Util.new_set FStar_Util.compare FStar_Util.hashcode  in
    FStar_Util.mk_ref uu____4469
  
let exported_id_set_new :
  Prims.unit -> exported_id_kind -> Prims.string FStar_Util.set FStar_ST.ref
  =
  fun uu____4481  ->
    let term_type_set = string_set_ref_new ()  in
    let field_set = string_set_ref_new ()  in
    fun uu___172_4490  ->
      match uu___172_4490 with
      | Exported_id_term_type  -> term_type_set
      | Exported_id_field  -> field_set
  
let unique :
  Prims.bool -> Prims.bool -> env -> FStar_Ident.lident -> Prims.bool =
  fun any_val  ->
    fun exclude_if  ->
      fun env  ->
        fun lid  ->
          let filter_scope_mods uu___173_4514 =
            match uu___173_4514 with
            | Rec_binding uu____4515 -> true
            | uu____4516 -> false  in
          let this_env =
            let uu___183_4518 = env  in
            let uu____4519 =
              FStar_List.filter filter_scope_mods env.scope_mods  in
            {
              curmodule = (uu___183_4518.curmodule);
              curmonad = (uu___183_4518.curmonad);
              modules = (uu___183_4518.modules);
              scope_mods = uu____4519;
              exported_ids = empty_exported_id_smap;
              trans_exported_ids = (uu___183_4518.trans_exported_ids);
              includes = empty_include_smap;
              sigaccum = (uu___183_4518.sigaccum);
              sigmap = (uu___183_4518.sigmap);
              iface = (uu___183_4518.iface);
              admitted_iface = (uu___183_4518.admitted_iface);
              expect_typ = (uu___183_4518.expect_typ);
              docs = (uu___183_4518.docs);
              remaining_iface_decls = (uu___183_4518.remaining_iface_decls);
              syntax_only = (uu___183_4518.syntax_only)
            }  in
          let uu____4521 = try_lookup_lid' any_val exclude_if this_env lid
             in
          match uu____4521 with | None  -> true | Some uu____4527 -> false
  
let push_scope_mod : env -> scope_mod -> env =
  fun env  ->
    fun scope_mod  ->
      let uu___184_4540 = env  in
      {
        curmodule = (uu___184_4540.curmodule);
        curmonad = (uu___184_4540.curmonad);
        modules = (uu___184_4540.modules);
        scope_mods = (scope_mod :: (env.scope_mods));
        exported_ids = (uu___184_4540.exported_ids);
        trans_exported_ids = (uu___184_4540.trans_exported_ids);
        includes = (uu___184_4540.includes);
        sigaccum = (uu___184_4540.sigaccum);
        sigmap = (uu___184_4540.sigmap);
        iface = (uu___184_4540.iface);
        admitted_iface = (uu___184_4540.admitted_iface);
        expect_typ = (uu___184_4540.expect_typ);
        docs = (uu___184_4540.docs);
        remaining_iface_decls = (uu___184_4540.remaining_iface_decls);
        syntax_only = (uu___184_4540.syntax_only)
      }
  
let push_bv' :
  env -> FStar_Ident.ident -> Prims.bool -> (env * FStar_Syntax_Syntax.bv) =
  fun env  ->
    fun x  ->
      fun is_mutable  ->
        let bv =
          FStar_Syntax_Syntax.gen_bv x.FStar_Ident.idText
            (Some (x.FStar_Ident.idRange)) FStar_Syntax_Syntax.tun
           in
        ((push_scope_mod env (Local_binding (x, bv, is_mutable))), bv)
  
let push_bv_mutable :
  env -> FStar_Ident.ident -> (env * FStar_Syntax_Syntax.bv) =
  fun env  -> fun x  -> push_bv' env x true 
let push_bv : env -> FStar_Ident.ident -> (env * FStar_Syntax_Syntax.bv) =
  fun env  -> fun x  -> push_bv' env x false 
let push_top_level_rec_binding :
  env -> FStar_Ident.ident -> FStar_Syntax_Syntax.delta_depth -> env =
  fun env  ->
    fun x  ->
      fun dd  ->
        let l = qualify env x  in
        let uu____4589 =
          (unique false true env l) || (FStar_Options.interactive ())  in
        if uu____4589
        then push_scope_mod env (Rec_binding (x, l, dd))
        else
          raise
            (FStar_Errors.Error
               ((Prims.strcat "Duplicate top-level names " l.FStar_Ident.str),
                 (FStar_Ident.range_of_lid l)))
  
let push_sigelt : env -> FStar_Syntax_Syntax.sigelt -> env =
  fun env  ->
    fun s  ->
      let err1 l =
        let sopt = FStar_Util.smap_try_find (sigmap env) l.FStar_Ident.str
           in
        let r =
          match sopt with
          | Some (se,uu____4611) ->
              let uu____4614 =
                FStar_Util.find_opt (FStar_Ident.lid_equals l)
                  (FStar_Syntax_Util.lids_of_sigelt se)
                 in
              (match uu____4614 with
               | Some l1 ->
                   FStar_All.pipe_left FStar_Range.string_of_range
                     (FStar_Ident.range_of_lid l1)
               | None  -> "<unknown>")
          | None  -> "<unknown>"  in
        let uu____4619 =
          let uu____4620 =
            let uu____4623 =
              FStar_Util.format2
                "Duplicate top-level names [%s]; previously declared at %s"
                (FStar_Ident.text_of_lid l) r
               in
            (uu____4623, (FStar_Ident.range_of_lid l))  in
          FStar_Errors.Error uu____4620  in
        raise uu____4619  in
      let globals = FStar_Util.mk_ref env.scope_mods  in
      let env1 =
        let uu____4630 =
          match s.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_let uu____4635 -> (false, true)
          | FStar_Syntax_Syntax.Sig_bundle uu____4639 -> (true, true)
          | uu____4644 -> (false, false)  in
        match uu____4630 with
        | (any_val,exclude_if) ->
            let lids = FStar_Syntax_Util.lids_of_sigelt s  in
            let uu____4649 =
              FStar_Util.find_map lids
                (fun l  ->
                   let uu____4652 =
                     let uu____4653 = unique any_val exclude_if env l  in
                     Prims.op_Negation uu____4653  in
                   if uu____4652 then Some l else None)
               in
            (match uu____4649 with
             | Some l when
                 let uu____4657 = FStar_Options.interactive ()  in
                 Prims.op_Negation uu____4657 -> err1 l
             | uu____4658 ->
                 (extract_record env globals s;
                  (let uu___185_4663 = env  in
                   {
                     curmodule = (uu___185_4663.curmodule);
                     curmonad = (uu___185_4663.curmonad);
                     modules = (uu___185_4663.modules);
                     scope_mods = (uu___185_4663.scope_mods);
                     exported_ids = (uu___185_4663.exported_ids);
                     trans_exported_ids = (uu___185_4663.trans_exported_ids);
                     includes = (uu___185_4663.includes);
                     sigaccum = (s :: (env.sigaccum));
                     sigmap = (uu___185_4663.sigmap);
                     iface = (uu___185_4663.iface);
                     admitted_iface = (uu___185_4663.admitted_iface);
                     expect_typ = (uu___185_4663.expect_typ);
                     docs = (uu___185_4663.docs);
                     remaining_iface_decls =
                       (uu___185_4663.remaining_iface_decls);
                     syntax_only = (uu___185_4663.syntax_only)
                   })))
         in
      let env2 =
        let uu___186_4665 = env1  in
        let uu____4666 = FStar_ST.read globals  in
        {
          curmodule = (uu___186_4665.curmodule);
          curmonad = (uu___186_4665.curmonad);
          modules = (uu___186_4665.modules);
          scope_mods = uu____4666;
          exported_ids = (uu___186_4665.exported_ids);
          trans_exported_ids = (uu___186_4665.trans_exported_ids);
          includes = (uu___186_4665.includes);
          sigaccum = (uu___186_4665.sigaccum);
          sigmap = (uu___186_4665.sigmap);
          iface = (uu___186_4665.iface);
          admitted_iface = (uu___186_4665.admitted_iface);
          expect_typ = (uu___186_4665.expect_typ);
          docs = (uu___186_4665.docs);
          remaining_iface_decls = (uu___186_4665.remaining_iface_decls);
          syntax_only = (uu___186_4665.syntax_only)
        }  in
      let uu____4671 =
        match s.FStar_Syntax_Syntax.sigel with
        | FStar_Syntax_Syntax.Sig_bundle (ses,uu____4685) ->
            let uu____4690 =
              FStar_List.map
                (fun se  -> ((FStar_Syntax_Util.lids_of_sigelt se), se)) ses
               in
            (env2, uu____4690)
        | uu____4704 -> (env2, [((FStar_Syntax_Util.lids_of_sigelt s), s)])
         in
      match uu____4671 with
      | (env3,lss) ->
          (FStar_All.pipe_right lss
             (FStar_List.iter
                (fun uu____4734  ->
                   match uu____4734 with
                   | (lids,se) ->
                       FStar_All.pipe_right lids
                         (FStar_List.iter
                            (fun lid  ->
                               (let uu____4745 =
                                  let uu____4747 = FStar_ST.read globals  in
                                  (Top_level_def (lid.FStar_Ident.ident)) ::
                                    uu____4747
                                   in
                                FStar_ST.write globals uu____4745);
                               (match () with
                                | () ->
                                    let modul =
                                      let uu____4756 =
                                        FStar_Ident.lid_of_ids
                                          lid.FStar_Ident.ns
                                         in
                                      uu____4756.FStar_Ident.str  in
                                    ((let uu____4758 =
                                        get_exported_id_set env3 modul  in
                                      match uu____4758 with
                                      | Some f ->
                                          let my_exported_ids =
                                            f Exported_id_term_type  in
                                          let uu____4773 =
                                            let uu____4774 =
                                              FStar_ST.read my_exported_ids
                                               in
                                            FStar_Util.set_add
                                              (lid.FStar_Ident.ident).FStar_Ident.idText
                                              uu____4774
                                             in
                                          FStar_ST.write my_exported_ids
                                            uu____4773
                                      | None  -> ());
                                     (match () with
                                      | () ->
                                          FStar_Util.smap_add (sigmap env3)
                                            lid.FStar_Ident.str
                                            (se,
                                              (env3.iface &&
                                                 (Prims.op_Negation
                                                    env3.admitted_iface))))))))));
           (let env4 =
              let uu___187_4786 = env3  in
              let uu____4787 = FStar_ST.read globals  in
              {
                curmodule = (uu___187_4786.curmodule);
                curmonad = (uu___187_4786.curmonad);
                modules = (uu___187_4786.modules);
                scope_mods = uu____4787;
                exported_ids = (uu___187_4786.exported_ids);
                trans_exported_ids = (uu___187_4786.trans_exported_ids);
                includes = (uu___187_4786.includes);
                sigaccum = (uu___187_4786.sigaccum);
                sigmap = (uu___187_4786.sigmap);
                iface = (uu___187_4786.iface);
                admitted_iface = (uu___187_4786.admitted_iface);
                expect_typ = (uu___187_4786.expect_typ);
                docs = (uu___187_4786.docs);
                remaining_iface_decls = (uu___187_4786.remaining_iface_decls);
                syntax_only = (uu___187_4786.syntax_only)
              }  in
            env4))
  
let push_namespace : env -> FStar_Ident.lident -> env =
  fun env  ->
    fun ns  ->
      let uu____4800 =
        let uu____4803 = resolve_module_name env ns false  in
        match uu____4803 with
        | None  ->
            let modules = env.modules  in
            let uu____4811 =
              FStar_All.pipe_right modules
                (FStar_Util.for_some
                   (fun uu____4817  ->
                      match uu____4817 with
                      | (m,uu____4821) ->
                          FStar_Util.starts_with
                            (Prims.strcat (FStar_Ident.text_of_lid m) ".")
                            (Prims.strcat (FStar_Ident.text_of_lid ns) ".")))
               in
            if uu____4811
            then (ns, Open_namespace)
            else
              (let uu____4825 =
                 let uu____4826 =
                   let uu____4829 =
                     FStar_Util.format1 "Namespace %s cannot be found"
                       (FStar_Ident.text_of_lid ns)
                      in
                   (uu____4829, (FStar_Ident.range_of_lid ns))  in
                 FStar_Errors.Error uu____4826  in
               raise uu____4825)
        | Some ns' -> (fail_if_curmodule env ns ns'; (ns', Open_module))  in
      match uu____4800 with
      | (ns',kd) -> push_scope_mod env (Open_module_or_namespace (ns', kd))
  
let push_include : env -> FStar_Ident.lident -> env =
  fun env  ->
    fun ns  ->
      let ns0 = ns  in
      let uu____4845 = resolve_module_name env ns false  in
      match uu____4845 with
      | Some ns1 ->
          (fail_if_curmodule env ns0 ns1;
           (let env1 =
              push_scope_mod env
                (Open_module_or_namespace (ns1, Open_module))
               in
            let curmod =
              let uu____4851 = current_module env1  in
              uu____4851.FStar_Ident.str  in
            (let uu____4853 = FStar_Util.smap_try_find env1.includes curmod
                in
             match uu____4853 with
             | None  -> ()
             | Some incl ->
                 let uu____4866 =
                   let uu____4868 = FStar_ST.read incl  in ns1 :: uu____4868
                    in
                 FStar_ST.write incl uu____4866);
            (match () with
             | () ->
                 let uu____4876 =
                   get_trans_exported_id_set env1 ns1.FStar_Ident.str  in
                 (match uu____4876 with
                  | Some ns_trans_exports ->
                      ((let uu____4889 =
                          let uu____4900 = get_exported_id_set env1 curmod
                             in
                          let uu____4905 =
                            get_trans_exported_id_set env1 curmod  in
                          (uu____4900, uu____4905)  in
                        match uu____4889 with
                        | (Some cur_exports,Some cur_trans_exports) ->
                            let update_exports k =
                              let ns_ex =
                                let uu____4945 = ns_trans_exports k  in
                                FStar_ST.read uu____4945  in
                              let ex = cur_exports k  in
                              (let uu____4954 =
                                 let uu____4955 = FStar_ST.read ex  in
                                 FStar_Util.set_difference uu____4955 ns_ex
                                  in
                               FStar_ST.write ex uu____4954);
                              (match () with
                               | () ->
                                   let trans_ex = cur_trans_exports k  in
                                   let uu____4965 =
                                     let uu____4966 = FStar_ST.read trans_ex
                                        in
                                     FStar_Util.set_union uu____4966 ns_ex
                                      in
                                   FStar_ST.write trans_ex uu____4965)
                               in
                            FStar_List.iter update_exports
                              all_exported_id_kinds
                        | uu____4972 -> ());
                       (match () with | () -> env1))
                  | None  ->
                      let uu____4986 =
                        let uu____4987 =
                          let uu____4990 =
                            FStar_Util.format1
                              "include: Module %s was not prepared"
                              ns1.FStar_Ident.str
                             in
                          (uu____4990, (FStar_Ident.range_of_lid ns1))  in
                        FStar_Errors.Error uu____4987  in
                      raise uu____4986))))
      | uu____4991 ->
          let uu____4993 =
            let uu____4994 =
              let uu____4997 =
                FStar_Util.format1 "include: Module %s cannot be found"
                  ns.FStar_Ident.str
                 in
              (uu____4997, (FStar_Ident.range_of_lid ns))  in
            FStar_Errors.Error uu____4994  in
          raise uu____4993
  
let push_module_abbrev :
  env -> FStar_Ident.ident -> FStar_Ident.lident -> env =
  fun env  ->
    fun x  ->
      fun l  ->
        let uu____5010 = module_is_defined env l  in
        if uu____5010
        then
          (fail_if_curmodule env l l;
           push_scope_mod env (Module_abbrev (x, l)))
        else
          (let uu____5013 =
             let uu____5014 =
               let uu____5017 =
                 FStar_Util.format1 "Module %s cannot be found"
                   (FStar_Ident.text_of_lid l)
                  in
               (uu____5017, (FStar_Ident.range_of_lid l))  in
             FStar_Errors.Error uu____5014  in
           raise uu____5013)
  
let push_doc : env -> FStar_Ident.lid -> FStar_Parser_AST.fsdoc option -> env
  =
  fun env  ->
    fun l  ->
      fun doc_opt  ->
        match doc_opt with
        | None  -> env
        | Some doc1 ->
            ((let uu____5034 =
                FStar_Util.smap_try_find env.docs l.FStar_Ident.str  in
              match uu____5034 with
              | None  -> ()
              | Some old_doc ->
                  let uu____5037 =
                    let uu____5038 = FStar_Ident.string_of_lid l  in
                    let uu____5039 = FStar_Parser_AST.string_of_fsdoc old_doc
                       in
                    let uu____5040 = FStar_Parser_AST.string_of_fsdoc doc1
                       in
                    FStar_Util.format3
                      "Overwriting doc of %s; old doc was [%s]; new doc are [%s]"
                      uu____5038 uu____5039 uu____5040
                     in
                  FStar_Errors.warn (FStar_Ident.range_of_lid l) uu____5037);
             FStar_Util.smap_add env.docs l.FStar_Ident.str doc1;
             env)
  
let check_admits : env -> Prims.unit =
  fun env  ->
    FStar_All.pipe_right env.sigaccum
      (FStar_List.iter
         (fun se  ->
            match se.FStar_Syntax_Syntax.sigel with
            | FStar_Syntax_Syntax.Sig_declare_typ (l,u,t) ->
                let uu____5050 = try_lookup_lid env l  in
                (match uu____5050 with
                 | None  ->
                     ((let uu____5057 =
                         let uu____5058 = FStar_Options.interactive ()  in
                         Prims.op_Negation uu____5058  in
                       if uu____5057
                       then
                         let uu____5059 =
                           let uu____5060 =
                             FStar_Range.string_of_range
                               (FStar_Ident.range_of_lid l)
                              in
                           let uu____5061 =
                             FStar_Syntax_Print.lid_to_string l  in
                           FStar_Util.format2
                             "%s: Warning: Admitting %s without a definition\n"
                             uu____5060 uu____5061
                            in
                         FStar_Util.print_string uu____5059
                       else ());
                      (let quals = FStar_Syntax_Syntax.Assumption ::
                         (se.FStar_Syntax_Syntax.sigquals)  in
                       FStar_Util.smap_add (sigmap env) l.FStar_Ident.str
                         ((let uu___188_5067 = se  in
                           {
                             FStar_Syntax_Syntax.sigel =
                               (uu___188_5067.FStar_Syntax_Syntax.sigel);
                             FStar_Syntax_Syntax.sigrng =
                               (uu___188_5067.FStar_Syntax_Syntax.sigrng);
                             FStar_Syntax_Syntax.sigquals = quals;
                             FStar_Syntax_Syntax.sigmeta =
                               (uu___188_5067.FStar_Syntax_Syntax.sigmeta);
                             FStar_Syntax_Syntax.sigattrs =
                               (uu___188_5067.FStar_Syntax_Syntax.sigattrs)
                           }), false)))
                 | Some uu____5068 -> ())
            | uu____5073 -> ()))
  
let finish : env -> FStar_Syntax_Syntax.modul -> env =
  fun env  ->
    fun modul  ->
      FStar_All.pipe_right modul.FStar_Syntax_Syntax.declarations
        (FStar_List.iter
           (fun se  ->
              let quals = se.FStar_Syntax_Syntax.sigquals  in
              match se.FStar_Syntax_Syntax.sigel with
              | FStar_Syntax_Syntax.Sig_bundle (ses,uu____5087) ->
                  if
                    (FStar_List.contains FStar_Syntax_Syntax.Private quals)
                      ||
                      (FStar_List.contains FStar_Syntax_Syntax.Abstract quals)
                  then
                    FStar_All.pipe_right ses
                      (FStar_List.iter
                         (fun se1  ->
                            match se1.FStar_Syntax_Syntax.sigel with
                            | FStar_Syntax_Syntax.Sig_datacon
                                (lid,uu____5095,uu____5096,uu____5097,uu____5098,uu____5099)
                                ->
                                FStar_Util.smap_remove (sigmap env)
                                  lid.FStar_Ident.str
                            | uu____5104 -> ()))
                  else ()
              | FStar_Syntax_Syntax.Sig_declare_typ
                  (lid,uu____5107,uu____5108) ->
                  if FStar_List.contains FStar_Syntax_Syntax.Private quals
                  then
                    FStar_Util.smap_remove (sigmap env) lid.FStar_Ident.str
                  else ()
              | FStar_Syntax_Syntax.Sig_let ((uu____5112,lbs),uu____5114) ->
                  (if
                     (FStar_List.contains FStar_Syntax_Syntax.Private quals)
                       ||
                       (FStar_List.contains FStar_Syntax_Syntax.Abstract
                          quals)
                   then
                     FStar_All.pipe_right lbs
                       (FStar_List.iter
                          (fun lb  ->
                             let uu____5125 =
                               let uu____5126 =
                                 let uu____5127 =
                                   let uu____5132 =
                                     FStar_Util.right
                                       lb.FStar_Syntax_Syntax.lbname
                                      in
                                   uu____5132.FStar_Syntax_Syntax.fv_name  in
                                 uu____5127.FStar_Syntax_Syntax.v  in
                               uu____5126.FStar_Ident.str  in
                             FStar_Util.smap_remove (sigmap env) uu____5125))
                   else ();
                   if
                     (FStar_List.contains FStar_Syntax_Syntax.Abstract quals)
                       &&
                       (Prims.op_Negation
                          (FStar_List.contains FStar_Syntax_Syntax.Private
                             quals))
                   then
                     FStar_All.pipe_right lbs
                       (FStar_List.iter
                          (fun lb  ->
                             let lid =
                               let uu____5142 =
                                 let uu____5147 =
                                   FStar_Util.right
                                     lb.FStar_Syntax_Syntax.lbname
                                    in
                                 uu____5147.FStar_Syntax_Syntax.fv_name  in
                               uu____5142.FStar_Syntax_Syntax.v  in
                             let quals1 = FStar_Syntax_Syntax.Assumption ::
                               quals  in
                             let decl =
                               let uu___189_5154 = se  in
                               {
                                 FStar_Syntax_Syntax.sigel =
                                   (FStar_Syntax_Syntax.Sig_declare_typ
                                      (lid, (lb.FStar_Syntax_Syntax.lbunivs),
                                        (lb.FStar_Syntax_Syntax.lbtyp)));
                                 FStar_Syntax_Syntax.sigrng =
                                   (uu___189_5154.FStar_Syntax_Syntax.sigrng);
                                 FStar_Syntax_Syntax.sigquals = quals1;
                                 FStar_Syntax_Syntax.sigmeta =
                                   (uu___189_5154.FStar_Syntax_Syntax.sigmeta);
                                 FStar_Syntax_Syntax.sigattrs =
                                   (uu___189_5154.FStar_Syntax_Syntax.sigattrs)
                               }  in
                             FStar_Util.smap_add (sigmap env)
                               lid.FStar_Ident.str (decl, false)))
                   else ())
              | uu____5161 -> ()));
      (let curmod =
         let uu____5163 = current_module env  in uu____5163.FStar_Ident.str
          in
       (let uu____5165 =
          let uu____5176 = get_exported_id_set env curmod  in
          let uu____5181 = get_trans_exported_id_set env curmod  in
          (uu____5176, uu____5181)  in
        match uu____5165 with
        | (Some cur_ex,Some cur_trans_ex) ->
            let update_exports eikind =
              let cur_ex_set =
                let uu____5221 = cur_ex eikind  in FStar_ST.read uu____5221
                 in
              let cur_trans_ex_set_ref = cur_trans_ex eikind  in
              let uu____5229 =
                let uu____5230 = FStar_ST.read cur_trans_ex_set_ref  in
                FStar_Util.set_union cur_ex_set uu____5230  in
              FStar_ST.write cur_trans_ex_set_ref uu____5229  in
            FStar_List.iter update_exports all_exported_id_kinds
        | uu____5236 -> ());
       (match () with
        | () ->
            (filter_record_cache ();
             (match () with
              | () ->
                  let uu___190_5248 = env  in
                  {
                    curmodule = None;
                    curmonad = (uu___190_5248.curmonad);
                    modules = (((modul.FStar_Syntax_Syntax.name), modul) ::
                      (env.modules));
                    scope_mods = [];
                    exported_ids = (uu___190_5248.exported_ids);
                    trans_exported_ids = (uu___190_5248.trans_exported_ids);
                    includes = (uu___190_5248.includes);
                    sigaccum = [];
                    sigmap = (uu___190_5248.sigmap);
                    iface = (uu___190_5248.iface);
                    admitted_iface = (uu___190_5248.admitted_iface);
                    expect_typ = (uu___190_5248.expect_typ);
                    docs = (uu___190_5248.docs);
                    remaining_iface_decls =
                      (uu___190_5248.remaining_iface_decls);
                    syntax_only = (uu___190_5248.syntax_only)
                  }))))
  
let stack : env Prims.list FStar_ST.ref = FStar_Util.mk_ref [] 
let push : env -> env =
  fun env  ->
    push_record_cache ();
    (let uu____5262 =
       let uu____5264 = FStar_ST.read stack  in env :: uu____5264  in
     FStar_ST.write stack uu____5262);
    (let uu___191_5272 = env  in
     let uu____5273 = FStar_Util.smap_copy (sigmap env)  in
     let uu____5279 = FStar_Util.smap_copy env.docs  in
     {
       curmodule = (uu___191_5272.curmodule);
       curmonad = (uu___191_5272.curmonad);
       modules = (uu___191_5272.modules);
       scope_mods = (uu___191_5272.scope_mods);
       exported_ids = (uu___191_5272.exported_ids);
       trans_exported_ids = (uu___191_5272.trans_exported_ids);
       includes = (uu___191_5272.includes);
       sigaccum = (uu___191_5272.sigaccum);
       sigmap = uu____5273;
       iface = (uu___191_5272.iface);
       admitted_iface = (uu___191_5272.admitted_iface);
       expect_typ = (uu___191_5272.expect_typ);
       docs = uu____5279;
       remaining_iface_decls = (uu___191_5272.remaining_iface_decls);
       syntax_only = (uu___191_5272.syntax_only)
     })
  
let pop : Prims.unit -> env =
  fun uu____5284  ->
    let uu____5285 = FStar_ST.read stack  in
    match uu____5285 with
    | env::tl1 -> (pop_record_cache (); FStar_ST.write stack tl1; env)
    | uu____5298 -> failwith "Impossible: Too many pops"
  
let commit_mark : env -> env =
  fun env  ->
    commit_record_cache ();
    (let uu____5305 = FStar_ST.read stack  in
     match uu____5305 with
     | uu____5310::tl1 -> (FStar_ST.write stack tl1; env)
     | uu____5317 -> failwith "Impossible: Too many pops")
  
let mark : env -> env = fun x  -> push x 
let reset_mark : Prims.unit -> env = fun uu____5326  -> pop () 
let export_interface : FStar_Ident.lident -> env -> env =
  fun m  ->
    fun env  ->
      let sigelt_in_m se =
        match FStar_Syntax_Util.lids_of_sigelt se with
        | l::uu____5340 -> l.FStar_Ident.nsstr = m.FStar_Ident.str
        | uu____5342 -> false  in
      let sm = sigmap env  in
      let env1 = pop ()  in
      let keys = FStar_Util.smap_keys sm  in
      let sm' = sigmap env1  in
      FStar_All.pipe_right keys
        (FStar_List.iter
           (fun k  ->
              let uu____5360 = FStar_Util.smap_try_find sm' k  in
              match uu____5360 with
              | Some (se,true ) when sigelt_in_m se ->
                  (FStar_Util.smap_remove sm' k;
                   (let se1 =
                      match se.FStar_Syntax_Syntax.sigel with
                      | FStar_Syntax_Syntax.Sig_declare_typ (l,u,t) ->
                          let uu___192_5376 = se  in
                          {
                            FStar_Syntax_Syntax.sigel =
                              (uu___192_5376.FStar_Syntax_Syntax.sigel);
                            FStar_Syntax_Syntax.sigrng =
                              (uu___192_5376.FStar_Syntax_Syntax.sigrng);
                            FStar_Syntax_Syntax.sigquals =
                              (FStar_Syntax_Syntax.Assumption ::
                              (se.FStar_Syntax_Syntax.sigquals));
                            FStar_Syntax_Syntax.sigmeta =
                              (uu___192_5376.FStar_Syntax_Syntax.sigmeta);
                            FStar_Syntax_Syntax.sigattrs =
                              (uu___192_5376.FStar_Syntax_Syntax.sigattrs)
                          }
                      | uu____5377 -> se  in
                    FStar_Util.smap_add sm' k (se1, false)))
              | uu____5380 -> ()));
      env1
  
let finish_module_or_interface : env -> FStar_Syntax_Syntax.modul -> env =
  fun env  ->
    fun modul  ->
      if Prims.op_Negation modul.FStar_Syntax_Syntax.is_interface
      then check_admits env
      else ();
      finish env modul
  
let prepare_module_or_interface :
  Prims.bool -> Prims.bool -> env -> FStar_Ident.lident -> (env * Prims.bool)
  =
  fun intf  ->
    fun admitted  ->
      fun env  ->
        fun mname  ->
          let prep env1 =
            let open_ns =
              if FStar_Ident.lid_equals mname FStar_Parser_Const.prims_lid
              then []
              else
                if
                  FStar_Util.starts_with "FStar."
                    (FStar_Ident.text_of_lid mname)
                then
                  [FStar_Parser_Const.prims_lid;
                  FStar_Parser_Const.pervasives_lid;
                  FStar_Parser_Const.fstar_ns_lid]
                else
                  [FStar_Parser_Const.prims_lid;
                  FStar_Parser_Const.pervasives_lid;
                  FStar_Parser_Const.st_lid;
                  FStar_Parser_Const.all_lid;
                  FStar_Parser_Const.fstar_ns_lid]
               in
            let open_ns1 =
              if
                (FStar_List.length mname.FStar_Ident.ns) <>
                  (Prims.parse_int "0")
              then
                let ns = FStar_Ident.lid_of_ids mname.FStar_Ident.ns  in ns
                  :: open_ns
              else open_ns  in
            (let uu____5432 = exported_id_set_new ()  in
             FStar_Util.smap_add env1.exported_ids mname.FStar_Ident.str
               uu____5432);
            (match () with
             | () ->
                 ((let uu____5437 = exported_id_set_new ()  in
                   FStar_Util.smap_add env1.trans_exported_ids
                     mname.FStar_Ident.str uu____5437);
                  (match () with
                   | () ->
                       ((let uu____5442 = FStar_Util.mk_ref []  in
                         FStar_Util.smap_add env1.includes
                           mname.FStar_Ident.str uu____5442);
                        (match () with
                         | () ->
                             let uu___193_5451 = env1  in
                             let uu____5452 =
                               FStar_List.map
                                 (fun lid  ->
                                    Open_module_or_namespace
                                      (lid, Open_namespace)) open_ns1
                                in
                             {
                               curmodule = (Some mname);
                               curmonad = (uu___193_5451.curmonad);
                               modules = (uu___193_5451.modules);
                               scope_mods = uu____5452;
                               exported_ids = (uu___193_5451.exported_ids);
                               trans_exported_ids =
                                 (uu___193_5451.trans_exported_ids);
                               includes = (uu___193_5451.includes);
                               sigaccum = (uu___193_5451.sigaccum);
                               sigmap = (env1.sigmap);
                               iface = intf;
                               admitted_iface = admitted;
                               expect_typ = (uu___193_5451.expect_typ);
                               docs = (uu___193_5451.docs);
                               remaining_iface_decls =
                                 (uu___193_5451.remaining_iface_decls);
                               syntax_only = (uu___193_5451.syntax_only)
                             })))))
             in
          let uu____5455 =
            FStar_All.pipe_right env.modules
              (FStar_Util.find_opt
                 (fun uu____5467  ->
                    match uu____5467 with
                    | (l,uu____5471) -> FStar_Ident.lid_equals l mname))
             in
          match uu____5455 with
          | None  -> let uu____5476 = prep env  in (uu____5476, false)
          | Some (uu____5477,m) ->
              ((let uu____5482 =
                  (let uu____5483 = FStar_Options.interactive ()  in
                   Prims.op_Negation uu____5483) &&
                    ((Prims.op_Negation m.FStar_Syntax_Syntax.is_interface)
                       || intf)
                   in
                if uu____5482
                then
                  let uu____5484 =
                    let uu____5485 =
                      let uu____5488 =
                        FStar_Util.format1
                          "Duplicate module or interface name: %s"
                          mname.FStar_Ident.str
                         in
                      (uu____5488, (FStar_Ident.range_of_lid mname))  in
                    FStar_Errors.Error uu____5485  in
                  raise uu____5484
                else ());
               (let uu____5490 =
                  let uu____5491 = push env  in prep uu____5491  in
                (uu____5490, true)))
  
let enter_monad_scope : env -> FStar_Ident.ident -> env =
  fun env  ->
    fun mname  ->
      match env.curmonad with
      | Some mname' ->
          raise
            (FStar_Errors.Error
               ((Prims.strcat "Trying to define monad "
                   (Prims.strcat mname.FStar_Ident.idText
                      (Prims.strcat ", but already in monad scope "
                         mname'.FStar_Ident.idText))),
                 (mname.FStar_Ident.idRange)))
      | None  ->
          let uu___194_5501 = env  in
          {
            curmodule = (uu___194_5501.curmodule);
            curmonad = (Some mname);
            modules = (uu___194_5501.modules);
            scope_mods = (uu___194_5501.scope_mods);
            exported_ids = (uu___194_5501.exported_ids);
            trans_exported_ids = (uu___194_5501.trans_exported_ids);
            includes = (uu___194_5501.includes);
            sigaccum = (uu___194_5501.sigaccum);
            sigmap = (uu___194_5501.sigmap);
            iface = (uu___194_5501.iface);
            admitted_iface = (uu___194_5501.admitted_iface);
            expect_typ = (uu___194_5501.expect_typ);
            docs = (uu___194_5501.docs);
            remaining_iface_decls = (uu___194_5501.remaining_iface_decls);
            syntax_only = (uu___194_5501.syntax_only)
          }
  
let fail_or env lookup lid =
  let uu____5530 = lookup lid  in
  match uu____5530 with
  | None  ->
      let opened_modules =
        FStar_List.map
          (fun uu____5536  ->
             match uu____5536 with
             | (lid1,uu____5540) -> FStar_Ident.text_of_lid lid1) env.modules
         in
      let msg =
        FStar_Util.format1 "Identifier not found: [%s]"
          (FStar_Ident.text_of_lid lid)
         in
      let msg1 =
        if (FStar_List.length lid.FStar_Ident.ns) = (Prims.parse_int "0")
        then msg
        else
          (let modul =
             let uu____5549 = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
             FStar_Ident.set_lid_range uu____5549
               (FStar_Ident.range_of_lid lid)
              in
           let uu____5550 = resolve_module_name env modul true  in
           match uu____5550 with
           | None  ->
               let opened_modules1 = FStar_String.concat ", " opened_modules
                  in
               FStar_Util.format3
                 "%s\nModule %s does not belong to the list of modules in scope, namely %s"
                 msg modul.FStar_Ident.str opened_modules1
           | Some modul' when
               Prims.op_Negation
                 (FStar_List.existsb (fun m  -> m = modul'.FStar_Ident.str)
                    opened_modules)
               ->
               let opened_modules1 = FStar_String.concat ", " opened_modules
                  in
               FStar_Util.format4
                 "%s\nModule %s resolved into %s, which does not belong to the list of modules in scope, namely %s"
                 msg modul.FStar_Ident.str modul'.FStar_Ident.str
                 opened_modules1
           | Some modul' ->
               FStar_Util.format4
                 "%s\nModule %s resolved into %s, definition %s not found"
                 msg modul.FStar_Ident.str modul'.FStar_Ident.str
                 (lid.FStar_Ident.ident).FStar_Ident.idText)
         in
      raise (FStar_Errors.Error (msg1, (FStar_Ident.range_of_lid lid)))
  | Some r -> r 
let fail_or2 lookup id =
  let uu____5580 = lookup id  in
  match uu____5580 with
  | None  ->
      raise
        (FStar_Errors.Error
           ((Prims.strcat "Identifier not found ["
               (Prims.strcat id.FStar_Ident.idText "]")),
             (id.FStar_Ident.idRange)))
  | Some r -> r 
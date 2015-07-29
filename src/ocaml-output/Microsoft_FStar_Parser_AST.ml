
type level =
| Un
| Expr
| Type
| Kind
| Formula

let is_Un = (fun ( _discr_ ) -> (match (_discr_) with
| Un -> begin
true
end
| _ -> begin
false
end))

let is_Expr = (fun ( _discr_ ) -> (match (_discr_) with
| Expr -> begin
true
end
| _ -> begin
false
end))

let is_Type = (fun ( _discr_ ) -> (match (_discr_) with
| Type -> begin
true
end
| _ -> begin
false
end))

let is_Kind = (fun ( _discr_ ) -> (match (_discr_) with
| Kind -> begin
true
end
| _ -> begin
false
end))

let is_Formula = (fun ( _discr_ ) -> (match (_discr_) with
| Formula -> begin
true
end
| _ -> begin
false
end))

type lid =
Microsoft_FStar_Absyn_Syntax.l__LongIdent

type imp =
| FsTypApp
| Hash
| Nothing

let is_FsTypApp = (fun ( _discr_ ) -> (match (_discr_) with
| FsTypApp -> begin
true
end
| _ -> begin
false
end))

let is_Hash = (fun ( _discr_ ) -> (match (_discr_) with
| Hash -> begin
true
end
| _ -> begin
false
end))

let is_Nothing = (fun ( _discr_ ) -> (match (_discr_) with
| Nothing -> begin
true
end
| _ -> begin
false
end))

type term' =
| Wild
| Const of Microsoft_FStar_Absyn_Syntax.sconst
| Op of (string * term list)
| Tvar of Microsoft_FStar_Absyn_Syntax.ident
| Var of lid
| Name of lid
| Construct of (lid * (term * imp) list)
| Abs of (pattern list * term)
| App of (term * term * imp)
| Let of (bool * (pattern * term) list * term)
| Seq of (term * term)
| If of (term * term * term)
| Match of (term * branch list)
| TryWith of (term * branch list)
| Ascribed of (term * term)
| Record of (term option * (lid * term) list)
| Project of (term * lid)
| Product of (binder list * term)
| Sum of (binder list * term)
| QForall of (binder list * term list * term)
| QExists of (binder list * term list * term)
| Refine of (binder * term)
| NamedTyp of (Microsoft_FStar_Absyn_Syntax.ident * term)
| Paren of term
| Requires of (term * string option)
| Ensures of (term * string option)
| Labeled of (term * string * bool) 
 and term =
{tm : term'; range : Support.Microsoft.FStar.Range.range; level : level} 
 and binder' =
| Variable of Microsoft_FStar_Absyn_Syntax.ident
| TVariable of Microsoft_FStar_Absyn_Syntax.ident
| Annotated of (Microsoft_FStar_Absyn_Syntax.ident * term)
| TAnnotated of (Microsoft_FStar_Absyn_Syntax.ident * term)
| NoName of term 
 and binder =
{b : binder'; brange : Support.Microsoft.FStar.Range.range; blevel : level; aqual : Microsoft_FStar_Absyn_Syntax.aqual} 
 and pattern' =
| PatWild
| PatConst of Microsoft_FStar_Absyn_Syntax.sconst
| PatApp of (pattern * pattern list)
| PatVar of (Microsoft_FStar_Absyn_Syntax.ident * bool)
| PatName of lid
| PatTvar of (Microsoft_FStar_Absyn_Syntax.ident * bool)
| PatList of pattern list
| PatTuple of (pattern list * bool)
| PatRecord of (lid * pattern) list
| PatAscribed of (pattern * term)
| PatOr of pattern list 
 and pattern =
{pat : pattern'; prange : Support.Microsoft.FStar.Range.range} 
 and branch =
(pattern * term option * term)

let is_Wild = (fun ( _discr_ ) -> (match (_discr_) with
| Wild -> begin
true
end
| _ -> begin
false
end))

let is_Const = (fun ( _discr_ ) -> (match (_discr_) with
| Const (_) -> begin
true
end
| _ -> begin
false
end))

let is_Op = (fun ( _discr_ ) -> (match (_discr_) with
| Op (_) -> begin
true
end
| _ -> begin
false
end))

let is_Tvar = (fun ( _discr_ ) -> (match (_discr_) with
| Tvar (_) -> begin
true
end
| _ -> begin
false
end))

let is_Var = (fun ( _discr_ ) -> (match (_discr_) with
| Var (_) -> begin
true
end
| _ -> begin
false
end))

let is_Name = (fun ( _discr_ ) -> (match (_discr_) with
| Name (_) -> begin
true
end
| _ -> begin
false
end))

let is_Construct = (fun ( _discr_ ) -> (match (_discr_) with
| Construct (_) -> begin
true
end
| _ -> begin
false
end))

let is_Abs = (fun ( _discr_ ) -> (match (_discr_) with
| Abs (_) -> begin
true
end
| _ -> begin
false
end))

let is_App = (fun ( _discr_ ) -> (match (_discr_) with
| App (_) -> begin
true
end
| _ -> begin
false
end))

let is_Let = (fun ( _discr_ ) -> (match (_discr_) with
| Let (_) -> begin
true
end
| _ -> begin
false
end))

let is_Seq = (fun ( _discr_ ) -> (match (_discr_) with
| Seq (_) -> begin
true
end
| _ -> begin
false
end))

let is_If = (fun ( _discr_ ) -> (match (_discr_) with
| If (_) -> begin
true
end
| _ -> begin
false
end))

let is_Match = (fun ( _discr_ ) -> (match (_discr_) with
| Match (_) -> begin
true
end
| _ -> begin
false
end))

let is_TryWith = (fun ( _discr_ ) -> (match (_discr_) with
| TryWith (_) -> begin
true
end
| _ -> begin
false
end))

let is_Ascribed = (fun ( _discr_ ) -> (match (_discr_) with
| Ascribed (_) -> begin
true
end
| _ -> begin
false
end))

let is_Record = (fun ( _discr_ ) -> (match (_discr_) with
| Record (_) -> begin
true
end
| _ -> begin
false
end))

let is_Project = (fun ( _discr_ ) -> (match (_discr_) with
| Project (_) -> begin
true
end
| _ -> begin
false
end))

let is_Product = (fun ( _discr_ ) -> (match (_discr_) with
| Product (_) -> begin
true
end
| _ -> begin
false
end))

let is_Sum = (fun ( _discr_ ) -> (match (_discr_) with
| Sum (_) -> begin
true
end
| _ -> begin
false
end))

let is_QForall = (fun ( _discr_ ) -> (match (_discr_) with
| QForall (_) -> begin
true
end
| _ -> begin
false
end))

let is_QExists = (fun ( _discr_ ) -> (match (_discr_) with
| QExists (_) -> begin
true
end
| _ -> begin
false
end))

let is_Refine = (fun ( _discr_ ) -> (match (_discr_) with
| Refine (_) -> begin
true
end
| _ -> begin
false
end))

let is_NamedTyp = (fun ( _discr_ ) -> (match (_discr_) with
| NamedTyp (_) -> begin
true
end
| _ -> begin
false
end))

let is_Paren = (fun ( _discr_ ) -> (match (_discr_) with
| Paren (_) -> begin
true
end
| _ -> begin
false
end))

let is_Requires = (fun ( _discr_ ) -> (match (_discr_) with
| Requires (_) -> begin
true
end
| _ -> begin
false
end))

let is_Ensures = (fun ( _discr_ ) -> (match (_discr_) with
| Ensures (_) -> begin
true
end
| _ -> begin
false
end))

let is_Labeled = (fun ( _discr_ ) -> (match (_discr_) with
| Labeled (_) -> begin
true
end
| _ -> begin
false
end))

let is_Mkterm = (fun ( _  :  term ) -> (failwith ("Not yet implemented")))

let is_Variable = (fun ( _discr_ ) -> (match (_discr_) with
| Variable (_) -> begin
true
end
| _ -> begin
false
end))

let is_TVariable = (fun ( _discr_ ) -> (match (_discr_) with
| TVariable (_) -> begin
true
end
| _ -> begin
false
end))

let is_Annotated = (fun ( _discr_ ) -> (match (_discr_) with
| Annotated (_) -> begin
true
end
| _ -> begin
false
end))

let is_TAnnotated = (fun ( _discr_ ) -> (match (_discr_) with
| TAnnotated (_) -> begin
true
end
| _ -> begin
false
end))

let is_NoName = (fun ( _discr_ ) -> (match (_discr_) with
| NoName (_) -> begin
true
end
| _ -> begin
false
end))

let is_Mkbinder = (fun ( _  :  binder ) -> (failwith ("Not yet implemented")))

let is_PatWild = (fun ( _discr_ ) -> (match (_discr_) with
| PatWild -> begin
true
end
| _ -> begin
false
end))

let is_PatConst = (fun ( _discr_ ) -> (match (_discr_) with
| PatConst (_) -> begin
true
end
| _ -> begin
false
end))

let is_PatApp = (fun ( _discr_ ) -> (match (_discr_) with
| PatApp (_) -> begin
true
end
| _ -> begin
false
end))

let is_PatVar = (fun ( _discr_ ) -> (match (_discr_) with
| PatVar (_) -> begin
true
end
| _ -> begin
false
end))

let is_PatName = (fun ( _discr_ ) -> (match (_discr_) with
| PatName (_) -> begin
true
end
| _ -> begin
false
end))

let is_PatTvar = (fun ( _discr_ ) -> (match (_discr_) with
| PatTvar (_) -> begin
true
end
| _ -> begin
false
end))

let is_PatList = (fun ( _discr_ ) -> (match (_discr_) with
| PatList (_) -> begin
true
end
| _ -> begin
false
end))

let is_PatTuple = (fun ( _discr_ ) -> (match (_discr_) with
| PatTuple (_) -> begin
true
end
| _ -> begin
false
end))

let is_PatRecord = (fun ( _discr_ ) -> (match (_discr_) with
| PatRecord (_) -> begin
true
end
| _ -> begin
false
end))

let is_PatAscribed = (fun ( _discr_ ) -> (match (_discr_) with
| PatAscribed (_) -> begin
true
end
| _ -> begin
false
end))

let is_PatOr = (fun ( _discr_ ) -> (match (_discr_) with
| PatOr (_) -> begin
true
end
| _ -> begin
false
end))

let is_Mkpattern = (fun ( _  :  pattern ) -> (failwith ("Not yet implemented")))

type knd =
term

type typ =
term

type expr =
term

type tycon =
| TyconAbstract of (Microsoft_FStar_Absyn_Syntax.ident * binder list * knd option)
| TyconAbbrev of (Microsoft_FStar_Absyn_Syntax.ident * binder list * knd option * term)
| TyconRecord of (Microsoft_FStar_Absyn_Syntax.ident * binder list * knd option * (Microsoft_FStar_Absyn_Syntax.ident * term) list)
| TyconVariant of (Microsoft_FStar_Absyn_Syntax.ident * binder list * knd option * (Microsoft_FStar_Absyn_Syntax.ident * term option * bool) list)

let is_TyconAbstract = (fun ( _discr_ ) -> (match (_discr_) with
| TyconAbstract (_) -> begin
true
end
| _ -> begin
false
end))

let is_TyconAbbrev = (fun ( _discr_ ) -> (match (_discr_) with
| TyconAbbrev (_) -> begin
true
end
| _ -> begin
false
end))

let is_TyconRecord = (fun ( _discr_ ) -> (match (_discr_) with
| TyconRecord (_) -> begin
true
end
| _ -> begin
false
end))

let is_TyconVariant = (fun ( _discr_ ) -> (match (_discr_) with
| TyconVariant (_) -> begin
true
end
| _ -> begin
false
end))

type qualifiers =
Microsoft_FStar_Absyn_Syntax.qualifier list

type lift =
{msource : lid; mdest : lid; lift_op : term}

let is_Mklift = (fun ( _  :  lift ) -> (failwith ("Not yet implemented")))

type decl' =
| Open of lid
| KindAbbrev of (Microsoft_FStar_Absyn_Syntax.ident * binder list * knd)
| ToplevelLet of (bool * (pattern * term) list)
| Main of term
| Assume of (qualifiers * Microsoft_FStar_Absyn_Syntax.ident * term)
| Tycon of (qualifiers * tycon list)
| Val of (qualifiers * Microsoft_FStar_Absyn_Syntax.ident * term)
| Exception of (Microsoft_FStar_Absyn_Syntax.ident * term option)
| NewEffect of (qualifiers * effect_decl)
| SubEffect of lift
| Pragma of Microsoft_FStar_Absyn_Syntax.pragma 
 and decl =
{d : decl'; drange : Support.Microsoft.FStar.Range.range} 
 and effect_decl =
| DefineEffect of (Microsoft_FStar_Absyn_Syntax.ident * binder list * term * decl list)
| RedefineEffect of (Microsoft_FStar_Absyn_Syntax.ident * binder list * term)

let is_Open = (fun ( _discr_ ) -> (match (_discr_) with
| Open (_) -> begin
true
end
| _ -> begin
false
end))

let is_KindAbbrev = (fun ( _discr_ ) -> (match (_discr_) with
| KindAbbrev (_) -> begin
true
end
| _ -> begin
false
end))

let is_ToplevelLet = (fun ( _discr_ ) -> (match (_discr_) with
| ToplevelLet (_) -> begin
true
end
| _ -> begin
false
end))

let is_Main = (fun ( _discr_ ) -> (match (_discr_) with
| Main (_) -> begin
true
end
| _ -> begin
false
end))

let is_Assume = (fun ( _discr_ ) -> (match (_discr_) with
| Assume (_) -> begin
true
end
| _ -> begin
false
end))

let is_Tycon = (fun ( _discr_ ) -> (match (_discr_) with
| Tycon (_) -> begin
true
end
| _ -> begin
false
end))

let is_Val = (fun ( _discr_ ) -> (match (_discr_) with
| Val (_) -> begin
true
end
| _ -> begin
false
end))

let is_Exception = (fun ( _discr_ ) -> (match (_discr_) with
| Exception (_) -> begin
true
end
| _ -> begin
false
end))

let is_NewEffect = (fun ( _discr_ ) -> (match (_discr_) with
| NewEffect (_) -> begin
true
end
| _ -> begin
false
end))

let is_SubEffect = (fun ( _discr_ ) -> (match (_discr_) with
| SubEffect (_) -> begin
true
end
| _ -> begin
false
end))

let is_Pragma = (fun ( _discr_ ) -> (match (_discr_) with
| Pragma (_) -> begin
true
end
| _ -> begin
false
end))

let is_Mkdecl = (fun ( _  :  decl ) -> (failwith ("Not yet implemented")))

let is_DefineEffect = (fun ( _discr_ ) -> (match (_discr_) with
| DefineEffect (_) -> begin
true
end
| _ -> begin
false
end))

let is_RedefineEffect = (fun ( _discr_ ) -> (match (_discr_) with
| RedefineEffect (_) -> begin
true
end
| _ -> begin
false
end))

type modul =
| Module of (Microsoft_FStar_Absyn_Syntax.l__LongIdent * decl list)
| Interface of (Microsoft_FStar_Absyn_Syntax.l__LongIdent * decl list * bool)

let is_Module = (fun ( _discr_ ) -> (match (_discr_) with
| Module (_) -> begin
true
end
| _ -> begin
false
end))

let is_Interface = (fun ( _discr_ ) -> (match (_discr_) with
| Interface (_) -> begin
true
end
| _ -> begin
false
end))

type file =
modul list

type inputFragment =
(file, decl list) Support.Microsoft.FStar.Util.either

let mk_decl = (fun ( d  :  decl' ) ( r  :  Support.Microsoft.FStar.Range.range ) -> {d = d; drange = r})

let mk_binder = (fun ( b  :  binder' ) ( r  :  Support.Microsoft.FStar.Range.range ) ( l  :  level ) ( i  :  Microsoft_FStar_Absyn_Syntax.aqual ) -> {b = b; brange = r; blevel = l; aqual = i})

let mk_term = (fun ( t  :  term' ) ( r  :  Support.Microsoft.FStar.Range.range ) ( l  :  level ) -> {tm = t; range = r; level = l})

let mk_pattern = (fun ( p  :  pattern' ) ( r  :  Support.Microsoft.FStar.Range.range ) -> {pat = p; prange = r})

let un_curry_abs = (fun ( ps  :  pattern list ) ( body  :  term ) -> (match (body.tm) with
| Abs ((p', body')) -> begin
Abs (((Support.List.append ps p'), body'))
end
| _ -> begin
Abs ((ps, body))
end))

let mk_function = (fun ( branches  :  branch list ) ( r1  :  Support.Microsoft.FStar.Range.range ) ( r2  :  Support.Microsoft.FStar.Range.range ) -> (let x = (Microsoft_FStar_Absyn_Util.genident (Some (r1)))
in (let _52_14485 = (let _52_14484 = (let _52_14483 = (let _52_14482 = (let _52_14481 = (let _52_14480 = (let _52_14479 = (let _52_14478 = (Microsoft_FStar_Absyn_Syntax.lid_of_ids ((x)::[]))
in Var (_52_14478))
in (mk_term _52_14479 r1 Expr))
in (_52_14480, branches))
in Match (_52_14481))
in (mk_term _52_14482 r2 Expr))
in (((mk_pattern (PatVar ((x, false))) r1))::[], _52_14483))
in Abs (_52_14484))
in (mk_term _52_14485 r2 Expr))))

let un_function = (fun ( p  :  pattern ) ( tm  :  term ) -> (match ((p.pat, tm.tm)) with
| (PatVar (_), Abs ((pats, body))) -> begin
Some (((mk_pattern (PatApp ((p, pats))) p.prange), body))
end
| _ -> begin
None
end))

let lid_with_range = (fun ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (let _52_14494 = (Microsoft_FStar_Absyn_Syntax.path_of_lid lid)
in (Microsoft_FStar_Absyn_Syntax.lid_of_path _52_14494 r)))

let to_string_l = (fun ( sep  :  string ) ( f  :  'u37u1571  ->  string ) ( l  :  'u37u1571 list ) -> (let _52_14501 = (Support.List.map f l)
in (Support.String.concat sep _52_14501)))

let imp_to_string = (fun ( _37_1  :  imp ) -> (match (_37_1) with
| Hash -> begin
"#"
end
| _ -> begin
""
end))

let rec term_to_string = (fun ( x  :  term ) -> (match (x.tm) with
| Wild -> begin
"_"
end
| Requires ((t, _)) -> begin
(let _52_14508 = (term_to_string t)
in (Support.Microsoft.FStar.Util.format1 "(requires %s)" _52_14508))
end
| Ensures ((t, _)) -> begin
(let _52_14509 = (term_to_string t)
in (Support.Microsoft.FStar.Util.format1 "(ensures %s)" _52_14509))
end
| Labeled ((t, l, _)) -> begin
(let _52_14510 = (term_to_string t)
in (Support.Microsoft.FStar.Util.format2 "(labeled %s %s)" l _52_14510))
end
| Const (c) -> begin
(Microsoft_FStar_Absyn_Print.const_to_string c)
end
| Op ((s, xs)) -> begin
(let _52_14513 = (let _52_14512 = (Support.List.map (fun ( x  :  term ) -> (Support.Prims.pipe_right x term_to_string)) xs)
in (Support.String.concat ", " _52_14512))
in (Support.Microsoft.FStar.Util.format2 "%s(%s)" s _52_14513))
end
| Tvar (id) -> begin
id.Microsoft_FStar_Absyn_Syntax.idText
end
| (Var (l)) | (Name (l)) -> begin
(Microsoft_FStar_Absyn_Print.sli l)
end
| Construct ((l, args)) -> begin
(let _52_14517 = (Microsoft_FStar_Absyn_Print.sli l)
in (let _52_14516 = (to_string_l " " (fun ( _37_221  :  (term * imp) ) -> (match (_37_221) with
| (a, imp) -> begin
(let _52_14515 = (term_to_string a)
in (Support.Microsoft.FStar.Util.format2 "%s%s" (imp_to_string imp) _52_14515))
end)) args)
in (Support.Microsoft.FStar.Util.format2 "(%s %s)" _52_14517 _52_14516)))
end
| Abs ((pats, t)) when (x.level = Expr) -> begin
(let _52_14519 = (to_string_l " " pat_to_string pats)
in (let _52_14518 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "(fun %s -> %s)" _52_14519 _52_14518)))
end
| Abs ((pats, t)) when (x.level = Type) -> begin
(let _52_14521 = (to_string_l " " pat_to_string pats)
in (let _52_14520 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "(fun %s => %s)" _52_14521 _52_14520)))
end
| App ((t1, t2, imp)) -> begin
(let _52_14523 = (Support.Prims.pipe_right t1 term_to_string)
in (let _52_14522 = (Support.Prims.pipe_right t2 term_to_string)
in (Support.Microsoft.FStar.Util.format3 "%s %s%s" _52_14523 (imp_to_string imp) _52_14522)))
end
| Let ((false, (pat, tm)::[], body)) -> begin
(let _52_14526 = (Support.Prims.pipe_right pat pat_to_string)
in (let _52_14525 = (Support.Prims.pipe_right tm term_to_string)
in (let _52_14524 = (Support.Prims.pipe_right body term_to_string)
in (Support.Microsoft.FStar.Util.format3 "let %s = %s in %s" _52_14526 _52_14525 _52_14524))))
end
| Let ((_, lbs, body)) -> begin
(let _52_14531 = (to_string_l " and " (fun ( _37_251  :  (pattern * term) ) -> (match (_37_251) with
| (p, b) -> begin
(let _52_14529 = (Support.Prims.pipe_right p pat_to_string)
in (let _52_14528 = (Support.Prims.pipe_right b term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s=%s" _52_14529 _52_14528)))
end)) lbs)
in (let _52_14530 = (Support.Prims.pipe_right body term_to_string)
in (Support.Microsoft.FStar.Util.format2 "let rec %s in %s" _52_14531 _52_14530)))
end
| Seq ((t1, t2)) -> begin
(let _52_14533 = (Support.Prims.pipe_right t1 term_to_string)
in (let _52_14532 = (Support.Prims.pipe_right t2 term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s; %s" _52_14533 _52_14532)))
end
| If ((t1, t2, t3)) -> begin
(let _52_14536 = (Support.Prims.pipe_right t1 term_to_string)
in (let _52_14535 = (Support.Prims.pipe_right t2 term_to_string)
in (let _52_14534 = (Support.Prims.pipe_right t3 term_to_string)
in (Support.Microsoft.FStar.Util.format3 "if %s then %s else %s" _52_14536 _52_14535 _52_14534))))
end
| Match ((t, branches)) -> begin
(let _52_14543 = (Support.Prims.pipe_right t term_to_string)
in (let _52_14542 = (to_string_l " | " (fun ( _37_268  :  (pattern * term option * term) ) -> (match (_37_268) with
| (p, w, e) -> begin
(let _52_14541 = (Support.Prims.pipe_right p pat_to_string)
in (let _52_14540 = (match (w) with
| None -> begin
""
end
| Some (e) -> begin
(let _52_14538 = (term_to_string e)
in (Support.Microsoft.FStar.Util.format1 "when %s" _52_14538))
end)
in (let _52_14539 = (Support.Prims.pipe_right e term_to_string)
in (Support.Microsoft.FStar.Util.format3 "%s %s -> %s" _52_14541 _52_14540 _52_14539))))
end)) branches)
in (Support.Microsoft.FStar.Util.format2 "match %s with %s" _52_14543 _52_14542)))
end
| Ascribed ((t1, t2)) -> begin
(let _52_14545 = (Support.Prims.pipe_right t1 term_to_string)
in (let _52_14544 = (Support.Prims.pipe_right t2 term_to_string)
in (Support.Microsoft.FStar.Util.format2 "(%s : %s)" _52_14545 _52_14544)))
end
| Record ((Some (e), fields)) -> begin
(let _52_14550 = (Support.Prims.pipe_right e term_to_string)
in (let _52_14549 = (to_string_l " " (fun ( _37_283  :  (Microsoft_FStar_Absyn_Syntax.lident * term) ) -> (match (_37_283) with
| (l, e) -> begin
(let _52_14548 = (Microsoft_FStar_Absyn_Print.sli l)
in (let _52_14547 = (Support.Prims.pipe_right e term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s=%s" _52_14548 _52_14547)))
end)) fields)
in (Support.Microsoft.FStar.Util.format2 "{%s with %s}" _52_14550 _52_14549)))
end
| Record ((None, fields)) -> begin
(let _52_14554 = (to_string_l " " (fun ( _37_290  :  (Microsoft_FStar_Absyn_Syntax.lident * term) ) -> (match (_37_290) with
| (l, e) -> begin
(let _52_14553 = (Microsoft_FStar_Absyn_Print.sli l)
in (let _52_14552 = (Support.Prims.pipe_right e term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s=%s" _52_14553 _52_14552)))
end)) fields)
in (Support.Microsoft.FStar.Util.format1 "{%s}" _52_14554))
end
| Project ((e, l)) -> begin
(let _52_14556 = (Support.Prims.pipe_right e term_to_string)
in (let _52_14555 = (Microsoft_FStar_Absyn_Print.sli l)
in (Support.Microsoft.FStar.Util.format2 "%s.%s" _52_14556 _52_14555)))
end
| Product (([], t)) -> begin
(term_to_string t)
end
| Product ((b::hd::tl, t)) -> begin
(term_to_string (mk_term (Product (((b)::[], (mk_term (Product (((hd)::tl, t))) x.range x.level)))) x.range x.level))
end
| Product ((b::[], t)) when (x.level = Type) -> begin
(let _52_14558 = (Support.Prims.pipe_right b binder_to_string)
in (let _52_14557 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s -> %s" _52_14558 _52_14557)))
end
| Product ((b::[], t)) when (x.level = Kind) -> begin
(let _52_14560 = (Support.Prims.pipe_right b binder_to_string)
in (let _52_14559 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s => %s" _52_14560 _52_14559)))
end
| Sum ((binders, t)) -> begin
(let _52_14563 = (let _52_14561 = (Support.Prims.pipe_right binders (Support.List.map binder_to_string))
in (Support.Prims.pipe_right _52_14561 (Support.String.concat " * ")))
in (let _52_14562 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s * %s" _52_14563 _52_14562)))
end
| QForall ((bs, pats, t)) -> begin
(let _52_14566 = (to_string_l " " binder_to_string bs)
in (let _52_14565 = (to_string_l "; " term_to_string pats)
in (let _52_14564 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format3 "forall %s.{:pattern %s} %s" _52_14566 _52_14565 _52_14564))))
end
| QExists ((bs, pats, t)) -> begin
(let _52_14569 = (to_string_l " " binder_to_string bs)
in (let _52_14568 = (to_string_l "; " term_to_string pats)
in (let _52_14567 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format3 "exists %s.{:pattern %s} %s" _52_14569 _52_14568 _52_14567))))
end
| Refine ((b, t)) -> begin
(let _52_14571 = (Support.Prims.pipe_right b binder_to_string)
in (let _52_14570 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s:{%s}" _52_14571 _52_14570)))
end
| NamedTyp ((x, t)) -> begin
(let _52_14572 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s:%s" x.Microsoft_FStar_Absyn_Syntax.idText _52_14572))
end
| Paren (t) -> begin
(let _52_14573 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format1 "(%s)" _52_14573))
end
| Product ((bs, t)) -> begin
(let _52_14576 = (let _52_14574 = (Support.Prims.pipe_right bs (Support.List.map binder_to_string))
in (Support.Prims.pipe_right _52_14574 (Support.String.concat ",")))
in (let _52_14575 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "Unidentified product: [%s] %s" _52_14576 _52_14575)))
end
| t -> begin
(failwith ("Missing case in term_to_string"))
end))
and binder_to_string = (fun ( x  :  binder ) -> (let s = (match (x.b) with
| Variable (i) -> begin
i.Microsoft_FStar_Absyn_Syntax.idText
end
| TVariable (i) -> begin
(Support.Microsoft.FStar.Util.format1 "%s:_" i.Microsoft_FStar_Absyn_Syntax.idText)
end
| (TAnnotated ((i, t))) | (Annotated ((i, t))) -> begin
(let _52_14578 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s:%s" i.Microsoft_FStar_Absyn_Syntax.idText _52_14578))
end
| NoName (t) -> begin
(Support.Prims.pipe_right t term_to_string)
end)
in (match (x.aqual) with
| Some (Microsoft_FStar_Absyn_Syntax.Implicit) -> begin
(Support.Microsoft.FStar.Util.format1 "#%s" s)
end
| Some (Microsoft_FStar_Absyn_Syntax.Equality) -> begin
(Support.Microsoft.FStar.Util.format1 "=%s" s)
end
| _ -> begin
s
end)))
and pat_to_string = (fun ( x  :  pattern ) -> (match (x.pat) with
| PatWild -> begin
"_"
end
| PatConst (c) -> begin
(Microsoft_FStar_Absyn_Print.const_to_string c)
end
| PatApp ((p, ps)) -> begin
(let _52_14581 = (Support.Prims.pipe_right p pat_to_string)
in (let _52_14580 = (to_string_l " " pat_to_string ps)
in (Support.Microsoft.FStar.Util.format2 "(%s %s)" _52_14581 _52_14580)))
end
| (PatTvar ((i, true))) | (PatVar ((i, true))) -> begin
(Support.Microsoft.FStar.Util.format1 "#%s" i.Microsoft_FStar_Absyn_Syntax.idText)
end
| (PatTvar ((i, false))) | (PatVar ((i, false))) -> begin
i.Microsoft_FStar_Absyn_Syntax.idText
end
| PatName (l) -> begin
(Microsoft_FStar_Absyn_Print.sli l)
end
| PatList (l) -> begin
(let _52_14582 = (to_string_l "; " pat_to_string l)
in (Support.Microsoft.FStar.Util.format1 "[%s]" _52_14582))
end
| PatTuple ((l, false)) -> begin
(let _52_14583 = (to_string_l ", " pat_to_string l)
in (Support.Microsoft.FStar.Util.format1 "(%s)" _52_14583))
end
| PatTuple ((l, true)) -> begin
(let _52_14584 = (to_string_l ", " pat_to_string l)
in (Support.Microsoft.FStar.Util.format1 "(|%s|)" _52_14584))
end
| PatRecord (l) -> begin
(let _52_14588 = (to_string_l "; " (fun ( _37_404  :  (Microsoft_FStar_Absyn_Syntax.lident * pattern) ) -> (match (_37_404) with
| (f, e) -> begin
(let _52_14587 = (Microsoft_FStar_Absyn_Print.sli f)
in (let _52_14586 = (Support.Prims.pipe_right e pat_to_string)
in (Support.Microsoft.FStar.Util.format2 "%s=%s" _52_14587 _52_14586)))
end)) l)
in (Support.Microsoft.FStar.Util.format1 "{%s}" _52_14588))
end
| PatOr (l) -> begin
(to_string_l "|\n " pat_to_string l)
end
| PatAscribed ((p, t)) -> begin
(let _52_14590 = (Support.Prims.pipe_right p pat_to_string)
in (let _52_14589 = (Support.Prims.pipe_right t term_to_string)
in (Support.Microsoft.FStar.Util.format2 "(%s:%s)" _52_14590 _52_14589)))
end))

let error = (fun ( msg  :  string ) ( tm  :  term ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (let tm = (Support.Prims.pipe_right tm term_to_string)
in (let tm = (match (((Support.String.length tm) >= 80)) with
| true -> begin
(let _52_14594 = (Support.Microsoft.FStar.Util.substring tm 0 77)
in (Support.String.strcat _52_14594 "..."))
end
| false -> begin
tm
end)
in (raise (Microsoft_FStar_Absyn_Syntax.Error (((Support.String.strcat (Support.String.strcat msg "\n") tm), r)))))))

let consPat = (fun ( r  :  Support.Microsoft.FStar.Range.range ) ( hd  :  pattern ) ( tl  :  pattern ) -> PatApp (((mk_pattern (PatName (Microsoft_FStar_Absyn_Const.cons_lid)) r), (hd)::(tl)::[])))

let consTerm = (fun ( r  :  Support.Microsoft.FStar.Range.range ) ( hd  :  term ) ( tl  :  term ) -> (mk_term (Construct ((Microsoft_FStar_Absyn_Const.cons_lid, ((hd, Nothing))::((tl, Nothing))::[]))) r Expr))

let lexConsTerm = (fun ( r  :  Support.Microsoft.FStar.Range.range ) ( hd  :  term ) ( tl  :  term ) -> (mk_term (Construct ((Microsoft_FStar_Absyn_Const.lexcons_lid, ((hd, Nothing))::((tl, Nothing))::[]))) r Expr))

let mkConsList = (fun ( r  :  Support.Microsoft.FStar.Range.range ) ( elts  :  term list ) -> (let nil = (mk_term (Construct ((Microsoft_FStar_Absyn_Const.nil_lid, []))) r Expr)
in (Support.List.fold_right (fun ( e  :  term ) ( tl  :  term ) -> (consTerm r e tl)) elts nil)))

let mkLexList = (fun ( r  :  Support.Microsoft.FStar.Range.range ) ( elts  :  term list ) -> (let nil = (mk_term (Construct ((Microsoft_FStar_Absyn_Const.lextop_lid, []))) r Expr)
in (Support.List.fold_right (fun ( e  :  term ) ( tl  :  term ) -> (lexConsTerm r e tl)) elts nil)))

let mkApp = (fun ( t  :  term ) ( args  :  (term * imp) list ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (match (args) with
| [] -> begin
t
end
| _ -> begin
(match (t.tm) with
| Name (s) -> begin
(mk_term (Construct ((s, args))) r Un)
end
| _ -> begin
(Support.List.fold_left (fun ( t  :  term ) ( _37_448  :  (term * imp) ) -> (match (_37_448) with
| (a, imp) -> begin
(mk_term (App ((t, a, imp))) r Un)
end)) t args)
end)
end))

let mkRefSet = (fun ( r  :  Support.Microsoft.FStar.Range.range ) ( elts  :  term list ) -> (let empty = (let _52_14638 = (let _52_14637 = (Microsoft_FStar_Absyn_Util.set_lid_range Microsoft_FStar_Absyn_Const.set_empty r)
in Var (_52_14637))
in (mk_term _52_14638 r Expr))
in (let ref_constr = (let _52_14640 = (let _52_14639 = (Microsoft_FStar_Absyn_Util.set_lid_range Microsoft_FStar_Absyn_Const.heap_ref r)
in Var (_52_14639))
in (mk_term _52_14640 r Expr))
in (let singleton = (let _52_14642 = (let _52_14641 = (Microsoft_FStar_Absyn_Util.set_lid_range Microsoft_FStar_Absyn_Const.set_singleton r)
in Var (_52_14641))
in (mk_term _52_14642 r Expr))
in (let union = (let _52_14644 = (let _52_14643 = (Microsoft_FStar_Absyn_Util.set_lid_range Microsoft_FStar_Absyn_Const.set_union r)
in Var (_52_14643))
in (mk_term _52_14644 r Expr))
in (Support.List.fold_right (fun ( e  :  term ) ( tl  :  term ) -> (let e = (mkApp ref_constr (((e, Nothing))::[]) r)
in (let single_e = (mkApp singleton (((e, Nothing))::[]) r)
in (mkApp union (((single_e, Nothing))::((tl, Nothing))::[]) r)))) elts empty))))))

let mkExplicitApp = (fun ( t  :  term ) ( args  :  term list ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (match (args) with
| [] -> begin
t
end
| _ -> begin
(match (t.tm) with
| Name (s) -> begin
(let _52_14656 = (let _52_14655 = (let _52_14654 = (Support.List.map (fun ( a  :  term ) -> (a, Nothing)) args)
in (s, _52_14654))
in Construct (_52_14655))
in (mk_term _52_14656 r Un))
end
| _ -> begin
(Support.List.fold_left (fun ( t  :  term ) ( a  :  term ) -> (mk_term (App ((t, a, Nothing))) r Un)) t args)
end)
end))

let mkAdmitMagic = (fun ( r  :  Support.Microsoft.FStar.Range.range ) -> (let unit_const = (mk_term (Const (Microsoft_FStar_Absyn_Syntax.Const_unit)) r Expr)
in (let admit = (let admit_name = (let _52_14662 = (let _52_14661 = (Microsoft_FStar_Absyn_Util.set_lid_range Microsoft_FStar_Absyn_Const.admit_lid r)
in Var (_52_14661))
in (mk_term _52_14662 r Expr))
in (mkExplicitApp admit_name ((unit_const)::[]) r))
in (let magic = (let magic_name = (let _52_14664 = (let _52_14663 = (Microsoft_FStar_Absyn_Util.set_lid_range Microsoft_FStar_Absyn_Const.magic_lid r)
in Var (_52_14663))
in (mk_term _52_14664 r Expr))
in (mkExplicitApp magic_name ((unit_const)::[]) r))
in (let admit_magic = (mk_term (Seq ((admit, magic))) r Expr)
in admit_magic)))))

let mkWildAdmitMagic = (fun ( r  :  Support.Microsoft.FStar.Range.range ) -> (let _52_14666 = (mkAdmitMagic r)
in ((mk_pattern PatWild r), None, _52_14666)))

let focusBranches = (fun ( branches  :  (bool * (pattern * 'u37u4316 option * term)) list ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (let should_filter = (Support.Microsoft.FStar.Util.for_some Support.Prims.fst branches)
in (match (should_filter) with
| true -> begin
(let _37_483 = (Microsoft_FStar_Tc_Errors.warn r "Focusing on only some cases")
in (let focussed = (let _52_14669 = (Support.List.filter Support.Prims.fst branches)
in (Support.Prims.pipe_right _52_14669 (Support.List.map Support.Prims.snd)))
in (let _52_14671 = (let _52_14670 = (mkWildAdmitMagic r)
in (_52_14670)::[])
in (Support.List.append focussed _52_14671))))
end
| false -> begin
(Support.Prims.pipe_right branches (Support.List.map Support.Prims.snd))
end)))

let focusLetBindings = (fun ( lbs  :  (bool * ('u37u4474 * term)) list ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (let should_filter = (Support.Microsoft.FStar.Util.for_some Support.Prims.fst lbs)
in (match (should_filter) with
| true -> begin
(let _37_489 = (Microsoft_FStar_Tc_Errors.warn r "Focusing on only some cases in this (mutually) recursive definition")
in (Support.List.map (fun ( _37_493  :  (bool * ('u37u4474 * term)) ) -> (match (_37_493) with
| (f, lb) -> begin
(match (f) with
| true -> begin
lb
end
| false -> begin
(let _52_14675 = (mkAdmitMagic r)
in ((Support.Prims.fst lb), _52_14675))
end)
end)) lbs))
end
| false -> begin
(Support.Prims.pipe_right lbs (Support.List.map Support.Prims.snd))
end)))

let mkFsTypApp = (fun ( t  :  term ) ( args  :  term list ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (let _52_14683 = (Support.List.map (fun ( a  :  term ) -> (a, FsTypApp)) args)
in (mkApp t _52_14683 r)))

let mkTuple = (fun ( args  :  term list ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (let cons = (Microsoft_FStar_Absyn_Util.mk_tuple_data_lid (Support.List.length args) r)
in (let _52_14689 = (Support.List.map (fun ( x  :  term ) -> (x, Nothing)) args)
in (mkApp (mk_term (Name (cons)) r Expr) _52_14689 r))))

let mkDTuple = (fun ( args  :  term list ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (let cons = (Microsoft_FStar_Absyn_Util.mk_dtuple_data_lid (Support.List.length args) r)
in (let _52_14695 = (Support.List.map (fun ( x  :  term ) -> (x, Nothing)) args)
in (mkApp (mk_term (Name (cons)) r Expr) _52_14695 r))))

let mkRefinedBinder = (fun ( id  :  Microsoft_FStar_Absyn_Syntax.ident ) ( t  :  term ) ( refopt  :  term option ) ( m  :  Support.Microsoft.FStar.Range.range ) ( implicit  :  Microsoft_FStar_Absyn_Syntax.aqual ) -> (let b = (mk_binder (Annotated ((id, t))) m Type implicit)
in (match (refopt) with
| None -> begin
b
end
| Some (t) -> begin
(mk_binder (Annotated ((id, (mk_term (Refine ((b, t))) m Type)))) m Type implicit)
end)))

let rec extract_named_refinement = (fun ( t1  :  term ) -> (match (t1.tm) with
| NamedTyp ((x, t)) -> begin
Some ((x, t, None))
end
| Refine (({b = Annotated ((x, t)); brange = _; blevel = _; aqual = _}, t')) -> begin
Some ((x, t, Some (t')))
end
| Paren (t) -> begin
(extract_named_refinement t)
end
| _ -> begin
None
end))





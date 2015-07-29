
exception Err of (string)

let is_Err = (fun ( _discr_ ) -> (match (_discr_) with
| Err (_) -> begin
true
end
| _ -> begin
false
end))

let parse_error = (fun ( _25_3  :  unit ) -> (match (()) with
| () -> begin
(failwith ("Parse error: ill-formed cache"))
end))

type l__Writer =
Support.Microsoft.FStar.Util.oWriter

type l__Reader =
Support.Microsoft.FStar.Util.oReader

let serialize_option = (fun ( writer  :  l__Writer ) ( f  :  l__Writer  ->  'a  ->  unit ) ( l  :  'a option ) -> (match (l) with
| None -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'n')
end
| Some (l) -> begin
(let _25_11 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 's')
in (f writer l))
end))

let deserialize_option = (fun ( reader  :  l__Reader ) ( f  :  l__Reader  ->  'a ) -> (let n = (Support.Microsoft.FStar.Util.MkoReader.read_char reader ())
in (match ((n = 'n')) with
| true -> begin
None
end
| false -> begin
(let _52_7063 = (f reader)
in Some (_52_7063))
end)))

let serialize_list = (fun ( writer  :  l__Writer ) ( f  :  l__Writer  ->  'a  ->  unit ) ( l  :  'a list ) -> (let _25_21 = (Support.Microsoft.FStar.Util.MkoWriter.write_int writer (Support.List.length l))
in (Support.List.iter (fun ( elt  :  'a ) -> (f writer elt)) (Support.List.rev_append l []))))

let deserialize_list = (fun ( reader  :  l__Reader ) ( f  :  l__Reader  ->  'a ) -> (let n = (Support.Microsoft.FStar.Util.MkoReader.read_int reader ())
in (let rec helper = (fun ( accum  :  'a list ) ( n  :  int ) -> (match ((n = 0)) with
| true -> begin
accum
end
| false -> begin
(let _52_7084 = (let _52_7083 = (f reader)
in (_52_7083)::accum)
in (helper _52_7084 (n - 1)))
end))
in (helper [] n))))

let serialize_ident = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.ident ) -> (Support.Microsoft.FStar.Util.MkoWriter.write_string writer ast.Microsoft_FStar_Absyn_Syntax.idText))

let deserialize_ident = (fun ( reader  :  l__Reader ) -> (let _52_7092 = (let _52_7091 = (Support.Microsoft.FStar.Util.MkoReader.read_string reader ())
in (_52_7091, Microsoft_FStar_Absyn_Syntax.dummyRange))
in (Microsoft_FStar_Absyn_Syntax.mk_ident _52_7092)))

let serialize_LongIdent = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.l__LongIdent ) -> (let _25_36 = (serialize_list writer serialize_ident ast.Microsoft_FStar_Absyn_Syntax.ns)
in (serialize_ident writer ast.Microsoft_FStar_Absyn_Syntax.ident)))

let deserialize_LongIdent = (fun ( reader  :  l__Reader ) -> (let _52_7102 = (let _52_7101 = (deserialize_list reader deserialize_ident)
in (let _52_7100 = (let _52_7099 = (deserialize_ident reader)
in (_52_7099)::[])
in (Support.List.append _52_7101 _52_7100)))
in (Microsoft_FStar_Absyn_Syntax.lid_of_ids _52_7102)))

let serialize_lident = serialize_LongIdent

let deserialize_lident = deserialize_LongIdent

let serialize_withinfo_t = (fun ( writer  :  l__Writer ) ( s_v  :  l__Writer  ->  'a  ->  unit ) ( s_sort  :  l__Writer  ->  't  ->  unit ) ( ast  :  ('a, 't) Microsoft_FStar_Absyn_Syntax.withinfo_t ) -> (let _25_45 = (s_v writer ast.Microsoft_FStar_Absyn_Syntax.v)
in (s_sort writer ast.Microsoft_FStar_Absyn_Syntax.sort)))

let deserialize_withinfo_t = (fun ( reader  :  l__Reader ) ( ds_v  :  l__Reader  ->  'a ) ( ds_sort  :  l__Reader  ->  't ) -> (let _52_7132 = (ds_v reader)
in (let _52_7131 = (ds_sort reader)
in {Microsoft_FStar_Absyn_Syntax.v = _52_7132; Microsoft_FStar_Absyn_Syntax.sort = _52_7131; Microsoft_FStar_Absyn_Syntax.p = Microsoft_FStar_Absyn_Syntax.dummyRange})))

let serialize_var = (fun ( writer  :  l__Writer ) ( s_sort  :  l__Writer  ->  't  ->  unit ) ( ast  :  't Microsoft_FStar_Absyn_Syntax.var ) -> (serialize_withinfo_t writer serialize_lident s_sort ast))

let deserialize_var = (fun ( reader  :  l__Reader ) ( ds_sort  :  l__Reader  ->  't ) -> (deserialize_withinfo_t reader deserialize_lident ds_sort))

let serialize_bvdef = (fun ( writer  :  l__Writer ) ( ast  :  'a Microsoft_FStar_Absyn_Syntax.bvdef ) -> (let _25_62 = (serialize_ident writer ast.Microsoft_FStar_Absyn_Syntax.ppname)
in (serialize_ident writer ast.Microsoft_FStar_Absyn_Syntax.realname)))

let deserialize_bvdef = (fun ( ghost  :  'a option ) ( reader  :  l__Reader ) -> (let _52_7152 = (deserialize_ident reader)
in (let _52_7151 = (deserialize_ident reader)
in {Microsoft_FStar_Absyn_Syntax.ppname = _52_7152; Microsoft_FStar_Absyn_Syntax.realname = _52_7151})))

let serialize_bvar = (fun ( writer  :  l__Writer ) ( s_sort  :  l__Writer  ->  't  ->  unit ) ( ast  :  ('a, 't) Microsoft_FStar_Absyn_Syntax.bvar ) -> (serialize_withinfo_t writer serialize_bvdef s_sort ast))

let deserialize_bvar = (fun ( ghost  :  'a option ) ( reader  :  l__Reader ) ( ds_sort  :  l__Reader  ->  't ) -> (deserialize_withinfo_t reader (deserialize_bvdef ghost) ds_sort))

let serialize_sconst = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.sconst ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Const_unit -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
end
| Microsoft_FStar_Absyn_Syntax.Const_uint8 (v) -> begin
(let _25_82 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
in (Support.Microsoft.FStar.Util.MkoWriter.write_byte writer v))
end
| Microsoft_FStar_Absyn_Syntax.Const_bool (v) -> begin
(let _25_86 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
in (Support.Microsoft.FStar.Util.MkoWriter.write_bool writer v))
end
| Microsoft_FStar_Absyn_Syntax.Const_int32 (v) -> begin
(let _25_90 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'd')
in (Support.Microsoft.FStar.Util.MkoWriter.write_int32 writer v))
end
| Microsoft_FStar_Absyn_Syntax.Const_int64 (v) -> begin
(let _25_94 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'e')
in (Support.Microsoft.FStar.Util.MkoWriter.write_int64 writer v))
end
| Microsoft_FStar_Absyn_Syntax.Const_char (v) -> begin
(let _25_98 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'f')
in (Support.Microsoft.FStar.Util.MkoWriter.write_char writer v))
end
| Microsoft_FStar_Absyn_Syntax.Const_float (v) -> begin
(let _25_102 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'g')
in (Support.Microsoft.FStar.Util.MkoWriter.write_double writer v))
end
| Microsoft_FStar_Absyn_Syntax.Const_bytearray ((v, _)) -> begin
(let _25_109 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'h')
in (Support.Microsoft.FStar.Util.MkoWriter.write_bytearray writer v))
end
| Microsoft_FStar_Absyn_Syntax.Const_string ((v, _)) -> begin
(let _25_116 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'i')
in (Support.Microsoft.FStar.Util.MkoWriter.write_bytearray writer v))
end
| Microsoft_FStar_Absyn_Syntax.Const_int (v) -> begin
(let _25_120 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'j')
in (Support.Microsoft.FStar.Util.MkoWriter.write_string writer v))
end))

let deserialize_sconst = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
Microsoft_FStar_Absyn_Syntax.Const_unit
end
| 'b' -> begin
(let _52_7174 = (Support.Microsoft.FStar.Util.MkoReader.read_byte reader ())
in Microsoft_FStar_Absyn_Syntax.Const_uint8 (_52_7174))
end
| 'c' -> begin
(let _52_7175 = (Support.Microsoft.FStar.Util.MkoReader.read_bool reader ())
in Microsoft_FStar_Absyn_Syntax.Const_bool (_52_7175))
end
| 'd' -> begin
(let _52_7176 = (Support.Microsoft.FStar.Util.MkoReader.read_int32 reader ())
in Microsoft_FStar_Absyn_Syntax.Const_int32 (_52_7176))
end
| 'e' -> begin
(let _52_7177 = (Support.Microsoft.FStar.Util.MkoReader.read_int64 reader ())
in Microsoft_FStar_Absyn_Syntax.Const_int64 (_52_7177))
end
| 'f' -> begin
(let _52_7178 = (Support.Microsoft.FStar.Util.MkoReader.read_char reader ())
in Microsoft_FStar_Absyn_Syntax.Const_char (_52_7178))
end
| 'g' -> begin
(let _52_7179 = (Support.Microsoft.FStar.Util.MkoReader.read_double reader ())
in Microsoft_FStar_Absyn_Syntax.Const_float (_52_7179))
end
| 'h' -> begin
(let _52_7181 = (let _52_7180 = (Support.Microsoft.FStar.Util.MkoReader.read_bytearray reader ())
in (_52_7180, Microsoft_FStar_Absyn_Syntax.dummyRange))
in Microsoft_FStar_Absyn_Syntax.Const_bytearray (_52_7181))
end
| 'i' -> begin
(let _52_7183 = (let _52_7182 = (Support.Microsoft.FStar.Util.MkoReader.read_bytearray reader ())
in (_52_7182, Microsoft_FStar_Absyn_Syntax.dummyRange))
in Microsoft_FStar_Absyn_Syntax.Const_string (_52_7183))
end
| 'j' -> begin
(let _52_7184 = (Support.Microsoft.FStar.Util.MkoReader.read_string reader ())
in Microsoft_FStar_Absyn_Syntax.Const_int (_52_7184))
end
| _ -> begin
(parse_error ())
end))

let serialize_either = (fun ( writer  :  l__Writer ) ( s_l  :  l__Writer  ->  'a  ->  unit ) ( s_r  :  l__Writer  ->  'b  ->  unit ) ( ast  :  ('a, 'b) Support.Microsoft.FStar.Util.either ) -> (match (ast) with
| Support.Microsoft.FStar.Util.Inl (v) -> begin
(let _25_143 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
in (s_l writer v))
end
| Support.Microsoft.FStar.Util.Inr (v) -> begin
(let _25_147 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
in (s_r writer v))
end))

let deserialize_either = (fun ( reader  :  l__Reader ) ( ds_l  :  l__Reader  ->  'a ) ( ds_r  :  l__Reader  ->  'b ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
(let _52_7210 = (ds_l reader)
in Support.Microsoft.FStar.Util.Inl (_52_7210))
end
| 'b' -> begin
(let _52_7211 = (ds_r reader)
in Support.Microsoft.FStar.Util.Inr (_52_7211))
end
| _ -> begin
(parse_error ())
end))

let serialize_syntax = (fun ( writer  :  l__Writer ) ( s_a  :  l__Writer  ->  'a  ->  unit ) ( ast  :  ('a, 'b) Microsoft_FStar_Absyn_Syntax.syntax ) -> (s_a writer ast.Microsoft_FStar_Absyn_Syntax.n))

let deserialize_syntax = (fun ( reader  :  l__Reader ) ( ds_a  :  l__Reader  ->  'a ) ( ds_b  :  'b ) -> (let _52_7230 = (ds_a reader)
in (let _52_7229 = (Support.Microsoft.FStar.Util.mk_ref None)
in (let _52_7228 = (Support.Microsoft.FStar.Util.mk_ref None)
in (let _52_7227 = (Support.Microsoft.FStar.Util.mk_ref None)
in {Microsoft_FStar_Absyn_Syntax.n = _52_7230; Microsoft_FStar_Absyn_Syntax.tk = _52_7229; Microsoft_FStar_Absyn_Syntax.pos = Microsoft_FStar_Absyn_Syntax.dummyRange; Microsoft_FStar_Absyn_Syntax.fvs = _52_7228; Microsoft_FStar_Absyn_Syntax.uvs = _52_7227})))))

let rec serialize_typ' = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.typ' ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Typ_btvar (v) -> begin
(let _25_172 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
in (serialize_btvar writer v))
end
| Microsoft_FStar_Absyn_Syntax.Typ_const (v) -> begin
(let _25_176 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
in (serialize_ftvar writer v))
end
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((bs, c)) -> begin
(let _25_182 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
in (let _25_184 = (serialize_binders writer bs)
in (serialize_comp writer c)))
end
| Microsoft_FStar_Absyn_Syntax.Typ_refine ((v, t)) -> begin
(let _25_190 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'd')
in (let _25_192 = (serialize_bvvar writer v)
in (serialize_typ writer t)))
end
| Microsoft_FStar_Absyn_Syntax.Typ_app ((t, ars)) -> begin
(let _25_198 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'e')
in (let _25_200 = (serialize_typ writer t)
in (let _25_202 = (serialize_args writer ars)
in (match ((let _52_7291 = (Support.ST.read Microsoft_FStar_Options.debug)
in (_52_7291 <> []))) with
| true -> begin
(match (t.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_lam ((_, _)) -> begin
(Support.Microsoft.FStar.Util.print_string "type application node with lam\n")
end
| _ -> begin
()
end)
end
| false -> begin
()
end))))
end
| Microsoft_FStar_Absyn_Syntax.Typ_lam ((bs, t)) -> begin
(let _25_216 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'f')
in (let _25_218 = (serialize_binders writer bs)
in (serialize_typ writer t)))
end
| Microsoft_FStar_Absyn_Syntax.Typ_ascribed ((t, k)) -> begin
(let _25_224 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'g')
in (let _25_226 = (serialize_typ writer t)
in (serialize_knd writer k)))
end
| Microsoft_FStar_Absyn_Syntax.Typ_meta (m) -> begin
(let _25_230 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'h')
in (serialize_meta_t writer m))
end
| Microsoft_FStar_Absyn_Syntax.Typ_unknown -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'i')
end
| Microsoft_FStar_Absyn_Syntax.Typ_uvar ((_, _)) -> begin
(raise (Err ("typ not impl:1")))
end
| Microsoft_FStar_Absyn_Syntax.Typ_delayed ((_, _)) -> begin
(raise (Err ("typ not impl:2")))
end))
and serialize_meta_t = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.meta_t ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Meta_pattern ((t, l)) -> begin
(let _25_251 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
in (let _25_253 = (serialize_typ writer t)
in (serialize_list writer serialize_arg l)))
end
| Microsoft_FStar_Absyn_Syntax.Meta_named ((t, lid)) -> begin
(let _25_259 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
in (let _25_261 = (serialize_typ writer t)
in (serialize_lident writer lid)))
end
| Microsoft_FStar_Absyn_Syntax.Meta_labeled ((t, s, _, b)) -> begin
(let _25_270 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
in (let _25_272 = (serialize_typ writer t)
in (let _25_274 = (Support.Microsoft.FStar.Util.MkoWriter.write_string writer s)
in (Support.Microsoft.FStar.Util.MkoWriter.write_bool writer b))))
end
| _ -> begin
(raise (Err ("unimplemented meta_t")))
end))
and serialize_arg = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.arg ) -> (let _25_280 = (serialize_either writer serialize_typ serialize_exp (Support.Prims.fst ast))
in (let _52_7296 = (Support.Prims.pipe_left Microsoft_FStar_Absyn_Syntax.is_implicit (Support.Prims.snd ast))
in (Support.Microsoft.FStar.Util.MkoWriter.write_bool writer _52_7296))))
and serialize_args = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.args ) -> (serialize_list writer serialize_arg ast))
and serialize_binder = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.binder ) -> (let _25_286 = (serialize_either writer serialize_btvar serialize_bvvar (Support.Prims.fst ast))
in (let _52_7301 = (Support.Prims.pipe_left Microsoft_FStar_Absyn_Syntax.is_implicit (Support.Prims.snd ast))
in (Support.Microsoft.FStar.Util.MkoWriter.write_bool writer _52_7301))))
and serialize_binders = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.binders ) -> (serialize_list writer serialize_binder ast))
and serialize_typ = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.typ ) -> (let _52_7306 = (Microsoft_FStar_Absyn_Util.compress_typ ast)
in (serialize_syntax writer serialize_typ' _52_7306)))
and serialize_comp_typ = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.comp_typ ) -> (let _25_294 = (serialize_lident writer ast.Microsoft_FStar_Absyn_Syntax.effect_name)
in (let _25_296 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.result_typ)
in (let _25_298 = (serialize_args writer ast.Microsoft_FStar_Absyn_Syntax.effect_args)
in (serialize_list writer serialize_cflags ast.Microsoft_FStar_Absyn_Syntax.flags)))))
and serialize_comp' = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.comp' ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Total (t) -> begin
(let _25_304 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
in (serialize_typ writer t))
end
| Microsoft_FStar_Absyn_Syntax.Comp (c) -> begin
(let _25_308 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
in (serialize_comp_typ writer c))
end))
and serialize_comp = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.comp ) -> (serialize_syntax writer serialize_comp' ast))
and serialize_cflags = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.cflags ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.TOTAL -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
end
| Microsoft_FStar_Absyn_Syntax.MLEFFECT -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
end
| Microsoft_FStar_Absyn_Syntax.RETURN -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
end
| Microsoft_FStar_Absyn_Syntax.PARTIAL_RETURN -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'd')
end
| Microsoft_FStar_Absyn_Syntax.SOMETRIVIAL -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'e')
end
| Microsoft_FStar_Absyn_Syntax.LEMMA -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'f')
end
| Microsoft_FStar_Absyn_Syntax.DECREASES (e) -> begin
(let _25_322 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'g')
in (serialize_exp writer e))
end))
and serialize_exp' = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.exp' ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Exp_bvar (v) -> begin
(let _25_328 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
in (serialize_bvvar writer v))
end
| Microsoft_FStar_Absyn_Syntax.Exp_fvar ((v, b)) -> begin
(let _25_334 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
in (let _25_336 = (serialize_fvvar writer v)
in (Support.Microsoft.FStar.Util.MkoWriter.write_bool writer false)))
end
| Microsoft_FStar_Absyn_Syntax.Exp_constant (c) -> begin
(let _25_340 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
in (serialize_sconst writer c))
end
| Microsoft_FStar_Absyn_Syntax.Exp_abs ((bs, e)) -> begin
(let _25_346 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'd')
in (let _25_348 = (serialize_binders writer bs)
in (serialize_exp writer e)))
end
| Microsoft_FStar_Absyn_Syntax.Exp_app ((e, ars)) -> begin
(let _25_354 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'e')
in (let _25_356 = (serialize_exp writer e)
in (serialize_args writer ars)))
end
| Microsoft_FStar_Absyn_Syntax.Exp_match ((e, l)) -> begin
(let g = (fun ( writer  :  l__Writer ) ( eopt  :  Microsoft_FStar_Absyn_Syntax.exp option ) -> (match (eopt) with
| Some (e1) -> begin
(let _25_367 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
in (serialize_exp writer e1))
end
| None -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
end))
in (let f = (fun ( writer  :  l__Writer ) ( _25_375  :  (Microsoft_FStar_Absyn_Syntax.pat * Microsoft_FStar_Absyn_Syntax.exp option * Microsoft_FStar_Absyn_Syntax.exp) ) -> (match (_25_375) with
| (p, eopt, e) -> begin
(let _25_376 = (serialize_pat writer p)
in (let _25_378 = (g writer eopt)
in (serialize_exp writer e)))
end))
in (let _25_380 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'f')
in (let _25_382 = (serialize_exp writer e)
in (serialize_list writer f l)))))
end
| Microsoft_FStar_Absyn_Syntax.Exp_ascribed ((e, t, l)) -> begin
(let _25_389 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'g')
in (let _25_391 = (serialize_exp writer e)
in (let _25_393 = (serialize_typ writer t)
in (serialize_option writer serialize_lident l))))
end
| Microsoft_FStar_Absyn_Syntax.Exp_let ((lbs, e)) -> begin
(let _25_399 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'h')
in (let _25_401 = (serialize_letbindings writer lbs)
in (serialize_exp writer e)))
end
| Microsoft_FStar_Absyn_Syntax.Exp_meta (m) -> begin
(let _25_405 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'i')
in (serialize_meta_e writer m))
end
| _ -> begin
(raise (Err ("unimplemented exp\'")))
end))
and serialize_meta_e = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.meta_e ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Meta_desugared ((e, s)) -> begin
(let _25_415 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
in (let _25_417 = (serialize_exp writer e)
in (serialize_meta_source_info writer s)))
end))
and serialize_meta_source_info = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.meta_source_info ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Data_app -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
end
| Microsoft_FStar_Absyn_Syntax.Sequence -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
end
| Microsoft_FStar_Absyn_Syntax.Primop -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
end
| Microsoft_FStar_Absyn_Syntax.MaskedEffect -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'd')
end))
and serialize_exp = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.exp ) -> (let _52_7331 = (Microsoft_FStar_Absyn_Util.compress_exp ast)
in (serialize_syntax writer serialize_exp' _52_7331)))
and serialize_btvdef = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.btvdef ) -> (serialize_bvdef writer ast))
and serialize_bvvdef = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.bvvdef ) -> (serialize_bvdef writer ast))
and serialize_pat' = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.pat' ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Pat_disj (l) -> begin
(let _25_435 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
in (serialize_list writer serialize_pat l))
end
| Microsoft_FStar_Absyn_Syntax.Pat_constant (c) -> begin
(let _25_439 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
in (serialize_sconst writer c))
end
| Microsoft_FStar_Absyn_Syntax.Pat_cons ((v, _, l)) -> begin
(let _25_447 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
in (let _25_449 = (serialize_fvvar writer v)
in (serialize_list writer serialize_pat l)))
end
| Microsoft_FStar_Absyn_Syntax.Pat_var ((v, b)) -> begin
(let _25_455 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'd')
in (let _25_457 = (serialize_bvvar writer v)
in (Support.Microsoft.FStar.Util.MkoWriter.write_bool writer b)))
end
| Microsoft_FStar_Absyn_Syntax.Pat_tvar (v) -> begin
(let _25_461 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'e')
in (serialize_btvar writer v))
end
| Microsoft_FStar_Absyn_Syntax.Pat_wild (v) -> begin
(let _25_465 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'f')
in (serialize_bvvar writer v))
end
| Microsoft_FStar_Absyn_Syntax.Pat_twild (v) -> begin
(let _25_469 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'g')
in (serialize_btvar writer v))
end
| Microsoft_FStar_Absyn_Syntax.Pat_dot_term ((v, e)) -> begin
(let _25_475 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'h')
in (let _25_477 = (serialize_bvvar writer v)
in (serialize_exp writer e)))
end
| Microsoft_FStar_Absyn_Syntax.Pat_dot_typ ((v, t)) -> begin
(let _25_483 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'i')
in (let _25_485 = (serialize_btvar writer v)
in (serialize_typ writer t)))
end))
and serialize_pat = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.pat ) -> (serialize_withinfo_t writer serialize_pat' (fun ( w  :  l__Writer ) ( kt  :  ((Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax, (Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax) Support.Microsoft.FStar.Util.either option ) -> ()) ast))
and serialize_knd' = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.knd' ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Kind_type -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
end
| Microsoft_FStar_Absyn_Syntax.Kind_effect -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
end
| Microsoft_FStar_Absyn_Syntax.Kind_abbrev ((ka, k)) -> begin
(let _25_499 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
in (let _25_501 = (serialize_kabbrev writer ka)
in (serialize_knd writer k)))
end
| Microsoft_FStar_Absyn_Syntax.Kind_arrow ((bs, k)) -> begin
(let _25_507 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'd')
in (let _25_509 = (serialize_binders writer bs)
in (serialize_knd writer k)))
end
| Microsoft_FStar_Absyn_Syntax.Kind_lam ((bs, k)) -> begin
(let _25_515 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'e')
in (let _25_517 = (serialize_binders writer bs)
in (serialize_knd writer k)))
end
| Microsoft_FStar_Absyn_Syntax.Kind_unknown -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'f')
end
| Microsoft_FStar_Absyn_Syntax.Kind_uvar ((uv, args)) -> begin
(raise (Err ("knd\' serialization unimplemented:1")))
end
| Microsoft_FStar_Absyn_Syntax.Kind_delayed ((_, _, _)) -> begin
(raise (Err ("knd\' serialization unimplemented:2")))
end))
and serialize_knd = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.knd ) -> (let _52_7346 = (Microsoft_FStar_Absyn_Util.compress_kind ast)
in (serialize_syntax writer serialize_knd' _52_7346)))
and serialize_kabbrev = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.kabbrev ) -> (let _25_536 = (serialize_lident writer (Support.Prims.fst ast))
in (serialize_args writer (Support.Prims.snd ast))))
and serialize_lbname = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.lbname ) -> (serialize_either writer serialize_bvvdef serialize_lident ast))
and serialize_letbindings = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.letbindings ) -> (let f = (fun ( writer  :  l__Writer ) ( lb  :  Microsoft_FStar_Absyn_Syntax.letbinding ) -> (let _25_545 = (serialize_lbname writer lb.Microsoft_FStar_Absyn_Syntax.lbname)
in (let _25_547 = (serialize_lident writer lb.Microsoft_FStar_Absyn_Syntax.lbeff)
in (let _25_549 = (serialize_typ writer lb.Microsoft_FStar_Absyn_Syntax.lbtyp)
in (serialize_exp writer lb.Microsoft_FStar_Absyn_Syntax.lbdef)))))
in (let _25_551 = (Support.Microsoft.FStar.Util.MkoWriter.write_bool writer (Support.Prims.fst ast))
in (serialize_list writer f (Support.Prims.snd ast)))))
and serialize_fvar = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.fvar ) -> (serialize_either writer serialize_btvdef serialize_bvvdef ast))
and serialize_btvar = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.btvar ) -> (serialize_bvar writer serialize_knd ast))
and serialize_bvvar = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.bvvar ) -> (serialize_bvar writer serialize_typ ast))
and serialize_ftvar = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.ftvar ) -> (serialize_var writer serialize_knd ast))
and serialize_fvvar = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.fvvar ) -> (serialize_var writer serialize_typ ast))

let rec deserialize_typ' = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
(let _52_7397 = (deserialize_btvar reader)
in Microsoft_FStar_Absyn_Syntax.Typ_btvar (_52_7397))
end
| 'b' -> begin
(let _52_7398 = (deserialize_ftvar reader)
in Microsoft_FStar_Absyn_Syntax.Typ_const (_52_7398))
end
| 'c' -> begin
(let _52_7401 = (let _52_7400 = (deserialize_binders reader)
in (let _52_7399 = (deserialize_comp reader)
in (_52_7400, _52_7399)))
in Microsoft_FStar_Absyn_Syntax.Typ_fun (_52_7401))
end
| 'd' -> begin
(let _52_7404 = (let _52_7403 = (deserialize_bvvar reader)
in (let _52_7402 = (deserialize_typ reader)
in (_52_7403, _52_7402)))
in Microsoft_FStar_Absyn_Syntax.Typ_refine (_52_7404))
end
| 'e' -> begin
(let _52_7407 = (let _52_7406 = (deserialize_typ reader)
in (let _52_7405 = (deserialize_args reader)
in (_52_7406, _52_7405)))
in Microsoft_FStar_Absyn_Syntax.Typ_app (_52_7407))
end
| 'f' -> begin
(let _52_7410 = (let _52_7409 = (deserialize_binders reader)
in (let _52_7408 = (deserialize_typ reader)
in (_52_7409, _52_7408)))
in Microsoft_FStar_Absyn_Syntax.Typ_lam (_52_7410))
end
| 'g' -> begin
(let _52_7413 = (let _52_7412 = (deserialize_typ reader)
in (let _52_7411 = (deserialize_knd reader)
in (_52_7412, _52_7411)))
in Microsoft_FStar_Absyn_Syntax.Typ_ascribed (_52_7413))
end
| 'h' -> begin
(let _52_7414 = (deserialize_meta_t reader)
in Microsoft_FStar_Absyn_Syntax.Typ_meta (_52_7414))
end
| 'i' -> begin
Microsoft_FStar_Absyn_Syntax.Typ_unknown
end
| _ -> begin
(parse_error ())
end))
and deserialize_meta_t = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
(let _52_7418 = (let _52_7417 = (deserialize_typ reader)
in (let _52_7416 = (deserialize_list reader deserialize_arg)
in (_52_7417, _52_7416)))
in Microsoft_FStar_Absyn_Syntax.Meta_pattern (_52_7418))
end
| 'b' -> begin
(let _52_7421 = (let _52_7420 = (deserialize_typ reader)
in (let _52_7419 = (deserialize_lident reader)
in (_52_7420, _52_7419)))
in Microsoft_FStar_Absyn_Syntax.Meta_named (_52_7421))
end
| 'c' -> begin
(let _52_7425 = (let _52_7424 = (deserialize_typ reader)
in (let _52_7423 = (Support.Microsoft.FStar.Util.MkoReader.read_string reader ())
in (let _52_7422 = (Support.Microsoft.FStar.Util.MkoReader.read_bool reader ())
in (_52_7424, _52_7423, Microsoft_FStar_Absyn_Syntax.dummyRange, _52_7422))))
in Microsoft_FStar_Absyn_Syntax.Meta_labeled (_52_7425))
end
| _ -> begin
(parse_error ())
end))
and deserialize_arg = (fun ( reader  :  l__Reader ) -> (let _52_7429 = (deserialize_either reader deserialize_typ deserialize_exp)
in (let _52_7428 = (let _52_7427 = (Support.Microsoft.FStar.Util.MkoReader.read_bool reader ())
in (Support.Prims.pipe_left Microsoft_FStar_Absyn_Syntax.as_implicit _52_7427))
in (_52_7429, _52_7428))))
and deserialize_args = (fun ( reader  :  l__Reader ) -> (deserialize_list reader deserialize_arg))
and deserialize_binder = (fun ( reader  :  l__Reader ) -> (let _52_7434 = (deserialize_either reader deserialize_btvar deserialize_bvvar)
in (let _52_7433 = (let _52_7432 = (Support.Microsoft.FStar.Util.MkoReader.read_bool reader ())
in (Support.Prims.pipe_left Microsoft_FStar_Absyn_Syntax.as_implicit _52_7432))
in (_52_7434, _52_7433))))
and deserialize_binders = (fun ( reader  :  l__Reader ) -> (deserialize_list reader deserialize_binder))
and deserialize_typ = (fun ( reader  :  l__Reader ) -> (deserialize_syntax reader deserialize_typ' Microsoft_FStar_Absyn_Syntax.mk_Kind_unknown))
and deserialize_comp_typ = (fun ( reader  :  l__Reader ) -> (let _52_7441 = (deserialize_lident reader)
in (let _52_7440 = (deserialize_typ reader)
in (let _52_7439 = (deserialize_args reader)
in (let _52_7438 = (deserialize_list reader deserialize_cflags)
in {Microsoft_FStar_Absyn_Syntax.effect_name = _52_7441; Microsoft_FStar_Absyn_Syntax.result_typ = _52_7440; Microsoft_FStar_Absyn_Syntax.effect_args = _52_7439; Microsoft_FStar_Absyn_Syntax.flags = _52_7438})))))
and deserialize_comp' = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
(let _52_7443 = (deserialize_typ reader)
in Microsoft_FStar_Absyn_Syntax.Total (_52_7443))
end
| 'b' -> begin
(let _52_7444 = (deserialize_comp_typ reader)
in Microsoft_FStar_Absyn_Syntax.Comp (_52_7444))
end
| _ -> begin
(parse_error ())
end))
and deserialize_comp = (fun ( reader  :  l__Reader ) -> (deserialize_syntax reader deserialize_comp' ()))
and deserialize_cflags = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
Microsoft_FStar_Absyn_Syntax.TOTAL
end
| 'b' -> begin
Microsoft_FStar_Absyn_Syntax.MLEFFECT
end
| 'c' -> begin
Microsoft_FStar_Absyn_Syntax.RETURN
end
| 'd' -> begin
Microsoft_FStar_Absyn_Syntax.PARTIAL_RETURN
end
| 'e' -> begin
Microsoft_FStar_Absyn_Syntax.SOMETRIVIAL
end
| 'f' -> begin
Microsoft_FStar_Absyn_Syntax.LEMMA
end
| 'g' -> begin
(let _52_7447 = (deserialize_exp reader)
in Microsoft_FStar_Absyn_Syntax.DECREASES (_52_7447))
end
| _ -> begin
(parse_error ())
end))
and deserialize_exp' = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
(let _52_7449 = (deserialize_bvvar reader)
in Microsoft_FStar_Absyn_Syntax.Exp_bvar (_52_7449))
end
| 'b' -> begin
(let _52_7452 = (let _52_7451 = (deserialize_fvvar reader)
in (_52_7451, (let _25_606 = (let _52_7450 = (Support.Microsoft.FStar.Util.MkoReader.read_bool reader ())
in (Support.Prims.pipe_left Support.Prims.ignore _52_7450))
in None)))
in Microsoft_FStar_Absyn_Syntax.Exp_fvar (_52_7452))
end
| 'c' -> begin
(let _52_7453 = (deserialize_sconst reader)
in Microsoft_FStar_Absyn_Syntax.Exp_constant (_52_7453))
end
| 'd' -> begin
(let _52_7456 = (let _52_7455 = (deserialize_binders reader)
in (let _52_7454 = (deserialize_exp reader)
in (_52_7455, _52_7454)))
in Microsoft_FStar_Absyn_Syntax.Exp_abs (_52_7456))
end
| 'e' -> begin
(let _52_7459 = (let _52_7458 = (deserialize_exp reader)
in (let _52_7457 = (deserialize_args reader)
in (_52_7458, _52_7457)))
in Microsoft_FStar_Absyn_Syntax.Exp_app (_52_7459))
end
| 'f' -> begin
(let g = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
(let _52_7462 = (deserialize_exp reader)
in Some (_52_7462))
end
| 'b' -> begin
None
end
| _ -> begin
(parse_error ())
end))
in (let f = (fun ( reader  :  l__Reader ) -> (let _52_7467 = (deserialize_pat reader)
in (let _52_7466 = (g reader)
in (let _52_7465 = (deserialize_exp reader)
in (_52_7467, _52_7466, _52_7465)))))
in (let _52_7470 = (let _52_7469 = (deserialize_exp reader)
in (let _52_7468 = (deserialize_list reader f)
in (_52_7469, _52_7468)))
in Microsoft_FStar_Absyn_Syntax.Exp_match (_52_7470))))
end
| 'g' -> begin
(let _52_7474 = (let _52_7473 = (deserialize_exp reader)
in (let _52_7472 = (deserialize_typ reader)
in (let _52_7471 = (deserialize_option reader deserialize_lident)
in (_52_7473, _52_7472, _52_7471))))
in Microsoft_FStar_Absyn_Syntax.Exp_ascribed (_52_7474))
end
| 'h' -> begin
(let _52_7477 = (let _52_7476 = (deserialize_letbindings reader)
in (let _52_7475 = (deserialize_exp reader)
in (_52_7476, _52_7475)))
in Microsoft_FStar_Absyn_Syntax.Exp_let (_52_7477))
end
| 'i' -> begin
(let _52_7478 = (deserialize_meta_e reader)
in Microsoft_FStar_Absyn_Syntax.Exp_meta (_52_7478))
end
| _ -> begin
(parse_error ())
end))
and deserialize_meta_e = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
(let _52_7482 = (let _52_7481 = (deserialize_exp reader)
in (let _52_7480 = (deserialize_meta_source_info reader)
in (_52_7481, _52_7480)))
in Microsoft_FStar_Absyn_Syntax.Meta_desugared (_52_7482))
end
| _ -> begin
(parse_error ())
end))
and deserialize_meta_source_info = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
Microsoft_FStar_Absyn_Syntax.Data_app
end
| 'b' -> begin
Microsoft_FStar_Absyn_Syntax.Sequence
end
| 'c' -> begin
Microsoft_FStar_Absyn_Syntax.Primop
end
| 'd' -> begin
Microsoft_FStar_Absyn_Syntax.MaskedEffect
end
| _ -> begin
(parse_error ())
end))
and deserialize_exp = (fun ( reader  :  l__Reader ) -> (deserialize_syntax reader deserialize_exp' Microsoft_FStar_Absyn_Syntax.mk_Typ_unknown))
and deserialize_btvdef = (fun ( reader  :  l__Reader ) -> (deserialize_bvdef None reader))
and deserialize_bvvdef = (fun ( reader  :  l__Reader ) -> (deserialize_bvdef None reader))
and deserialize_pat' = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
(let _52_7488 = (deserialize_list reader deserialize_pat)
in Microsoft_FStar_Absyn_Syntax.Pat_disj (_52_7488))
end
| 'b' -> begin
(let _52_7489 = (deserialize_sconst reader)
in Microsoft_FStar_Absyn_Syntax.Pat_constant (_52_7489))
end
| 'c' -> begin
(let _52_7492 = (let _52_7491 = (deserialize_fvvar reader)
in (let _52_7490 = (deserialize_list reader deserialize_pat)
in (_52_7491, None, _52_7490)))
in Microsoft_FStar_Absyn_Syntax.Pat_cons (_52_7492))
end
| 'd' -> begin
(let _52_7495 = (let _52_7494 = (deserialize_bvvar reader)
in (let _52_7493 = (Support.Microsoft.FStar.Util.MkoReader.read_bool reader ())
in (_52_7494, _52_7493)))
in Microsoft_FStar_Absyn_Syntax.Pat_var (_52_7495))
end
| 'e' -> begin
(let _52_7496 = (deserialize_btvar reader)
in Microsoft_FStar_Absyn_Syntax.Pat_tvar (_52_7496))
end
| 'f' -> begin
(let _52_7497 = (deserialize_bvvar reader)
in Microsoft_FStar_Absyn_Syntax.Pat_wild (_52_7497))
end
| 'g' -> begin
(let _52_7498 = (deserialize_btvar reader)
in Microsoft_FStar_Absyn_Syntax.Pat_twild (_52_7498))
end
| 'h' -> begin
(let _52_7501 = (let _52_7500 = (deserialize_bvvar reader)
in (let _52_7499 = (deserialize_exp reader)
in (_52_7500, _52_7499)))
in Microsoft_FStar_Absyn_Syntax.Pat_dot_term (_52_7501))
end
| 'i' -> begin
(let _52_7504 = (let _52_7503 = (deserialize_btvar reader)
in (let _52_7502 = (deserialize_typ reader)
in (_52_7503, _52_7502)))
in Microsoft_FStar_Absyn_Syntax.Pat_dot_typ (_52_7504))
end
| _ -> begin
(parse_error ())
end))
and deserialize_pat = (fun ( reader  :  l__Reader ) -> (deserialize_withinfo_t reader deserialize_pat' (fun ( r  :  l__Reader ) -> None)))
and deserialize_knd' = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
Microsoft_FStar_Absyn_Syntax.Kind_type
end
| 'b' -> begin
Microsoft_FStar_Absyn_Syntax.Kind_effect
end
| 'c' -> begin
(let _52_7510 = (let _52_7509 = (deserialize_kabbrev reader)
in (let _52_7508 = (deserialize_knd reader)
in (_52_7509, _52_7508)))
in Microsoft_FStar_Absyn_Syntax.Kind_abbrev (_52_7510))
end
| 'd' -> begin
(let _52_7513 = (let _52_7512 = (deserialize_binders reader)
in (let _52_7511 = (deserialize_knd reader)
in (_52_7512, _52_7511)))
in Microsoft_FStar_Absyn_Syntax.Kind_arrow (_52_7513))
end
| 'e' -> begin
(let _52_7516 = (let _52_7515 = (deserialize_binders reader)
in (let _52_7514 = (deserialize_knd reader)
in (_52_7515, _52_7514)))
in Microsoft_FStar_Absyn_Syntax.Kind_lam (_52_7516))
end
| 'f' -> begin
Microsoft_FStar_Absyn_Syntax.Kind_unknown
end
| _ -> begin
(parse_error ())
end))
and deserialize_knd = (fun ( reader  :  l__Reader ) -> (deserialize_syntax reader deserialize_knd' ()))
and deserialize_kabbrev = (fun ( reader  :  l__Reader ) -> (let _52_7520 = (deserialize_lident reader)
in (let _52_7519 = (deserialize_args reader)
in (_52_7520, _52_7519))))
and deserialize_lbname = (fun ( reader  :  l__Reader ) -> (deserialize_either reader deserialize_bvvdef deserialize_lident))
and deserialize_letbindings = (fun ( reader  :  l__Reader ) -> (let f = (fun ( reader  :  l__Reader ) -> (let _52_7528 = (deserialize_lbname reader)
in (let _52_7527 = (deserialize_typ reader)
in (let _52_7526 = (deserialize_lident reader)
in (let _52_7525 = (deserialize_exp reader)
in {Microsoft_FStar_Absyn_Syntax.lbname = _52_7528; Microsoft_FStar_Absyn_Syntax.lbtyp = _52_7527; Microsoft_FStar_Absyn_Syntax.lbeff = _52_7526; Microsoft_FStar_Absyn_Syntax.lbdef = _52_7525})))))
in (let _52_7530 = (Support.Microsoft.FStar.Util.MkoReader.read_bool reader ())
in (let _52_7529 = (deserialize_list reader f)
in (_52_7530, _52_7529)))))
and deserialize_fvar = (fun ( reader  :  l__Reader ) -> (deserialize_either reader deserialize_btvdef deserialize_bvvdef))
and deserialize_btvar = (fun ( reader  :  l__Reader ) -> (deserialize_bvar None reader deserialize_knd))
and deserialize_bvvar = (fun ( reader  :  l__Reader ) -> (deserialize_bvar None reader deserialize_typ))
and deserialize_ftvar = (fun ( reader  :  l__Reader ) -> (deserialize_var reader deserialize_knd))
and deserialize_fvvar = (fun ( reader  :  l__Reader ) -> (deserialize_var reader deserialize_typ))

let serialize_formula = serialize_typ

let deserialize_formula = deserialize_typ

let serialize_qualifier = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.qualifier ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Private -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
end
| Microsoft_FStar_Absyn_Syntax.Assumption -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
end
| Microsoft_FStar_Absyn_Syntax.Logic -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'g')
end
| Microsoft_FStar_Absyn_Syntax.Opaque -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'h')
end
| Microsoft_FStar_Absyn_Syntax.Discriminator (lid) -> begin
(let _25_681 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'i')
in (serialize_lident writer lid))
end
| Microsoft_FStar_Absyn_Syntax.Projector ((lid, v)) -> begin
(let _25_687 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'j')
in (let _25_689 = (serialize_lident writer lid)
in (serialize_either writer serialize_btvdef serialize_bvvdef v)))
end
| Microsoft_FStar_Absyn_Syntax.RecordType (l) -> begin
(let _25_693 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'k')
in (serialize_list writer serialize_lident l))
end
| Microsoft_FStar_Absyn_Syntax.RecordConstructor (l) -> begin
(let _25_697 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'l')
in (serialize_list writer serialize_lident l))
end
| Microsoft_FStar_Absyn_Syntax.ExceptionConstructor -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'm')
end
| Microsoft_FStar_Absyn_Syntax.HasMaskedEffect -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'o')
end
| Microsoft_FStar_Absyn_Syntax.DefaultEffect (l) -> begin
(let _25_703 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'p')
in (serialize_option writer serialize_lident l))
end
| Microsoft_FStar_Absyn_Syntax.TotalEffect -> begin
(Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'q')
end
| _ -> begin
(failwith ("Unexpected qualifier"))
end))

let deserialize_qualifier = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
Microsoft_FStar_Absyn_Syntax.Private
end
| 'c' -> begin
Microsoft_FStar_Absyn_Syntax.Assumption
end
| 'g' -> begin
Microsoft_FStar_Absyn_Syntax.Logic
end
| 'h' -> begin
Microsoft_FStar_Absyn_Syntax.Opaque
end
| 'i' -> begin
(let _52_7545 = (deserialize_lident reader)
in Microsoft_FStar_Absyn_Syntax.Discriminator (_52_7545))
end
| 'j' -> begin
(let _52_7548 = (let _52_7547 = (deserialize_lident reader)
in (let _52_7546 = (deserialize_either reader deserialize_btvdef deserialize_bvvdef)
in (_52_7547, _52_7546)))
in Microsoft_FStar_Absyn_Syntax.Projector (_52_7548))
end
| 'k' -> begin
(let _52_7549 = (deserialize_list reader deserialize_lident)
in Microsoft_FStar_Absyn_Syntax.RecordType (_52_7549))
end
| 'l' -> begin
(let _52_7550 = (deserialize_list reader deserialize_lident)
in Microsoft_FStar_Absyn_Syntax.RecordConstructor (_52_7550))
end
| 'm' -> begin
Microsoft_FStar_Absyn_Syntax.ExceptionConstructor
end
| 'o' -> begin
Microsoft_FStar_Absyn_Syntax.HasMaskedEffect
end
| 'p' -> begin
(let _52_7552 = (deserialize_option reader deserialize_lident)
in (Support.Prims.pipe_right _52_7552 (fun ( _52_7551  :  Microsoft_FStar_Absyn_Syntax.lident option ) -> Microsoft_FStar_Absyn_Syntax.DefaultEffect (_52_7551))))
end
| 'q' -> begin
Microsoft_FStar_Absyn_Syntax.TotalEffect
end
| _ -> begin
(parse_error ())
end))

let serialize_tycon = (fun ( writer  :  l__Writer ) ( _25_727  :  Microsoft_FStar_Absyn_Syntax.tycon ) -> (match (_25_727) with
| (lid, bs, k) -> begin
(let _25_728 = (serialize_lident writer lid)
in (let _25_730 = (serialize_binders writer bs)
in (serialize_knd writer k)))
end))

let deserialize_tycon = (fun ( reader  :  l__Reader ) -> (let _52_7561 = (deserialize_lident reader)
in (let _52_7560 = (deserialize_binders reader)
in (let _52_7559 = (deserialize_knd reader)
in (_52_7561, _52_7560, _52_7559)))))

let serialize_monad_abbrev = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.monad_abbrev ) -> (let _25_735 = (serialize_lident writer ast.Microsoft_FStar_Absyn_Syntax.mabbrev)
in (let _25_737 = (serialize_binders writer ast.Microsoft_FStar_Absyn_Syntax.parms)
in (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.def))))

let deserialize_monad_abbrev = (fun ( reader  :  l__Reader ) -> (let _52_7570 = (deserialize_lident reader)
in (let _52_7569 = (deserialize_binders reader)
in (let _52_7568 = (deserialize_typ reader)
in {Microsoft_FStar_Absyn_Syntax.mabbrev = _52_7570; Microsoft_FStar_Absyn_Syntax.parms = _52_7569; Microsoft_FStar_Absyn_Syntax.def = _52_7568}))))

let serialize_sub_effect = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.sub_eff ) -> (let _25_742 = (serialize_lident writer ast.Microsoft_FStar_Absyn_Syntax.source)
in (let _25_744 = (serialize_lident writer ast.Microsoft_FStar_Absyn_Syntax.target)
in (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.lift))))

let deserialize_sub_effect = (fun ( reader  :  l__Reader ) -> (let _52_7579 = (deserialize_lident reader)
in (let _52_7578 = (deserialize_lident reader)
in (let _52_7577 = (deserialize_typ reader)
in {Microsoft_FStar_Absyn_Syntax.source = _52_7579; Microsoft_FStar_Absyn_Syntax.target = _52_7578; Microsoft_FStar_Absyn_Syntax.lift = _52_7577}))))

let rec serialize_new_effect = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.eff_decl ) -> (let _25_749 = (serialize_lident writer ast.Microsoft_FStar_Absyn_Syntax.mname)
in (let _25_751 = (serialize_list writer serialize_binder ast.Microsoft_FStar_Absyn_Syntax.binders)
in (let _25_753 = (serialize_list writer serialize_qualifier ast.Microsoft_FStar_Absyn_Syntax.qualifiers)
in (let _25_755 = (serialize_knd writer ast.Microsoft_FStar_Absyn_Syntax.signature)
in (let _25_757 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.ret)
in (let _25_759 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.bind_wp)
in (let _25_761 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.bind_wlp)
in (let _25_763 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.if_then_else)
in (let _25_765 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.ite_wp)
in (let _25_767 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.ite_wlp)
in (let _25_769 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.wp_binop)
in (let _25_771 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.wp_as_type)
in (let _25_773 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.close_wp)
in (let _25_775 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.close_wp_t)
in (let _25_777 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.assert_p)
in (let _25_779 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.assume_p)
in (let _25_781 = (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.null_wp)
in (serialize_typ writer ast.Microsoft_FStar_Absyn_Syntax.trivial)))))))))))))))))))
and serialize_sigelt = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.sigelt ) -> (match (ast) with
| Microsoft_FStar_Absyn_Syntax.Sig_pragma (_) -> begin
(failwith ("NYI"))
end
| Microsoft_FStar_Absyn_Syntax.Sig_tycon ((lid, bs, k, l1, l2, qs, _)) -> begin
(let _25_798 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'a')
in (let _25_800 = (serialize_lident writer lid)
in (let _25_802 = (serialize_binders writer bs)
in (let _25_804 = (serialize_knd writer k)
in (let _25_806 = (serialize_list writer serialize_lident l1)
in (let _25_808 = (serialize_list writer serialize_lident l2)
in (serialize_list writer serialize_qualifier qs)))))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((lid, bs, k, t, qs, _)) -> begin
(let _25_819 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'b')
in (let _25_821 = (serialize_lident writer lid)
in (let _25_823 = (serialize_binders writer bs)
in (let _25_825 = (serialize_knd writer k)
in (let _25_827 = (serialize_typ writer t)
in (serialize_list writer serialize_qualifier qs))))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_datacon ((lid1, t, tyc, qs, mutuals, _)) -> begin
(let t' = (match ((Microsoft_FStar_Absyn_Util.function_formals t)) with
| Some ((f, c)) -> begin
(let _52_7589 = (let _52_7588 = (Microsoft_FStar_Absyn_Syntax.mk_Total (Microsoft_FStar_Absyn_Util.comp_result c))
in (f, _52_7588))
in (Microsoft_FStar_Absyn_Syntax.mk_Typ_fun _52_7589 None Microsoft_FStar_Absyn_Syntax.dummyRange))
end
| None -> begin
t
end)
in (let _25_844 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'c')
in (let _25_846 = (serialize_lident writer lid1)
in (let _25_848 = (serialize_typ writer t')
in (let _25_850 = (serialize_tycon writer tyc)
in (let _25_852 = (serialize_list writer serialize_qualifier qs)
in (serialize_list writer serialize_lident mutuals)))))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((lid, t, qs, _)) -> begin
(let _25_861 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'd')
in (let _25_863 = (serialize_lident writer lid)
in (let _25_865 = (serialize_typ writer t)
in (serialize_list writer serialize_qualifier qs))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_assume ((lid, fml, qs, _)) -> begin
(let _25_874 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'e')
in (let _25_876 = (serialize_lident writer lid)
in (let _25_878 = (serialize_formula writer fml)
in (serialize_list writer serialize_qualifier qs))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_let ((lbs, _, l, quals)) -> begin
(let _25_887 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'f')
in (let _25_889 = (serialize_letbindings writer lbs)
in (let _25_891 = (serialize_list writer serialize_lident l)
in (let _52_7591 = (Support.Prims.pipe_right quals (Support.Microsoft.FStar.Util.for_some (fun ( _25_1  :  Microsoft_FStar_Absyn_Syntax.qualifier ) -> (match (_25_1) with
| Microsoft_FStar_Absyn_Syntax.HasMaskedEffect -> begin
true
end
| _ -> begin
false
end))))
in (Support.Microsoft.FStar.Util.MkoWriter.write_bool writer _52_7591)))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_main ((e, _)) -> begin
(let _25_902 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'g')
in (serialize_exp writer e))
end
| Microsoft_FStar_Absyn_Syntax.Sig_bundle ((l, qs, lids, _)) -> begin
(let _25_911 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'h')
in (let _25_913 = (serialize_list writer serialize_sigelt l)
in (let _25_915 = (serialize_list writer serialize_qualifier qs)
in (serialize_list writer serialize_lident lids))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_new_effect ((n, _)) -> begin
(let _25_922 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'i')
in (serialize_new_effect writer n))
end
| Microsoft_FStar_Absyn_Syntax.Sig_effect_abbrev ((lid, bs, c, qs, _)) -> begin
(let _25_932 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'j')
in (let _25_934 = (serialize_lident writer lid)
in (let _25_936 = (serialize_binders writer bs)
in (let _25_938 = (serialize_comp writer c)
in (serialize_list writer serialize_qualifier qs)))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_sub_effect ((se, r)) -> begin
(let _25_944 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'k')
in (serialize_sub_effect writer se))
end
| Microsoft_FStar_Absyn_Syntax.Sig_kind_abbrev ((l, binders, k, _)) -> begin
(let _25_953 = (Support.Microsoft.FStar.Util.MkoWriter.write_char writer 'l')
in (let _25_955 = (serialize_lident writer l)
in (let _25_957 = (serialize_list writer serialize_binder binders)
in (serialize_knd writer k))))
end))

let rec deserialize_new_effect = (fun ( reader  :  l__Reader ) -> (let _52_7612 = (deserialize_lident reader)
in (let _52_7611 = (deserialize_list reader deserialize_binder)
in (let _52_7610 = (deserialize_list reader deserialize_qualifier)
in (let _52_7609 = (deserialize_knd reader)
in (let _52_7608 = (deserialize_typ reader)
in (let _52_7607 = (deserialize_typ reader)
in (let _52_7606 = (deserialize_typ reader)
in (let _52_7605 = (deserialize_typ reader)
in (let _52_7604 = (deserialize_typ reader)
in (let _52_7603 = (deserialize_typ reader)
in (let _52_7602 = (deserialize_typ reader)
in (let _52_7601 = (deserialize_typ reader)
in (let _52_7600 = (deserialize_typ reader)
in (let _52_7599 = (deserialize_typ reader)
in (let _52_7598 = (deserialize_typ reader)
in (let _52_7597 = (deserialize_typ reader)
in (let _52_7596 = (deserialize_typ reader)
in (let _52_7595 = (deserialize_typ reader)
in {Microsoft_FStar_Absyn_Syntax.mname = _52_7612; Microsoft_FStar_Absyn_Syntax.binders = _52_7611; Microsoft_FStar_Absyn_Syntax.qualifiers = _52_7610; Microsoft_FStar_Absyn_Syntax.signature = _52_7609; Microsoft_FStar_Absyn_Syntax.ret = _52_7608; Microsoft_FStar_Absyn_Syntax.bind_wp = _52_7607; Microsoft_FStar_Absyn_Syntax.bind_wlp = _52_7606; Microsoft_FStar_Absyn_Syntax.if_then_else = _52_7605; Microsoft_FStar_Absyn_Syntax.ite_wp = _52_7604; Microsoft_FStar_Absyn_Syntax.ite_wlp = _52_7603; Microsoft_FStar_Absyn_Syntax.wp_binop = _52_7602; Microsoft_FStar_Absyn_Syntax.wp_as_type = _52_7601; Microsoft_FStar_Absyn_Syntax.close_wp = _52_7600; Microsoft_FStar_Absyn_Syntax.close_wp_t = _52_7599; Microsoft_FStar_Absyn_Syntax.assert_p = _52_7598; Microsoft_FStar_Absyn_Syntax.assume_p = _52_7597; Microsoft_FStar_Absyn_Syntax.null_wp = _52_7596; Microsoft_FStar_Absyn_Syntax.trivial = _52_7595})))))))))))))))))))
and deserialize_sigelt = (fun ( reader  :  l__Reader ) -> (match ((Support.Microsoft.FStar.Util.MkoReader.read_char reader ())) with
| 'a' -> begin
(let _52_7620 = (let _52_7619 = (deserialize_lident reader)
in (let _52_7618 = (deserialize_binders reader)
in (let _52_7617 = (deserialize_knd reader)
in (let _52_7616 = (deserialize_list reader deserialize_lident)
in (let _52_7615 = (deserialize_list reader deserialize_lident)
in (let _52_7614 = (deserialize_list reader deserialize_qualifier)
in (_52_7619, _52_7618, _52_7617, _52_7616, _52_7615, _52_7614, Microsoft_FStar_Absyn_Syntax.dummyRange)))))))
in Microsoft_FStar_Absyn_Syntax.Sig_tycon (_52_7620))
end
| 'b' -> begin
(let _52_7626 = (let _52_7625 = (deserialize_lident reader)
in (let _52_7624 = (deserialize_binders reader)
in (let _52_7623 = (deserialize_knd reader)
in (let _52_7622 = (deserialize_typ reader)
in (let _52_7621 = (deserialize_list reader deserialize_qualifier)
in (_52_7625, _52_7624, _52_7623, _52_7622, _52_7621, Microsoft_FStar_Absyn_Syntax.dummyRange))))))
in Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev (_52_7626))
end
| 'c' -> begin
(let _52_7632 = (let _52_7631 = (deserialize_lident reader)
in (let _52_7630 = (deserialize_typ reader)
in (let _52_7629 = (deserialize_tycon reader)
in (let _52_7628 = (deserialize_list reader deserialize_qualifier)
in (let _52_7627 = (deserialize_list reader deserialize_lident)
in (_52_7631, _52_7630, _52_7629, _52_7628, _52_7627, Microsoft_FStar_Absyn_Syntax.dummyRange))))))
in Microsoft_FStar_Absyn_Syntax.Sig_datacon (_52_7632))
end
| 'd' -> begin
(let _52_7636 = (let _52_7635 = (deserialize_lident reader)
in (let _52_7634 = (deserialize_typ reader)
in (let _52_7633 = (deserialize_list reader deserialize_qualifier)
in (_52_7635, _52_7634, _52_7633, Microsoft_FStar_Absyn_Syntax.dummyRange))))
in Microsoft_FStar_Absyn_Syntax.Sig_val_decl (_52_7636))
end
| 'e' -> begin
(let _52_7640 = (let _52_7639 = (deserialize_lident reader)
in (let _52_7638 = (deserialize_formula reader)
in (let _52_7637 = (deserialize_list reader deserialize_qualifier)
in (_52_7639, _52_7638, _52_7637, Microsoft_FStar_Absyn_Syntax.dummyRange))))
in Microsoft_FStar_Absyn_Syntax.Sig_assume (_52_7640))
end
| 'f' -> begin
(let _52_7644 = (let _52_7643 = (deserialize_letbindings reader)
in (let _52_7642 = (deserialize_list reader deserialize_lident)
in (let _52_7641 = (match ((Support.Microsoft.FStar.Util.MkoReader.read_bool reader ())) with
| true -> begin
(Microsoft_FStar_Absyn_Syntax.HasMaskedEffect)::[]
end
| false -> begin
[]
end)
in (_52_7643, Microsoft_FStar_Absyn_Syntax.dummyRange, _52_7642, _52_7641))))
in Microsoft_FStar_Absyn_Syntax.Sig_let (_52_7644))
end
| 'g' -> begin
(let _52_7646 = (let _52_7645 = (deserialize_exp reader)
in (_52_7645, Microsoft_FStar_Absyn_Syntax.dummyRange))
in Microsoft_FStar_Absyn_Syntax.Sig_main (_52_7646))
end
| 'h' -> begin
(let _52_7650 = (let _52_7649 = (deserialize_list reader deserialize_sigelt)
in (let _52_7648 = (deserialize_list reader deserialize_qualifier)
in (let _52_7647 = (deserialize_list reader deserialize_lident)
in (_52_7649, _52_7648, _52_7647, Microsoft_FStar_Absyn_Syntax.dummyRange))))
in Microsoft_FStar_Absyn_Syntax.Sig_bundle (_52_7650))
end
| 'i' -> begin
(let _52_7652 = (let _52_7651 = (deserialize_new_effect reader)
in (_52_7651, Microsoft_FStar_Absyn_Syntax.dummyRange))
in Microsoft_FStar_Absyn_Syntax.Sig_new_effect (_52_7652))
end
| ('j') | ('k') | ('l') -> begin
(failwith ("TODO"))
end
| _ -> begin
(parse_error ())
end))

let serialize_sigelts = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.sigelts ) -> (serialize_list writer serialize_sigelt ast))

let deserialize_sigelts = (fun ( reader  :  l__Reader ) -> (deserialize_list reader deserialize_sigelt))

let serialize_modul = (fun ( writer  :  l__Writer ) ( ast  :  Microsoft_FStar_Absyn_Syntax.modul ) -> (let _25_980 = (serialize_lident writer ast.Microsoft_FStar_Absyn_Syntax.name)
in (let _25_982 = (serialize_sigelts writer [])
in (let _25_984 = (serialize_sigelts writer ast.Microsoft_FStar_Absyn_Syntax.exports)
in (Support.Microsoft.FStar.Util.MkoWriter.write_bool writer ast.Microsoft_FStar_Absyn_Syntax.is_interface)))))

let deserialize_modul = (fun ( reader  :  l__Reader ) -> (let m = (let _52_7668 = (deserialize_lident reader)
in (let _52_7667 = (deserialize_sigelts reader)
in (let _52_7666 = (deserialize_sigelts reader)
in (let _52_7665 = (Support.Microsoft.FStar.Util.MkoReader.read_bool reader ())
in {Microsoft_FStar_Absyn_Syntax.name = _52_7668; Microsoft_FStar_Absyn_Syntax.declarations = _52_7667; Microsoft_FStar_Absyn_Syntax.exports = _52_7666; Microsoft_FStar_Absyn_Syntax.is_interface = _52_7665; Microsoft_FStar_Absyn_Syntax.is_deserialized = true}))))
in (let _25_988 = m
in {Microsoft_FStar_Absyn_Syntax.name = _25_988.Microsoft_FStar_Absyn_Syntax.name; Microsoft_FStar_Absyn_Syntax.declarations = m.Microsoft_FStar_Absyn_Syntax.exports; Microsoft_FStar_Absyn_Syntax.exports = _25_988.Microsoft_FStar_Absyn_Syntax.exports; Microsoft_FStar_Absyn_Syntax.is_interface = _25_988.Microsoft_FStar_Absyn_Syntax.is_interface; Microsoft_FStar_Absyn_Syntax.is_deserialized = _25_988.Microsoft_FStar_Absyn_Syntax.is_deserialized})))





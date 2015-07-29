
type binding =
| Binding_var of (Microsoft_FStar_Absyn_Syntax.bvvdef * Microsoft_FStar_Absyn_Syntax.typ)
| Binding_typ of (Microsoft_FStar_Absyn_Syntax.btvdef * Microsoft_FStar_Absyn_Syntax.knd)
| Binding_lid of (Microsoft_FStar_Absyn_Syntax.lident * Microsoft_FStar_Absyn_Syntax.typ)
| Binding_sig of Microsoft_FStar_Absyn_Syntax.sigelt

let is_Binding_var = (fun ( _discr_ ) -> (match (_discr_) with
| Binding_var (_) -> begin
true
end
| _ -> begin
false
end))

let is_Binding_typ = (fun ( _discr_ ) -> (match (_discr_) with
| Binding_typ (_) -> begin
true
end
| _ -> begin
false
end))

let is_Binding_lid = (fun ( _discr_ ) -> (match (_discr_) with
| Binding_lid (_) -> begin
true
end
| _ -> begin
false
end))

let is_Binding_sig = (fun ( _discr_ ) -> (match (_discr_) with
| Binding_sig (_) -> begin
true
end
| _ -> begin
false
end))

type sigtable =
Microsoft_FStar_Absyn_Syntax.sigelt Support.Microsoft.FStar.Util.smap

let default_table_size = 200

let strlid_of_sigelt = (fun ( se  :  Microsoft_FStar_Absyn_Syntax.sigelt ) -> (match ((Microsoft_FStar_Absyn_Util.lid_of_sigelt se)) with
| None -> begin
None
end
| Some (l) -> begin
(let _52_7841 = (Microsoft_FStar_Absyn_Syntax.text_of_lid l)
in Some (_52_7841))
end))

let signature_to_sigtables = (fun ( s  :  Microsoft_FStar_Absyn_Syntax.sigelt list ) -> (let ht = (Support.Microsoft.FStar.Util.smap_create default_table_size)
in (let _27_31 = (Support.List.iter (fun ( se  :  Microsoft_FStar_Absyn_Syntax.sigelt ) -> (let lids = (Microsoft_FStar_Absyn_Util.lids_of_sigelt se)
in (Support.List.iter (fun ( l  :  Microsoft_FStar_Absyn_Syntax.l__LongIdent ) -> (Support.Microsoft.FStar.Util.smap_add ht l.Microsoft_FStar_Absyn_Syntax.str se)) lids))) s)
in ht)))

let modules_to_sigtables = (fun ( mods  :  ('u27u1086 * Microsoft_FStar_Absyn_Syntax.modul) list ) -> (let _52_7848 = (Support.List.collect (fun ( _27_37  :  ('u27u1086 * Microsoft_FStar_Absyn_Syntax.modul) ) -> (match (_27_37) with
| (_, m) -> begin
m.Microsoft_FStar_Absyn_Syntax.declarations
end)) mods)
in (signature_to_sigtables _52_7848)))

type level =
| Expr
| Type
| Kind

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

type mlift =
Microsoft_FStar_Absyn_Syntax.typ  ->  Microsoft_FStar_Absyn_Syntax.typ  ->  Microsoft_FStar_Absyn_Syntax.typ

type edge =
{msource : Microsoft_FStar_Absyn_Syntax.lident; mtarget : Microsoft_FStar_Absyn_Syntax.lident; mlift : mlift}

let is_Mkedge = (fun ( _  :  edge ) -> (failwith ("Not yet implemented")))

type effects =
{decls : Microsoft_FStar_Absyn_Syntax.eff_decl list; order : edge list; joins : (Microsoft_FStar_Absyn_Syntax.lident * Microsoft_FStar_Absyn_Syntax.lident * Microsoft_FStar_Absyn_Syntax.lident * mlift * mlift) list}

let is_Mkeffects = (fun ( _  :  effects ) -> (failwith ("Not yet implemented")))

type env =
{solver : solver_t; range : Support.Microsoft.FStar.Range.range; curmodule : Microsoft_FStar_Absyn_Syntax.lident; gamma : binding list; modules : Microsoft_FStar_Absyn_Syntax.modul list; expected_typ : Microsoft_FStar_Absyn_Syntax.typ option; level : level; sigtab : sigtable list; is_pattern : bool; instantiate_targs : bool; instantiate_vargs : bool; effects : effects; generalize : bool; letrecs : (Microsoft_FStar_Absyn_Syntax.lbname * Microsoft_FStar_Absyn_Syntax.typ) list; top_level : bool; check_uvars : bool; use_eq : bool; is_iface : bool; admit : bool; default_effects : (Microsoft_FStar_Absyn_Syntax.lident * Microsoft_FStar_Absyn_Syntax.lident) list} 
 and solver_t =
{init : env  ->  unit; push : string  ->  unit; pop : string  ->  unit; mark : string  ->  unit; reset_mark : string  ->  unit; commit_mark : string  ->  unit; encode_modul : env  ->  Microsoft_FStar_Absyn_Syntax.modul  ->  unit; encode_sig : env  ->  Microsoft_FStar_Absyn_Syntax.sigelt  ->  unit; solve : env  ->  Microsoft_FStar_Absyn_Syntax.typ  ->  unit; is_trivial : env  ->  Microsoft_FStar_Absyn_Syntax.typ  ->  bool; finish : unit  ->  unit; refresh : unit  ->  unit}

let is_Mkenv = (fun ( _  :  env ) -> (failwith ("Not yet implemented")))

let is_Mksolver_t = (fun ( _  :  solver_t ) -> (failwith ("Not yet implemented")))

let bound_vars = (fun ( env  :  env ) -> (Support.Prims.pipe_right env.gamma (Support.List.collect (fun ( _27_1  :  binding ) -> (match (_27_1) with
| Binding_typ ((a, k)) -> begin
(let _52_8074 = (Support.Prims.pipe_left (fun ( _52_8073  :  ((Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax Microsoft_FStar_Absyn_Syntax.bvdef, Microsoft_FStar_Absyn_Syntax.knd) Microsoft_FStar_Absyn_Syntax.withinfo_t ) -> Support.Microsoft.FStar.Util.Inl (_52_8073)) (Microsoft_FStar_Absyn_Util.bvd_to_bvar_s a k))
in (_52_8074)::[])
end
| Binding_var ((x, t)) -> begin
(let _52_8076 = (Support.Prims.pipe_left (fun ( _52_8075  :  ((Microsoft_FStar_Absyn_Syntax.exp', (Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax Microsoft_FStar_Absyn_Syntax.bvdef, Microsoft_FStar_Absyn_Syntax.typ) Microsoft_FStar_Absyn_Syntax.withinfo_t ) -> Support.Microsoft.FStar.Util.Inr (_52_8075)) (Microsoft_FStar_Absyn_Util.bvd_to_bvar_s x t))
in (_52_8076)::[])
end
| Binding_lid (_) -> begin
[]
end
| Binding_sig (_) -> begin
[]
end)))))

let has_interface = (fun ( env  :  env ) ( l  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (Support.Prims.pipe_right env.modules (Support.Microsoft.FStar.Util.for_some (fun ( m  :  Microsoft_FStar_Absyn_Syntax.modul ) -> (m.Microsoft_FStar_Absyn_Syntax.is_interface && (Microsoft_FStar_Absyn_Syntax.lid_equals m.Microsoft_FStar_Absyn_Syntax.name l))))))

let debug = (fun ( env  :  env ) ( l  :  Microsoft_FStar_Options.debug_level_t ) -> (let _52_8089 = (let _52_8087 = (Support.ST.read Microsoft_FStar_Options.debug)
in (Support.Prims.pipe_right _52_8087 (Support.Microsoft.FStar.Util.for_some (fun ( x  :  string ) -> (env.curmodule.Microsoft_FStar_Absyn_Syntax.str = x)))))
in (let _52_8088 = (Microsoft_FStar_Options.debug_level_geq l)
in (_52_8089 && _52_8088))))

let show = (fun ( env  :  env ) -> (let _52_8093 = (Support.ST.read Microsoft_FStar_Options.show_signatures)
in (Support.Prims.pipe_right _52_8093 (Support.Microsoft.FStar.Util.for_some (fun ( x  :  string ) -> (env.curmodule.Microsoft_FStar_Absyn_Syntax.str = x))))))

let new_sigtab = (fun ( _27_104  :  unit ) -> (match (()) with
| () -> begin
(Support.Microsoft.FStar.Util.smap_create default_table_size)
end))

let sigtab = (fun ( env  :  env ) -> (Support.List.hd env.sigtab))

let push = (fun ( env  :  env ) ( msg  :  string ) -> (let _27_108 = (Microsoft_FStar_Tc_Env_Mksolver_t.push env.solver msg)
in (let _27_110 = env
in (let _52_8103 = (let _52_8102 = (let _52_8101 = (sigtab env)
in (Support.Microsoft.FStar.Util.smap_copy _52_8101))
in (_52_8102)::env.sigtab)
in {solver = _27_110.solver; range = _27_110.range; curmodule = _27_110.curmodule; gamma = _27_110.gamma; modules = _27_110.modules; expected_typ = _27_110.expected_typ; level = _27_110.level; sigtab = _52_8103; is_pattern = _27_110.is_pattern; instantiate_targs = _27_110.instantiate_targs; instantiate_vargs = _27_110.instantiate_vargs; effects = _27_110.effects; generalize = _27_110.generalize; letrecs = _27_110.letrecs; top_level = _27_110.top_level; check_uvars = _27_110.check_uvars; use_eq = _27_110.use_eq; is_iface = _27_110.is_iface; admit = _27_110.admit; default_effects = _27_110.default_effects}))))

let mark = (fun ( env  :  env ) -> (let _27_113 = (Microsoft_FStar_Tc_Env_Mksolver_t.mark env.solver "USER MARK")
in (let _27_115 = env
in (let _52_8108 = (let _52_8107 = (let _52_8106 = (sigtab env)
in (Support.Microsoft.FStar.Util.smap_copy _52_8106))
in (_52_8107)::env.sigtab)
in {solver = _27_115.solver; range = _27_115.range; curmodule = _27_115.curmodule; gamma = _27_115.gamma; modules = _27_115.modules; expected_typ = _27_115.expected_typ; level = _27_115.level; sigtab = _52_8108; is_pattern = _27_115.is_pattern; instantiate_targs = _27_115.instantiate_targs; instantiate_vargs = _27_115.instantiate_vargs; effects = _27_115.effects; generalize = _27_115.generalize; letrecs = _27_115.letrecs; top_level = _27_115.top_level; check_uvars = _27_115.check_uvars; use_eq = _27_115.use_eq; is_iface = _27_115.is_iface; admit = _27_115.admit; default_effects = _27_115.default_effects}))))

let commit_mark = (fun ( env  :  env ) -> (let _27_118 = (Microsoft_FStar_Tc_Env_Mksolver_t.commit_mark env.solver "USER MARK")
in (let sigtab = (match (env.sigtab) with
| hd::_::tl -> begin
(hd)::tl
end
| _ -> begin
(failwith ("Impossible"))
end)
in (let _27_129 = env
in {solver = _27_129.solver; range = _27_129.range; curmodule = _27_129.curmodule; gamma = _27_129.gamma; modules = _27_129.modules; expected_typ = _27_129.expected_typ; level = _27_129.level; sigtab = sigtab; is_pattern = _27_129.is_pattern; instantiate_targs = _27_129.instantiate_targs; instantiate_vargs = _27_129.instantiate_vargs; effects = _27_129.effects; generalize = _27_129.generalize; letrecs = _27_129.letrecs; top_level = _27_129.top_level; check_uvars = _27_129.check_uvars; use_eq = _27_129.use_eq; is_iface = _27_129.is_iface; admit = _27_129.admit; default_effects = _27_129.default_effects}))))

let reset_mark = (fun ( env  :  env ) -> (let _27_132 = (Microsoft_FStar_Tc_Env_Mksolver_t.reset_mark env.solver "USER MARK")
in (let _27_134 = env
in (let _52_8113 = (Support.List.tl env.sigtab)
in {solver = _27_134.solver; range = _27_134.range; curmodule = _27_134.curmodule; gamma = _27_134.gamma; modules = _27_134.modules; expected_typ = _27_134.expected_typ; level = _27_134.level; sigtab = _52_8113; is_pattern = _27_134.is_pattern; instantiate_targs = _27_134.instantiate_targs; instantiate_vargs = _27_134.instantiate_vargs; effects = _27_134.effects; generalize = _27_134.generalize; letrecs = _27_134.letrecs; top_level = _27_134.top_level; check_uvars = _27_134.check_uvars; use_eq = _27_134.use_eq; is_iface = _27_134.is_iface; admit = _27_134.admit; default_effects = _27_134.default_effects}))))

let pop = (fun ( env  :  env ) ( msg  :  string ) -> (match (env.sigtab) with
| ([]) | (_::[]) -> begin
(failwith ("Too many pops"))
end
| _::tl -> begin
(let _27_146 = (Microsoft_FStar_Tc_Env_Mksolver_t.pop env.solver msg)
in (let _27_148 = env
in {solver = _27_148.solver; range = _27_148.range; curmodule = _27_148.curmodule; gamma = _27_148.gamma; modules = _27_148.modules; expected_typ = _27_148.expected_typ; level = _27_148.level; sigtab = tl; is_pattern = _27_148.is_pattern; instantiate_targs = _27_148.instantiate_targs; instantiate_vargs = _27_148.instantiate_vargs; effects = _27_148.effects; generalize = _27_148.generalize; letrecs = _27_148.letrecs; top_level = _27_148.top_level; check_uvars = _27_148.check_uvars; use_eq = _27_148.use_eq; is_iface = _27_148.is_iface; admit = _27_148.admit; default_effects = _27_148.default_effects}))
end))

let initial_env = (fun ( solver  :  solver_t ) ( module_lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (let _52_8123 = (let _52_8122 = (new_sigtab ())
in (_52_8122)::[])
in {solver = solver; range = Microsoft_FStar_Absyn_Syntax.dummyRange; curmodule = module_lid; gamma = []; modules = []; expected_typ = None; level = Expr; sigtab = _52_8123; is_pattern = false; instantiate_targs = true; instantiate_vargs = true; effects = {decls = []; order = []; joins = []}; generalize = true; letrecs = []; top_level = true; check_uvars = false; use_eq = false; is_iface = false; admit = false; default_effects = []}))

let effect_decl_opt = (fun ( env  :  env ) ( l  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (Support.Prims.pipe_right env.effects.decls (Support.Microsoft.FStar.Util.find_opt (fun ( d  :  Microsoft_FStar_Absyn_Syntax.eff_decl ) -> (Microsoft_FStar_Absyn_Syntax.lid_equals d.Microsoft_FStar_Absyn_Syntax.mname l)))))

let name_not_found = (fun ( l  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (Support.Microsoft.FStar.Util.format1 "Name \"%s\" not found" l.Microsoft_FStar_Absyn_Syntax.str))

let variable_not_found = (fun ( v  :  'u27u2068 Microsoft_FStar_Absyn_Syntax.bvdef ) -> (let _52_8132 = (Microsoft_FStar_Absyn_Print.strBvd v)
in (Support.Microsoft.FStar.Util.format1 "Variable \"%s\" not found" _52_8132)))

let get_effect_decl = (fun ( env  :  env ) ( l  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((effect_decl_opt env l)) with
| None -> begin
(let _52_8140 = (let _52_8139 = (let _52_8138 = (name_not_found l)
in (let _52_8137 = (Microsoft_FStar_Absyn_Syntax.range_of_lid l)
in (_52_8138, _52_8137)))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8139))
in (raise (_52_8140)))
end
| Some (md) -> begin
md
end))

let join = (fun ( env  :  env ) ( l1  :  Microsoft_FStar_Absyn_Syntax.lident ) ( l2  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((Microsoft_FStar_Absyn_Syntax.lid_equals l1 l2)) with
| true -> begin
(l1, (fun ( t  :  Microsoft_FStar_Absyn_Syntax.typ ) ( wp  :  Microsoft_FStar_Absyn_Syntax.typ ) -> wp), (fun ( t  :  Microsoft_FStar_Absyn_Syntax.typ ) ( wp  :  Microsoft_FStar_Absyn_Syntax.typ ) -> wp))
end
| false -> begin
(match ((Support.Prims.pipe_right env.effects.joins (Support.Microsoft.FStar.Util.find_opt (fun ( _27_177  :  (Microsoft_FStar_Absyn_Syntax.lident * Microsoft_FStar_Absyn_Syntax.lident * Microsoft_FStar_Absyn_Syntax.lident * mlift * mlift) ) -> (match (_27_177) with
| (m1, m2, _, _, _) -> begin
((Microsoft_FStar_Absyn_Syntax.lid_equals l1 m1) && (Microsoft_FStar_Absyn_Syntax.lid_equals l2 m2))
end))))) with
| None -> begin
(let _52_8196 = (let _52_8195 = (let _52_8194 = (let _52_8193 = (Microsoft_FStar_Absyn_Print.sli l1)
in (let _52_8192 = (Microsoft_FStar_Absyn_Print.sli l2)
in (Support.Microsoft.FStar.Util.format2 "Effects %s and %s cannot be composed" _52_8193 _52_8192)))
in (_52_8194, env.range))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8195))
in (raise (_52_8196)))
end
| Some ((_, _, m3, j1, j2)) -> begin
(m3, j1, j2)
end)
end))

let monad_leq = (fun ( env  :  env ) ( l1  :  Microsoft_FStar_Absyn_Syntax.lident ) ( l2  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((Microsoft_FStar_Absyn_Syntax.lid_equals l1 l2)) with
| true -> begin
Some ({msource = l1; mtarget = l2; mlift = (fun ( t  :  (Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax ) ( wp  :  (Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax ) -> wp)})
end
| false -> begin
(Support.Prims.pipe_right env.effects.order (Support.Microsoft.FStar.Util.find_opt (fun ( e  :  edge ) -> ((Microsoft_FStar_Absyn_Syntax.lid_equals l1 e.msource) && (Microsoft_FStar_Absyn_Syntax.lid_equals l2 e.mtarget)))))
end))

let wp_sig_aux = (fun ( decls  :  Microsoft_FStar_Absyn_Syntax.eff_decl list ) ( m  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((Support.Prims.pipe_right decls (Support.Microsoft.FStar.Util.find_opt (fun ( d  :  Microsoft_FStar_Absyn_Syntax.eff_decl ) -> (Microsoft_FStar_Absyn_Syntax.lid_equals d.Microsoft_FStar_Absyn_Syntax.mname m))))) with
| None -> begin
(let _52_8211 = (Support.Microsoft.FStar.Util.format1 "Impossible: declaration for monad %s not found" m.Microsoft_FStar_Absyn_Syntax.str)
in (failwith (_52_8211)))
end
| Some (md) -> begin
(match (md.Microsoft_FStar_Absyn_Syntax.signature.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Kind_arrow (((Support.Microsoft.FStar.Util.Inl (a), _)::(Support.Microsoft.FStar.Util.Inl (wp), _)::(Support.Microsoft.FStar.Util.Inl (wlp), _)::[], {Microsoft_FStar_Absyn_Syntax.n = Microsoft_FStar_Absyn_Syntax.Kind_effect; Microsoft_FStar_Absyn_Syntax.tk = _; Microsoft_FStar_Absyn_Syntax.pos = _; Microsoft_FStar_Absyn_Syntax.fvs = _; Microsoft_FStar_Absyn_Syntax.uvs = _})) -> begin
(a, wp.Microsoft_FStar_Absyn_Syntax.sort)
end
| _ -> begin
(failwith ("Impossible"))
end)
end))

let wp_signature = (fun ( env  :  env ) ( m  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (wp_sig_aux env.effects.decls m))

let default_effect = (fun ( env  :  env ) ( l  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (Support.Microsoft.FStar.Util.find_map env.default_effects (fun ( _27_236  :  (Microsoft_FStar_Absyn_Syntax.lident * Microsoft_FStar_Absyn_Syntax.lident) ) -> (match (_27_236) with
| (l', m) -> begin
(match ((Microsoft_FStar_Absyn_Syntax.lid_equals l l')) with
| true -> begin
Some (m)
end
| false -> begin
None
end)
end))))

let build_lattice = (fun ( env  :  env ) ( se  :  Microsoft_FStar_Absyn_Syntax.sigelt ) -> (match (se) with
| Microsoft_FStar_Absyn_Syntax.Sig_effect_abbrev ((l, _, c, quals, r)) -> begin
(match ((Support.Microsoft.FStar.Util.find_map quals (fun ( _27_2  :  Microsoft_FStar_Absyn_Syntax.qualifier ) -> (match (_27_2) with
| Microsoft_FStar_Absyn_Syntax.DefaultEffect (n) -> begin
n
end
| _ -> begin
None
end)))) with
| None -> begin
env
end
| Some (e) -> begin
(let _27_255 = env
in {solver = _27_255.solver; range = _27_255.range; curmodule = _27_255.curmodule; gamma = _27_255.gamma; modules = _27_255.modules; expected_typ = _27_255.expected_typ; level = _27_255.level; sigtab = _27_255.sigtab; is_pattern = _27_255.is_pattern; instantiate_targs = _27_255.instantiate_targs; instantiate_vargs = _27_255.instantiate_vargs; effects = _27_255.effects; generalize = _27_255.generalize; letrecs = _27_255.letrecs; top_level = _27_255.top_level; check_uvars = _27_255.check_uvars; use_eq = _27_255.use_eq; is_iface = _27_255.is_iface; admit = _27_255.admit; default_effects = ((e, l))::env.default_effects})
end)
end
| Microsoft_FStar_Absyn_Syntax.Sig_new_effect ((ne, _)) -> begin
(let effects = (let _27_262 = env.effects
in {decls = (ne)::env.effects.decls; order = _27_262.order; joins = _27_262.joins})
in (let _27_265 = env
in {solver = _27_265.solver; range = _27_265.range; curmodule = _27_265.curmodule; gamma = _27_265.gamma; modules = _27_265.modules; expected_typ = _27_265.expected_typ; level = _27_265.level; sigtab = _27_265.sigtab; is_pattern = _27_265.is_pattern; instantiate_targs = _27_265.instantiate_targs; instantiate_vargs = _27_265.instantiate_vargs; effects = effects; generalize = _27_265.generalize; letrecs = _27_265.letrecs; top_level = _27_265.top_level; check_uvars = _27_265.check_uvars; use_eq = _27_265.use_eq; is_iface = _27_265.is_iface; admit = _27_265.admit; default_effects = _27_265.default_effects}))
end
| Microsoft_FStar_Absyn_Syntax.Sig_sub_effect ((sub, _)) -> begin
(let compose_edges = (fun ( e1  :  edge ) ( e2  :  edge ) -> {msource = e1.msource; mtarget = e2.mtarget; mlift = (fun ( r  :  (Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax ) ( wp1  :  (Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax ) -> (let _52_8232 = (Microsoft_FStar_Tc_Env_Mkedge.mlift e1 r wp1)
in (Microsoft_FStar_Tc_Env_Mkedge.mlift e2 r _52_8232)))})
in (let mk_lift = (fun ( lift_t  :  Microsoft_FStar_Absyn_Syntax.typ ) ( r  :  Microsoft_FStar_Absyn_Syntax.typ ) ( wp1  :  Microsoft_FStar_Absyn_Syntax.typ ) -> (let _52_8243 = (let _52_8242 = (let _52_8241 = (Microsoft_FStar_Absyn_Syntax.targ r)
in (let _52_8240 = (let _52_8239 = (Microsoft_FStar_Absyn_Syntax.targ wp1)
in (_52_8239)::[])
in (_52_8241)::_52_8240))
in (lift_t, _52_8242))
in (Microsoft_FStar_Absyn_Syntax.mk_Typ_app _52_8243 None wp1.Microsoft_FStar_Absyn_Syntax.pos)))
in (let edge = {msource = sub.Microsoft_FStar_Absyn_Syntax.source; mtarget = sub.Microsoft_FStar_Absyn_Syntax.target; mlift = (mk_lift sub.Microsoft_FStar_Absyn_Syntax.lift)}
in (let id_edge = (fun ( l  :  Microsoft_FStar_Absyn_Syntax.lident ) -> {msource = sub.Microsoft_FStar_Absyn_Syntax.source; mtarget = sub.Microsoft_FStar_Absyn_Syntax.target; mlift = (fun ( t  :  (Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax ) ( wp  :  (Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax ) -> wp)})
in (let print_mlift = (fun ( l  :  Microsoft_FStar_Absyn_Syntax.typ  ->  Microsoft_FStar_Absyn_Syntax.typ  ->  (Microsoft_FStar_Absyn_Syntax.typ', (Microsoft_FStar_Absyn_Syntax.knd', unit) Microsoft_FStar_Absyn_Syntax.syntax) Microsoft_FStar_Absyn_Syntax.syntax ) -> (let arg = (let _52_8260 = (Microsoft_FStar_Absyn_Syntax.lid_of_path (("ARG")::[]) Microsoft_FStar_Absyn_Syntax.dummyRange)
in (Microsoft_FStar_Absyn_Util.ftv _52_8260 Microsoft_FStar_Absyn_Syntax.mk_Kind_type))
in (let wp = (let _52_8261 = (Microsoft_FStar_Absyn_Syntax.lid_of_path (("WP")::[]) Microsoft_FStar_Absyn_Syntax.dummyRange)
in (Microsoft_FStar_Absyn_Util.ftv _52_8261 Microsoft_FStar_Absyn_Syntax.mk_Kind_unknown))
in (let _52_8262 = (l arg wp)
in (Microsoft_FStar_Absyn_Print.typ_to_string _52_8262)))))
in (let order = (edge)::env.effects.order
in (let ms = (Support.Prims.pipe_right env.effects.decls (Support.List.map (fun ( e  :  Microsoft_FStar_Absyn_Syntax.eff_decl ) -> e.Microsoft_FStar_Absyn_Syntax.mname)))
in (let find_edge = (fun ( order  :  edge list ) ( _27_297  :  (Microsoft_FStar_Absyn_Syntax.lident * Microsoft_FStar_Absyn_Syntax.lident) ) -> (match (_27_297) with
| (i, j) -> begin
(match ((Microsoft_FStar_Absyn_Syntax.lid_equals i j)) with
| true -> begin
(Support.Prims.pipe_right (id_edge i) (fun ( _52_8268  :  edge ) -> Some (_52_8268)))
end
| false -> begin
(Support.Prims.pipe_right order (Support.Microsoft.FStar.Util.find_opt (fun ( e  :  edge ) -> ((Microsoft_FStar_Absyn_Syntax.lid_equals e.msource i) && (Microsoft_FStar_Absyn_Syntax.lid_equals e.mtarget j)))))
end)
end))
in (let order = (Support.Prims.pipe_right ms (Support.List.fold_left (fun ( order  :  edge list ) ( k  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (let _52_8276 = (Support.Prims.pipe_right ms (Support.List.collect (fun ( i  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((Microsoft_FStar_Absyn_Syntax.lid_equals i k)) with
| true -> begin
[]
end
| false -> begin
(Support.Prims.pipe_right ms (Support.List.collect (fun ( j  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((Microsoft_FStar_Absyn_Syntax.lid_equals j k)) with
| true -> begin
[]
end
| false -> begin
(match ((let _52_8275 = (find_edge order (i, k))
in (let _52_8274 = (find_edge order (k, j))
in (_52_8275, _52_8274)))) with
| (Some (e1), Some (e2)) -> begin
((compose_edges e1 e2))::[]
end
| _ -> begin
[]
end)
end))))
end))))
in (Support.List.append order _52_8276))) order))
in (let order = (Support.Microsoft.FStar.Util.remove_dups (fun ( e1  :  edge ) ( e2  :  edge ) -> ((Microsoft_FStar_Absyn_Syntax.lid_equals e1.msource e2.msource) && (Microsoft_FStar_Absyn_Syntax.lid_equals e1.mtarget e2.mtarget))) order)
in (let joins = (Support.Prims.pipe_right ms (Support.List.collect (fun ( i  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (Support.Prims.pipe_right ms (Support.List.collect (fun ( j  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (let join_opt = (Support.Prims.pipe_right ms (Support.List.fold_left (fun ( bopt  :  (Microsoft_FStar_Absyn_Syntax.lident * edge * edge) option ) ( k  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((let _52_8284 = (find_edge order (i, k))
in (let _52_8283 = (find_edge order (j, k))
in (_52_8284, _52_8283)))) with
| (Some (ik), Some (jk)) -> begin
(match (bopt) with
| None -> begin
Some ((k, ik, jk))
end
| Some ((ub, _, _)) -> begin
(match ((let _52_8289 = (let _52_8285 = (find_edge order (k, ub))
in (Support.Microsoft.FStar.Util.is_some _52_8285))
in (let _52_8288 = (let _52_8287 = (let _52_8286 = (find_edge order (ub, k))
in (Support.Microsoft.FStar.Util.is_some _52_8286))
in (not (_52_8287)))
in (_52_8289 && _52_8288)))) with
| true -> begin
Some ((k, ik, jk))
end
| false -> begin
bopt
end)
end)
end
| _ -> begin
bopt
end)) None))
in (match (join_opt) with
| None -> begin
[]
end
| Some ((k, e1, e2)) -> begin
((i, j, k, e1.mlift, e2.mlift))::[]
end))))))))
in (let effects = (let _27_341 = env.effects
in {decls = _27_341.decls; order = order; joins = joins})
in (let _27_344 = env
in {solver = _27_344.solver; range = _27_344.range; curmodule = _27_344.curmodule; gamma = _27_344.gamma; modules = _27_344.modules; expected_typ = _27_344.expected_typ; level = _27_344.level; sigtab = _27_344.sigtab; is_pattern = _27_344.is_pattern; instantiate_targs = _27_344.instantiate_targs; instantiate_vargs = _27_344.instantiate_vargs; effects = effects; generalize = _27_344.generalize; letrecs = _27_344.letrecs; top_level = _27_344.top_level; check_uvars = _27_344.check_uvars; use_eq = _27_344.use_eq; is_iface = _27_344.is_iface; admit = _27_344.admit; default_effects = _27_344.default_effects})))))))))))))
end
| _ -> begin
env
end))

let rec add_sigelt = (fun ( env  :  env ) ( se  :  Microsoft_FStar_Absyn_Syntax.sigelt ) -> (match (se) with
| Microsoft_FStar_Absyn_Syntax.Sig_bundle ((ses, _, _, _)) -> begin
(add_sigelts env ses)
end
| _ -> begin
(let lids = (Microsoft_FStar_Absyn_Util.lids_of_sigelt se)
in (Support.List.iter (fun ( l  :  Microsoft_FStar_Absyn_Syntax.l__LongIdent ) -> (let _52_8297 = (sigtab env)
in (Support.Microsoft.FStar.Util.smap_add _52_8297 l.Microsoft_FStar_Absyn_Syntax.str se))) lids))
end))
and add_sigelts = (fun ( env  :  env ) ( ses  :  Microsoft_FStar_Absyn_Syntax.sigelt list ) -> (Support.Prims.pipe_right ses (Support.List.iter (add_sigelt env))))

let empty_lid = (let _52_8301 = (let _52_8300 = (Microsoft_FStar_Absyn_Syntax.id_of_text "")
in (_52_8300)::[])
in (Microsoft_FStar_Absyn_Syntax.lid_of_ids _52_8301))

let finish_module = (fun ( env  :  env ) ( m  :  Microsoft_FStar_Absyn_Syntax.modul ) -> (let sigs = (match ((Microsoft_FStar_Absyn_Syntax.lid_equals m.Microsoft_FStar_Absyn_Syntax.name Microsoft_FStar_Absyn_Const.prims_lid)) with
| true -> begin
(Support.Prims.pipe_right env.gamma (Support.List.collect (fun ( _27_3  :  binding ) -> (match (_27_3) with
| Binding_sig (se) -> begin
(se)::[]
end
| _ -> begin
[]
end))))
end
| false -> begin
m.Microsoft_FStar_Absyn_Syntax.exports
end)
in (let _27_373 = (add_sigelts env sigs)
in (let _27_375 = env
in {solver = _27_375.solver; range = _27_375.range; curmodule = empty_lid; gamma = []; modules = (m)::env.modules; expected_typ = _27_375.expected_typ; level = _27_375.level; sigtab = _27_375.sigtab; is_pattern = _27_375.is_pattern; instantiate_targs = _27_375.instantiate_targs; instantiate_vargs = _27_375.instantiate_vargs; effects = _27_375.effects; generalize = _27_375.generalize; letrecs = _27_375.letrecs; top_level = _27_375.top_level; check_uvars = _27_375.check_uvars; use_eq = _27_375.use_eq; is_iface = _27_375.is_iface; admit = _27_375.admit; default_effects = _27_375.default_effects}))))

let set_level = (fun ( env  :  env ) ( level  :  level ) -> (let _27_379 = env
in {solver = _27_379.solver; range = _27_379.range; curmodule = _27_379.curmodule; gamma = _27_379.gamma; modules = _27_379.modules; expected_typ = _27_379.expected_typ; level = level; sigtab = _27_379.sigtab; is_pattern = _27_379.is_pattern; instantiate_targs = _27_379.instantiate_targs; instantiate_vargs = _27_379.instantiate_vargs; effects = _27_379.effects; generalize = _27_379.generalize; letrecs = _27_379.letrecs; top_level = _27_379.top_level; check_uvars = _27_379.check_uvars; use_eq = _27_379.use_eq; is_iface = _27_379.is_iface; admit = _27_379.admit; default_effects = _27_379.default_effects}))

let is_level = (fun ( env  :  env ) ( level  :  level ) -> (env.level = level))

let modules = (fun ( env  :  env ) -> env.modules)

let current_module = (fun ( env  :  env ) -> env.curmodule)

let set_current_module = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (let _27_387 = env
in {solver = _27_387.solver; range = _27_387.range; curmodule = lid; gamma = _27_387.gamma; modules = _27_387.modules; expected_typ = _27_387.expected_typ; level = _27_387.level; sigtab = _27_387.sigtab; is_pattern = _27_387.is_pattern; instantiate_targs = _27_387.instantiate_targs; instantiate_vargs = _27_387.instantiate_vargs; effects = _27_387.effects; generalize = _27_387.generalize; letrecs = _27_387.letrecs; top_level = _27_387.top_level; check_uvars = _27_387.check_uvars; use_eq = _27_387.use_eq; is_iface = _27_387.is_iface; admit = _27_387.admit; default_effects = _27_387.default_effects}))

let set_range = (fun ( e  :  env ) ( r  :  Support.Microsoft.FStar.Range.range ) -> (match ((r = Microsoft_FStar_Absyn_Syntax.dummyRange)) with
| true -> begin
e
end
| false -> begin
(let _27_391 = e
in {solver = _27_391.solver; range = r; curmodule = _27_391.curmodule; gamma = _27_391.gamma; modules = _27_391.modules; expected_typ = _27_391.expected_typ; level = _27_391.level; sigtab = _27_391.sigtab; is_pattern = _27_391.is_pattern; instantiate_targs = _27_391.instantiate_targs; instantiate_vargs = _27_391.instantiate_vargs; effects = _27_391.effects; generalize = _27_391.generalize; letrecs = _27_391.letrecs; top_level = _27_391.top_level; check_uvars = _27_391.check_uvars; use_eq = _27_391.use_eq; is_iface = _27_391.is_iface; admit = _27_391.admit; default_effects = _27_391.default_effects})
end))

let get_range = (fun ( e  :  env ) -> e.range)

let find_in_sigtab = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (let _52_8334 = (sigtab env)
in (let _52_8333 = (Microsoft_FStar_Absyn_Syntax.text_of_lid lid)
in (Support.Microsoft.FStar.Util.smap_try_find _52_8334 _52_8333))))

let lookup_bvvdef = (fun ( env  :  env ) ( bvvd  :  Microsoft_FStar_Absyn_Syntax.bvvdef ) -> (Support.Microsoft.FStar.Util.find_map env.gamma (fun ( _27_4  :  binding ) -> (match (_27_4) with
| Binding_var ((id, t)) when (Microsoft_FStar_Absyn_Util.bvd_eq id bvvd) -> begin
Some (t)
end
| _ -> begin
None
end))))

let lookup_bvar = (fun ( env  :  env ) ( bv  :  Microsoft_FStar_Absyn_Syntax.bvvar ) -> (match ((lookup_bvvdef env bv.Microsoft_FStar_Absyn_Syntax.v)) with
| None -> begin
(let _52_8346 = (let _52_8345 = (let _52_8344 = (variable_not_found bv.Microsoft_FStar_Absyn_Syntax.v)
in (_52_8344, (Microsoft_FStar_Absyn_Util.range_of_bvd bv.Microsoft_FStar_Absyn_Syntax.v)))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8345))
in (raise (_52_8346)))
end
| Some (t) -> begin
t
end))

let lookup_qname = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (let in_cur_mod = (fun ( l  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (let cur = (current_module env)
in (match ((l.Microsoft_FStar_Absyn_Syntax.nsstr = cur.Microsoft_FStar_Absyn_Syntax.str)) with
| true -> begin
true
end
| false -> begin
(match ((Support.Microsoft.FStar.Util.starts_with l.Microsoft_FStar_Absyn_Syntax.nsstr cur.Microsoft_FStar_Absyn_Syntax.str)) with
| true -> begin
(let lns = (Support.List.append l.Microsoft_FStar_Absyn_Syntax.ns ((l.Microsoft_FStar_Absyn_Syntax.ident)::[]))
in (let cur = (Support.List.append cur.Microsoft_FStar_Absyn_Syntax.ns ((cur.Microsoft_FStar_Absyn_Syntax.ident)::[]))
in (let rec aux = (fun ( c  :  Microsoft_FStar_Absyn_Syntax.ident list ) ( l  :  Microsoft_FStar_Absyn_Syntax.ident list ) -> (match ((c, l)) with
| ([], _) -> begin
true
end
| (_, []) -> begin
false
end
| (hd::tl, hd'::tl') when (hd.Microsoft_FStar_Absyn_Syntax.idText = hd'.Microsoft_FStar_Absyn_Syntax.idText) -> begin
(aux tl tl')
end
| _ -> begin
false
end))
in (aux cur lns))))
end
| false -> begin
false
end)
end)))
in (let cur_mod = (in_cur_mod lid)
in (let found = (match (cur_mod) with
| true -> begin
(Support.Microsoft.FStar.Util.find_map env.gamma (fun ( _27_5  :  binding ) -> (match (_27_5) with
| Binding_lid ((l, t)) -> begin
(match ((Microsoft_FStar_Absyn_Syntax.lid_equals lid l)) with
| true -> begin
Some (Support.Microsoft.FStar.Util.Inl (t))
end
| false -> begin
None
end)
end
| Binding_sig (Microsoft_FStar_Absyn_Syntax.Sig_bundle ((ses, _, _, _))) -> begin
(Support.Microsoft.FStar.Util.find_map ses (fun ( se  :  Microsoft_FStar_Absyn_Syntax.sigelt ) -> (match ((let _52_8359 = (Microsoft_FStar_Absyn_Util.lids_of_sigelt se)
in (Support.Prims.pipe_right _52_8359 (Support.Microsoft.FStar.Util.for_some (Microsoft_FStar_Absyn_Syntax.lid_equals lid))))) with
| true -> begin
Some (Support.Microsoft.FStar.Util.Inr (se))
end
| false -> begin
None
end)))
end
| Binding_sig (s) -> begin
(let lids = (Microsoft_FStar_Absyn_Util.lids_of_sigelt s)
in (match ((Support.Prims.pipe_right lids (Support.Microsoft.FStar.Util.for_some (Microsoft_FStar_Absyn_Syntax.lid_equals lid)))) with
| true -> begin
Some (Support.Microsoft.FStar.Util.Inr (s))
end
| false -> begin
None
end))
end
| _ -> begin
None
end)))
end
| false -> begin
None
end)
in (match ((Support.Microsoft.FStar.Util.is_some found)) with
| true -> begin
found
end
| false -> begin
(match ((let _52_8360 = (has_interface env env.curmodule)
in ((not (cur_mod)) || _52_8360))) with
| true -> begin
(match ((find_in_sigtab env lid)) with
| Some (se) -> begin
Some (Support.Microsoft.FStar.Util.Inr (se))
end
| None -> begin
None
end)
end
| false -> begin
None
end)
end)))))

let lookup_datacon = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env lid)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_datacon ((_, t, _, _, _, _)))) -> begin
t
end
| _ -> begin
(let _52_8368 = (let _52_8367 = (let _52_8366 = (name_not_found lid)
in (let _52_8365 = (Microsoft_FStar_Absyn_Syntax.range_of_lid lid)
in (_52_8366, _52_8365)))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8367))
in (raise (_52_8368)))
end))

let lookup_kind_abbrev = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env lid)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_kind_abbrev ((l, binders, k, _)))) -> begin
(l, binders, k)
end
| _ -> begin
(let _52_8376 = (let _52_8375 = (let _52_8374 = (name_not_found lid)
in (let _52_8373 = (Microsoft_FStar_Absyn_Syntax.range_of_lid lid)
in (_52_8374, _52_8373)))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8375))
in (raise (_52_8376)))
end))

let lookup_projector = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) ( i  :  int ) -> (let fail = (fun ( _27_499  :  unit ) -> (match (()) with
| () -> begin
(let _52_8387 = (let _52_8386 = (Support.Microsoft.FStar.Util.string_of_int i)
in (let _52_8385 = (Microsoft_FStar_Absyn_Print.sli lid)
in (Support.Microsoft.FStar.Util.format2 "Impossible: projecting field #%s from constructor %s is undefined" _52_8386 _52_8385)))
in (failwith (_52_8387)))
end))
in (let t = (lookup_datacon env lid)
in (match ((let _52_8388 = (Microsoft_FStar_Absyn_Util.compress_typ t)
in _52_8388.Microsoft_FStar_Absyn_Syntax.n)) with
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((binders, _)) -> begin
(match (((i < 0) || (i >= (Support.List.length binders)))) with
| true -> begin
(fail ())
end
| false -> begin
(let b = (Support.List.nth binders i)
in (match ((Support.Prims.fst b)) with
| Support.Microsoft.FStar.Util.Inl (a) -> begin
(let _52_8389 = (Microsoft_FStar_Absyn_Util.mk_field_projector_name lid a i)
in (Support.Prims.pipe_right _52_8389 Support.Prims.fst))
end
| Support.Microsoft.FStar.Util.Inr (x) -> begin
(let _52_8390 = (Microsoft_FStar_Absyn_Util.mk_field_projector_name lid x i)
in (Support.Prims.pipe_right _52_8390 Support.Prims.fst))
end))
end)
end
| _ -> begin
(fail ())
end))))

let try_lookup_val_decl = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env lid)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((_, t, q, _)))) -> begin
Some ((t, q))
end
| _ -> begin
None
end))

let lookup_val_decl = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env lid)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((_, t, _, _)))) -> begin
t
end
| _ -> begin
(let _52_8402 = (let _52_8401 = (let _52_8400 = (name_not_found lid)
in (let _52_8399 = (Microsoft_FStar_Absyn_Syntax.range_of_lid lid)
in (_52_8400, _52_8399)))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8401))
in (raise (_52_8402)))
end))

let lookup_lid = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (let not_found = (fun ( _27_545  :  unit ) -> (match (()) with
| () -> begin
(let _52_8412 = (let _52_8411 = (let _52_8410 = (name_not_found lid)
in (let _52_8409 = (Microsoft_FStar_Absyn_Syntax.range_of_lid lid)
in (_52_8410, _52_8409)))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8411))
in (raise (_52_8412)))
end))
in (let mapper = (fun ( _27_6  :  (Microsoft_FStar_Absyn_Syntax.typ, Microsoft_FStar_Absyn_Syntax.sigelt) Support.Microsoft.FStar.Util.either ) -> (match (_27_6) with
| (Support.Microsoft.FStar.Util.Inl (t)) | (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_datacon ((_, t, _, _, _, _)))) | (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((_, t, _, _)))) | (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_let (((_, {Microsoft_FStar_Absyn_Syntax.lbname = _; Microsoft_FStar_Absyn_Syntax.lbtyp = t; Microsoft_FStar_Absyn_Syntax.lbeff = _; Microsoft_FStar_Absyn_Syntax.lbdef = _}::[]), _, _, _)))) -> begin
Some (t)
end
| Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_let (((_, lbs), _, _, _))) -> begin
(Support.Microsoft.FStar.Util.find_map lbs (fun ( lb  :  Microsoft_FStar_Absyn_Syntax.letbinding ) -> (match (lb.Microsoft_FStar_Absyn_Syntax.lbname) with
| Support.Microsoft.FStar.Util.Inl (_) -> begin
(failwith ("impossible"))
end
| Support.Microsoft.FStar.Util.Inr (lid') -> begin
(match ((Microsoft_FStar_Absyn_Syntax.lid_equals lid lid')) with
| true -> begin
Some (lb.Microsoft_FStar_Absyn_Syntax.lbtyp)
end
| false -> begin
None
end)
end)))
end
| t -> begin
None
end))
in (match ((let _52_8416 = (lookup_qname env lid)
in (Support.Microsoft.FStar.Util.bind_opt _52_8416 mapper))) with
| Some (t) -> begin
(let _27_614 = t
in (let _52_8417 = (Microsoft_FStar_Absyn_Syntax.range_of_lid lid)
in {Microsoft_FStar_Absyn_Syntax.n = _27_614.Microsoft_FStar_Absyn_Syntax.n; Microsoft_FStar_Absyn_Syntax.tk = _27_614.Microsoft_FStar_Absyn_Syntax.tk; Microsoft_FStar_Absyn_Syntax.pos = _52_8417; Microsoft_FStar_Absyn_Syntax.fvs = _27_614.Microsoft_FStar_Absyn_Syntax.fvs; Microsoft_FStar_Absyn_Syntax.uvs = _27_614.Microsoft_FStar_Absyn_Syntax.uvs}))
end
| None -> begin
(not_found ())
end))))

let is_datacon = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env lid)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((_, _, quals, _)))) -> begin
(Support.Prims.pipe_right quals (Support.Microsoft.FStar.Util.for_some (fun ( _27_7  :  Microsoft_FStar_Absyn_Syntax.qualifier ) -> (match (_27_7) with
| Microsoft_FStar_Absyn_Syntax.Assumption -> begin
true
end
| _ -> begin
false
end))))
end
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_datacon ((_, t, _, _, _, _)))) -> begin
true
end
| _ -> begin
false
end))

let is_record = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env lid)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_tycon ((_, _, _, _, _, tags, _)))) -> begin
(Support.Microsoft.FStar.Util.for_some (fun ( _27_8  :  Microsoft_FStar_Absyn_Syntax.qualifier ) -> (match (_27_8) with
| (Microsoft_FStar_Absyn_Syntax.RecordType (_)) | (Microsoft_FStar_Absyn_Syntax.RecordConstructor (_)) -> begin
true
end
| _ -> begin
false
end)) tags)
end
| _ -> begin
false
end))

let lookup_datacons_of_typ = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env lid)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_tycon ((_, _, _, _, datas, _, _)))) -> begin
(let _52_8434 = (Support.List.map (fun ( l  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (let _52_8433 = (lookup_lid env l)
in (l, _52_8433))) datas)
in Some (_52_8434))
end
| _ -> begin
None
end))

let lookup_effect_abbrev = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env lid)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_effect_abbrev ((lid, binders, c, quals, _)))) -> begin
(match ((Support.Prims.pipe_right quals (Support.Microsoft.FStar.Util.for_some (fun ( _27_9  :  Microsoft_FStar_Absyn_Syntax.qualifier ) -> (match (_27_9) with
| Microsoft_FStar_Absyn_Syntax.Opaque -> begin
true
end
| _ -> begin
false
end))))) with
| true -> begin
None
end
| false -> begin
Some ((binders, c))
end)
end
| _ -> begin
None
end))

let lookup_typ_abbrev = (fun ( env  :  env ) ( lid  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env lid)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((lid, tps, _, t, quals, _)))) -> begin
(match ((Support.Prims.pipe_right quals (Support.Microsoft.FStar.Util.for_some (fun ( _27_10  :  Microsoft_FStar_Absyn_Syntax.qualifier ) -> (match (_27_10) with
| Microsoft_FStar_Absyn_Syntax.Opaque -> begin
true
end
| _ -> begin
false
end))))) with
| true -> begin
None
end
| false -> begin
(let t = (Microsoft_FStar_Absyn_Util.close_with_lam tps t)
in (let _52_8445 = (Microsoft_FStar_Absyn_Syntax.mk_Typ_meta (Microsoft_FStar_Absyn_Syntax.Meta_named ((t, lid))))
in Some (_52_8445)))
end)
end
| _ -> begin
None
end))

let lookup_btvdef = (fun ( env  :  env ) ( btvd  :  Microsoft_FStar_Absyn_Syntax.btvdef ) -> (Support.Microsoft.FStar.Util.find_map env.gamma (fun ( _27_11  :  binding ) -> (match (_27_11) with
| Binding_typ ((id, k)) when (Microsoft_FStar_Absyn_Util.bvd_eq id btvd) -> begin
Some (k)
end
| _ -> begin
None
end))))

let lookup_btvar = (fun ( env  :  env ) ( btv  :  Microsoft_FStar_Absyn_Syntax.btvar ) -> (match ((lookup_btvdef env btv.Microsoft_FStar_Absyn_Syntax.v)) with
| None -> begin
(let _52_8457 = (let _52_8456 = (let _52_8455 = (variable_not_found btv.Microsoft_FStar_Absyn_Syntax.v)
in (_52_8455, (Microsoft_FStar_Absyn_Util.range_of_bvd btv.Microsoft_FStar_Absyn_Syntax.v)))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8456))
in (raise (_52_8457)))
end
| Some (k) -> begin
k
end))

let lookup_typ_lid = (fun ( env  :  env ) ( ftv  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env ftv)) with
| (Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_tycon ((lid, tps, k, _, _, _, _))))) | (Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((lid, tps, k, _, _, _))))) -> begin
(Microsoft_FStar_Absyn_Util.close_kind tps k)
end
| _ -> begin
(let _52_8465 = (let _52_8464 = (let _52_8463 = (name_not_found ftv)
in (let _52_8462 = (Microsoft_FStar_Absyn_Syntax.range_of_lid ftv)
in (_52_8463, _52_8462)))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8464))
in (raise (_52_8465)))
end))

let is_projector = (fun ( env  :  env ) ( l  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env l)) with
| (Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_tycon ((_, _, _, _, _, quals, _))))) | (Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((_, _, quals, _))))) -> begin
(Support.Microsoft.FStar.Util.for_some (fun ( _27_12  :  Microsoft_FStar_Absyn_Syntax.qualifier ) -> (match (_27_12) with
| Microsoft_FStar_Absyn_Syntax.Projector (_) -> begin
true
end
| _ -> begin
false
end)) quals)
end
| _ -> begin
false
end))

let try_lookup_effect_lid = (fun ( env  :  env ) ( ftv  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((lookup_qname env ftv)) with
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_new_effect ((ne, _)))) -> begin
(let _52_8476 = (Microsoft_FStar_Absyn_Util.close_kind ne.Microsoft_FStar_Absyn_Syntax.binders ne.Microsoft_FStar_Absyn_Syntax.signature)
in (Support.Prims.pipe_right _52_8476 (fun ( _52_8475  :  Microsoft_FStar_Absyn_Syntax.knd ) -> Some (_52_8475))))
end
| Some (Support.Microsoft.FStar.Util.Inr (Microsoft_FStar_Absyn_Syntax.Sig_effect_abbrev ((lid, binders, _, _, _)))) -> begin
(let _52_8478 = (Microsoft_FStar_Absyn_Util.close_kind binders Microsoft_FStar_Absyn_Syntax.mk_Kind_effect)
in (Support.Prims.pipe_right _52_8478 (fun ( _52_8477  :  Microsoft_FStar_Absyn_Syntax.knd ) -> Some (_52_8477))))
end
| _ -> begin
None
end))

let lookup_effect_lid = (fun ( env  :  env ) ( ftv  :  Microsoft_FStar_Absyn_Syntax.lident ) -> (match ((try_lookup_effect_lid env ftv)) with
| None -> begin
(let _52_8486 = (let _52_8485 = (let _52_8484 = (name_not_found ftv)
in (let _52_8483 = (Microsoft_FStar_Absyn_Syntax.range_of_lid ftv)
in (_52_8484, _52_8483)))
in Microsoft_FStar_Absyn_Syntax.Error (_52_8485))
in (raise (_52_8486)))
end
| Some (k) -> begin
k
end))

let lookup_operator = (fun ( env  :  env ) ( opname  :  Microsoft_FStar_Absyn_Syntax.ident ) -> (let primName = (Microsoft_FStar_Absyn_Syntax.lid_of_path (("Prims")::((Support.String.strcat "_dummy_" opname.Microsoft_FStar_Absyn_Syntax.idText))::[]) Microsoft_FStar_Absyn_Syntax.dummyRange)
in (lookup_lid env primName)))

let push_sigelt = (fun ( env  :  env ) ( s  :  Microsoft_FStar_Absyn_Syntax.sigelt ) -> (build_lattice (let _27_855 = env
in {solver = _27_855.solver; range = _27_855.range; curmodule = _27_855.curmodule; gamma = (Binding_sig (s))::env.gamma; modules = _27_855.modules; expected_typ = _27_855.expected_typ; level = _27_855.level; sigtab = _27_855.sigtab; is_pattern = _27_855.is_pattern; instantiate_targs = _27_855.instantiate_targs; instantiate_vargs = _27_855.instantiate_vargs; effects = _27_855.effects; generalize = _27_855.generalize; letrecs = _27_855.letrecs; top_level = _27_855.top_level; check_uvars = _27_855.check_uvars; use_eq = _27_855.use_eq; is_iface = _27_855.is_iface; admit = _27_855.admit; default_effects = _27_855.default_effects}) s))

let push_local_binding = (fun ( env  :  env ) ( b  :  binding ) -> (let _27_859 = env
in {solver = _27_859.solver; range = _27_859.range; curmodule = _27_859.curmodule; gamma = (b)::env.gamma; modules = _27_859.modules; expected_typ = _27_859.expected_typ; level = _27_859.level; sigtab = _27_859.sigtab; is_pattern = _27_859.is_pattern; instantiate_targs = _27_859.instantiate_targs; instantiate_vargs = _27_859.instantiate_vargs; effects = _27_859.effects; generalize = _27_859.generalize; letrecs = _27_859.letrecs; top_level = _27_859.top_level; check_uvars = _27_859.check_uvars; use_eq = _27_859.use_eq; is_iface = _27_859.is_iface; admit = _27_859.admit; default_effects = _27_859.default_effects}))

let uvars_in_env = (fun ( env  :  env ) -> (let no_uvs = (let _52_8503 = (Microsoft_FStar_Absyn_Syntax.new_uv_set ())
in (let _52_8502 = (Microsoft_FStar_Absyn_Syntax.new_uvt_set ())
in (let _52_8501 = (Microsoft_FStar_Absyn_Syntax.new_uvt_set ())
in {Microsoft_FStar_Absyn_Syntax.uvars_k = _52_8503; Microsoft_FStar_Absyn_Syntax.uvars_t = _52_8502; Microsoft_FStar_Absyn_Syntax.uvars_e = _52_8501})))
in (let ext = (fun ( out  :  Microsoft_FStar_Absyn_Syntax.uvars ) ( uvs  :  Microsoft_FStar_Absyn_Syntax.uvars ) -> (let _27_866 = out
in (let _52_8510 = (Support.Microsoft.FStar.Util.set_union out.Microsoft_FStar_Absyn_Syntax.uvars_k uvs.Microsoft_FStar_Absyn_Syntax.uvars_k)
in (let _52_8509 = (Support.Microsoft.FStar.Util.set_union out.Microsoft_FStar_Absyn_Syntax.uvars_t uvs.Microsoft_FStar_Absyn_Syntax.uvars_t)
in (let _52_8508 = (Support.Microsoft.FStar.Util.set_union out.Microsoft_FStar_Absyn_Syntax.uvars_e uvs.Microsoft_FStar_Absyn_Syntax.uvars_e)
in {Microsoft_FStar_Absyn_Syntax.uvars_k = _52_8510; Microsoft_FStar_Absyn_Syntax.uvars_t = _52_8509; Microsoft_FStar_Absyn_Syntax.uvars_e = _52_8508})))))
in (let rec aux = (fun ( out  :  Microsoft_FStar_Absyn_Syntax.uvars ) ( g  :  binding list ) -> (match (g) with
| [] -> begin
out
end
| (Binding_lid ((_, t))::tl) | (Binding_var ((_, t))::tl) -> begin
(let _52_8516 = (let _52_8515 = (Microsoft_FStar_Absyn_Util.uvars_in_typ t)
in (ext out _52_8515))
in (aux _52_8516 tl))
end
| Binding_typ ((_, k))::tl -> begin
(let _52_8518 = (let _52_8517 = (Microsoft_FStar_Absyn_Util.uvars_in_kind k)
in (ext out _52_8517))
in (aux _52_8518 tl))
end
| Binding_sig (_)::_ -> begin
out
end))
in (aux no_uvs env.gamma)))))

let push_module = (fun ( env  :  env ) ( m  :  Microsoft_FStar_Absyn_Syntax.modul ) -> (let _27_899 = (add_sigelts env m.Microsoft_FStar_Absyn_Syntax.exports)
in (let _27_901 = env
in {solver = _27_901.solver; range = _27_901.range; curmodule = _27_901.curmodule; gamma = []; modules = (m)::env.modules; expected_typ = None; level = _27_901.level; sigtab = _27_901.sigtab; is_pattern = _27_901.is_pattern; instantiate_targs = _27_901.instantiate_targs; instantiate_vargs = _27_901.instantiate_vargs; effects = _27_901.effects; generalize = _27_901.generalize; letrecs = _27_901.letrecs; top_level = _27_901.top_level; check_uvars = _27_901.check_uvars; use_eq = _27_901.use_eq; is_iface = _27_901.is_iface; admit = _27_901.admit; default_effects = _27_901.default_effects})))

let set_expected_typ = (fun ( env  :  env ) ( t  :  Microsoft_FStar_Absyn_Syntax.typ ) -> (let _27_905 = env
in {solver = _27_905.solver; range = _27_905.range; curmodule = _27_905.curmodule; gamma = _27_905.gamma; modules = _27_905.modules; expected_typ = Some (t); level = _27_905.level; sigtab = _27_905.sigtab; is_pattern = _27_905.is_pattern; instantiate_targs = _27_905.instantiate_targs; instantiate_vargs = _27_905.instantiate_vargs; effects = _27_905.effects; generalize = _27_905.generalize; letrecs = _27_905.letrecs; top_level = _27_905.top_level; check_uvars = _27_905.check_uvars; use_eq = false; is_iface = _27_905.is_iface; admit = _27_905.admit; default_effects = _27_905.default_effects}))

let expected_typ = (fun ( env  :  env ) -> (match (env.expected_typ) with
| None -> begin
None
end
| Some (t) -> begin
Some (t)
end))

let clear_expected_typ = (fun ( env  :  env ) -> (let _52_8531 = (expected_typ env)
in ((let _27_912 = env
in {solver = _27_912.solver; range = _27_912.range; curmodule = _27_912.curmodule; gamma = _27_912.gamma; modules = _27_912.modules; expected_typ = None; level = _27_912.level; sigtab = _27_912.sigtab; is_pattern = _27_912.is_pattern; instantiate_targs = _27_912.instantiate_targs; instantiate_vargs = _27_912.instantiate_vargs; effects = _27_912.effects; generalize = _27_912.generalize; letrecs = _27_912.letrecs; top_level = _27_912.top_level; check_uvars = _27_912.check_uvars; use_eq = false; is_iface = _27_912.is_iface; admit = _27_912.admit; default_effects = _27_912.default_effects}), _52_8531)))

let fold_env = (fun ( env  :  env ) ( f  :  'a  ->  binding  ->  'a ) ( a  :  'a ) -> (Support.List.fold_right (fun ( e  :  binding ) ( a  :  'a ) -> (f a e)) env.gamma a))

let binding_of_binder = (fun ( b  :  Microsoft_FStar_Absyn_Syntax.binder ) -> (match ((Support.Prims.fst b)) with
| Support.Microsoft.FStar.Util.Inl (a) -> begin
Binding_typ ((a.Microsoft_FStar_Absyn_Syntax.v, a.Microsoft_FStar_Absyn_Syntax.sort))
end
| Support.Microsoft.FStar.Util.Inr (x) -> begin
Binding_var ((x.Microsoft_FStar_Absyn_Syntax.v, x.Microsoft_FStar_Absyn_Syntax.sort))
end))

let binders = (fun ( env  :  env ) -> (Support.List.fold_left (fun ( out  :  Microsoft_FStar_Absyn_Syntax.binder list ) ( b  :  binding ) -> (match (b) with
| Binding_var ((x, t)) -> begin
(let _52_8549 = (Support.Prims.pipe_left Microsoft_FStar_Absyn_Syntax.v_binder (Microsoft_FStar_Absyn_Util.bvd_to_bvar_s x t))
in (_52_8549)::out)
end
| Binding_typ ((a, k)) -> begin
(let _52_8550 = (Support.Prims.pipe_left Microsoft_FStar_Absyn_Syntax.t_binder (Microsoft_FStar_Absyn_Util.bvd_to_bvar_s a k))
in (_52_8550)::out)
end
| _ -> begin
out
end)) [] env.gamma))

let t_binders = (fun ( env  :  env ) -> (Support.List.fold_left (fun ( out  :  Microsoft_FStar_Absyn_Syntax.binder list ) ( b  :  binding ) -> (match (b) with
| Binding_var (_) -> begin
out
end
| Binding_typ ((a, k)) -> begin
(let _52_8555 = (Support.Prims.pipe_left Microsoft_FStar_Absyn_Syntax.t_binder (Microsoft_FStar_Absyn_Util.bvd_to_bvar_s a k))
in (_52_8555)::out)
end
| _ -> begin
out
end)) [] env.gamma))

let idents = (fun ( env  :  env ) -> (let _52_8559 = (let _52_8558 = (binders env)
in (Support.Prims.pipe_right _52_8558 (Support.List.map Support.Prims.fst)))
in (Microsoft_FStar_Absyn_Syntax.freevars_of_list _52_8559)))

let lidents = (fun ( env  :  env ) -> (let keys = (Support.List.fold_left (fun ( keys  :  Microsoft_FStar_Absyn_Syntax.lident list ) ( _27_13  :  binding ) -> (match (_27_13) with
| Binding_sig (s) -> begin
(let _52_8564 = (Microsoft_FStar_Absyn_Util.lids_of_sigelt s)
in (Support.List.append _52_8564 keys))
end
| _ -> begin
keys
end)) [] env.gamma)
in (let _52_8569 = (sigtab env)
in (Support.Microsoft.FStar.Util.smap_fold _52_8569 (fun ( _27_958  :  string ) ( v  :  Microsoft_FStar_Absyn_Syntax.sigelt ) ( keys  :  Microsoft_FStar_Absyn_Syntax.lident list ) -> (let _52_8568 = (Microsoft_FStar_Absyn_Util.lids_of_sigelt v)
in (Support.List.append _52_8568 keys))) keys))))





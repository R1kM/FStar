module Unicode

let α = 0
let β = 0
let γ = 0
let δ = 0
let ε = 0
let φ = 0
let χ = 0
let η = 0
let ι = 0
let κ = 0
let μ = 0
let ν = 0
let π = 0
let θ = 0
let ρ = 0
let σ = 0
let τ = 0
let ψ = 0
let ω = 0
let ξ = 0
let ζ = 0


let xx : ℕ = 25
let ℕ = 25
let _ = assert (ℕ == 25)

(* let ℕ = 1 *)
(* let ℤ = 1 *)
(* let 𝔹 = 1 *)

let ff : int → int = λ x → x

let _ = assert (∀ x. x > 1 ⟹ x > 0)
let _ = assert (∃ x. x > 1 ⟺ 1 < x)
let _ = assert (⊥ ⟹ ⊤)
(* let _ = assert ((5 × 5) == 25) *)
let _ = assert (forall p q. (p /\ q) == (p ∧ q))
let _ = assert (forall p q. (p \/ q) == (p ∨ q))

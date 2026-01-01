# Replicates default Ferris keymap from QMK
# Credit: Pierre Chevalier, 2020
# https://github.com/qmk/qmk_firmware/tree/master/keyboards/ferris/keymaps/default
from kb import KMKKeyboard
from kb import pins
from kmk.keys import KC, Key
from kmk.modules.holdtap import HoldTap
from kmk.modules.layers import Layers
from kmk.modules.mouse_keys import MouseKeys
from kmk.modules.split import Split, SplitSide
from kmk.hid import Debug, HIDModes
from kmk.modules.macros import Macros, Press, Release, Tap

keyboard = KMKKeyboard()

split = Split(
    split_side=SplitSide.LEFT,
    use_pio=True,
)

layers = Layers()
holdtap = HoldTap()
mouse_key = MouseKeys()
macros = Macros()


keyboard.modules = [macros, layers, split, holdtap, mouse_key]
keyboard.keymap =  []

# Cleaner key names
_______ = KC.TRNS
___x___ = KC.TRNS
XXXXXXX = KC.NO


# Layer tap for other home row keys

# Mod-taps


# fmt: off

#keyboard.keymap += [[  
#                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
#                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
#                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
#                                                _______, _______,     _______, _______
#                     ]]
#S_L5 = KC.LT(5, KC.S)
#D_L1 = KC.LT(1, KC.D)
#F_L3 = KC.LT(3, KC.F)
#J_L4 = KC.LT(4, KC.J)
#K_L2 = KC.LT(2, KC.K)
#L_L6 = KC.LT(6, KC.L)
#SPC_L7 = KC.LT(7, KC.SPC)
#A_SFT = KC.HT(KC.A, KC.LSFT)
#SCLN_SFT = KC.HT(KC.SCLN, KC.LSFT)
#X_CTL = KC.HT(KC.X, KC.LCTRL)
#C_ALT = KC.HT(KC.C, KC.LALT)
#COM_ALT = KC.HT(KC.COMM, KC.LALT)
#DOT_CTL = KC.HT(KC.DOT, KC.LCTRL)
#CTL_ALT = KC.LCTRL(KC.LALT)
#keyboard.keymap += [[#qwerty
#                     KC.Q,   KC.W,   KC.E,    KC.R,    KC.T,    KC.Y,    KC.U,    KC.I,    KC.O,     KC.P,
#                     A_SFT,  S_L5,   D_L1,    F_L3,    KC.G,    KC.H,    J_L4,    K_L2,    L_L6, SCLN_SFT,
#                     KC.Z,  X_CTL,  C_ALT,    KC.V,    KC.B,    KC.N,    KC.M, COM_ALT, DOT_CTL,  KC.SLSH,
#                                           KC.LGUI, KC.BSPC,    SPC_L7,  KC.ENT,
#                     ]]

T_L1 = KC.LT(1, KC.T)
N_L2 = KC.LT(2, KC.N)
S_L3 = KC.LT(3, KC.S)
E_L4 = KC.LT(4, KC.E)
R_L5 = KC.LT(5, KC.R)
I_L6 = KC.LT(6, KC.I)
SPC_L7 = KC.LT(7, KC.SPC)
L8_ESC = KC.LT(8, KC.ESC) 
A_SFT = KC.HT(KC.A, KC.LSFT)
O_SFT = KC.HT(KC.O, KC.LSFT)
Z_CTL = KC.HT(KC.Z, KC.LCTRL)
D_ALT = KC.HT(KC.D, KC.LALT)
keyboard.keymap += [[# 0 COLEMAKDH 
                     KC.Q    ,KC.W    ,KC.F    ,KC.P    ,KC.B     ,KC.J    ,KC.L    ,KC.U    ,KC.Y     ,KC.TAB,
                     A_SFT   ,R_L5    ,S_L3    ,T_L1    ,KC.G     ,KC.M    ,N_L2    ,E_L4    ,I_L6     ,O_SFT,
                     Z_CTL   ,KC.X    ,KC.C    ,D_ALT    ,KC.V     ,KC.K    ,KC.H    ,KC.QUOT ,KC.RCTRL ,KC.SLSH,
                                                L8_ESC  ,KC.BSPC  ,SPC_L7  ,KC.ENT
                     ]]

keyboard.keymap += [[  # 1 RIGHT SYMBOLS
                     KC.GRV, _______, KC.COLN, _______, _______,      _______,  KC.POUND, KC.AMPR, KC.TILDE, _______,  
                     KC.DQUO, KC.COMM, KC.DOT,  ___x___, _______,     KC.PIPE,  KC.EQL,  KC.EXLM, KC.AT,  KC.SCLN,
                     _______, _______, _______, _______, _______,     _______,  KC.MINS, _______, _______, KC.BSLS, 
                                                _______, _______,     _______,  _______
                     ]]

keyboard.keymap += [[  # 2 LEFT SYMBOLS
                     KC.RABK, KC.RCBR, KC.RBRC, KC.RPRN, KC.PLUS,     _______,  _______, KC.EXLM, KC.GRV, _______,
                     KC.LABK, KC.LCBR, KC.LBRC, KC.LPRN, KC.ASTR,     _______,  ___x___, KC.DLR, KC.MINS, KC.QUES,
                     KC.PERC, _______, KC.CIRC, KC.UNDS, KC.MINS,     _______,  _______, KC.AMPR, KC.EQL, KC.TILDE,
                                                _______, _______,     _______, _______
                     ]]

#vim window swapping
winRight = KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.W),
    Release(KC.LCTL),
    Tap(KC.RGHT)
)
winLeft = KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.W),
    Release(KC.LCTL),
    Tap(KC.LEFT)
)
winDown= KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.W),
    Release(KC.LCTL),
    Tap(KC.DOWN)
)
winUp = KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.W),
    Release(KC.LCTL),
    Tap(KC.UP)
)


keyboard.keymap += [[  #3 Navigation 
                     _______, _______, _______, _______, _______,     _______, winLeft, winDown, winUp, winRight,
                     KC.N0,   KC.B,    ___x___, KC.E,    KC.DLR,      _______, KC.LEFT, KC.DOWN, KC.UP,   KC.RGHT,    
                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
                                                _______, _______,     _______, _______
                     ]]

keyboard.keymap += [[  #4 empty
                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
                     _______, _______, _______, _______, _______,     _______, _______, ___x___, _______, _______,
                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
                                                _______, _______,     _______, _______
                     ]]

ext= KC.MACRO(
    Press(KC.LSFT),
    Tap(KC.E),
    Release(KC.LSFT)
)
conc = KC.MACRO(
    Press(KC.LSFT),
    Tap(KC.O),
    Release(KC.LSFT)
)
sym = KC.MACRO(
    Press(KC.LSFT),
    Tap(KC.Q),
    Release(KC.LSFT)
)

undo = KC.RCTRL(KC.Z)
redo = KC.RCTRL(KC.Y)

keyboard.keymap += [[  # 5 onshape layer
                     _______, _______, KC.U,    ext,     undo,        _______, _______, _______, _______, _______,
                     _______, ___x___, KC.ENT,  KC.L,    sym,         _______, _______, _______, _______, _______,
                     _______, _______, conc,    KC.I,    redo,        _______, _______, _______, _______, _______,
                                                _______, _______,     _______, _______
                     ]]

keyboard.keymap += [[  #6 empty
                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
                     _______, _______, _______, _______, _______,     _______, _______, _______, ___x___, _______,
                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
                                                _______, _______,     _______, _______
                     ]]

keyboard.keymap += [[  # 7 NUMBERS
                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
                     KC.N1,   KC.N2,   KC.N3,   KC.N4,   KC.N5,       KC.N6,   KC.N7,   KC.N8,   KC.N9,   KC.N0,
                     _______, _______, _______, _______, _______,     _______, KC.DOT, _______, _______, _______,
                                                _______, _______,     ___x___, _______
                     ]]

modkey = KC.LALT
fFox = modkey(KC.W)
yazi = modkey(KC.E)
launcher = modkey(KC.R)
term = modkey(KC.Q)
newfzf = modkey(KC.ENT)
newedit = modkey(KC.Z)
killWindow = modkey(KC.C)
hypr_up = modkey(KC.K)
hypr_down = modkey(KC.J)
hypr_left = modkey(KC.H)
hypr_right = modkey(KC.L)
winfloat = modkey(KC.V)

hypr_w1 = modkey(KC.N1)
hypr_w2 = modkey(KC.N2)
hypr_w3 = modkey(KC.N3)
hypr_w4 = modkey(KC.N4)


pushW1 = modkey(KC.LSFT(KC.N1))
pushW2 = modkey(KC.LSFT(KC.N2))
pushW3 = modkey(KC.LSFT(KC.N3))
pushW4 = modkey(KC.LSFT(KC.N4))

keyboard.keymap += [[  # 8 window management - hypr
                     pushW4,  pushW3,  pushW2,  pushW1,  _______,      KC.ESC,  term,       fFox,    launcher,  yazi, 
                     hypr_w4, hypr_w3, hypr_w2, hypr_w1, winfloat,     _______, hypr_left,  hypr_up, hypr_down, hypr_right, 
                     _______, _______, _______, _______, _______,      _______, killWindow, _______, _______,   _______, 
                                                ___x___, _______,      newfzf,newedit
                     ]]

if __name__ == '__main__':
    keyboard.go(hid_type=HIDModes.USB)

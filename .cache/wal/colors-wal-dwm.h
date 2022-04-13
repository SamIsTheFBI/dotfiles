static const char norm_fg[] = "#ede6de";
static const char norm_bg[] = "#1b1818";
static const char norm_border[] = "#a5a19b";

static const char sel_fg[] = "#ede6de";
static const char sel_bg[] = "#61909E";
static const char sel_border[] = "#ede6de";

static const char urg_fg[] = "#ede6de";
static const char urg_bg[] = "#D69E60";
static const char urg_border[] = "#D69E60";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};

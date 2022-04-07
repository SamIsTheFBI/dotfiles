static const char norm_fg[] = "#a9e3c4";
static const char norm_bg[] = "#09111c";
static const char norm_border[] = "#769e89";

static const char sel_fg[] = "#a9e3c4";
static const char sel_bg[] = "#4B8975";
static const char sel_border[] = "#a9e3c4";

static const char urg_fg[] = "#a9e3c4";
static const char urg_bg[] = "#A86B54";
static const char urg_border[] = "#A86B54";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};

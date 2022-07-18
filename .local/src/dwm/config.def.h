/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 1;       /* snap pixel */
static const unsigned int gappih    = 5;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 4;       /* vert inner gap between windows */
static const unsigned int gappoh    = 5;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 5;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;     /* 0 means no bar */
static const int topbar             = 1;     /* 0 means bottom bar */
static const char *fonts[]				=  { "JetBrainsMono Nerd Font:style:medium:size=10","Noto Sans Mono CJK JP:style=SemiBold:size=10", "emoji:size-10" };
static const char dmenufont[]			= "JetBrainsMono Nerd Font:style:medium:size=10";
static const unsigned int ulinepad	= 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	/* 1 to show underline on all tags, 0 for just the active ones */
static const Bool viewontag         = False;     /* Switch view on tag switch */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const unsigned int rmborder = 1; /* Set to 1 to remove border when only one window is visible on screen */

static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#005577";
static char selbgcolor[]            = "#005577";
static char termcol0[] = "#000000"; /* black   */
static char termcol1[] = "#ff0000"; /* red     */
static char termcol2[] = "#33ff00"; /* green   */
static char termcol3[] = "#ff0099"; /* yellow  */
static char termcol4[] = "#0066ff"; /* blue    */
static char termcol5[] = "#cc00ff"; /* magenta */
static char termcol6[] = "#00ffff"; /* cyan    */
static char termcol7[] = "#d0d0d0"; /* white   */
static char termcol8[]  = "#808080"; /* black   */
static char termcol9[]  = "#ff0000"; /* red     */
static char termcol10[] = "#33ff00"; /* green   */
static char termcol11[] = "#ff0099"; /* yellow  */
static char termcol12[] = "#0066ff"; /* blue    */
static char termcol13[] = "#cc00ff"; /* magenta */
static char termcol14[] = "#00ffff"; /* cyan    */
static char termcol15[] = "#ffffff"; /* white   */
static char *termcolor[] = {
  termcol0,
  termcol1,
  termcol2,
  termcol3,
  termcol4,
  termcol5,
  termcol6,
  termcol7,
  termcol8,
  termcol9,
  termcol10,
  termcol11,
  termcol12,
  termcol13,
  termcol14,
  termcol15,
};
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};


/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9"};
// static const char *tags[] = { "", "", "", "", "", "", ""};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	// For tag masks, 1 << (n-1) where n is the tag number in which you want to open the app
	
	/* class				instance				title			tags		switchtotag	isfloating	isterminal  noswallow	monitor */
	{ "st-256color",		"st-256color",   		NULL,  			0,				0,          0,			1,			0,		-1 },
	{ "Doublecmd",			"doublecmd",   			NULL,  			0,				0,          1,			0,			0,		-1 },
	{ "Chromium",  			"chromium",				NULL,   		1 << 1,			1,			0,			0,			1,		-1 },
	{ "TelegramDesktop",	"telegram-desktop", 	NULL,   		1 << 2,			1,			0,			0,			1,		-1 },
	{ "PPSSPPSDL",  		"PPSSPPSDL",     		NULL,   		1 << 4,			1,			1,			1,			0,		-1 },   //PPSSPP AppImage
	{ "dolphin-emu",  		"dolphin-emu",     		NULL,  			1 << 4,			1,			0,			1,			0,		-1 },		// pacman
	{ "mGBA",  				"AppRun.wrapped",   	NULL, 			1 << 4,			1,			0,			1,			0,		-1 },   //mGBA AppImage
	{ "Pcsx2",  			"pcsx2",     			NULL, 			1 << 4,			1,			0,			1,			0,		-1 },
	{ "mpv",  				"gl",     				NULL,   		1 << 5,			1,			0,			0,			1,		-1 },
	{ "Nemo",  			"nemo",     			NULL,   		1 << 6,			1,			0,			0,			1,		-1 },
	{ NULL,					NULL, 				"Event Tester",   		0,			0,			0,			1,			1,		-1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const float smfact     = 0.00; /* factor of tiled clients [0.00..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

#define STATUSBAR "dwmblocks"

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] 			=	{ "dmenu_run", "-m", dmenumon, "-fn", dmenufont, topbar ? NULL : "-b"};
static const char *termcmd[]        = { "st",                NULL };
static const char *layoutmenu_cmd = "~/.local/src/dwm/layoutmenu.sh";
static const char *browsercmd[]     = { "chromium",          NULL };
static const char *chatapp[]        = { "telegram-desktop",  NULL };
// static const char *txteditor[]	    = { "geany",             NULL };
static const char *fileman[]	    	= { "nemo", 	     		 NULL };
static const char *jgmenucmd[]  = { "jgmenu_run", NULL };

#include <X11/XF86keysym.h>

static Key keys[] = {


	/*__App_Shortcuts__*/
	/* modifier								key					function			argument */
	{MODKEY,                 XK_p,      	spawn,      {.v = dmenucmd } },
	{MODKEY|ShiftMask,       XK_Return, 	spawn,      {.v = termcmd } },
	{MODKEY|ShiftMask,       XK_w,      	spawn,      {.v = browsercmd} },
	{MODKEY|ShiftMask,       XK_m,      	spawn,      {.v = chatapp} },
	{MODKEY|ShiftMask,       XK_h,      	spawn,      SHCMD("st htop") },
	{MODKEY|ShiftMask,       XK_e,      	spawn,      {.v = fileman} },


        /*__Window_Management_ig_*/
	/* modifier							key	   					function					argument */
	{ MODKEY,               XK_b,      			togglebar,      		{0} },
	{ MODKEY,               XK_Left,   			focusstack,     		{.i = +1 } },
	{ MODKEY,               XK_Right,  			focusstack,     		{.i = -1 } },
	// { MODKEY,               XK_Left,   focusdir,       {.i = 0 } }, // left
	// { MODKEY,               XK_Right,  focusdir,       {.i = 1 } }, // right
	// { MODKEY,               XK_Up,     focusdir,       {.i = 2 } }, // up
	// { MODKEY,               XK_Down,   focusdir,       {.i = 3 } }, // down
	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
	{ MODKEY,               XK_bracketleft, incnmaster,     		{.i = +1 } },
	{ MODKEY,               XK_bracketright,incnmaster,     		{.i = -1 } },
	{ MODKEY,               XK_comma,      	setmfact,       		{.f = -0.05} },
	{ MODKEY|ShiftMask,     XK_comma,      	setcfact,       		{.f = -0.25} },
	{ MODKEY,               XK_period,      setmfact,       		{.f = +0.05} },
	{ MODKEY|ShiftMask,     XK_period,      setcfact,       		{.f = +0.25} },
	{ MODKEY|ShiftMask,     XK_bar,   		setcfact,       		{.f = 0.00} },
	{ MODKEY,               XK_Return,			zoom,           		{0} },
	{ MODKEY,               XK_Tab,					view,           		{0} },
	{ MODKEY|ShiftMask,     XK_c,						killclient,     		{0} },
	{ MODKEY,             	XK_f,						togglefullscr,  		{0} },
	// { MODKEY,               XK_space,				setlayout,      		{0} },
  	{ MODKEY,               XK_space,      togglecanfocusfloating,   {0} },
	{ MODKEY|ShiftMask,     XK_space,				togglefloating, 		{0} },
	{ MODKEY,               XK_0,						view,           		{.ui = ~0 } },
	{ MODKEY|ShiftMask,     XK_0,						tag,            		{.ui = ~0 } },
	{ ControlMask,     XK_comma,				focusmon,       		{.i = -1 } },
	{ ControlMask,     XK_period,				focusmon,       		{.i = +1 } },
	{ ControlMask|ShiftMask,     XK_comma,				tagmon,         		{.i = -1 } },
	{ ControlMask|ShiftMask,     XK_period,				tagmon,         		{.i = +1 } },
	{ MODKEY|ControlMask,	XK_Right,				viewnext,				{0} },
	{ MODKEY|ControlMask,	XK_Left,				viewprev,				{0} },
	{ MODKEY|ShiftMask,		XK_Right,				tagtonext,				{0} },
	{ MODKEY|ShiftMask,		XK_Left,				tagtoprev,				{0} },
	{ MODKEY,             	XK_F5,					quit,           		{0} },
	{ MODKEY|ControlMask,             	XK_F5,					xrdb,           		{.v = NULL} },
	{ ControlMask,         	XK_F5,					quit,           		{1} },
	{ MODKEY|ControlMask,		XK_comma,				cyclelayout,    		{.i = -1 } },
	{ MODKEY|ControlMask,   XK_period,			cyclelayout,    		{.i = +1 } },
	{ ALTKEY, 							XK_Tab,					spawn,	SHCMD("rofi -show window -show-icons")},
	{ MODKEY|ALTKEY,        XK_Left,				spawn,        	SHCMD("xrandr --output eDP --rotate left") },
	{ MODKEY|ALTKEY,        XK_Right,				spawn,        	SHCMD("xrandr --output eDP --rotate right") },
	{ MODKEY|ALTKEY,        XK_Up,					spawn,        	SHCMD("xrandr --output eDP --rotate normal") },
	{ MODKEY|ALTKEY,        XK_Down,				spawn,        	SHCMD("xrandr --output eDP --rotate inverted") },
	{MODKEY,						XK_slash, 	   hidewin, 	   {0}},
    {MODKEY|ShiftMask, 			    XK_slash, 	   restorewin, 	   {0}},
    {ControlMask, 					XK_slash, 	   hideotherwins,  {0}},
    {ControlMask|ShiftMask, 		XK_slash, 	   restoreotherwins, {0}},

	// Border
	{ MODKEY,             XK_semicolon, 		setborderpx,    {.i = -1 } },
	{ MODKEY,             XK_apostrophe, 		setborderpx,    {.i = +1 } },
	{ MODKEY,             XK_backslash, 	setborderpx,    {.i = 0 } },

	// Gaps
	{ MODKEY,               XK_minus,				incrgaps,        		{.i = -5 } },	
	{ MODKEY,               XK_equal,				incrgaps,        		{.i = +5 } },	
	{ MODKEY|ShiftMask,     XK_minus,				togglegaps,     		{0} },
	{ MODKEY|ShiftMask,     XK_equal,				defaultgaps,    		{0} },

	{ MODKEY|ALTKEY,        XK_minus,				incrigaps,        	{.i = -5 } },
	{ MODKEY|ALTKEY,        XK_equal,				incrigaps,        	{.i = +5 } },
	{ ALTKEY,        		XK_minus,				incrihgaps,        	{.i = -5 } },
	{ ALTKEY,        		XK_equal,				incrihgaps,        	{.i = +5 } },
	{ ALTKEY|ShiftMask,     XK_minus,				incrivgaps,        	{.i = -5 } },
	{ ALTKEY|ShiftMask,     XK_equal,				incrivgaps,        	{.i = +5 } },
	
	{ MODKEY|ControlMask,   XK_minus,				incrogaps,        	{.i = -5 } },
	{ MODKEY|ControlMask,   XK_equal,				incrogaps,        	{.i = +5 } },
	{ ControlMask,   		XK_minus,				incrohgaps,        	{.i = -5 } },
	{ ControlMask,   		XK_equal,				incrohgaps,        	{.i = +5 } },
	{ ControlMask|ShiftMask,XK_minus,				incrovgaps,        	{.i = -5 } },
	{ ControlMask|ShiftMask,XK_equal,				incrovgaps,        	{.i = +5 } },

	/* modifier			key	   	function			argument */
	{ MODKEY,      XK_x,    	spawn,      SHCMD("~/.local/bin/sysact")},
	{ MODKEY,      XK_m,    	spawn,      SHCMD("~/.local/bin/watchmedia")},
	{ MODKEY,      XK_d,    	spawn,      SHCMD("~/.local/bin/change-resolution")},
	{ MODKEY,      XK_y,    	spawn,      SHCMD("~/.local/bin/dmenu-translate")},
	{ MODKEY,			 XK_a,    	spawn,      SHCMD("rofi -show drun -show-icons -theme ~/.config/rofi/applauncher.rasi")},
	{ MODKEY,			 XK_s,    	spawn,      SHCMD("~/.local/bin/playt")},
	{ MODKEY,			 XK_c,    	spawn,      SHCMD("~/.local/bin/colpick")},
	{ MODKEY,			 XK_j,    	spawn,      SHCMD("jgmenu_run")},
	{ MODKEY,			 XK_t,    	spawn,      SHCMD("~/.local/bin/colorscheme-changer")},
	{ MODKEY,			 XK_e,    	spawn,      SHCMD("cat ~/emoji-list | dmenu -l 12 -i | awk '{print$NF}' | xclip -r -sel c")},

	/*														tag no.*/
	TAGKEYS(                        XK_1,                      			0)
	TAGKEYS(                        XK_2,                      			1)
	TAGKEYS(                        XK_3,                      			2)
	TAGKEYS(                        XK_4,                      			3)
	TAGKEYS(                        XK_5,                      			4)
	TAGKEYS(                        XK_6,                      			5)
	TAGKEYS(                        XK_7,                      			6)
	TAGKEYS(                        XK_8,                      			7)
	TAGKEYS(                        XK_9,                      			8)

	/*__Xf86/Multimedia_Keys_(mostly)__*/
	/* modifier,		key,			function,	argument */
	{ 0,					XF86XK_AudioMute,   		spawn,		SHCMD("~/.local/bin/volume tmute")},
	{ 0,					XF86XK_AudioRaiseVolume, 	spawn,		SHCMD("~/.local/bin/volume incr")},
	{ 0,					XF86XK_AudioLowerVolume, 	spawn,		SHCMD("~/.local/bin/volume decr")},
	{ 0,					XF86XK_MonBrightnessUp,  	spawn,		SHCMD("~/.local/bin/shine incr")},
	{ 0,					XF86XK_MonBrightnessDown, 	spawn,		SHCMD("~/.local/bin/shine decr")},
	{ 0,					XK_Print, 					spawn,		SHCMD("~/.local/bin/screencap")},
	{ MODKEY,				XK_Print, 					spawn,		SHCMD("~/.local/bin/screencap fullsave")},
	{ ShiftMask,			XK_Print, 					spawn,		SHCMD("~/.local/bin/screencap selectcopy")},
	{ MODKEY|ShiftMask, 	XK_Print, 					spawn,		SHCMD("~/.local/bin/screencap selectsave")},
	{ ControlMask,			XK_Print, 					spawn,		SHCMD("~/.local/bin/screencap actwincopy")},
	{ MODKEY|ControlMask,	XK_Print, 					spawn,		SHCMD("~/.local/bin/screencap actwinsave")},
	{ 0,					XF86XK_AudioNext,			spawn,		SHCMD("~/.local/bin/media next")},
	{ 0,					XF86XK_AudioPrev,			spawn,		SHCMD("~/.local/bin/media prev")},	
	{ 0,					XF86XK_AudioPlay,			spawn,		SHCMD("~/.local/bin/media toggle")},
	{ MODKEY,				XK_z, 						spawn,		SHCMD("~/.local/bin/touchpadtap")},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
	/* placemouse options, choose which feels more natural:
	 *    0 - tiled position is relative to mouse cursor
	 *    1 - tiled postiion is relative to window center
	 *    2 - mouse pointer warps to window center
	 *
	 * The moveorplace uses movemouse or placemouse depending on the floating state
	 * of the selected client. Set up individual keybindings for the two if you want
	 * to control these separately (i.e. to retain the feature to move a tiled window
	 * into a floating position).
	 */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        layoutmenu,     {0} },
	{ ClkStatusText,        0,              Button1,        sigstatusbar,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigstatusbar,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigstatusbar,   {.i = 3} },
	{ ClkClientWin,         MODKEY,         Button1,        moveorplace,    {.i = 1} },
	{ ClkClientWin,         MODKEY|ShiftMask,Button1,        dragmfact,    	{0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkClientWin,         MODKEY|ShiftMask, Button3,      dragcfact,      {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
    { ClkRootWin,  0, Button3, spawn, {.v = jgmenucmd } },
};

/* signal definitions */
/* signum must be greater than 0 */
/* trigger signals using `xsetroot -name "fsignal:<signum>"` */
static Signal signals[] = {
	/* signum       function        argument  */
	{ 1,            xrdb,      {.v = NULL} },
};

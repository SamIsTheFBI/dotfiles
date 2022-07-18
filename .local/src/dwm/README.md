## Keybindings

Super key is an alternative name for the Windows key or Command key when using Linux or BSD operating systems or software.

- ### App Shortcuts:

| Key Combo              | What it'll do             |
|------------------------|---------------------------|
| `super`+`shift`+`enter`| launch terminal      	 |
| `super`+`shift`+`w`    | launch web browser   	 |
| `super`+`shift`+`m`    | launch chat app 			 |
| `super`+`shift`+`h`    | launch htop in st terminal|
| `super`+`shift`+`e`    | launch file manager       |
| `super`+`shift`+`c`    | kill window/application	 |


- ### Window Management

| Key Combo             	| What it'll do                                  				  |
|---------------------------|-----------------------------------------------------------------|
| `alt`+`tab`		        | Switch windows using rofi 				 	 				  |
| `super`+`b`               | toggle bar visibility                          				  |
| `super`+`left`/`right key`| toggle selected window          			 	 				  |
| `super`+`[`/`]`			| increase/decrease windows in master (left) side				  |
| `super`+`,`/`.`			| decrease/increase master window's "weight"     				  |
| `super`+`shift`+`,`/`.`	| decrease/increase slave window's "weight" wrt other slave window|
| `super`+`enter`			| switch selected slave window with master window				  |
| `super`+`tab`				| switch to last tag											  |
| `super`+`shift`+`c`		| kill window/application										  |
| `super`+`f`				| toggle fullscreen mode										  |
| `super`+`control`+`,`/`.`	| cycle window layout											  |
| `super`+`space`			| disable/enable focus on floating windows                    	  |
| `super`+`shift`+`space`	| toggle active window to floating window						  |
| `control`+`,`/`.`			| change focused monitor										  |
| `control`+`shift`+`,`/`.`	| Move selected window to next screen							  |

- ### Keybindings related to gaps

| Key Combo         		| What it'll do                          |
|---------------------------|----------------------------------------|
| `super`+`shift`+`_` 	 	| toggle gaps on/off 					 |
| `super`+`shift`+`=` 	 	| reset gaps back to default 			 | 
| `super`+`-`/`+` 		    | decrease/increase all gaps			 | 
| `super`+`alt`+`-`/`+` 	| decrease/increase inner all gaps		 | 
| `super`+`control`+`-`/`+` | decrease/increase outer all gaps 		 | 
| `alt`+`-`/`+` 			| decrease/increase inner vertical gaps  | 
| `alt`+`shift`+`-`/`+` 	| decrease/increase inner horizontal gaps| 
| `control`+`-`/`+` 		| decrease/increase outer vertical gaps	 | 
| `control`+`shift`+`-`/`+` | decrease/increase outer horizontal gaps| 

- ### Keybindings related to border size

| Key Combo         		| What it'll do                          |
|---------------------------|----------------------------------------|
| `super`+`;`				| Decrease border size 				     |
| `super`+`'`				| Increase border size 				     |
| `super`+`\`				| Reset border size 				 	 |

- ### DWM Controls

| Key Combo       		| What it'll do                                        	   |
|-----------------------|----------------------------------------------------------|
| `super`+`F5`          | quit dwm session (back to tty) 						   |
| `control`+`F5`        | reload dwm 											   |
| `super`+`control`+`F5`| reload dwm & apply colors from `.Xresources` (xrdb patch)|


- ### Tag related keybindings

| Key Combo               		  | What it'll do                                        											 |
|---------------------------------|--------------------------------------------------------------------------------------------------|
| `super`+`1-9`               	  | switch tags 				 																	 |
| `super`+`control`+`left`/`right`| change current tag to the one on its left/right 												 | 
| `super`+`shift`+`left`/`right`  | move selected window one tag to the left/right 													 | 
| `super`+`shift`+`1-9`           | move active window to other tags 			 													 |
| `super`+`shift`+`control`+`1-9` | tag active window to other tags	(i.e selected window will show in the newly selected tag as well)|
| `super`+`0`                     | select all tags (i.e view windows of all tags in current tag) 					 				 |
| `super`+`shift`+`0`             | tag active window to all tags (i.e selected window will follow the active tag) 					 |


- ### dmenu/rofi/random scripts keybindings

| Key Combo	   | What it'll do              |
|--------------|----------------------------|
| `super`+`p`  | run dmenu        			|
| `super`+`x`  | bring up power menu (dmenu)|
| `super`+`m`  | watchmedia script (dmenu)  |
| `super`+`a`  | application launcher (rofi)|
| `super`+`j`  | application launcher (jgmenu)|
| `super`+`s`  | YouTube downloader (dmenu) |
| `super`+`c`  | colorpicker script 		|
| `super`+`e`  | emoji picker (dmenu)		|
| `super`+`z`  | disable/enable touchpad	|


- ### Multimedia/Misc Keys

| Key Combo                		 | What it'll do                                            |
|--------------------------------|----------------------------------------------------------|
| `PrintScreen`              	 | Copy full screenshot                                     |
| `super`+`PrintScreen`        	 | Copy & save full screenshot                              |
| `shift`+`PrintScreen`        	 | Select a part of screen and copy it to clipboard         |
| `super`+`shift`+`PrintScreen`  | Select a part of screen, copy it to clipboard & save     |
| `control`+`PrintScreen`        | Copy active window's screenshot                          |
| `super`+`control`+`PrintScreen`| Copy active window's screenshot & save                   |
| `Audio Up/Down/Mute`       	 | Increase/Decrease/Mute Audio                             |
| `Brightness Up/Down`        	 | Increase/Decrease brightness                             |
| `Audio Play/Next/Previous`  	 | Toggle between play & pause, change to next/previous song|


- ### Things you can do combining mouse & keyboard buttons

| Keyboard+Mouse Stuff |
|----------------------|
| `super`+`Right Click` a floating window to resize it. |
| `super`+`shift`+ `Left Click` a non-floating master window to change its "weight" (size). |
| `super`+`shift`+ `Right Click` a non-floating slave window to change its "weight" (size). |
| `super`+`Left Click` a window and drag around to move it. If non-floating window is selected, then you can drag it around to another non-floating window's place and switch with it |
| `super`+`Left Click` a tag to send selected window to that particular tag. |
| `super`+`Right Click` a tag to tag selected window to that particular tag. |
| `Middle Click` dwm status bar (except tags side) to launch terminal. |
| `Middle Click` a window to toggle floating state of that window. |


## Patches Applied

- actualfullscreen
- adjacenttag
- alpha
- canfocusfloating
- cfacts
- cyclelayouts
- dragcfact
- dragmfact
- focusdir
- focusonnetactive
- notitle
- pertag
- placemouse
- preserveonrestart
- removeborder
- resizepoint
- restartsig
- setborderpx
- smfact
- status2d+systray+xrdb
- statuscmd+status2d
- swallow
- switchtotag
- underlinetags
- vanitygaps
- viewontag
- xrdb
- zoomswap
